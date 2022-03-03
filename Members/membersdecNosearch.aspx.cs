using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Diagnostics;
public partial class decNosearch : System.Web.UI.Page
{
	protected void Page_Load(object sender, EventArgs e)
	{

	}

	protected void btnSearch_Click(object sender, EventArgs e)
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
        string tempFile = string.Format(@"Y:\UploadedDecisions\no.3-2022.PDF");
        Server.MapPath(@"\\192.168.14.42\Decisions\UploadedDecisions\no.3-2022.PDF");
        Response.Redirect("file://///ida-app1/Decisions/UploadedDecisions/no.3-2022.PDF");
    }
}