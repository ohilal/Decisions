using System;
using System.Configuration;
using System.DirectoryServices;
using System.Security.Principal;
using System.Web;
using System.Web.Caching;

public static class AdHelper
{
    /// <summary>
    /// يجلب الـ SID للمستخدم الحالي من Active Directory
    /// </summary>
    public static string GetCurrentUserSid()
    {
        string username = GetCurrentUsername();
        if (string.IsNullOrEmpty(username))
            return "UNKNOWN-SID";

        // محاولة جلب الـ SID من Cache أولاً
        string cacheKey = "UserSID_" + username;
        string cachedSid = null;
        if (HttpContext.Current != null && HttpContext.Current.Cache != null)
        {
            cachedSid = HttpContext.Current.Cache[cacheKey] as string;
        }
        if (!string.IsNullOrEmpty(cachedSid))
            return cachedSid;

        // جلب الـ SID من LDAP
        string sid = GetSidFromLdap(username);

        // تخزين في Cache لمدة 30 دقيقة
        if (!string.IsNullOrEmpty(sid) && HttpContext.Current != null && HttpContext.Current.Cache != null)
        {
            HttpContext.Current.Cache.Insert(
                cacheKey, sid, null,
                Cache.NoAbsoluteExpiration,
                TimeSpan.FromMinutes(30));
        }

        return sid;
    }

    /// <summary>
    /// يجلب اسم المستخدم الحالي (بدون الـ Domain)
    /// </summary>
    public static string GetCurrentUsername()
    {
        try
        {
            string fullUsername = "";

            if (HttpContext.Current != null
                && HttpContext.Current.User != null
                && HttpContext.Current.User.Identity != null)
            {
                fullUsername = HttpContext.Current.User.Identity.Name;
            }

            if (string.IsNullOrEmpty(fullUsername))
                return null;

            // استخراج اسم المستخدم فقط (بدون DOMAIN\)
            if (fullUsername.Contains("\\"))
                return fullUsername.Split('\\')[1];
            if (fullUsername.Contains("@"))
                return fullUsername.Split('@')[0];

            return fullUsername;
        }
        catch
        {
            return null;
        }
    }

    /// <summary>
    /// يجلب اسم المستخدم الكامل مع الـ Domain
    /// </summary>
    public static string GetCurrentFullUsername()
    {
        try
        {
            if (HttpContext.Current != null
                && HttpContext.Current.User != null
                && HttpContext.Current.User.Identity != null)
            {
                return HttpContext.Current.User.Identity.Name;
            }
            return "UNKNOWN";
        }
        catch
        {
            return "UNKNOWN";
        }
    }

