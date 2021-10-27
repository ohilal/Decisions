<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="templats.aspx.cs" Inherits="searchData" Title="البحث عن دراسة" EnableEventValidation="false" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container text-center mx-auto align-items-center">
    <asp:DataList ID="listTilte" runat="server" DataKeyField="GuideTypeID" DataSourceID="sdsTitle" RepeatDirection="Horizontal" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
        <ItemTemplate>
<asp:Label ID="GuideTypeNameLabel" runat="server" Text='<%# Eval("GuideTypeName") %>' CssClass="h1 text-info text-center mx-auto col-12 "/>
           
        </ItemTemplate>
                </asp:DataList>
        <asp:SqlDataSource ID="sdsTitle" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT GuideTypeName, GuideTypeID FROM GuideTypes WHERE (GuideTypeID = @gID)">
            <SelectParameters>
                <asp:QueryStringParameter Name="gID" QueryStringField="gID" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>
    <br />
                  
		<asp:ListView ID="ListView1" runat="server" DataSourceID="SqlDataSource1" >
        <AlternatingItemTemplate>
            <li class="list-unstyled" >
				<asp:Label ID="TemplateNameLabel" runat="server" Text='<%# Eval("TemplateName") %>' CssClass="h3 col-12" />
				<br />
				الملف:
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
				<hr />
			</ItemSeparatorTemplate>
        <ItemTemplate>
            <li class="list-unstyled" > 
				<asp:Label ID="TemplateNameLabel" runat="server" Text='<%# Eval("TemplateName") %>' CssClass="h3 col-12" />
				<br />
				الملف:
				<a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("TemplatePath")%>&#039;)'><i class="far fa-file-pdf fa-2x text-info"></i></a>
				<br />
			</li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" >
				<li runat="server" id="itemPlaceholder" />
			</ul>
			<div style="text-align: center;background-color: #FFCC66;color: #333333;">
			</div>
             <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
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


                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT TemplateName, TemplatePath, typeID FROM Templates WHERE (typeID = @gID)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="gID" QueryStringField="gID" />
                    </SelectParameters>
        </asp:SqlDataSource>


                <br />
				&nbsp; &nbsp; 

</asp:Content>

