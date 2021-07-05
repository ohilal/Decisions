<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="membersdataresult.aspx.cs" Inherits="Members_membersdataresult" Title="عرض لتعديل الدراسة" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <h2>البحث فى الدراسات بالعنوان أو بالكلمات الدالة</h2>
    <asp:TextBox ID="TextBox2" runat="server" Width="350"></asp:TextBox>&nbsp;
    <asp:Button ID="Button1"
        runat="server" Text="بحـث" />
    <asp:GridView ID="grdSearch" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="decID" DataSourceID="sdsSearch" 
        onrowdatabound="grdSearch_RowDataBound" AllowPaging="True" AllowSorting="True">
        <Columns>
            <asp:BoundField DataField="decID" HeaderText="decID" InsertVisible="False" 
                ReadOnly="True" SortExpression="decID" Visible="False" />
            <asp:BoundField DataField="decNo" HeaderText="decNo" 
                SortExpression="decNo" />
            <asp:BoundField DataField="decTitle" HeaderText="عنوان القرار" 
                SortExpression="decTitle" />
            <asp:BoundField DataField="decDate" 
                HeaderText="تاريخ القرار" SortExpression="decDate" />
            <asp:BoundField DataField="decisionFile" HeaderText="الملف" SortExpression="decisionFile" Visible="False" />
            <asp:BoundField DataField="decType" HeaderText="نوع القرار" ReadOnly="True" SortExpression="decType" />

  <asp:HyperLinkField DataNavigateUrlFields="decID" 
                DataNavigateUrlFormatString="editdetails.aspx?decID={0}" HeaderText="التفاصيل " 
                Text="اظهر التفاصيل " />
            <asp:CommandField ShowDeleteButton="True" />

        </Columns>
       
    </asp:GridView>
  
    <asp:SqlDataSource ID="sdsSearch" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="decKeywords" SelectCommandType="StoredProcedure" 
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
  <h2>عرض كل القرارات</h2>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" 
        AllowSorting="True" onrowdatabound="GridView1_RowDataBound">
        <PagerSettings Mode="NumericFirstLast" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="decNo" HeaderText="رقم القرار" SortExpression="decNo" />
            <asp:BoundField DataField="decTitle" HeaderText="العنوان" 
                SortExpression="decTitle" />
            <asp:BoundField DataField="decKeywords" HeaderText="الكلمات الدالة" 
                SortExpression="decKeywords" />
            <asp:BoundField DataField="decisionFile" HeaderText="الملف" 
                SortExpression="decisionFile" />
            <asp:BoundField DataField="decDate" HeaderText="تاريخ القرار" 
                SortExpression="decDate" DataFormatString="{0:dd/MMM/yyyy}" />
            <asp:BoundField DataField="decsubjectNo" HeaderText="عدد مواد القرار" SortExpression="decsubjectNo" />
            <asp:BoundField DataField="decType" HeaderText="نوع القرار" SortExpression="decType" />
        </Columns>
        <PagerStyle CssClass="cssPager" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
        
        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decKeywords, decisions_Info.decisionFile, decisions_Info.decDate, decisions_Info.decsubjectNo, decision_Types.decType FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID" 
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
            <asp:Parameter Name="activityCode" Type="Int32" />
            <asp:Parameter Name="BranchID" Type="Int32" />
            <asp:Parameter Name="Keywords" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

