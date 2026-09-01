using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;

/// <summary>
/// أدوات مساعدة للتعامل مع بيانات المصادقة (SID, Username, etc.)
/// </summary>
public static class AuthHelper
{
    /// <summary>
    /// يجلب الـ SID للمستخدم الحالي من FormsAuthenticationTicket
    /// </summary>
    public static string GetCurrentUserSid()
    {
        try
        {
            if (HttpContext.Current == null)
                return "UNKNOWN-SID";

            if (HttpContext.Current.User == null || !HttpContext.Current.User.Identity.IsAuthenticated)
                return "UNKNOWN-SID";

            FormsIdentity formsId = HttpContext.Current.User.Identity as FormsIdentity;
            if (formsId == null)
                return "UNKNOWN-SID";

            FormsAuthenticationTicket ticket = formsId.Ticket;
            if (ticket == null || string.IsNullOrEmpty(ticket.UserData))
                return "UNKNOWN-SID";

            // UserData يحتوي على SID|UserName|DisplayName
            string userData = ticket.UserData;
            string[] parts = userData.Split('|');

            if (parts.Length >= 1 && !string.IsNullOrEmpty(parts[0]))
                return parts[0];

            return "UNKNOWN-SID";
        }
        catch
        {
            return "UNKNOWN-SID";
        }
    }

    /// <summary>
    /// يجلب اسم المستخدم الكامل (DOMAIN\username)
    /// </summary>
    public static string GetCurrentFullUsername()
    {
        try
        {
            if (HttpContext.Current != null
                && HttpContext.Current.User != null
                && HttpContext.Current.User.Identity != null
                && HttpContext.Current.User.Identity.IsAuthenticated)
            {
                FormsIdentity formsId = HttpContext.Current.User.Identity as FormsIdentity;
                if (formsId != null && formsId.Ticket != null && !string.IsNullOrEmpty(formsId.Ticket.UserData))
                {
                    string[] parts = formsId.Ticket.UserData.Split('|');
                    if (parts.Length >= 2 && !string.IsNullOrEmpty(parts[1]))
                        return parts[1];
                }
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
    /// يجلب اسم العرض (Display Name) من AD
    /// </summary>
    public static string GetCurrentDisplayName()
    {
        try
        {
            if (HttpContext.Current != null
                && HttpContext.Current.User != null
                && HttpContext.Current.User.Identity != null
                && HttpContext.Current.User.Identity.IsAuthenticated)
            {
                FormsIdentity formsId = HttpContext.Current.User.Identity as FormsIdentity;
                if (formsId != null && formsId.Ticket != null && !string.IsNullOrEmpty(formsId.Ticket.UserData))
                {
                    string[] parts = formsId.Ticket.UserData.Split('|');
                    if (parts.Length >= 3 && !string.IsNullOrEmpty(parts[2]))
                        return parts[2];
                }
            }
            return "";
        }
        catch
        {
            return "";
        }
    }

    /// <summary>
    /// يجلب معلومات المستخدم الكاملة (SID, UserName, DisplayName)
    /// </summary>
    public static UserInfo GetCurrentUserFullInfo()
    {
        UserInfo info = new UserInfo();

        try
        {
            if (HttpContext.Current == null)
                return info;

            if (HttpContext.Current.User == null || !HttpContext.Current.User.Identity.IsAuthenticated)
                return info;

            FormsIdentity formsId = HttpContext.Current.User.Identity as FormsIdentity;
            if (formsId == null || formsId.Ticket == null)
                return info;

            string userData = formsId.Ticket.UserData;
            if (string.IsNullOrEmpty(userData))
                return info;

            string[] parts = userData.Split('|');
            if (parts.Length >= 1) info.Sid = parts[0];
            if (parts.Length >= 2) info.UserName = parts[1];
            if (parts.Length >= 3) info.DisplayName = parts[2];

            info.IsAuthenticated = true;
        }
        catch { }

        return info;
    }
}

/// <summary>
/// كلاس يحتوي على معلومات المستخدم الحالي
/// </summary>
public class UserInfo
{
    public string Sid { get; set; }
    public string UserName { get; set; }
    public string DisplayName { get; set; }
    public bool IsAuthenticated { get; set; }

    public UserInfo()
    {
        Sid = "UNKNOWN-SID";
        UserName = "UNKNOWN";
        DisplayName = "";
        IsAuthenticated = false;
    }
}