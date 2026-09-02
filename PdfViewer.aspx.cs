using System;
using System.IO;
using System.Web;

public partial class PdfViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 1. التحقق من المصادقة
            if (User == null || User.Identity == null || !User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/Login.aspx?ReturnUrl=" +
                    HttpUtility.UrlEncode(Request.RawUrl));
                return;
            }

            // 2. التحقق من اسم الملف
            string fileName = Request.QueryString["f"];
            if (string.IsNullOrEmpty(fileName))
            {
                Response.StatusCode = 400;
                Response.Write("ملف غير محدد");
                Response.End();
                return;
            }

            // 3. تنظيف اسم الملف (منع directory traversal)
            string safeName = Path.GetFileName(fileName);
            if (string.IsNullOrEmpty(safeName))
            {
                Response.StatusCode = 400;
                Response.Write("اسم ملف غير صالح");
                Response.End();
                return;
            }

            // 4. التحقق من وجود الملف
            string physicalPath = Server.MapPath("~/UploadedDecisions/" + safeName);
           // string physicalPath = Server.MapPath("~/DecisionsData/" + safeName); //this is for the server
            if (!File.Exists(physicalPath))
            {
                Response.StatusCode = 404;
                Response.Write("الملف غير موجود");
                Response.End();
                return;
            }

            // 5. جلب معلومات المستخدم من FormsAuthenticationTicket
            string sid = "UNKNOWN-SID";
            string userName = "UNKNOWN";

            try
            {
                sid = AuthHelper.GetCurrentUserSid();
                userName = AuthHelper.GetCurrentFullUsername();
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting user info: " + ex.Message);
            }

            // 6. تسجيل الوصول
            LogAccess(userName, safeName, sid);

            // 7. تمرير القيم إلى الصفحة
            hfPdfUrl.Value = ResolveUrl("~/PdfHandler.ashx?f=" + HttpUtility.UrlEncode(safeName));
            hfUserSid.Value = sid;
            hfUserName.Value = userName;
            hfDocTitle.Value = Path.GetFileNameWithoutExtension(safeName);
        }
    }

    private void LogAccess(string user, string file, string sid)
    {
        try
        {
            string logPath = Server.MapPath("~/App_Data/pdf_access.log");
            string line = string.Format("{0:yyyy-MM-dd HH:mm:ss}\t{1}\t{2}\t{3}\r\n",
                DateTime.Now, user, sid, file);
            File.AppendAllText(logPath, line);
        }
        catch { }
    }
}