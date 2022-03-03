using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Diagnostics;
using System.Data.SqlClient;
using System.Configuration;

public partial class testSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        GridViewRow row = btn.NamingContainer as GridViewRow;

        int id = Convert.ToInt32(DataList1.DataKeys[0]);
        string constr = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string sql = " DELETE FROM decisions_Info WHERE (decID = @decID)";
                cmd.CommandText = sql;
                cmd.Parameters.AddWithValue("decID", id);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        DataList1.DataBind();
    }
    public void openFile(string _uri)
    {
        Process.Start(@_uri.ToString()); //use the @ to use the string as is.
    }

    protected void LinkButton1_Command(object sender, CommandEventArgs e)
    {
        openFile(e.CommandArgument.ToString());
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string tempFile = string.Format(@"\\192.168.14.42\Decisions\UploadedDecisions\no.3-2022.PDF");
        Server.MapPath(@"\\192.168.14.42\Decisions\UploadedDecisions\no.3-2022.PDF");
        Response.Redirect("file://///ida-app1/Decisions/UploadedDecisions/no.3-2022.PDF");
       
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        HyperLink lnk = (HyperLink)(e.Item.FindControl("HyperLink2"));
string fileName = "no.3-2022.PDF";
        lnk.NavigateUrl= string.Format(@"\\192.168.14.42\Decisions\UploadedDecisions\") + fileName;
        lnk.Text = fileName;
        LinkButton lib=(LinkButton)(e.Item.FindControl("LinkButton1"));
        lib.CommandArgument= @"\\192.168.14.42\Decisions\UploadedDecisions\" + fileName;

    }
}