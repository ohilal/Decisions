using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;

public partial class InsertDecesion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string UpPath;
        UpPath = "C:\\UploadedDecisions";
        if (!Directory.Exists(UpPath))
        {
            Directory.CreateDirectory("C:\\UploadedDecisions\\");
        }


    }
    protected void btnSubmitDec_Click(object sender, EventArgs e)
    {
        
        if (uploadGuideFile.HasFile)
        {
            string filepath = uploadGuideFile.PostedFile.FileName;
            string filename = Path.GetFileName(filepath);
            string ext = Path.GetExtension(filename);
            SqlDataSource1.InsertParameters["TemplatePath"].DefaultValue = filename;
        }

        uploadGuideFile.SaveAs(Server.MapPath("~/UploadedDecisions/") + uploadGuideFile.FileName);
		//Response.Write(txtDate.Text);
          SqlDataSource1.Insert();
          Response.Redirect("~/success.aspx");
    }

	
}
