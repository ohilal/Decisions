<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="dataresults.aspx.cs" Inherits="dataresults" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    d<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="dID" DataSourceID="dataresultssds">
        <Columns>
            <asp:BoundField DataField="dID" HeaderText="dID" InsertVisible="False" 
                ReadOnly="True" SortExpression="dID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Summury" HeaderText="Summury" 
                SortExpression="Summury" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" 
                DataFormatString="{0:MMMM,yyyy}" />
            <asp:BoundField DataField="BranchName" HeaderText="BranchName" 
                SortExpression="BranchName" />
            <asp:TemplateField HeaderText="Filepath" SortExpression="Filepath">
                <ItemTemplate>
                    <%--<a href="UploadedUserFiles/<%#Eval("Filepath")%>" ><%#Eval("Filepath")%></a>--%>
                    <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="LangName" HeaderText="لغه الدراسة" 
                SortExpression="LangName" />
            <asp:HyperLinkField DataNavigateUrlFields="dID" 
                DataNavigateUrlFormatString="details.aspx?dID={0}" HeaderText="التفاصيل" 
                Text="اظهر التفاصيل" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="dataresultssds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
        
        SelectCommand="SELECT    Title, Summury,Date,  Filepath,dID,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as Branch
,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
and (Fullinfo.BranchID=branch_managment.BranchID)) as Management,
(select langName from Lang_Lockup where (Lang_Lockup.langId=Fullinfo.langId))as LangName
 from Fullinfo
">
    </asp:SqlDataSource>
</asp:Content>

