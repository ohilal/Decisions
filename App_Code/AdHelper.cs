using System;
using System.Configuration;
using System.DirectoryServices;
using System.Security.Principal;
using System.Web;

public static class AdHelper
{
    /// <summary>
    /// جلب LDAP path الصحيح من Web.config
    /// يستخدم DomainName من appSettings بدلاً من adconnection
    /// </summary>
    private static string GetCorrectLdapPath()
    {
        // ✅ الطريقة 1: بناء LDAP path من DomainName (الأفضل)
        string domainName = ConfigurationManager.AppSettings["DomainName"];
        if (!string.IsNullOrEmpty(domainName))
        {
            // تحويل "gofi.local" إلى "LDAP://DC=gofi,DC=local"
            string[] parts = domainName.Split('.');
            string dcPath = string.Join(",", Array.ConvertAll(parts, p => "DC=" + p));
            return "LDAP://" + dcPath;
        }

        // ✅ الطريقة 2: استخدام serverpath من appSettings
        string serverPath = ConfigurationManager.AppSettings["serverpath"];
        if (!string.IsNullOrEmpty(serverPath))
        {
            if (!serverPath.StartsWith("LDAP://", StringComparison.OrdinalIgnoreCase))
                serverPath = "LDAP://" + serverPath;
            return serverPath;
        }

        // ✅ الطريقة 3: استخدام Global Catalog (للبحث في كامل الـ Forest)
        return "GC://";
    }

    /// <summary>
    /// جلب معلومات المستخدم من LDAP
    /// </summary>
    public static AdUserInfo GetFullUserInfo(string username)
    {
        AdUserInfo info = new AdUserInfo();

        if (string.IsNullOrEmpty(username))
            return info;

        try
        {
            // تنظيف اسم المستخدم
            string samName = username;
            if (username.Contains("\\"))
                samName = username.Split('\\')[1];
            else if (username.Contains("@"))
                samName = username.Split('@')[0];

            string ldapPath = GetCorrectLdapPath();

            using (DirectoryEntry root = new DirectoryEntry(ldapPath))
            using (DirectorySearcher searcher = new DirectorySearcher(root))
            {
                searcher.Filter = "(&(objectClass=user)(objectCategory=person)(sAMAccountName=" +
                                  EscapeLdapFilter(samName) + "))";

                searcher.PropertiesToLoad.Clear();
                searcher.PropertiesToLoad.Add("objectSid");
                searcher.PropertiesToLoad.Add("displayName");
                searcher.PropertiesToLoad.Add("sAMAccountName");
                searcher.PropertiesToLoad.Add("distinguishedName");
                searcher.PropertiesToLoad.Add("mail");
                searcher.PropertiesToLoad.Add("department");

                SearchResult result = searcher.FindOne();

                if (result != null)
                {
                    info.SamAccountName = samName;

                    //  SID
                    if (result.Properties.Contains("objectSid") && result.Properties["objectSid"].Count > 0)
                    {
                        byte[] sidBytes = (byte[])result.Properties["objectSid"][0];
                        info.Sid = new SecurityIdentifier(sidBytes, 0).Value;
                    }

                    //  DisplayName
                    if (result.Properties.Contains("displayName") && result.Properties["displayName"].Count > 0)
                        info.DisplayName = result.Properties["displayName"][0].ToString();

                    //  Email
                    if (result.Properties.Contains("mail") && result.Properties["mail"].Count > 0)
                        info.Email = result.Properties["mail"][0].ToString();

                    //  Department
                    if (result.Properties.Contains("department") && result.Properties["department"].Count > 0)
                        info.Department = result.Properties["department"][0].ToString();

                    //  DN
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

    private static string EscapeLdapFilter(string input)
    {
        if (string.IsNullOrEmpty(input)) return input;
        return input.Replace("\\", "\\5c")
                    .Replace("*", "\\2a")
                    .Replace("(", "\\28")
                    .Replace(")", "\\29")
                    .Replace("\0", "\\00");
    }
}

public class AdUserInfo
{
    public string Sid { get; set; }
    public string SamAccountName { get; set; }
    public string DisplayName { get; set; }
    public string Email { get; set; }
    public string Department { get; set; }
    public string DistinguishedName { get; set; }

    public AdUserInfo()
    {
        Sid = "UNKNOWN-SID";
    }
}