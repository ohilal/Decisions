<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InsertDecesion.aspx.cs" Inherits="InsertDecesion" Title="إدخال قرارات الهيئة" %>

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
            <td class="col-lg-3 col-sm-12 col-form-label">
                رقم القرار</td>
            <td>
                <asp:TextBox ID="txtNo" runat="server" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                العنوان
            </td>
            <td>
                <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style3">
                تاريخ القرار</td>
            <td class="style4">
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control col-lg-6 col-sm-12" TextMode="Date"></asp:TextBox>
                
            </td>
        </tr>
        <tr>
            <td class="style3">
                عدد مواد القرار</td>
            <td class="style4">
                <asp:TextBox ID="txtsubNo" runat="server" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                التصنيف</td>
            <td>
                <asp:DropDownList ID="ddlDecType" runat="server" DataSourceID="sdsDecType" 
                    DataTextField="decType" DataValueField="decTypeID" CssClass="form-control col-lg-6 col-sm-12" AppendDataBoundItems="true">
                    <asp:ListItem Text="اختر تصنيف القرار" Enabled="true"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsDecType" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    SelectCommand="SELECT [decTypeID], [decType] FROM [decision_Types]">
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style2">
                الكلمات الدالة</td>
            <td dir="rtl">
                <asp:TextBox ID="txtKeywords" runat="server" TextMode="MultiLine" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="style2">
                تحميل الملف</td>
            <td>
                <asp:FileUpload ID="uploadDecesion" runat="server" CssClass="form-control col-lg-6 col-sm-12" />
            </td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td>
                <input id="Reset1" type="reset" value="reset" class="btn btn-secondary btn-lg"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="btnSubmitDec" runat="server" Text="إدخال القرار" 
                    onclick="btnSubmitDec_Click" CssClass="btn btn-info btn-lg" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    InsertCommand="insertDecision" InsertCommandType="StoredProcedure" 
                    SelectCommand="select * from decisions_Info">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtNo" Name="decNo" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtDate" DbType="DateTime" Name="decDate" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtTitle" Name="decTitle" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtKeywords" Name="decKeywords" 
                            PropertyName="Text" Type="String" />
                        <asp:Parameter Name="decisionFile" Type="String" />
                        <asp:ControlParameter ControlID="ddlDecType" Name="decTypeID" 
                            PropertyName="SelectedValue" Type="Int16" />
                        <asp:ControlParameter ControlID="txtsubNo" Name="decsubjectNo" 
                            PropertyName="Text" Type="Int16" />
                    </InsertParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>

