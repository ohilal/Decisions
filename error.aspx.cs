using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class error : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        lbl404.Visible = (this.Request.QueryString["code"] != null && this.Request.QueryString["code"] == "404");
        lbl408.Visible = (this.Request.QueryString["code"] != null && this.Request.QueryString["code"] == "408");
        lbl505.Visible = (this.Request.QueryString["code"] != null && this.Request.QueryString["code"] == "505");
        lblError.Visible = (string.IsNullOrEmpty(this.Request.QueryString["code"]));

    }
}
