<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="success.aspx.cs" Inherits="success" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script language="javascript" type="text/javascript">
    function Back()
    {
        history.go(-1);
        return false;
    }

  </script>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <div class="alert-success mx-auto align-items-center">
    <h1 class="text-success text-center">
    تم إدخال البيانات بنجاح</h1>
   <%--<asp:Button runat="server" Text="عودة إلى صفحة الإدخال" 
         ID="btnBack" onclick="btnBack_Click" CssClass="btn btn-lg btn-info" />--%>
         <br />
         <br /></div>
    <br />
         <input type="submit" name="btnEdit" value="عودة إلى صفحة الإدخال" onclick="return Back();" id="btnEdit"  class="btn btn-lg btn-info" />
</asp:Content>

