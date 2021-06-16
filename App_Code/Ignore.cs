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

/// <summary>
/// Summary description for Ignore
/// </summary>
public class Ignore
{
       public static string PrepareWords(string MyWords, bool IgnoreTashkeel, bool IgnoreHamzat, bool IgnoreTahMarbota, bool AhrofAlela)
        {

            string MyNewString = "";

            if (IgnoreTashkeel)
            {
                string IgnrTshForm = "[ًٌٍَُِّْ~`]*";
                for (int i = 0; i < MyWords.Length - 1; i++)
                {
                    MyNewString += MyWords[i] + IgnrTshForm;
                }
            }
            else
            {
                MyNewString = MyWords;
            }

            int uu = MyNewString.Length;
            string[] aaa = new string[uu - 1];
            for (int i = 0; i < uu - 1; i++)
            {
                aaa[i] = MyNewString[i].ToString();
            }

            for (int t = 0; t < aaa.Length - 1; t++)
            {

                switch (aaa[t])
                {
                    case "ا":
                        aaa[t] = IgnoreHamzat == true ? "[اأإآؤئء]" : aaa[t];

                        aaa[t] = AhrofAlela == true ? "[اويى]" : aaa[t];
                        break;

                    case "أ":
                        aaa[t] = IgnoreHamzat == true ? "[اأإآؤئء]" : aaa[t];
                        break;
                    case "إ":
                        aaa[t] = IgnoreHamzat == true ? "[اأإآؤئء]" : aaa[t];
                        break;
                    case "آ":
                        aaa[t] = IgnoreHamzat == true ? "[اأإآؤئء]" : aaa[t];
                        break;
                    case "ؤ":
                        aaa[t] = IgnoreHamzat == true ? "[وأإآؤئء]" : aaa[t];
                        break;
                    case "ئ":
                        aaa[t] = IgnoreHamzat == true ? "[أىإآؤئءي]" : aaa[t];
                        break;
                    case "و":
                        aaa[t] = IgnoreHamzat == true ? "[وأإآؤئء]" : aaa[t];
                        aaa[t] = AhrofAlela == true ? "[اويى]" : aaa[t];
                        break;
                    case "ي":
                        aaa[t] = IgnoreHamzat == true ? "[أإآؤئءي]" : aaa[t];
                        aaa[t] = AhrofAlela == true ? "[اويى]" : aaa[t];
                        break;
                    case "ء":
                        aaa[t] = IgnoreHamzat == true ? "[أإآؤئء]" : aaa[t];
                        break;
                    case "ى":
                        aaa[t] = IgnoreHamzat == true ? "[أىإآؤئء]" : aaa[t];
                        aaa[t] = AhrofAlela == true ? "[اويى]" : aaa[t];
                        break;
                    case "ة":
                        aaa[t] = IgnoreHamzat == true ? "[ةه]" : aaa[t];
                        break;
                    case "ه":
                        aaa[t] = IgnoreHamzat == true ? "[ةه]" : aaa[t];
                        break;
                }
            }

            MyNewString = string.Join("", aaa);
            return MyNewString;
        }
    }


