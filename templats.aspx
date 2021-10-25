<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="templats.aspx.cs" Inherits="searchData" Title="البحث عن دراسة" EnableEventValidation="false" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
		<h1 class="text-center text-info">طلبات  ونماذج </h1>
                  
		<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
        <AlternatingItemTemplate>
            <li style="background-color: #FAFAD2;color: #284775;">إسم النموذج:
				<asp:Label ID="TemplateNameLabel" runat="server" Text='<%# Eval("TemplateName") %>' />
				<br />
				ملف النموذج:
				<a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("TemplatePath")%>&#039;)'><i class="far fa-file-pdf fa-2x text-info"></i></a>
				<br />
			</li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="background-color: #FFCC66;color: #000080;">TemplateName:
				<asp:TextBox ID="TemplateNameTextBox" runat="server" Text='<%# Bind("TemplateName") %>' />
				<br />
				TemplatePath:
				<asp:TextBox ID="TemplatePathTextBox" runat="server" Text='<%# Bind("TemplatePath") %>' />
				<br />
				<asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
				<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
			</li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">TemplateName:
				<asp:TextBox ID="TemplateNameTextBox" runat="server" Text='<%# Bind("TemplateName") %>' />
				<br />
				TemplatePath:
				<asp:TextBox ID="TemplatePathTextBox" runat="server" Text='<%# Bind("TemplatePath") %>' />
				<br />
				<asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
				<asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
			</li>
        </InsertItemTemplate>
        	<ItemSeparatorTemplate>
				<br />
			</ItemSeparatorTemplate>
        <ItemTemplate>
            <li style="background-color: #FFFBD6;color: #333333;">إسم النموذج:
				<asp:Label ID="TemplateNameLabel" runat="server" Text='<%# Eval("TemplateName") %>' />
				<br />
				ملف النموذج:
				<a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("TemplatePath")%>&#039;)'><i class="far fa-file-pdf fa-2x text-info"></i></a>
				<br />
			</li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="font-family: Verdana, Arial, Helvetica, sans-serif;">
				<li runat="server" id="itemPlaceholder" />
			</ul>
			<div style="text-align: center;background-color: #FFCC66;font-family: Verdana, Arial, Helvetica, sans-serif;color: #333333;">
			</div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="background-color: #FFCC66;font-weight: bold;color: #000080;">TemplateName:
				<asp:Label ID="TemplateNameLabel" runat="server" Text='<%# Eval("TemplateName") %>' />
				<br />
				ملف النموذج:
				<a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("TemplatePath")%>&#039;)'><i class="far fa-file-pdf fa-2x text-info"></i></a>
				<br />
			</li>
        </SelectedItemTemplate>
                    </asp:ListView>


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT TemplateName, TemplatePath FROM Templates"></asp:SqlDataSource>


                <br />
				&nbsp; &nbsp; 

</asp:Content>

