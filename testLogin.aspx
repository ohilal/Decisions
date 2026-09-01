<%@ Page Language="C#" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            // اختبار إنشاء تذكرة
            FormsAuthenticationTicket ticket = new FormsAuthenticationTicket(
                1, "test", DateTime.Now, DateTime.Now.AddMinutes(30), false, "test", "/");
            
            string encrypted = FormsAuthentication.Encrypt(ticket);
            
            Response.Write("✅ نجح إنشاء التذكرة<br/>");
            Response.Write("Encrypted: " + encrypted.Substring(0, 50) + "...");
        }
        catch (Exception ex)
        {
            Response.Write("❌ فشل: " + ex.Message);
        }
    }
</script>
