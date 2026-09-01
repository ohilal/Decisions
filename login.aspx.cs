using System;
using System.Configuration;
using System.Runtime.InteropServices;
using System.Security.Principal;
using System.Web;
using System.Web.Security;
using System.Web.UI;

public partial class login : System.Web.UI.Page
{
    [DllImport("ADVAPI32.dll", EntryPoint = "LogonUserW", SetLastError = true, CharSet = CharSet.Auto)]
    public static extern bool LogonUser(string lpszUsername, string lpszDomain,
        string lpszPassword, int dwLogonType, int dwLogonProvider, ref IntPtr phToken);

    [DllImport("kernel32.dll", CharSet = CharSet.Auto, SetLastError = true)]
    public static extern bool CloseHandle(IntPtr handle);

    public static string GetDomainName(string usernameDomain)
    {
        if (string.IsNullOrEmpty(usernameDomain))
            throw new ArgumentException("Argument can't be null.", "usernameDomain");

        if (usernameDomain.Contains("\\"))
            return usernameDomain.Substring(0, usernameDomain.IndexOf("\\"));
        else if (usernameDomain.Contains("@"))
            return usernameDomain.Substring(usernameDomain.IndexOf("@") + 1);
        return "";
    }

    public static string GetUsername(string usernameDomain)
    {
        if (string.IsNullOrEmpty(usernameDomain))
            throw new ArgumentException("Argument can't be null.", "usernameDomain");

        if (usernameDomain.Contains("\\"))
            return usernameDomain.Substring(usernameDomain.IndexOf("\\") + 1);
        else if (usernameDomain.Contains("@"))
            return usernameDomain.Substring(0, usernameDomain.IndexOf("@"));
        return usernameDomain;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string domainName = GetDomainName(txtUserName.Text);
        string userName = GetUsername(txtUserName.Text);
        IntPtr token = IntPtr.Zero;

        bool result = LogonUser(userName, domainName, txtPassword.Text, 2, 0, ref token);

        if (result)
        {
            // جلب الـ SID من Token
            string sid = "UNKNOWN-SID";
            try
            {
                if (token != IntPtr.Zero)
                {
                    using (System.Security.Principal.WindowsIdentity identity =
                        new System.Security.Principal.WindowsIdentity(token))
                    {
                        if (identity.User != null)
                            sid = identity.User.Value;
                    }
                }
            }
            catch { }

            if (token != IntPtr.Zero)
                CloseHandle(token);

            // بناء UserData
            string fullUsername = string.IsNullOrEmpty(domainName)
                ? userName
                : domainName + "\\" + userName;
            string userData = sid + "|" + fullUsername;

            // إنشاء التذكرة
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1,
                txtUserName.Text,
                DateTime.Now,
                DateTime.Now.AddMinutes(30),
                false,
                userData,
                FormsAuthentication.FormsCookiePath
            );

            string encryptedTicket = FormsAuthentication.Encrypt(ticket);
            HttpCookie authCookie = new HttpCookie(FormsAuthentication.FormsCookieName, encryptedTicket);
            authCookie.HttpOnly = true;
            authCookie.Path = FormsAuthentication.FormsCookiePath;
            Response.Cookies.Add(authCookie);

            // التوجيه
            if (txtUserName.Text == "mai.galal")
                Response.Redirect("Admins/InsertAnswer.aspx");
            else
            {
                string returnUrl = Request.QueryString["ReturnUrl"];
                if (!string.IsNullOrEmpty(returnUrl) && returnUrl.StartsWith("/") && !returnUrl.StartsWith("//"))
                    Response.Redirect(returnUrl);
                else
                    Response.Redirect("Default.aspx");
            }
        }
        else
        {
            lblerror.Text = "تأكد من ادخال اسم المستخدم/ كلمة المرور الصحيحة.";
        }
    }
}