    /// <summary>
    /// يجلب الـ SID من LDAP باستخدام الـ connection string الموجود في Web.config
    /// </summary>
    public static string GetSidFromLdap(string username)
    {
        if (string.IsNullOrEmpty(username))
            return null;

        try
        {
            string ldapPath = GetLdapPath();
            if (string.IsNullOrEmpty(ldapPath))
                return null;

            using (DirectoryEntry root = new DirectoryEntry(ldapPath))
            using (DirectorySearcher searcher = new DirectorySearcher(root))
            {
                searcher.Filter = "(&(objectClass=user)(objectCategory=person)(sAMAccountName=" +
                                  EscapeLdapFilter(username) + "))";
                searcher.PropertiesToLoad.Add("objectSid");
                searcher.PropertiesToLoad.Add("displayName");
                searcher.PropertiesToLoad.Add("distinguishedName");
                searcher.PropertiesToLoad.Add("mail");
                searcher.PropertiesToLoad.Add("department");

                SearchResult result = searcher.FindOne();

                if (result != null && result.Properties.Contains("objectSid"))
                {
                    byte[] sidBytes = (byte[])result.Properties["objectSid"][0];
                    SecurityIdentifier sid = new SecurityIdentifier(sidBytes, 0);
                    return sid.Value;
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("LDAP Error: " + ex.Message);
        }

        return null;
    }

    /// <summary>
    /// يجلب معلومات كاملة للمستخدم من AD
    /// </summary>
    public static AdUserInfo GetFullUserInfo(string username)
    {
        AdUserInfo info = new AdUserInfo();

        if (string.IsNullOrEmpty(username))
            return info;

        try
        {
            string ldapPath = GetLdapPath();
            if (string.IsNullOrEmpty(ldapPath))
                return info;

            using (DirectoryEntry root = new DirectoryEntry(ldapPath))
            using (DirectorySearcher searcher = new DirectorySearcher(root))
            {
                searcher.Filter = "(&(objectClass=user)(objectCategory=person)(sAMAccountName=" +
                                  EscapeLdapFilter(username) + "))";
                searcher.PropertiesToLoad.Add("objectSid");
                searcher.PropertiesToLoad.Add("displayName");
                searcher.PropertiesToLoad.Add("sAMAccountName");
                searcher.PropertiesToLoad.Add("distinguishedName");
                searcher.PropertiesToLoad.Add("mail");
                searcher.PropertiesToLoad.Add("department");
                searcher.PropertiesToLoad.Add("title");

                SearchResult result = searcher.FindOne();

                if (result != null)
                {
                    info.SamAccountName = username;

                    if (result.Properties.Contains("objectSid"))
                    {
                        byte[] sidBytes = (byte[])result.Properties["objectSid"][0];
                        info.Sid = new SecurityIdentifier(sidBytes, 0).Value;
                    }

                    if (result.Properties.Contains("displayName") && result.Properties["displayName"].Count > 0)
                        info.DisplayName = result.Properties["displayName"][0].ToString();

                    if (result.Properties.Contains("mail") && result.Properties["mail"].Count > 0)
                        info.Email = result.Properties["mail"][0].ToString();

                    if (result.Properties.Contains("department") && result.Properties["department"].Count > 0)
                        info.Department = result.Properties["department"][0].ToString();

                    if (result.Properties.Contains("title") && result.Properties["title"].Count > 0)
                        info.Title = result.Properties["title"][0].ToString();

                    if (result.Properties.Contains("distinguishedName") && result.Properties["distinguishedName"].Count > 0)
                        info.DistinguishedName = result.Properties["distinguishedName"][0].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("LDAP Error: " + ex.Message);
        }

        return info;
    }

    /// <summary>
    /// يجلب LDAP path من Web.config
    /// </summary>
    private static string GetLdapPath()
    {
        // أولاً: حاول قراءة connection string
        ConnectionStringSettings cs = ConfigurationManager.ConnectionStrings["adconnection"];
        if (cs != null && !string.IsNullOrEmpty(cs.ConnectionString))
            return cs.ConnectionString;

        // ثانياً: حاول بناء LDAP path من DomainName
        string domainName = ConfigurationManager.AppSettings["DomainName"];
        if (!string.IsNullOrEmpty(domainName))
        {
            string ldapBase = "LDAP://";
            string[] parts = domainName.Split('.');
            ldapBase += string.Join(",", Array.ConvertAll(parts, p => "DC=" + p));
            return ldapBase;
        }

        return null;
    }

    /// <summary>
    /// حماية من LDAP Injection
    /// </summary>
    private static string EscapeLdapFilter(string input)
    {
        if (string.IsNullOrEmpty(input)) return input;

        return input.Replace("\\", "\\5c")
                    .Replace("*", "\\2a")
                    .Replace("(", "\\28")
                    .Replace(")", "\\29")
                    .Replace("\0", "\\00")
                    .Replace("/", "\\2f")
                    .Replace(":", "\\3a")
                    .Replace("[", "\\5b")
                    .Replace("]", "\\5d");
    }
}

/// <summary>
/// كلاس يحتوي على معلومات المستخدم من AD
/// </summary>
public class AdUserInfo
{
    public string Sid { get; set; }
    public string SamAccountName { get; set; }
    public string DisplayName { get; set; }
    public string Email { get; set; }
    public string Department { get; set; }
    public string Title { get; set; }
    public string DistinguishedName { get; set; }

    public AdUserInfo()
    {
        Sid = "UNKNOWN";
    }
}