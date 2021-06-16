using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for autoComplete
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class autoComplete : System.Web.Services.WebService {

    public autoComplete () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetActivity(string prefixText)
{
 int count = 10;
 string sql = "Select activityName,activityCode from Activities Where activityName like '%'+ @prefixText + '%' or activityCode like  @prefixText ";
 //string sql = "SELECT activityName + ' ' + (select cast(activityCode as nvarchar(255)))as [coding] FROM Activities Where activityName like '%'+ @prefixText + '%' or activityCode like  @prefixText";
 SqlDataAdapter da = new SqlDataAdapter(sql, ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString);
 da.SelectCommand.Parameters.Add("@prefixText", SqlDbType.NVarChar, 255).Value = prefixText+"%";
 //secID = HttpContext.Current.Request.UrlReferrer.Query;
 DataTable dt = new DataTable(); 
 da.Fill(dt); 
 string[] items = new string[dt.Rows.Count];
 int i = 0; 
 foreach (DataRow dr in dt.Rows) 
 {
     items.SetValue(dr["activityName"].ToString(), i);
     //items.SetValue(dr["activityCode"].ToString(), i); 
  i++; 
 } 
 return items; 
} 
    
}

