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
using System.Windows.Forms;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write(ListView2.EmptyDataTemplate.ToString() + "empty");
        ListView2.DataSourceID = "sdsmarquee";
        ListView2.DataBind();
        if (!IsPostBack)
        {
              if (ListView2.Items.Count ==0)
        {
            divmarquee.Visible = false;
        }
        else
        {
            divmarquee.Visible = true;
        }
           
        }

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
	
    protected string GetVisibility(string MakeFlag)
    {

        if (MakeFlag == "")
        {
            return "none";
        }
        else
        {
            return "block";
        }
    }


    


}

