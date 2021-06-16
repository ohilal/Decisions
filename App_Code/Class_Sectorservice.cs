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
/// Summary description for Class_Sectorservice
/// </summary>
[WebService(Namespace = "http://tempuri.org/")]
[WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
// To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
 [System.Web.Script.Services.ScriptService]
public class Class_Sectorservice : System.Web.Services.WebService
{

    public Class_Sectorservice()
    {

        //Uncomment the following line if using designed components 
        //InitializeComponent(); 
    }

    [WebMethod]
    public CascadingDropDownNameValue[] GetSectorfromClass(string knownCategoryValues, string category)
    {
        classificationTableAdapters.ClassificationTableAdapter ClassAdapter = new classificationTableAdapters.ClassificationTableAdapter();
        classification.ClassificationDataTable ClassDatatable = ClassAdapter.GetClass();
        List<CascadingDropDownNameValue> ClassValue = new List<CascadingDropDownNameValue>();
        foreach (DataRow dr in ClassDatatable)
        {
            string cl=(string) dr["ClassName"];
            int clID=(int)dr["ClassID"];
            ClassValue.Add(new CascadingDropDownNameValue (cl,clID.ToString()));

        }
        return ClassValue.ToArray();

        
    }

    [WebMethod]
    public CascadingDropDownNameValue[] Getsector(string knownCategoryValues, string category)
    {
        StringDictionary CLS = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int CLassID;
        if(!CLS.ContainsKey("Classify")||!Int32.TryParse(CLS["Classify"],out CLassID))
        {
            return null;
        }
        
        sectorTableAdapters.industrialSectorTableAdapter SecAdapter=new sectorTableAdapters.industrialSectorTableAdapter();
        sector.industrialSectorDataTable Sectable = SecAdapter.Getsector(CLassID);
        
        List<CascadingDropDownNameValue> secValue=new List<CascadingDropDownNameValue>();
        foreach(DataRow dr in Sectable)
        {
            string SEC =(string)dr["SectorName"];
           int SECID=(int)dr["SectorID"];
           secValue.Add(new CascadingDropDownNameValue(SEC,SECID.ToString()));
        }
        return secValue.ToArray();
    }

    [WebMethod]
    public CascadingDropDownNameValue[] GetactivitiesMethod(string knownCategoryValues, string category)
    {
        StringDictionary dic = CascadingDropDown.ParseKnownCategoryValuesString(knownCategoryValues);
        int secid;
        if (!dic.ContainsKey("active")||!Int32.TryParse(dic["active"],out secid))
        {
            return null;
        }
        ActivitiesDSTableAdapters.ActivitiesTableAdapter actadapter=new ActivitiesDSTableAdapters.ActivitiesTableAdapter();
        ActivitiesDS.ActivitiesDataTable acttab=actadapter.GetActivities(secid);
        List<CascadingDropDownNameValue> actvalue=new List<CascadingDropDownNameValue>();
        foreach(DataRow dr in acttab)
        {
            //string act = (string)dr["activityName"];
            int act = (int)dr["activityCode"];
            int activityCode =(int)dr["activityCode"];
            actvalue.Add(new CascadingDropDownNameValue(act.ToString(),activityCode.ToString()));
        }
        return actvalue.ToArray();
    }



}

