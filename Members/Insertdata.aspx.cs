using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.IO;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;



public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //--------------------- reset textboxes---------------
        //Control myForm = Page.FindControl("form1");
        //foreach (Control ctl in myForm.Controls)
        //    if (ctl.GetType().ToString().Equals("System.Web.UI.WebControls.TextBox"))
        //        ((TextBox)ctl).Text = "";
        

        CultureInfo.CreateSpecificCulture("ar-EG");
        Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-EG");
        string UpPath;
        UpPath = "C:\\UploadedUserFiles";
        if (!Directory.Exists(UpPath))
        {
            Directory.CreateDirectory("C:\\UploadedUserFiles\\");
        }

       

    }
        public void clearTextboxes()
    {
        txtTitle.Text = "";
        txtDate.Text = "";
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        //string Resource = string.Empty;

        //for (int i = 1; i < 11; i++)
        //{
        //    if (((TextBox)Panel1.FindControl("txtrec" + i.ToString())).Text != "")
        //        Resource += ((TextBox)Panel1.FindControl("txtrec" + i.ToString())).Text + "|";
        //}

        //if (Resource.Length > 0)
        //{
        //    Resource = Resource.Remove(Resource.Length - 1);
        //    sdsInsert.InsertParameters["Resource"].DefaultValue = Resource;
            
        //}

        if (FileUpload1.HasFile)
        {
            string filepath = FileUpload1.PostedFile.FileName;
            string filename = Path.GetFileName(filepath);
            string ext = Path.GetExtension(filename);

            sdsInsert.InsertParameters["Filepath"].DefaultValue= filename;
            //cmd.Parameters.Add("@name", SqlDbType.NVarChar, 200).Value = TextBox1.Text;

        }
        //string strFileName;
        //strFileName = FileUpload1.PostedFile.FileName;
        //string c = System.IO.Path.GetFileName(strFileName);

        //FileUpload1.PostedFile.SaveAs("C:\\UploadedUserFiles\\" + c);
        //    Span1.InnerHtml = "File Uploaded Sucessfully.";

        FileUpload1.SaveAs(Server.MapPath("~/UploadedUserFiles/") + FileUpload1.FileName);

        //sdsInsert.InsertParameters["photoID"].DefaultValue = photoID;
        //sdsInsert.InsertParameters["photoID"].Direction = ParameterDirection.Output;
        //try
        //{

            sdsInsert.Insert();
           Response.Redirect("~/success.aspx");
            
        //}
        //catch (Exception ex)
            //{ cmd.Parameters.Add("@PhotoID", SqlDbType.Int).Direction =
            //ParameterDirection.Output;
            
        //    lblerror.Visible = true;
        //    lblerror.Text = ex.Message;
        //}
    }

    //protected void btnuploadImage_Click(object sender, EventArgs e)
    //{
    //    byte[] photoARRAY = uploadImage.FileBytes;
    //    using (SqlConnection cn=new SqlConnection(ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString))
    //    {

    //        //using (SqlCommand cmd = new SqlCommand("insert into photos (Photo)values(@Photo)",cn))
    //        using (SqlCommand cmd =new SqlCommand("insertPhoto",cn))
    //        {
    //            cmd.CommandType = CommandType.StoredProcedure;
    //            //cmd.Parameters.Add("@PhotoID", SqlDbType.Int).Direction = ParameterDirection.Output;
                        
    //            cmd.Parameters.Add(new SqlParameter("@Photo", SqlDbType.Image, photoARRAY.Length));
    //                cmd.Parameters["@Photo"].Value=photoARRAY;
    //            cn.Open();
    //            int rowsAffected= cmd.ExecuteNonQuery();
    //            if (rowsAffected > 0)
    //            {
    //                lblUploadImage.Text = "تم تحميل الصورة";
    //            }
    //            else
    //            {
    //                lblUploadImage.Text = "خطأ فى تحميل الصورة..";
    //            }
               
    //            cn.Close();
 
    //        }
    //    }
       
    //}
    
}
