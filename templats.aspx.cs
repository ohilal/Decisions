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
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
public partial class searchData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //CultureInfo.CreateSpecificCulture("ar-EG");
        //Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-EG");

       
         
         //if (ddlsearch.SelectedValue == "3")
         //{
         //    ddlmangment.Visible = true;
         //    ddlbranch_search.Visible = true;
         //    GridView3.Visible = false;

         //}
         //else { ddlbranch_search.Visible = false;
         //ddlmangment.Visible = false;
         //}

         //if (ddlsearch.SelectedValue == "1")
         //{
         //    ddlactivity.Visible = true;
         //    ddlsubsector.Visible = true;
         //    GridView1.Visible = false;
         //}
         //else { ddlactivity.Visible = false;
         //ddlsubsector.Visible = false;
         //}

    }









    protected void btnsearch_Click(object sender, EventArgs e)
    {
        SqlDataSource1.SelectCommand = "SELECT TemplateName, TemplatePath, typeID FROM Templates WHERE(typeID = @gID) and TemplateName like N'%" + txtsearch.Text + "%'";


    }
}
