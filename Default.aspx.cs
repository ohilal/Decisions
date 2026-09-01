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
            if (ListView2.Items.Count == 0)
            {
                divmarquee.Visible = false;
            }
            else
            {
                divmarquee.Visible = true;
            }

        }

        // new Marquee

        DataSourceSelectArguments args = new DataSourceSelectArguments();
DataView view = sdsmarquee.Select(args) as DataView; 

       // DataView view = (DataView)sdsmarquee.Select(DataSourceSelectArguments.Empty);

        DataTable table = view.ToTable();
        DataSet ds1 = new DataSet();
        ds1.Tables.Add(table);
        // DataSet ds1 = object.GetRecord();
        //obj.GetRecord(); /*this obj is referring to some class in which GetRecord method is present which return the record from database. You can write your //own class and method.*/
        string s1;
        s1 = "<table><tr><td>";

        for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
        {
            int j;
            //s1 += ds1.Tables[0].Rows.Count;
            //           s1 += ds1.Tables[0].Rows[0][0].ToString();
            //s1 += "<br/>";
            //s1 += ds1.Tables[0].Rows[0][1].ToString();
            // <a href='../DecisionsData/<%# Eval("decisionFile") %>' target='_blank'> 
            // s1 += ds1.Tables[0].Rows[i]["decisionFile"].ToString() ;
           s1 += "<a href='../DecisionsData/" + ds1.Tables[0].Rows[i]["decisionFile"].ToString() + "' target='_blank' style='font-family: fantasy; font-size: large; font-weight:bold; font-style: normal; color: #660066'>" + ds1.Tables[0].Rows[i][0].ToString() + "</a>";
            s1 += "&nbsp;<i class='fa-solid fa-gears text-danger'></i>&nbsp;";
            
        }
        s1 += "</tr></table>";
        //lt1.Text = s1.ToString();
        //lt2.Text = s1.ToString();
  
        //---------------------
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

