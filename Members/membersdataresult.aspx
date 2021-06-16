<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="membersdataresult.aspx.cs" Inherits="Members_membersdataresult" Title="عرض لتعديل الدراسة" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <h1>البحث فى الدراسات بالعنوان أو بالكلمات الدالة</h1>
    <asp:TextBox ID="TextBox2" runat="server" Width="350"></asp:TextBox>&nbsp;
    <asp:Button ID="Button1"
        runat="server" Text="بحـث" />
    <asp:GridView ID="grdSearch" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="dID" DataSourceID="sdsSearch" 
        onrowdatabound="grdSearch_RowDataBound">
        <Columns>
            <asp:BoundField DataField="dID" HeaderText="dID" InsertVisible="False" 
                ReadOnly="True" SortExpression="dID" />
            <asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                SortExpression="Title" />
            <asp:BoundField DataField="Summury" HeaderText="الملخص" 
                SortExpression="Summury" />
            <asp:BoundField DataField="Date" DataFormatString="{0:MMMM yyyy}" 
                HeaderText="تاريخ الإصدار" SortExpression="Date" />
            <asp:TemplateField HeaderText="الملف" SortExpression="Filepath">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <a href="#" onclick="window.open('../UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="dID" 
                DataNavigateUrlFormatString="editdetails.aspx?dID={0}" HeaderText="التفاصيل " 
                Text="اظهر التفاصيل " />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
  
    <asp:SqlDataSource ID="sdsSearch" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="searchKeywords" SelectCommandType="StoredProcedure" 
        DeleteCommand="delete from dbo.Fullinfo where dID =@dID">
        <DeleteParameters>
            <asp:ControlParameter ControlID="grdSearch" Name="dID" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" Name="searchword" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
  <br />
  <h1>عرض كل الدراسات</h1>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="dID" DataSourceID="SqlDataSource1" AllowPaging="True" 
        AllowSorting="True" onrowdatabound="GridView1_RowDataBound">
        <PagerSettings Mode="NumericFirstLast" />
        <Columns>
            <asp:BoundField DataField="dID" HeaderText="dID" InsertVisible="False" 
                ReadOnly="True" SortExpression="dID" Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                SortExpression="Title" />
            <asp:BoundField DataField="Summury" HeaderText="الملخص" 
                SortExpression="Summury" />
            <asp:BoundField DataField="Date" HeaderText="تاريخ الإصدار" 
                SortExpression="Date" DataFormatString="{0:MMMM yyyy}" />
            <asp:BoundField DataField="BranchName" HeaderText="الإدارة" 
                SortExpression="BranchName" />
            <asp:TemplateField HeaderText="الملف" SortExpression="Filepath">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                     <a href="#" onclick="window.open('../UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:HyperLinkField DataNavigateUrlFields="dID" 
                DataNavigateUrlFormatString="editdetails.aspx?dID={0}" HeaderText="التفاصيل " 
                Text="اظهر التفاصيل " />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <PagerStyle CssClass="cssPager" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
        
        SelectCommand="SELECT Fullinfo.dID, Fullinfo.Title, Fullinfo.Summury,  Fullinfo.Date, branch_managment.BranchName, Fullinfo.Filepath FROM Fullinfo INNER JOIN branch_managment ON Fullinfo.BranchID = branch_managment.BranchID" 
        UpdateCommand="updatedata" UpdateCommandType="StoredProcedure" 
        DeleteCommand="delete from dbo.Fullinfo where dID =@dID">
        <DeleteParameters>
            <asp:ControlParameter ControlID="GridView1" Name="dID" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="dID" QueryStringField="dID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Summury" Type="String" />
            <asp:Parameter DbType="Date" Name="Date" />
            <asp:Parameter Name="SectorID" Type="Int32" />
            <asp:Parameter Name="BranchID" Type="Int32" />
            <asp:Parameter Name="Filepath" Type="String" />
            <asp:Parameter Name="Keywords" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

