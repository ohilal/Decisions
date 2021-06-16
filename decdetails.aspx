<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="decdetails.aspx.cs" Inherits="details" Title="نتائج البحث تفصيليا" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-right:10px;">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="detailssds"   DataKeyNames="decID" HorizontalAlign="Justify" > 
         
        <Fields>
            <asp:BoundField DataField="decNo" HeaderText=" رقم القرار" 
                SortExpression="decNo" />
           
            <asp:BoundField DataField="decTitle" HeaderText="عنوان القرار" 
                SortExpression="decTitle" >
            </asp:BoundField>
            <asp:BoundField DataField="decDate" HeaderText="تاريخ القرار" 
                SortExpression="decDate" />
            <asp:TemplateField HeaderText="ملف القرار" SortExpression="decisionFile">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decisionFile") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decisionFile") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>


                   <a href="#" onclick="window.open('UploadedDecisions/<%#Eval("decisionFile")%>')">فتح ملف القرار </a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="decKeywords" HeaderText="كلمات دالة" 
                SortExpression="decKeywords" />
            <asp:BoundField DataField="decID" HeaderText="decID" ReadOnly="True" 
                SortExpression="decID" InsertVisible="False" />
            <asp:BoundField DataField="decsubjectNo" HeaderText="عدد مواد القرار" 
                SortExpression="decsubjectNo" />
            <asp:BoundField DataField="typename" HeaderText="نوع القرار" 
                SortExpression="typename" ReadOnly="True" />
        </Fields>
        <HeaderStyle HorizontalAlign="Right" Wrap="True" />

       <%-- <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" Position="Center" >
        </cc1:PopupControlExtender>--%>
    </asp:DetailsView>
    <br />
    <asp:SqlDataSource ID="detailssds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
            SelectCommand="select decNo, decTitle,decDate,decisionFile,decKeywords,decID,decsubjectNo,
(select decType from decision_Types where(decisions_Info.decID=decision_Types.decTypeID)) as typename
from decisions_Info  
where decID=@decID">
        <SelectParameters>
            <asp:QueryStringParameter Name="decID" QueryStringField="decID" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>

