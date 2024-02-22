using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Caching;
using PushNotification;

public partial class notifications : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            this.DataBind();
        }
        Label1.Text = "Cache Refresh: " +
    DateTime.Now.ToLongTimeString();

        // Create a dependency connection to the database.
        SqlDependency.Start(GetConnectionString());

        using (SqlConnection connection =
            new SqlConnection(GetConnectionString()))
        {
            using (SqlCommand command =
                new SqlCommand(GetSQL(), connection))
            {
                SqlCacheDependency dependency =
                    new SqlCacheDependency(command);
                // Refresh the cache after the number of minutes
                // listed below if a change does not occur.
                // This value could be stored in a configuration file.
                int numberOfMinutes = 3;
                DateTime expires =
                    DateTime.Now.AddMinutes(numberOfMinutes);

                Response.Cache.SetExpires(expires);
                Response.Cache.SetCacheability(HttpCacheability.Public);
                Response.Cache.SetValidUntilExpires(true);

                Response.AddCacheDependency(dependency);

                connection.Open();

                GridView1.DataSource = command.ExecuteReader();
                GridView1.DataBind();
            }
        }
    }
    private string GetConnectionString()
    {
        // To avoid storing the connection string in your code,
        // you can retrieve it from a configuration file.
        return "Data Source = .; Initial Catalog = databank; user Id = databank; password = bank; ";
    }
    private string GetSQL()
    {
        return "SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decKeywords, decisions_Info.decisionFile, decisions_Info.decTypeID, decisions_Info.decDate, decision_Types.decType FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID order by decisions_Info.decDate desc";
    }

    protected void OnPaging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        this.DataBind();
    }
    //public JsonResult GetNotificationContacts()
    //{
    //    var notificationRegisterTime = Session["LastUpdated"] != null ? Convert.ToDateTime(Session["LastUpdated"]) : DateTime.Now;
    //    NotificationComponent NC = new NotificationComponent();
    //    var list = NC.GetContacts(notificationRegisterTime);
    //    //update session here for get only new added contacts (notification)
    //    Session["LastUpdate"] = DateTime.Now;
    //    return new JsonResult { Data = list, JsonRequestBehavior = JsonRequestBehavior.AllowGet };
    //}
}