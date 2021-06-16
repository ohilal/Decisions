using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.Xml.Linq;
using AjaxControlToolkit;
using System.Data;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Collections.Specialized;

/// <summary>
/// Summary description for building
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
[System.Web.Script.Services.ScriptService]
public class building : System.Web.Services.WebService
{

    public building()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public CascadingDropDownNameValue[] Getbuildings(string knownCategoryValues, string category)
    {
        buildingdatasetTableAdapters.BuildingsTableAdapter bldAdapter = new buildingdatasetTableAdapters.BuildingsTableAdapter();
        buildingdataset.BuildingsDataTable building = bldAdapter.Getbuilding();
        List<CascadingDropDownNameValue> bvalues = new List<CascadingDropDownNameValue>();
        foreach (DataRow dr in building)
        {
            string build = (string)dr["Buildingname"];
            int buildId = (int)dr["BuildingID"];
            bvalues.Add(new CascadingDropDownNameValue(build, buildId.ToString()));
        }
        return bvalues.ToArray();
    }
    //----------------------------------------------------------
    [WebMethod]
    public CascadingDropDownNameValue[] Getfloor(string knownCategoryValues, string category)
    {
        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int buildID;
        if (!kv.ContainsKey("build") || !Int32.TryParse(kv["build"], out buildID))
        {
            return null;
        }
        //----------------------------------------------------------
        floorTableAdapters.FloorsTableAdapter flooradabter = new floorTableAdapters.FloorsTableAdapter();
        //dsbranch.branch_managmentDataTable branches = branchadabter.GetBranch();
       
        //dsbranch.branch_managmentDataTable branches = branchadabter.GetBranch(mangeID);
        floor.FloorsDataTable fl = flooradabter.Getfloor(buildID);

        List<CascadingDropDownNameValue> values = new List<CascadingDropDownNameValue>();

        foreach (DataRow dr in fl)
        {
            string flName = (string)dr["Floorname"];
            int flID = (int)dr["FloorId"];
            values.Add(new CascadingDropDownNameValue(flName, flID.ToString()));
        }
        return values.ToArray();
    }
    
}
////[WebMethod]
//    public CascadingDropDownNameValue[] GeBranch(string knownCategoryValues, string category)
//    {
//        StringDictionary kv = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
//        int mangeID;
//        if (!kv.ContainsKey("Manage") || !Int32.TryParse(kv["Manage"], out mangeID))
//        {
//            return null;
//        }
//        //----------------------------------------------------------
//       dsbranchTableAdapters.branch_managmentTableAdapter branchadabter = new dsbranchTableAdapters.branch_managmentTableAdapter();
//        //dsbranch.branch_managmentDataTable branches = branchadabter.GetBranch();
//       dsbranch.branch_managmentDataTable branches = branchadabter.GetBranch(mangeID);
//        List<CascadingDropDownNameValue> values = new List<CascadingDropDownNameValue>();
//        foreach (DataRow dr in branches)
//        {
//            string brn = (string)dr["BranchName"];
//            int brnID = (int)dr["BranchID"];
//            values.Add(new CascadingDropDownNameValue(brn,brnID.ToString()));
//        }
//        return values.ToArray();
//    }
