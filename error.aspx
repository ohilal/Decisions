<%@ Page Title="خطأ فى الصفحة!!" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="error.aspx.cs" Inherits="error" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="text-align:center;"><h1>
    <img src="App_Themes/Default/images/alert.png" alt="alert" /><br />
    خطأ مفاجئ!!
    </h1>
        
   <asp:Label Runat="server" SkinID="FeedbackKO" ID="lbl404" Text="عفوا.. الصفحة المطلوبة غير موجودة." />
   <br />
	<asp:Label Runat="server" SkinID="FeedbackKO" ID="lbl408" Text="The request timed out. This may be caused by a too high traffic. Please try again later." />
	<br />
	<asp:Label Runat="server" SkinID="FeedbackKO" ID="lbl505" 
	Text=".عفوا.... حدث خطأ مفاجئ فى إسترجاع البيانات .من فضلك أعد المحاولة بعد قليل   "/> 
	<br />
	<asp:Label runat="server" SkinID="FeedbackKO" ID="lblError" Visible="false" 
	   Text="عفوا.. حدثت مشاكل فى استرجاع البيانات المطلوبة.  " />
	 
	   </div>  
	
</asp:Content>

