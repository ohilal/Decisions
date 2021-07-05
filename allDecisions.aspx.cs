using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class allDecisions : System.Web.UI.Page
{
    string[] id = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        string constr = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;
        //if (Request.QueryString["id"] != null)
        //{
        //    id = ((string)Request.QueryString["id"]).Split(',');
        //    using (SqlConnection con = new SqlConnection(constr))
        //{
        //    using (SqlCommand cmd = new SqlCommand())
        //    {
        //        string sql = "SELECT decisions_Info.decNo, decisions_Info.decTitle, decDate, decision_Types.decType, decisions_Info.decisionFile FROM decision_Types INNER JOIN decisions_Info ON decision_Types.decTypeID = decisions_Info.decTypeID WHERE decision_Types.decTypeID=@decTypeID ORDER BY decDate DESC SET DATEFORMAT dmy ";
        //        cmd.CommandText = sql;
        //        cmd.Connection = con;
        //        using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
        //        {
        //            cmd.Parameters.AddWithValue("@decTypeID", Request.QueryString["id"].ToString());
        //            DataTable dt = new DataTable();
        //            sda.Fill(dt);
        //            ListView1.DataSource = sdsDate;
        //            ListView1.DataBind();
        //        }
        //    }
        //}
        //    }
        


    }
}