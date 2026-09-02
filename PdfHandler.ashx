<%@ WebHandler Language="C#" Class="PdfHandler" %>

using System;
using System.IO;
using System.Web;

public class PdfHandler : IHttpHandler
{
    public void ProcessRequest(HttpContext context)
    {
        try
        {
            // 1. التحقق من المصادقة
            if (context.User == null || context.User.Identity == null || !context.User.Identity.IsAuthenticated)
            {
                context.Response.StatusCode = 401;
                context.Response.ContentType = "text/plain";
                context.Response.Write("Unauthorized");
                context.Response.End();
                return;
            }

            // 2. جلب اسم الملف
            string fileName = context.Request.QueryString["f"];
            if (string.IsNullOrEmpty(fileName))
            {
                context.Response.StatusCode = 400;
                context.Response.ContentType = "text/plain";
                context.Response.Write("File name is required");
                context.Response.End();
                return;
            }

            // 3. تنظيف اسم الملف (منع directory traversal)
            string safeName = Path.GetFileName(fileName.Trim());
            if (string.IsNullOrEmpty(safeName))
            {
                context.Response.StatusCode = 400;
                context.Response.ContentType = "text/plain";
                context.Response.Write("Invalid file name");
                context.Response.End();
                return;
            }

            // 4. البحث عن الملف في عدة مسارات محتملة
            string physicalPath = FindPdfFile(context, safeName);

            if (string.IsNullOrEmpty(physicalPath))
            {
                context.Response.StatusCode = 404;
                context.Response.ContentType = "text/plain";
                context.Response.Write("File not found: " + safeName);
                context.Response.End();
                return;
            }

            // 5. إرسال الملف
            FileInfo fileInfo = new FileInfo(physicalPath);

            context.Response.Clear();
            context.Response.ContentType = "application/pdf";
            context.Response.AddHeader("Content-Disposition", "inline; filename=\"" + safeName + "\"");
            context.Response.AddHeader("Content-Length", fileInfo.Length.ToString());

            // منع الـ Cache
            context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
            context.Response.Cache.SetNoStore();
            context.Response.AddHeader("Pragma", "no-cache");
            context.Response.AddHeader("Expires", "0");

            // إرسال الملف
            context.Response.TransmitFile(physicalPath);
            context.Response.Flush();
        }
        catch (Exception ex)
        {
            try
            {
                context.Response.StatusCode = 500;
                context.Response.ContentType = "text/plain";
                context.Response.Write("Error: " + ex.Message);
            }
            catch { }

            System.Diagnostics.Debug.WriteLine("PdfHandler Error: " + ex.ToString());
        }
    }

    /// <summary>
    /// البحث عن الملف في عدة مسارات محتملة
    /// </summary>
    private string FindPdfFile(HttpContext context, string fileName)
    {
        // ✅ قائمة بالمسارات المحتملة - داخل جذر التطبيق فقط
        string[] possiblePaths = new string[]
        {
            // المسار 1: داخل جذر التطبيق
            context.Server.MapPath("~/UploadedDecisions/" + fileName),
            
            // المسار 2: داخل App_Data
            context.Server.MapPath("~/App_Data/UploadedDecisions/" + fileName),
            
            // المسار 3: داخل مجلد Admin
            context.Server.MapPath("~/Admin/UploadedDecisions/" + fileName),
            
            // المسار 4: داخل مجلد Members
            context.Server.MapPath("~/Members/UploadedDecisions/" + fileName),
            
            // المسار 5: داخل مجلد Admins (بدون d)
            context.Server.MapPath("~/Admins/UploadedDecisions/" + fileName)
        };

        foreach (string path in possiblePaths)
        {
            try
            {
                if (File.Exists(path))
                {
                    System.Diagnostics.Debug.WriteLine("PdfHandler: File found at - " + path);
                    return path;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("PdfHandler: Error checking path " + path + " - " + ex.Message);
            }
        }

        // تسجيل المسارات التي تم البحث فيها للمساعدة في التشخيص
        System.Diagnostics.Debug.WriteLine("PdfHandler: File not found. Searched paths:");
        foreach (string path in possiblePaths)
        {
            System.Diagnostics.Debug.WriteLine("  - " + path);
        }

        return null;
    }

    public bool IsReusable
    {
        get { return false; }
    }
}