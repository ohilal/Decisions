<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="insertGuide.aspx.cs" Inherits="InsertDecesion" Title="إدخال قرارات الهيئة" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 95%;
        }
        .style2
        {
            width: 113px;
            font-weight: bold;
        }
        .style3
        {
            width: 113px;
            font-weight: bold;
            height: 23px;
        }
        .style4
        {
            height: 23px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="text-align:center;">Member's Area</h1>
<asp:LoginView ID="LoginView1" runat="server">
    <LoggedInTemplate>
        مرحبا..<asp:LoginName ID="LoginName1" runat="server" />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </LoggedInTemplate>
</asp:LoginView>
    <table class="style1" cellpadding="3" cellspacing="3" dir="rtl">
        <tr>
            <td class="style2">
                اسم الدليل</td>
            <td>
                <asp:TextBox ID="txtGuideTitle" runat="server" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td class="style3">
              التاريخ</td>
            <td class="style4">
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control col-lg-6 col-sm-12" TextMode="Date"></asp:TextBox>
                
            </td>
        </tr>
        
        <tr>
            <td class="style2">
                نوع الدليل</td>
            <td>
                <asp:DropDownList ID="ddlGuideType" runat="server" DataSourceID="sdsGuideType" 
                    DataTextField="GuideTypeName" DataValueField="GuideTypeID" CssClass="form-control col-lg-6 col-sm-12" AppendDataBoundItems="True" style="right: 0px; top: 0px">
                    <asp:ListItem Text="اختر نوع الدليل" Enabled="true"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsGuideType" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    SelectCommand="SELECT [GuideTypeName], [GuideTypeID] FROM [GuideTypes]">
                </asp:SqlDataSource>
            </td>
        </tr>
        
        <tr>
            <td class="style2">
                تحميل الملف</td>
            <td>
                <asp:FileUpload ID="uploadGuideFile" runat="server" CssClass="form-control col-lg-6 col-sm-12" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <input id="Reset1" type="reset" value="reset" class="btn btn-secondary btn-lg"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="btnSubmitDec" runat="server" Text="إدخال " 
                    onclick="btnSubmitDec_Click" CssClass="btn btn-info btn-lg" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" InsertCommand="insertGuide" InsertCommandType="StoredProcedure" SelectCommand="SELECT Title, ID, guideType, InsertDate, guideFileExt FROM guidebook">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtGuideTitle" Name="Title" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlGuideType" Name="guideType" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtDate" DbType="Date" Name="InsertDate" PropertyName="Text" />
                        <asp:Parameter Name="guideFileExt" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>

