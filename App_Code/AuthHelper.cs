using System;
using System.Web;
using System.Web.Security;

public static class AuthHelper
{
    /// <summary>
    /// جلب SID من Ticket (بدون استعلام DB)
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

            string[] parts = ticket.UserData.Split('|');
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
    /// جلب اسم المستخدم الكامل من Ticket
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
    /// جلب Role المستخدم من Ticket (بدون استعلام DB)
    /// </summary>
    public static string GetCurrentUserRole()
    {
        try
        {
            if (HttpContext.Current == null)
                return "Reader";

            if (HttpContext.Current.User == null || !HttpContext.Current.User.Identity.IsAuthenticated)
                return "Reader";

            FormsIdentity formsId = HttpContext.Current.User.Identity as FormsIdentity;
            if (formsId == null)
                return "Reader";

            FormsAuthenticationTicket ticket = formsId.Ticket;
            if (ticket == null || string.IsNullOrEmpty(ticket.UserData))
                return "Reader";

            // UserData: SID|FullUsername|Role
            string[] parts = ticket.UserData.Split('|');
            if (parts.Length >= 3 && !string.IsNullOrEmpty(parts[2]))
                return parts[2];

            return "Reader";
        }
        catch
        {
            return "Reader";
        }
    }

    /// <summary>
    /// التحقق من أن المستخدم في Role معين
    /// </summary>
    public static bool IsInRole(string roleName)
    {
        string currentRole = GetCurrentUserRole();
        return string.Equals(currentRole, roleName, StringComparison.OrdinalIgnoreCase);
    }

    /// <summary>
    /// التحقق من أن المستخدم Admin
    /// </summary>
    public static bool IsAdmin()
    {
        return IsInRole("Admin");
    }

    /// <summary>
    /// التحقق من أن المستخدم Member أو Admin
    /// </summary>
    public static bool IsMemberOrAdmin()
    {
        return IsInRole("Admin") || IsInRole("Member");
    }
}