<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UnauthorizedAccess.aspx.cs" Inherits="UnauthorizedAccess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta http-equiv="refresh" content="5;url=Default.aspx"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div style="margin-right:20px;">
    <h1> عفوا، غير مسموح لك الدخول على هذه الصفحة  
    <br /> </h1>
    <br />
     سيتم تحويلك إلى  الصفحة الرئيسية خلال 5 ثوانى ....
   </div>
</asp:Content>

