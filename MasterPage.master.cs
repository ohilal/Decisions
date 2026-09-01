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
using System.Net;
using System.Security.Principal;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //------------------------ members area-----------------
        if(Page.User.IsInRole("Members")|| Page.User.IsInRole("Admin"))
        {
            MemebersArea.Visible = true;
        }
        if (Page.User.IsInRole("Admin"))
        {
            AdminArea.Visible = true;
        }
        //------------------------ End members area---------------
        //------------------------------------ Track Visitors 

           //string ipAddress = IpAddress();
           //string hostName=Dns.GetHostEntry(ipAddress).HostName;
            //string hostName = Dns.GetHostByAddress(ipAddress).HostName; 


            //StreamWriter wrtr = new StreamWriter (Server.MapPath( "visitors.log" ), true ); 

            //wrtr.WriteLine( DateTime .Now.ToString() + " | " + ipAddress + " | " + hostName + " | " + Request.Url.ToString()); 

            //wrtr.Close(); 

        } 

        private string IpAddress() 

        { 

            string strIpAddress; 

            strIpAddress = Request.ServerVariables[ "HTTP_X_FORWARDED_FOR" ]; 

            if (strIpAddress == null ) 

                strIpAddress = Request.ServerVariables[ "REMOTE_ADDR" ]; 

            return strIpAddress; 

        }
    //--------------- end Teacking
    public static string GetSidFromIdentity()
    {
        // في صفحة ASP.NET، استخدم User.Identity وليس WindowsIdentity.GetCurrent()
        // لأن GetCurrent() قد يرجع SID الخاص بـ Application Pool
        WindowsIdentity winId = HttpContext.Current.User.Identity as WindowsIdentity;
        //HttpContext.Current.Request.LogonUserIdentity(winId);
        if (winId != null && winId.User != null)
        {
            return winId.User.Value; // S-1-5-21-xxxxx-xxxxx-xxxxx-xxxx
        }
        return null;
    }
}

