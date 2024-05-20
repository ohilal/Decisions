<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="medical.aspx.cs" Inherits="medical" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container align-content-center" dir="rtl"  >
        <h1>
        <%--    <asp:HyperLink ID="HyperLink1" runat="server">HyperLink</asp:HyperLink>--%>
           <a href="" download="DecisionsData/medicalnetwork.xlsx" class="btn btn-info"  onclick="alert ('سيتم تحميل الملف على جهازك')">حفظ الملف بصيغة الاكسيل
                <i class="fa-solid fa-download"></i>
            </a>
        </h1></div>
    <div class=" container-fluid col-12 text-center" dir="rtl" ><h1>بيانات شبكة الرعاية الصحية <br />
          
            </h1>
        <iframe  width="1200" height="804" name="iframe_a"
src="DecisionsData/medicalnetwork.pdf"
     frameborder="0"  style="width:100%; min-width:1400px; min-height:1000px; margin: 0 auto; text-align: center; align-items: center;display: flex; justify-content: center;  ">
 </iframe>

           <%-- <iframe style="min-width:1400px; min-height:1000px;" src="UploadedDecisions/medicalnetwork.htm"></iframe>--%>
        
        </div>
</asp:Content>

