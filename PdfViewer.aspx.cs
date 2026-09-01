using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.IO;


public partial class PdfViewer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // 1. التحقق من اسم الملف
            string fileName = Request.QueryString["f"];
            if (string.IsNullOrEmpty(fileName))
            {
                Response.StatusCode = 400;
                Response.Write("ملف غير محدد");
                Response.End();
                return;
            }

            // 2. تنظيف اسم الملف
            string safeName = Path.GetFileName(fileName);
            if (string.IsNullOrEmpty(safeName))
            {
                Response.StatusCode = 400;
                Response.Write("اسم ملف غير صالح");
                Response.End();
                return;
            }

            // 3. التحقق من وجود الملف
           // string physicalPath = Server.MapPath("~/DecisionsData/" + safeName);
            string physicalPath = Server.MapPath("~/UploadedDecisions/" + safeName);// to use internally ONLY 
            if (!File.Exists(physicalPath))
            {
                Response.StatusCode = 404;
                Response.Write("الملف غير موجود");
                Response.End();
                return;
            }

            // 4. جلب الـ SID من LDAP
            string sid = "UNKNOWN-SID";
            string userName = "UNKNOWN";
            string displayName = "";

            try
            {
                userName = AdHelper.GetCurrentFullUsername();
                string samName = AdHelper.GetCurrentUsername();

                if (!string.IsNullOrEmpty(samName))
                {
                    AdUserInfo userInfo = AdHelper.GetFullUserInfo(samName);
                    if (userInfo != null)
                    {
                        if (!string.IsNullOrEmpty(userInfo.Sid))
                            sid = userInfo.Sid;
                        if (!string.IsNullOrEmpty(userInfo.DisplayName))
                            displayName = userInfo.DisplayName;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error getting user info: " + ex.Message);
            }

            // 5. تسجيل الوصول
            LogAccess(userName, safeName, sid);

            // 6. تمرير القيم إلى الصفحة
            hfPdfUrl.Value = ResolveUrl("~/PdfHandler.ashx?f=" + HttpUtility.UrlEncode(safeName));
            hfUserSid.Value = sid;
            hfUserName.Value = string.IsNullOrEmpty(displayName) ? userName : displayName;
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