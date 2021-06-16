<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="testsearchdate.aspx.cs" Inherits="testsearchdate" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:ltr;">
    <asp:TextBox ID="txtdate1" runat="server" BackColor="#FFFFCC" 
        ToolTip="من تاريخ...">من</asp:TextBox>
    <cc1:CalendarExtender ID="txtdate1_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtdate1">
    </cc1:CalendarExtender>
    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
    <asp:TextBox ID="txtdate2" runat="server" BackColor="#FF99CC" 
        ToolTip="إلي تاريخ..."></asp:TextBox>
    <cc1:CalendarExtender ID="txtdate2_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtdate2" >
    </cc1:CalendarExtender>
    <asp:Button ID="Button1" runat="server" Text="Button" />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="dID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="dID" HeaderText="dID" InsertVisible="False" 
                ReadOnly="True" SortExpression="dID" />
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
            <asp:BoundField DataField="Summury" HeaderText="Summury" 
                SortExpression="Summury" />
            <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
            <asp:BoundField DataField="Filepath" HeaderText="Filepath" 
                SortExpression="Filepath" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT
 
dID,Title,Summury,[Date],Filepath
from dbo.Fullinfo
WHERE ( Date between @searchdateone and @searchdatetwo )">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtdate1" Name="searchdateone" 
                PropertyName="Text" />
            <asp:ControlParameter ControlID="txtdate2" Name="searchdatetwo" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    </div>
</asp:Content>

