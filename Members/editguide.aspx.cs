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
       Response.Write( Request.QueryString["ID"]);



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
        
        

        FileUpload file = (FileUpload)DetailsView1.FindControl("uploadTemp");
        if (file.HasFile)
        {
            string filepath = file.PostedFile.FileName;
            string filename = Path.GetFileName(filepath);
            SqlDataSource1.UpdateParameters["guideFileExt"].DefaultValue = filename;

        }

        
        file.SaveAs(Server.MapPath("~/../DecisionsData/") + file.FileName);
        SqlDataSource1.Update();
        SqlDataSource1.DataBind();
        //if (e.NewValues == null)
        //{

        //    SqlDataSource1.UpdateParameters["decID"].DefaultValue = Request.QueryString["decID"];
        //    SqlDataSource1.UpdateParameters["decNo"].DefaultValue = e.NewValues["decNo"].ToString();
        //    SqlDataSource1.UpdateParameters["decTitle"].DefaultValue = e.NewValues["decTitle"].ToString();
        //    SqlDataSource1.UpdateParameters["decKeywords"].DefaultValue = e.NewValues["decKeywords"].ToString();
        //    SqlDataSource1.UpdateParameters["decisionFile"].DefaultValue = e.NewValues["decisionFile"].ToString();
        //    SqlDataSource1.UpdateParameters["decTypeID"].DefaultValue = e.NewValues["decTypeID"].ToString();
        //    //SqlDataSource1.UpdateParameters["Filepath"].DefaultValue = e.NewValues["Filepath"].ToString();
        //    SqlDataSource1.UpdateParameters["decsubjectNo"].DefaultValue = e.NewValues["decsubjectNo"].ToString();
        //    //SqlDataSource1.UpdateParameters["langId"].DefaultValue = e.NewValues["langId"].ToString();
        //    SqlDataSource1.Update();
        //}

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
