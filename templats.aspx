<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="templats.aspx.cs" Inherits="searchData" Title="" EnableEventValidation="false" %>


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

    <asp:ListView ID="ListView2" runat="server" DataSourceID="SqlDataSource1" GroupItemCount="2">
        <AlternatingItemTemplate>
            <td runat="server" style="" >

				<a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("TemplatePath")%>&#039;)' class="grey">
                   <i class="far fa-file-pdf fa-2x text-info"></i>
                    <asp:Label ID="TemplateNameLabel" runat="server" Text='<%# Eval("TemplateName") %>' CssClass="h5 col-12 grey" />
                    
				</a>
             </td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" style="">TemplateName:
                <asp:TextBox ID="TemplateNameTextBox" runat="server" Text='<%# Bind("TemplateName") %>' />
                <br />TemplatePath:
                <asp:TextBox ID="TemplatePathTextBox" runat="server" Text='<%# Bind("TemplatePath") %>' />
                <br />typeID:
                <asp:TextBox ID="typeIDTextBox" runat="server" Text='<%# Bind("typeID") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /></td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td>No data was returned.</td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server" >
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" style="">TemplateName:
                <asp:TextBox ID="TemplateNameTextBox" runat="server" Text='<%# Bind("TemplateName") %>' />
                <br />TemplatePath:
                <asp:TextBox ID="TemplatePathTextBox" runat="server" Text='<%# Bind("TemplatePath") %>' />
                <br />typeID:
                <asp:TextBox ID="typeIDTextBox" runat="server" Text='<%# Bind("typeID") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /></td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" style="" >
              <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("TemplatePath")%>&#039;)' class="grey">
                    <i class="far fa-file-pdf fa-2x text-info"></i>
                  <asp:Label ID="TemplateNameLabel" runat="server" Text='<%# Eval("TemplateName") %>' CssClass="h5 col-12 grey" />
                   
				</a></td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="table table table-striped table-bordered table-responsive-lg" >
                <tr  runat="server">
                    <td runat="server" class="col-lg-12">
                        <table id="groupPlaceholderContainer" runat="server" border="0" style="width:100%" class="table table table-striped table-bordered table-responsive-lg">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr runat="server">
                    <td runat="server" style="">
                        <asp:DataPager runat="server" ID="decsDataPager" PageSize="20">
        <Fields>
          <asp:TemplatePagerField>
            <PagerTemplate>
            <b>
            صفحة
            <asp:Label runat="server" ID="CurrentPageLabel" 
              Text="<%# Container.TotalRowCount>0 ? (Container.StartRowIndex / Container.PageSize) + 1 : 0 %>" />
            من
            <asp:Label runat="server" ID="TotalPagesLabel" 
              Text="<%# Math.Ceiling ((double)Container.TotalRowCount / Container.PageSize) %>" />
            </b>
            <br /><br />
            </PagerTemplate>
          </asp:TemplatePagerField>
          
          <asp:NextPreviousPagerField
            ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="page-item btn btn-secondary" FirstPageText="الأول" LastPageText="الأخير" PreviousPageText="&lt;&lt;" NextPageText="&gt;&gt;" />
          
          <asp:NumericPagerField 
            PreviousPageText="&lt;&lt;"
            NextPageText="&gt;&gt;"
            ButtonCount="10" />
            
          <asp:NextPreviousPagerField
           ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="False" ButtonCssClass="page-item btn btn-secondary" FirstPageText="الأول" LastPageText="الأخير" PreviousPageText="&lt;&lt;" NextPageText="&gt;&gt;" />
        </Fields>
      </asp:DataPager>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" style="">TemplateName:
                <asp:Label ID="TemplateNameLabel" runat="server" Text='<%# Eval("TemplateName") %>' />
                <br />TemplatePath:
                <asp:Label ID="TemplatePathLabel" runat="server" Text='<%# Eval("TemplatePath") %>' />
                <br />typeID:
                <asp:Label ID="typeIDLabel" runat="server" Text='<%# Eval("typeID") %>' />
                <br /></td>
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

