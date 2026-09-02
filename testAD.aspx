<%@ Page Language="C#" %>
<%@ Import Namespace="System" %>
<%@ Import Namespace="System.Configuration" %>
<%@ Import Namespace="System.DirectoryServices" %>
<%@ Import Namespace="System.Security.Principal" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!User.Identity.IsAuthenticated)
        {
            Response.Write("<h3>❌ غير مسجل دخول</h3>");
            return;
        }

        string username = User.Identity.Name;
        string samName = username;
        if (username.Contains("\\"))
            samName = username.Split('\\')[1];

        Response.Write("<h3>✅ معلومات المستخدم الحالي</h3>");
        Response.Write("<table border='1' cellpadding='5' style='border-collapse: collapse;'>");
        Response.Write("<tr><td><b>اسم المستخدم الكامل</b></td><td>" + username + "</td></tr>");
        Response.Write("<tr><td><b>sAMAccountName</b></td><td>" + samName + "</td></tr>");

        // ✅ 1. SID من Ticket (الأسرع)
        try
        {
            System.Web.Security.FormsIdentity fi = User.Identity as System.Web.Security.FormsIdentity;
            if (fi != null && fi.Ticket != null && !string.IsNullOrEmpty(fi.Ticket.UserData))
            {
                string[] parts = fi.Ticket.UserData.Split('|');
                if (parts.Length >= 1)
                {
                    Response.Write("<tr style='background-color: #90EE90;'><td><b>✅ SID من Ticket</b></td><td>" + parts[0] + "</td></tr>");
                }
                if (parts.Length >= 2)
                {
                    Response.Write("<tr style='background-color: #90EE90;'><td><b>✅ Full Username من Ticket</b></td><td>" + parts[1] + "</td></tr>");
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<tr style='background-color: #FFB6C1;'><td><b>❌ خطأ في Ticket</b></td><td>" + ex.Message + "</td></tr>");
        }

        // ✅ 2. اختبار LDAP path الصحيح
        try
        {
            Response.Write("<tr><td colspan='2' style='background-color: #87CEEB;'><b>اختبار LDAP Connection:</b></td></tr>");
            
            string domainName = ConfigurationManager.AppSettings["DomainName"];
            Response.Write("<tr><td><b>DomainName من appSettings</b></td><td>" + (domainName ?? "NULL") + "</td></tr>");

            string ldapPath = "";
            if (!string.IsNullOrEmpty(domainName))
            {
                string[] parts = domainName.Split('.');
                ldapPath = "LDAP://" + string.Join(",", Array.ConvertAll(parts, p => "DC=" + p));
            }
            
            Response.Write("<tr><td><b>LDAP Path المُنشأ</b></td><td>" + ldapPath + "</td></tr>");

            using (DirectoryEntry root = new DirectoryEntry(ldapPath))
            {
                Response.Write("<tr><td><b>Schema ClassName</b></td><td>" + root.SchemaClassName + "</td></tr>");
                Response.Write("<tr><td><b>Name</b></td><td>" + root.Name + "</td></tr>");
                
                using (DirectorySearcher searcher = new DirectorySearcher(root))
                {
                    searcher.Filter = "(sAMAccountName=" + samName + ")";
                    searcher.PropertiesToLoad.Add("objectSid");
                    searcher.PropertiesToLoad.Add("displayName");
                    
                    SearchResult result = searcher.FindOne();
                    
                    if (result != null)
                    {
                        Response.Write("<tr style='background-color: #90EE90;'><td><b>✅ تم العثور على المستخدم</b></td><td>" + result.Path + "</td></tr>");
                        
                        if (result.Properties.Contains("objectSid"))
                        {
                            byte[] sidBytes = (byte[])result.Properties["objectSid"][0];
                            SecurityIdentifier sid = new SecurityIdentifier(sidBytes, 0);
                            Response.Write("<tr><td><b>✅ SID من LDAP</b></td><td>" + sid.Value + "</td></tr>");
                        }
                        
                        if (result.Properties.Contains("displayName"))
                        {
                            Response.Write("<tr><td><b>Display Name</b></td><td>" + result.Properties["displayName"][0].ToString() + "</td></tr>");
                        }
                    }
                    else
                    {
                        Response.Write("<tr style='background-color: #FFB6C1;'><td><b>❌ لم يتم العثور على المستخدم</b></td><td>NULL</td></tr>");
                    }
                }
            }
        }
        catch (Exception ex)
        {
            Response.Write("<tr style='background-color: #FFB6C1;'><td><b>❌ خطأ في LDAP</b></td><td>" + ex.Message + "</td></tr>");
        }

        Response.Write("</table>");
    }
</script>