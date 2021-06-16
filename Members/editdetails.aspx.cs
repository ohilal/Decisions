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
using System.Data.Common;


public partial class Members_editdetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //((RadioButtonList)DetailsView1.FindControl("rdlMostwfi")).SelectedValue;

    }
    
    protected void SqlDataSource1_Updating(object sender, SqlDataSourceCommandEventArgs e)
    {
        DbParameterCollection CmdParams = e.Command.Parameters;
        ParameterCollection UpdParams = ((SqlDataSourceView)sender).UpdateParameters;

        Hashtable ht = new Hashtable();
        foreach (Parameter UpdParam in UpdParams)
            ht.Add(UpdParam.Name, true);

        for (int i = 0; i < CmdParams.Count; i++)
        {
            if (!ht.Contains(CmdParams[i].ParameterName.Substring(1)))
                CmdParams.Remove(CmdParams[i--]);
        }
    }
    protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
    {

        
      
            SqlDataSource1.OldValuesParameterFormatString = "";

            //FileUpload file = (FileUpload)DetailsView1.FindControl("FileUpload1");
            //if (file.HasFile)
            //{
            //    string filepath = file.PostedFile.FileName;
            //    string filename = Path.GetFileName(filepath);
            //    SqlDataSource1.UpdateParameters["Filepath"].DefaultValue = filename;

            //}


            //file.SaveAs(Server.MapPath("~/UploadedUserFiles/") + file.FileName);
if (e.NewValues == null)
{
            SqlDataSource1.UpdateParameters["dID"].DefaultValue = Request.QueryString["dID"];
            SqlDataSource1.UpdateParameters["Title"].DefaultValue = e.NewValues["Title"].ToString();
            SqlDataSource1.UpdateParameters["Summury"].DefaultValue = e.NewValues["Summury"].ToString();
            SqlDataSource1.UpdateParameters["Date"].DefaultValue = e.NewValues["Date"].ToString();
            SqlDataSource1.UpdateParameters["BranchID"].DefaultValue = e.NewValues["BranchID"].ToString();
            SqlDataSource1.UpdateParameters["activityCode"].DefaultValue = e.NewValues["activityCode"].ToString();
            //SqlDataSource1.UpdateParameters["Filepath"].DefaultValue = e.NewValues["Filepath"].ToString();
            SqlDataSource1.UpdateParameters["Keywords"].DefaultValue = e.NewValues["Keywords"].ToString();
            SqlDataSource1.UpdateParameters["langId"].DefaultValue = e.NewValues["langId"].ToString();
        }
        
    }

    protected void DetailsView1_ItemCreated(object sender, EventArgs e)
    {
        {
            // Test FooterRow to make sure all rows have been created 
            if (DetailsView1.FooterRow != null)
            {
                // The command bar is the last element in the Rows collection
                int commandRowIndex = DetailsView1.Rows.Count - 1;
                if (commandRowIndex > 0)
                {
                    DetailsViewRow commandRow = DetailsView1.Rows[commandRowIndex];
                    // Look for the DELETE button
                    DataControlFieldCell cell = (DataControlFieldCell)commandRow.Controls[0];
                    foreach (Control ctl in cell.Controls)
                    {
                        LinkButton link = ctl as LinkButton;
                        if (link != null)
                        {
                            //    if (link.CommandName == "Delete")
                            //    {
                            //        link.ToolTip = "اضغط هنا للإلغاء";
                            //        link.OnClientClick = "return confirm('هل أنت متأكد من إلغاءالبيان؟');";
                            //    }
                            if (link.CommandName == "Update")
                            {
                                link.ToolTip = "اضغط هنا للتعديل";
                                link.OnClientClick = "return confirm('هل أنت متأكد من تعديل البيان؟');";
                            }
                            if (link.CommandName == "Edit")
                            {
                                link.ToolTip = "اضغط هنا للتعديل";

                            }
                        }

                    }
                }
            }
        }
    
    }
}
