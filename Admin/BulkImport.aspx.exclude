<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BulkImport.aspx.cs" Inherits="Admin_BulkImport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div style="padding: 20px; font-family: Arial;">
            <h2>Bulk User Import from Excel</h2>
            <p>Select your Excel file (.xlsx or .xls):</p>
            <asp:FileUpload ID="fuExcel" runat="server" />
            <br /><br />
            <asp:Button ID="btnUpload" runat="server" Text="Start Import" OnClick="btnUpload_Click" />
            <br /><br />
            <asp:Label ID="lblStatus" runat="server" ForeColor="Green"></asp:Label>
            <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
            
            <br /><br />
            <asp:GridView ID="gvErrors" runat="server" AutoGenerateColumns="true" />
        </div>
</asp:Content>

