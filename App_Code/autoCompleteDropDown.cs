using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;


/// <summary>
/// Summary description for autoCompleteDropDown
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class autoCompleteDropDown : System.Web.Services.WebService {
SqlConnection conn= new SqlConnection(ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString);
    public autoCompleteDropDown () {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public string[] GetCountryOrStatesInfo(string prefixText, string contextKey) 

{ 

  int count = 10; 
  string sql=null;
  sql = "Select activityName,activityCode from Activities Where activityName like '%'+ @prefixText + '%' or activityCode like  @prefixText " + contextKey + "'";
 SqlDataAdapter da = new SqlDataAdapter(sql,conn); 
 da.SelectCommand.Parameters.Add("@prefixText",SqlDbType.VarChar, 255).Value = prefixText + "%"; 

  DataTable dt = new DataTable(); 

  da.Fill(dt); 

 

  string[] items = new string[dt.Rows.Count]; 

  int i = 0; 

  foreach (DataRow dr in dt.Rows) 

  { 

    items.SetValue(dr[0].ToString(), i); 

    i++; 

   

  } 

 

    return items; 

}

 

  

    

}



