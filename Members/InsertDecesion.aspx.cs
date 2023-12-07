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
        
        if (uploadDecesion.HasFile)
        {
            string filepath = uploadDecesion.PostedFile.FileName;
            string filename = Path.GetFileName(filepath);
            string ext = Path.GetExtension(filename);
            SqlDataSource1.InsertParameters["decisionFile"].DefaultValue = filename;
        }
        uploadDecesion.SaveAs(Server.MapPath("~/../DecisionsData/") + uploadDecesion.FileName);
		SqlDataSource1.InsertParameters["aspuser"].DefaultValue = Page.User.Identity.Name;
        // @"\\ida-app2\IDAInternalPortal\TSN\DDP\Scanned Documents\"
        //uploadDecesion.SaveAs(Server.MapPath(@"\\192.168.14.42\d$\Decisions\") + uploadDecesion.FileName);
          SqlDataSource1.Insert();
          Response.Redirect("~/success.aspx");
    }
}
