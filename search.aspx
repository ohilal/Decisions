<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="search.aspx.cs" Inherits="search" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
    <asp:DropDownList ID="ddlsearch" runat="server" AutoPostBack="True" 
        onselectedindexchanged="ddlsearch_SelectedIndexChanged">
        <asp:ListItem Value="0">اختر..</asp:ListItem>
        <asp:ListItem Value="1">بحث بنوع الدراسه
        </asp:ListItem>
        <asp:ListItem Value="2">بحث بتصنيف الدراسة</asp:ListItem>
        <asp:ListItem Value="3">بحث ياسم الادارة</asp:ListItem>
    </asp:DropDownList>
    <br />
       <br />
    <asp:DropDownList ID="ddlbranch_search" runat="server" DataSourceID="banchsds" 
        DataTextField="BranchName" DataValueField="BranchID" Visible="False" 
        AppendDataBoundItems="true" 
        onselectedindexchanged="ddlbranch_search_SelectedIndexChanged" >
        <asp:ListItem Value="0">---اختر----</asp:ListItem>
    </asp:DropDownList>
    <br />
    <asp:Button ID="btnBrnSearch" runat="server" Text="بحث" 
        onclick="btnBrnSearch_Click" Width="277px" />
    <asp:SqlDataSource ID="banchsds" runat="server" 
        ConnectionString="Data Source=DKAMAL;Initial Catalog=databank;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT [BranchID], [BranchName] FROM [branch_managment]">
    </asp:SqlDataSource>
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="testsds" Visible="False" AllowPaging="True" 
        AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                SortExpression="Title" />
            <asp:BoundField DataField="Summury" HeaderText="الملخص" 
                SortExpression="Summury" />
            <asp:BoundField DataField="Type" HeaderText="نوع الدراسة" 
                SortExpression="Type" />
            <asp:BoundField DataField="Owner" HeaderText="اسم معد الدراسة" 
                SortExpression="Owner" />
            <asp:BoundField DataField="Date" HeaderText="تاريخ الإصدار" 
                SortExpression="Date" />
            <asp:BoundField DataField="Classification" HeaderText="تصنيف الإدارة" 
                SortExpression="Classification" />
            <asp:BoundField DataField="Branch" HeaderText="الإدارة العامة" 
                SortExpression="Branch" ReadOnly="True" />
            <asp:BoundField DataField="Management" HeaderText="الإدارة المركزية" ReadOnly="True" 
                SortExpression="Management" />
            <asp:TemplateField HeaderText="Filepath" SortExpression="Filepath">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                   <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
        <asp:SqlDataSource ID="testsds" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
            SelectCommand="SELECT dID, Title, Summury, job, Owner, Date, ClassificationID, BranchID FROM Fullinfo WHERE (BranchID = @BID)">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlbranch_search" Name="BID" 
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
    <asp:SqlDataSource ID="sdsbranch_search" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="select Title, Summury],Owner,Date,Filepath,Keywords,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as Branch
,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
and (Fullinfo.BranchID=branch_managment.BranchID)) as Management
from Fullinfo where BranchID=@BranchID">
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlbranch_search" Name="BranchID" 
                PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    </div>
    
</asp:Content>

