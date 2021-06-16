<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Searchdetails.aspx.cs" Inherits="Searchdetails" Title="نتائج البحث مفصلة" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px" Width="564px" 
        AutoGenerateRows="False" DataSourceID="sdsDetails">
        <Fields>
            <asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                SortExpression="Title" />
            <asp:BoundField DataField="Summury" HeaderText="الملخص" 
                SortExpression="Summury" />
            <asp:BoundField DataField="Type" HeaderText="نوع الدراسة" 
                SortExpression="Type" />
            <asp:BoundField DataField="Owner" HeaderText="اسم معد الدراسة" 
                SortExpression="Owner" />
            <asp:BoundField DataField="Date" HeaderText="تاريخ الإصدار" 
                SortExpression="Date" DataFormatString="{0:MMMM,yyyy}" />
            <asp:BoundField DataField="Classification" HeaderText="التصنيف" 
                SortExpression="Classification" />
            <asp:BoundField DataField="Filepath" HeaderText="Filepath" 
                SortExpression="Filepath" />
            <asp:BoundField DataField="Keywords" HeaderText="Keywords" 
                SortExpression="Keywords" />
            <asp:BoundField DataField="Branch" HeaderText="الإدارة العامة" ReadOnly="True" 
                SortExpression="Branch" />
            <asp:BoundField DataField="Management" HeaderText="الإدارة المركزية" ReadOnly="True" 
                SortExpression="Management" />
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsDetails" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="select Title, Summury,[Type],Owner,Date,Classification,Filepath,Keywords,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as Branch
,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
and (Fullinfo.BranchID=branch_managment.BranchID)) as Management,
(select langName from Lang_Lockup where (Lang_Lockup.langId=Fullinfo.langId))as LangName

from Fullinfo where dID=@dId">
        <SelectParameters>
            <asp:QueryStringParameter Name="dId" QueryStringField="dID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

