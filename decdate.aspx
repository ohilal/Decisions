<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="decdate.aspx.cs" Inherits="decdate" Title="Untitled Page" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="rtlDirection">
        <asp:TextBox ID="TextBox2" runat="server" Width="350px"></asp:TextBox>
        <cc1:CalendarExtender ID="TextBox2_CalendarExtender2" runat="server" 
            Enabled="True" TargetControlID="TextBox2">
        </cc1:CalendarExtender>
        &nbsp;<asp:Button ID="btnDate" runat="server" Text="عرض القرار" />
        <asp:DataList ID="DataList2" runat="server" BorderColor="Silver" 
            BorderWidth="1px" DataSourceID="sdsDate" GridLines="Both" RepeatColumns="2" 
            Width="890px">
            <ItemTemplate>
                decNo:
                <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                <br />
                decTitle:
                <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle") %>' />
                <br />
                decDate:
                <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate") %>' />
                <br />
                decType:
                <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                <br />
                decisionFile: <a href="#" 
                    onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'>
                <%#Eval("decisionFile")%></a>
                <br />
                <br />
            </ItemTemplate>
        </asp:DataList>
        <asp:SqlDataSource ID="sdsDate" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
            SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decDate, decision_Types.decType, decisions_Info.decisionFile FROM decision_Types INNER JOIN decisions_Info ON decision_Types.decTypeID = decisions_Info.decTypeID WHERE (decisions_Info.decDate = @Date)">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox2" Name="Date" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
</asp:Content>

