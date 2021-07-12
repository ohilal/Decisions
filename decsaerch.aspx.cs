using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class testDate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void sdsDate_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {
        noDataLabel.Text = "";
        if (e.AffectedRows == 0)
        {

            noDataLabel.Text = "لا توجد بيانات";
        }
    }
}
