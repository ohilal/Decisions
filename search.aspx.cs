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

public partial class search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (ddlsearch.SelectedValue == "3")
        {
            ddlbranch_search.Visible = true;
        }
        else { ddlbranch_search.Visible = false; }

    }
    protected void btnBrnSearch_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
        if (ddlbranch_search.SelectedValue == "13")
        {
            GridView1.DataSource = testsds;
        }
        else { GridView1.DataSource = sdsbranch_search; }
        GridView1.DataSourceID = String.Empty;

    }
    protected void ddlsearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlbranch_search.Visible = false;
        GridView1.Visible = false;
       

    }
    protected void ddlbranch_search_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnBrnSearch.Visible = true;
    }
}
