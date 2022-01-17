using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using Microsoft.AspNet.SignalR;

namespace PushNotification
{
    public class NotificationComponent
    {
        //Here we will add a function for register notification (will add sql dependency)
        public void RegisterNotification(DateTime currentTime)
        {
            string conStr = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;
            // SelectCommand = "SELECT  decisions_Info.decID, decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decisionFile, decision_Types.decType, CONVERT (varchar, decisions_Info.decDate, 103) AS date, decisions_Info.decsubjectNo FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID ORDER BY decisions_Info.decDate DESC" >
            string sqlCommand = @"SELECT [decNo] ,[decTitle],[date],[Status] FROM [databank].[dbo].[decisions_Audit] where [date]>@AddedOn";
            //string sqlCommand = @"SELECT [ContactID],[ContactName],[ContactNo] from [dbo].[Contacts] where [AddedOn] > @AddedOn";
            //you can notice here I have added table name like this [dbo].[Contacts] with [dbo], its mendatory when you use Sql Dependency
            using (SqlConnection con = new SqlConnection(conStr))
            {
                SqlCommand cmd = new SqlCommand(sqlCommand, con);
                cmd.Parameters.AddWithValue("@AddedOn", currentTime);
                if (con.State != System.Data.ConnectionState.Open)
                {
                    con.Open();
                }
                cmd.Notification = null;
                SqlDependency sqlDep = new SqlDependency(cmd);
                sqlDep.OnChange += sqlDep_OnChange;
                //we must have to execute the command here
                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    // nothing need to add here now
                }
            }
        }

        void sqlDep_OnChange(object sender, SqlNotificationEventArgs e)
        {
            //or you can also check => if (e.Info == SqlNotificationInfo.Insert) , if you want notification only for inserted record
            //if (e.Info == SqlNotificationInfo.Insert)
            if (e.Type == SqlNotificationType.Change)
            {
                SqlDependency sqlDep = sender as SqlDependency;
                sqlDep.OnChange -= sqlDep_OnChange;

                //from here we will send notification message to client
                var notificationHub = GlobalHost.ConnectionManager.GetHubContext<NotificationHub>();
                notificationHub.Clients.All.notify("added");
                //re-register notification
                RegisterNotification(DateTime.Now);
            }
        }

        
        //public List<decisions_Audit> GetContacts(DateTime afterDate)
        //{
        //    using (MyPushNotificationEntities dc = new MyPushNotificationEntities())
        //    {
        //        return dc.Contacts.Where(a => a.AddedOn > afterDate).OrderByDescending(a => a.AddedOn).ToList();
        //    }
        //}
    }
}