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
    <h1 style="color: #58890E">
    تم إدخال البيانات بنجاح</h1>
   <asp:Button runat="server" Text="عودة إلى صفحة الإدخال" 
         ID="btnBack" onclick="btnBack_Click" />
         <br />
         <br />
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
         <input type="submit" name="btnEdit" value="عودة إلى صفحة الإدخال" onclick="return Back();" id="btnEdit"  style="font-family: Tahoma, arial, Helvetica, sans-serif" />
</asp:Content>

