using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using AjaxControlToolkit;
using System.Collections.Specialized;

/// <summary>
/// Summary description for filldropdown
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
[System.Web.Script.Services.ScriptService]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
// [System.Web.Script.Services.ScriptService]
public class filldropdown : System.Web.Services.WebService
{

    public filldropdown()
    {

        
    }

    [WebMethod]
    public CascadingDropDownNameValue[] GetMangment(string knownCategoryValues, string category)




    {
        dsmangmentTableAdapters.mangmentTableAdapter mangeadapter = new dsmangmentTableAdapters.mangmentTableAdapter();
        dsmangment.mangmentDataTable mangment = mangeadapter.GetMangment();
        List<CascadingDropDownNameValue> values = new List<CascadingDropDownNameValue>();
        foreach (DataRow dr in mangment)
        {
          string manage=(string)dr["mangmentName"];
          int mangeID = (int)dr["mangmentID"];
          values.Add(new CascadingDropDownNameValue(manage, mangeID.ToString()));
        }
        return values.ToArray();
    }
    [WebMethod]
    public CascadingDropDownNameValue[] GeBranch(string knownCategoryValues, string category)
    {
        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int mangeID;
        if (!kv.ContainsKey("Manage") || !Int32.TryParse(kv["Manage"], out mangeID))
        {
            return null;
        }
        //----------------------------------------------------------
       dsbranchTableAdapters.branch_managmentTableAdapter branchadabter = new dsbranchTableAdapters.branch_managmentTableAdapter();
        //dsbranch.branch_managmentDataTable branches = branchadabter.GetBranch();
       dsbranch.branch_managmentDataTable branches = branchadabter.GetBranch(mangeID);
        List<CascadingDropDownNameValue> values = new List<CascadingDropDownNameValue>();
        foreach (DataRow dr in branches)
        {
            string brn = (string)dr["BranchName"];
            int brnID = (int)dr["BranchID"];
            values.Add(new CascadingDropDownNameValue(brn,brnID.ToString()));
        }
        return values.ToArray();
    }
    
}

