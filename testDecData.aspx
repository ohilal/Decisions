<%@ Page Title="الفرارات" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="testDecData.aspx.cs" Inherits="testDecData" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DecTitle" runat="server" Height="50px" Width="95%" 
        AutoGenerateRows="False" DataSourceID="sdsDecTitle" BackColor="White" 
        EnableTheming="False">
        <Fields>
        
            <asp:TemplateField ShowHeader="False" SortExpression="decType">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decType") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decType") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                <h1>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("decType") %>'></asp:Label>
                </h1></ItemTemplate>
            </asp:TemplateField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsDecTitle" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="SELECT [decType] FROM [decision_Types] WHERE ([decTypeID] = @decTypeID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="decTypeID" QueryStringField="id" 
                Type="Byte" />
        </SelectParameters>
    </asp:SqlDataSource>
<asp:GridView ID="gdvDecisions" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sdsDecisions">
    <Columns>
        <asp:BoundField DataField="decNo" HeaderText="رقم القرار" 
            SortExpression="decNo" />
        <asp:BoundField DataField="decTitle" HeaderText="القرار" 
            SortExpression="decTitle" />
        <asp:BoundField DataField="decDate" DataFormatString="{0:dd MMMM yyyy}" 
            HeaderText="تاريخ الإصدار" SortExpression="decDate" />
        <asp:BoundField DataField="decType" HeaderText="نوع القرار" 
            SortExpression="decType" />
        <asp:TemplateField HeaderText="القرار" SortExpression="decisionFile">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decisionFile") %>'></asp:TextBox>
            </EditItemTemplate>
            <ItemTemplate>
                <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'><img src="Images/pdf_logo_trefoil.gif" style="border-style:none;" alt="فتح الملف" /></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
    <asp:SqlDataSource ID="sdsDecisions" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decDate, decision_Types.decType, decisions_Info.decisionFile FROM decision_Types INNER JOIN decisions_Info ON decision_Types.decTypeID = decisions_Info.decTypeID WHERE (decision_Types.decTypeID = @Type) order by decDate desc">
        <SelectParameters>
            <asp:QueryStringParameter Name="Type" QueryStringField="id" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>

