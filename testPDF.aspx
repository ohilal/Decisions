<%@ Page Language="C#" %>
<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Write("<h3>تشخيص مسارات الملفات</h3>");
        Response.Write("<style>table { border-collapse: collapse; } td, th { border: 1px solid #ccc; padding: 8px; }</style>");
        Response.Write("<table>");
        Response.Write("<tr><th>المسار</th><th>المسار الفعلي</th><th>موجود؟</th><th>عدد الملفات</th></tr>");

        string[] paths = new string[]
        {
            Server.MapPath("~/UploadedDecisions/"),
            //Server.MapPath("../UploadedDecisions/"),
            //Server.MapPath("../../UploadedDecisions/"),
            Server.MapPath("~/App_Data/UploadedDecisions/"),
            Server.MapPath("~/Admins/UploadedDecisions/"),
            Server.MapPath("~/Members/UploadedDecisions/")
        };

        foreach (string path in paths)
        {
            bool exists = System.IO.Directory.Exists(path);
            int fileCount = 0;
            string sampleFiles = "";

            if (exists)
            {
                string[] files = System.IO.Directory.GetFiles(path, "*.pdf");
                fileCount = files.Length;
                for (int i = 0; i < Math.Min(3, files.Length); i++)
                {
                    sampleFiles += System.IO.Path.GetFileName(files[i]) + "<br/>";
                }
            }

            string rowColor = exists ? "#d4edda" : "#f8d7da";
            Response.Write("<tr style='background:" + rowColor + "'>");
            Response.Write("<td>" + path + "</td>");
            Response.Write("<td>" + (exists ? "✅" : "❌") + "</td>");
            Response.Write("<td>" + exists + "</td>");
            Response.Write("<td>" + fileCount + " ملف PDF<br/>" + sampleFiles + "</td>");
            Response.Write("</tr>");
        }

        Response.Write("</table>");

        Response.Write("<hr/>");
        Response.Write("<h4>اختبار PdfHandler:</h4>");
        Response.Write("<p>افتح هذا الرابط في تاب جديد (استبدل filename.pdf باسم ملف موجود):</p>");
        Response.Write("<a href='PdfHandler.ashx?f=no.1109-2026.PDF' target='_blank'>PdfHandler.ashx?f=no.1109-2026.PDF</a>");
    }
</script>
