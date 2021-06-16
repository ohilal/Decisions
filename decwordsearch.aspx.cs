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
public partial class searchData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     

       
         ListView1.DataBind();
         

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtSearch.Text == "")
        { 
          
        Response.Write(@"<script language='javascript'>alert('من فضلك ادخل كلمة البحث');</script>"); 
        }
        //string Searching = Ignor.ignorAlef(txtSearch.Text, true, true, true, true);
        string Searching = Ignore.PrepareWords(txtSearch.Text, true, true, true, true); 
        
    }



   
        //txtSearch.Text = string.Empty;
    
   
}
