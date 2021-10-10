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

public partial class Members_membersdataresult : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public static void AddConfirmDelete(GridView gv, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            foreach (DataControlField dcf in gv.Columns)
            {
                if (dcf.ToString() == "CommandField")
                {
                    if (((CommandField)dcf).ShowDeleteButton == true)
                    {
                        e.Row.Cells[gv.Columns.IndexOf(dcf)].Attributes
                        .Add("onclick", "return confirm(\"هل انت متأكد من الغاء الدراسة؟\")");
                    }
                }
            }
        }
    }//
    protected void grdSearch_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        AddConfirmDelete((GridView)sender, e);

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        AddConfirmDelete((GridView)sender, e);
    }
    protected void btnDel_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        GridViewRow row = btn.NamingContainer as GridViewRow;

        int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values[0]);
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
        GridView1.DataBind();
       
    }
}
