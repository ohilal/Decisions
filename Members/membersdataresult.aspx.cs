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
}
