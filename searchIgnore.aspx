<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchIgnore.aspx.cs" Inherits="searchIgnore" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:TextBox ID="textbox1" runat="server"></asp:TextBox>
   
    <asp:Button ID="btnsearch" runat="server" Text="Button" 
        onclick="btnsearch_Click" />
         <br />
    <asp:CheckBox ID="CheckBox1" runat="server" />
    
      <asp:CheckBox ID="CheckBox2" runat="server" />
       
        <asp:CheckBox ID="CheckBox3" runat="server" />
          <asp:CheckBox ID="CheckBox4" runat="server" />
          <br />
    <asp:GridView ID="GridView1" runat="server">
    </asp:GridView>
    
    
</asp:Content>

