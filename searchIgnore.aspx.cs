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
using System.IO;

public partial class searchIgnore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {

        string txtsearch = Ignor.ignorAlef(textbox1.Text, CheckBox1.Checked, CheckBox2.Checked, CheckBox3.Checked, CheckBox4.Checked);

        string MyWhere = " WHERE (dbo.ContainsRegExp(Keywords, N'" + txtsearch + "') = 1)";
        //savedata.FillInMyData("select * from Fullinfo"+ MyWhere, databank, MainDBDataSet.;

    }

   
}
