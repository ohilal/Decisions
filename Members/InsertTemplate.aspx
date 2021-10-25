<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InsertTemplate.aspx.cs" Inherits="InsertDecesion" Title="إدخال قرارات الهيئة" %>

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
    	.auto-style1 {
			width: 113px;
			font-weight: bold;
			height: 33px;
		}
		.auto-style2 {
			height: 33px;
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
            <td class="auto-style1">
                اسم النموذج</td>
            <td class="auto-style2">
                <asp:TextBox ID="txtTemplate" runat="server" CssClass="form-control col-lg-6 col-sm-12" style="right: -179px; top: 0px"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" InsertCommand="insertTemp" InsertCommandType="StoredProcedure" SelectCommand="SELECT TemplateName, TemplatePath FROM Templates">
	<InsertParameters>
		<asp:ControlParameter ControlID="txtTemplate" Name="TemplateName" PropertyName="Text" Type="String" />
		<asp:Parameter Name="TemplatePath" Type="String" />
	</InsertParameters>
			</asp:SqlDataSource>
        </tr>
        
		
        
        <tr>
            <td class="style2">
                تحميل الملف</td>
            <td>
                <asp:FileUpload ID="uploadGuideFile" runat="server" CssClass="form-control col-lg-6 col-sm-12" style="right: -180px; top: -1px" />
            </td>
        </tr>
		<tr>
			<td>
				<asp:Button ID="btnSubmitDec" runat="server" Text="إدخال" OnClick="btnSubmitDec_Click" />
			</td>
		</tr>
        
    </table>

</asp:Content>

