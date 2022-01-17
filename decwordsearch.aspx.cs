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

        if (!IsPostBack)
        {
            ListView1.DataBind();
        }
       
         
         

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {

        if (txtSearch.Text == "" || txtSearch.Text==String.Empty)
        { 
          
        Response.Write(@"<script language='javascript'>alert('من فضلك ادخل كلمة البحث');</script>"); 
        }
        else {
            //string Searching = Ignor.ignorAlef(txtSearch.Text, true, true, true, true);
            string Searching = Ignore.PrepareWords(txtSearch.Text, true, true, true);
            ListView1.DataSourceID = "sdstest";
            ListView1.DataBind();
        }
    }




    //txtSearch.Text = string.Empty;



    protected void sdstest_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        noDataLabel.Text = "";
        if (e.AffectedRows == 0)
        {

            noDataLabel.Text = "لا توجد بيانات";
        }
    }

 
}
