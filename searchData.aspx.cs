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
public partial class searchData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
         ListView1.DataBind();
         if (ddlsearch.SelectedValue == "3")
         {
             ddlmangment.Visible = true;
             ddlbranch_search.Visible = true;

         }
         else { ddlbranch_search.Visible = false;
         ddlmangment.Visible = false;
         }

         if (ddlsearch.SelectedValue == "1")
         {
             ddlactivity.Visible = true;
         }
         else { ddlactivity.Visible = false; }

    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        //string connection = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;
        if (txtSearch.Text == "")
        { 
            //lblSearch.Text = "من فضلك ادخل كلمه البحث";
        Response.Write(@"<script language='javascript'>alert('من فضلك ادخل كلمة البحث');</script>"); 
        }

        //txtSearch.Text = string.Empty;
        //{
        //    using (SqlConnection cn = new SqlConnection(connection))
        //    {
        //        cn.Open();
        //        using (SqlCommand cmd = new SqlCommand("searchKeywords", cn))
        //        {
        //            cmd.CommandType = CommandType.StoredProcedure;
        //            cmd.Parameters.Add("@searchword", SqlDbType.NVarChar, 200).Value = txtSearch.Text;
        //            ListView1.DataSource = cmd.ExecuteReader();
                   
                   

        //        }
        //        cn.Close();
        //    }
        //}
    }



   
        //txtSearch.Text = string.Empty;
    protected void btnBrnSearch_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }
    protected void ddlsearch_SelectedIndexChanged(object sender, EventArgs e)
    {
        //ddlbranch_search.Visible = false;
        GridView1.Visible = false;
        GridView2.Visible = false;


    }
    protected void ddlbranch_search_SelectedIndexChanged(object sender, EventArgs e)
    {
        btnBrnSearch.Visible = true;
    }
   
}
