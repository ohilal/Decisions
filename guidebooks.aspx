<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="guidebooks.aspx.cs" Inherits="guidebooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container text-center mx-auto align-items-center">
    <asp:DataList ID="listTilte" runat="server" DataKeyField="GuideTypeID" DataSourceID="sdsTitle" RepeatDirection="Horizontal" RepeatLayout="Flow" ShowFooter="False" ShowHeader="False">
        <ItemTemplate>
<asp:Label ID="GuideTypeNameLabel" runat="server" Text='<%# Eval("GuideTypeName") %>' CssClass="h1 text-info text-center mx-auto col-12 " style="margin:0 auto !important;"/>
        </ItemTemplate>
                </asp:DataList></div>
    <br />
    <asp:SqlDataSource ID="sdsTitle" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT GuideTypeName, GuideTypeID FROM GuideTypes WHERE (GuideTypeID = @gID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="gID" QueryStringField="gID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="lvGuide" runat="server" DataKeyNames="GuideTypeID" DataSourceID="sdsGuide">
        <AlternatingItemTemplate>
            <li class="list-unstyled">
                 <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("guideFileExt")%>&#039;)' class="grey">
                <i class="far fa-file-pdf fa-2x text-info" title="فتح الملف"></i>
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' CssClass="h5 col-12"  />
                     
                 </a>
                <br />
 <div style='display:<%# GetVisibility(DataBinder.Eval(Container.DataItem,"GuideTypeID").ToString())%>'><dl><dt class="dbresults font-weight-bold">تاريخ إدخال الدليل :</dt><dd id="link2" runat="server" class="dbresults" ><%# Eval("InsertDate", "{0:dd/MM/yyyy}")%></dd></dl><br /></div>
<br />
                    </span>
                <%--<asp:Label ID="GuideTypeIDLabel" runat="server" Text='<%# Eval("GuideTypeID") %>' />
                <br />--%>
            </li>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <li style="">Title:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />
                InsertDate:
                <asp:TextBox ID="InsertDateTextBox" runat="server" Text='<%# Bind("InsertDate") %>' />
                <br />
                guideFileExt:
                <asp:TextBox ID="guideFileExtTextBox" runat="server" Text='<%# Bind("guideFileExt") %>' />
                <br />
                GuideTypeName:
                <asp:TextBox ID="GuideTypeNameTextBox" runat="server" Text='<%# Bind("GuideTypeName") %>' />
                <br />
                GuideTypeID:
                <asp:Label ID="GuideTypeIDLabel1" runat="server" Text='<%# Eval("GuideTypeID") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
            </li>
        </EditItemTemplate>
        <EmptyDataTemplate>
            No data was returned.
        </EmptyDataTemplate>
        <InsertItemTemplate>
            <li style="">Title:
                <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                <br />InsertDate:
                <asp:TextBox ID="InsertDateTextBox" runat="server" Text='<%# Bind("InsertDate") %>' />
                <br />guideFileExt:
                <asp:TextBox ID="guideFileExtTextBox" runat="server" Text='<%# Bind("guideFileExt") %>' />
                <br />GuideTypeName:
                <asp:TextBox ID="GuideTypeNameTextBox" runat="server" Text='<%# Bind("GuideTypeName") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
            </li>
        </InsertItemTemplate>
        <ItemSeparatorTemplate>
<hr />
        </ItemSeparatorTemplate>
        <ItemTemplate>
           <li class="list-unstyled">
<%--                <asp:Label ID="GuideTypeNameLabel" runat="server" Text='<%# Eval("GuideTypeName") %>' CssClass="h1 text-info text-center mx-auto col-12 float-xl-none" style="margin:0 auto !important;"/>
                <br />--%>
            <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("guideFileExt")%>&#039;)' class="grey">
                <i class="far fa-file-pdf fa-2x text-info" title="فتح الملف"></i>
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' CssClass="h5 col-12"  />
                     
                 </a>
               <br />
               <div style='display:<%# GetVisibility(DataBinder.Eval(Container.DataItem,"GuideTypeID").ToString())%>'><dl><dt class="dbresults font-weight-bold">تاريخ إدخال الدليل :</dt><dd id="link2" runat="server" class="dbresults" ><%# Eval("InsertDate", "{0:dd/MM/yyyy}")%></dd></dl><br /></div>

<%--                تاريخ إدخال الدليل:
                <asp:Label ID="InsertDateLabel" runat="server" Text='<%# Eval("InsertDate", "{0:dd/MM/yyyy}") %>' CssClass="col-12" />--%>
               

                <%--<asp:Label ID="GuideTypeIDLabel" runat="server" Text='<%# Eval("GuideTypeID") %>' />
                <br />--%>
            </li>
        </ItemTemplate>
        <LayoutTemplate>
            <ul id="itemPlaceholderContainer" runat="server" style="">
                <li runat="server" id="itemPlaceholder" />
            </ul>
            <div style="">
                <asp:DataPager ID="DataPager1" runat="server">
                    <Fields>
                        <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowLastPageButton="True" />
                    </Fields>
                </asp:DataPager>
            </div>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <li style="">Title:
                <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                <br />
                InsertDate:
                <asp:Label ID="InsertDateLabel" runat="server" Text='<%# Eval("InsertDate") %>' />
                <br />
                guideFileExt:
                <asp:Label ID="guideFileExtLabel" runat="server" Text='<%# Eval("guideFileExt") %>' />
                <br />
                GuideTypeName:
                <asp:Label ID="GuideTypeNameLabel" runat="server" Text='<%# Eval("GuideTypeName") %>' />
                <br />
                GuideTypeID:
                <asp:Label ID="GuideTypeIDLabel" runat="server" Text='<%# Eval("GuideTypeID") %>' />
                <br />
            </li>
        </SelectedItemTemplate>
    </asp:ListView>
    <asp:SqlDataSource ID="sdsGuide" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="
 SELECT guidebook.Title,  guidebook.guideFileExt, GuideTypes.GuideTypeName,guidebook.InsertDate,

 GuideTypes.GuideTypeID FROM guidebook INNER JOIN GuideTypes ON guidebook.guideType = GuideTypes.GuideTypeID 
 where guidebook.guideType=@type

 
">
        <SelectParameters>
            <asp:QueryStringParameter Name="type" QueryStringField="gID" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

