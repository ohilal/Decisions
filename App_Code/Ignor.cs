using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

/// <summary>
/// Summary description for Ignor
/// </summary>
public class Ignor
{
    public static string ignorAlef(string MyWords, bool IgnoreTashkeel ,bool IgnoreHamzat, bool IgnoreTahMarbota, bool AhrofAlela)
   {
        
    string MyNewString = "";
    if (IgnoreTashkeel) {
        string IgnrTshForm = "[ًٌٍَُِّْ~`]*";
        for (int i = 0; i <= MyWords.Length - 1; i++) {
            MyNewString += (MyWords.Substring(i, 1) + IgnrTshForm);

        }
   }
    else {
       MyNewString = MyWords;
    }
    int uu =MyWords.Length;
    string[] aaa = new string[uu];
    for (int i = 0; i <= uu - 1; i++) {
        aaa[i] = (MyWords.Substring(i+ 1, 1)) ;
   }
    for (int t = 0; t <= aaa.Length - 1; t++) {
        switch (aaa[t]) {
            case "ا":
                if (IgnoreHamzat) aaa[t] = "[اأإآؤئء]"; 
               if (AhrofAlela) aaa[t] = "[اويى]"; 
               break;
           case "أ":
                if (IgnoreHamzat) aaa[t] = "[اأإآؤئء]"; 
                break;
            case "إ":
                if (IgnoreHamzat) aaa[t] = "[اأإآؤئء]"; 
                break;
            case "آ":
               if (IgnoreHamzat) aaa[t] = "[اأإآؤئء]"; 
                break;
            case "ؤ":
                if (IgnoreHamzat) aaa[t] = "[وأإآؤئء]"; 
                break;
           case "ئ":
                if (IgnoreHamzat) aaa[t] = "[أىإآؤئءي]"; 
                break;
           case "و":
                if (IgnoreHamzat) aaa[t] = "[وأإآؤئء]"; 
                if (AhrofAlela) aaa[t] = "[اويى]"; 
                break;
            case "ي":
                if (IgnoreHamzat) aaa[t] = "[أإآؤئءي]"; 
                if (AhrofAlela) aaa[t] = "[اويى]"; 
               break;
            case "ء":
                if (IgnoreHamzat) aaa[t] = "[أإآؤئء]"; 
                break;
            case "ى":
                if (IgnoreHamzat) aaa[t] = "[أىإآؤئء]"; 
                if (AhrofAlela) aaa[t] = "[اويى]"; 
                break;
            case "ة":
                if (IgnoreTahMarbota) aaa[t] = "[ةه]"; 
                break;
            case "ه":
                if (IgnoreTahMarbota) aaa[t] = "[ةه]"; 
                break;
       }
    }
   MyNewString = string.Join("",aaa);
    return MyNewString;
    //string str = null;
    //str = "This is a Test";
    //MessageBox.Show(str.Length.ToString());
}

   
}
public class savedata
{
    public static bool FillInMyData(string MySelectCommand, string MyLibName, DataTable MyDataTable)
       
    {
       using (SqlConnection cn = new SqlConnection(ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString))
        {
            cn.Open();
            using (SqlDataAdapter bookAdapter = new SqlDataAdapter(MySelectCommand, cn))
            {
                MyDataTable.Clear();
                bookAdapter.Fill(MyDataTable);
                cn.Close();
                SqlConnection.ClearAllPools();
                return true;
 
            }
        }


        

 
    }
 
}

