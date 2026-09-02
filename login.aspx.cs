using System;
using System.Configuration;
using System.Data.SqlClient;
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
        else
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
        else
            return usernameDomain;
    }

    /// <summary>
    /// جلب Role المستخدم من قاعدة البيانات
    /// استعلام واحد سريع جداً (< 1ms) مع Index
    /// </summary>
    private string GetUserRoleFromDB(string userName)
    {
        string role = "Reader"; // الدور الافتراضي

        try
        {
            string connString = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // استعلام واحد بسيط وسريع
                string sql = @"SELECT TOP 1 RoleName 
                              FROM UserRoles 
                              WHERE UserName = @userName 
                                AND IsActive = 1";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@userName", userName);
                    conn.Open();

                    object result = cmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        role = result.ToString();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("DB Error: " + ex.Message);
        }

        return role;
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string domainName = GetDomainName(txtUserName.Text);
        string userName = GetUsername(txtUserName.Text);
        IntPtr token = IntPtr.Zero;

        bool result = LogonUser(userName, domainName, txtPassword.Text, 2, 0, ref token);

        if (result)
        {
            // ✅ 1. جلب الـ SID من Token
            string sid = "UNKNOWN-SID";
            try
            {
                if (token != IntPtr.Zero)
                {
                    using (WindowsIdentity identity = new WindowsIdentity(token))
                    {
                        if (identity.User != null)
                            sid = identity.User.Value;
                    }
                }
            }
            catch { }

            // ✅ 2. جلب Role من قاعدة البيانات (استعلام واحد فقط)
            string userRole = GetUserRoleFromDB(userName);

            // ✅ 3. إغلاق الـ Token
            if (token != IntPtr.Zero)
                CloseHandle(token);

            // ✅ 4. بناء UserData: SID|FullUsername|Role
            string fullUsername = string.IsNullOrEmpty(domainName)
                ? userName
                : domainName + "\\" + userName;
            string userData = sid + "|" + fullUsername + "|" + userRole;

            // ✅ 5. إنشاء FormsAuthenticationTicket مع UserData
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

            // ✅ 6. التوجيه
            string returnUrl = Request.QueryString["ReturnUrl"];

            if (!string.IsNullOrEmpty(returnUrl) && returnUrl.StartsWith("/") && !returnUrl.StartsWith("//"))
            {
                Response.Redirect(returnUrl);
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }
        else
        {
            lblerror.Text = "تأكد من ادخال اسم المستخدم/ كلمة المرور الصحيحة.";
        }
    }
}