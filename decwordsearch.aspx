<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="decwordsearch.aspx.cs" Inherits="searchData" Title="البحث عن دراسة" EnableEventValidation="false" %>

<%@ Register Assembly="Infragistics2.WebUI.UltraWebTab.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.UltraWebTab" TagPrefix="igtab" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .auto-style1 {
        direction: ltr;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="card col-xl-4 col-lg-5 col-md-8 col-sm-12 mx-auto container  m-card-with-icon " >
         <div class="top bg-gradient-secondary card-header"><img class="icon " src="Images/words.svg" />
             <h2 class="text-white text-center">البحث بالكلمات الدالة</h2>
             </div>
        <div class="card-body">
 <div class="form-inline">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control col-10" ClientIDMode="Static"></asp:TextBox>&nbsp; &nbsp; &nbsp;<asp:Button 
                        ID="btnSearch" runat="server" Text="بحث" 
        onclick="btnSearch_Click" CssClass="btn btn-info" />&nbsp; <asp:Label ID="lblSearch" runat="server" ></asp:Label>
       </div><br />
        </div>
    </div>
    <div>
         <asp:Label ID="noDataLabel" runat="server" Text="   " />
        <asp:ListView ID="ListView1" runat="server" >
        <AlternatingItemTemplate>
        <li style="background-color: #FFFFFF;color: #284775;font-family:Tahoma,Arial;">
        <h4><asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("decTitle") %>' /></h4> 
        <br /><b>رقم القرار:</b>  <asp:Label ID="SummuryLabel" runat="server" Text='<%# Eval("decNo") %>' />
        <br /><b>تاريخ الإصدار:</b> <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("decDate", "{0:dd/MM/yyyy}")%>' Style="direction:ltr;"  />
        <br /><b> نوع القرار:</b>
                    <asp:Label ID="langLabel" runat="server" Text='<%# Eval("decType") %>' />        
<%--          <br />  <a href="#" onclick="window.open('UploadedDecisions/<%#Eval("decisionFile")%>')" ><img src='<%#  "photo.aspx?photoID=" + Eval("photoID")+"&Width=45&Height=45"  %>' id="Photo"  alt="فتح ملف الدراسة" style="border:none;"/></a>
--%>        <br /><br /><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("decID", "decdetails.aspx?decID={0}") %>'>التفاصيل</asp:HyperLink></li>

        </li>
        </AlternatingItemTemplate>
        <EditItemTemplate><li style="background-color: #999999;font-family:Tahoma,Arial;">Title: <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
        <br />Summury: <asp:TextBox ID="decNo" runat="server" Text='<%# Bind("decNo") %>' />
       
        <br />Date: <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("decDate", "{0:dd,MMMM,yyyy}")%>' />
         <br />
                   
        <br />Filepath: <asp:TextBox ID="FilepathTextBox" runat="server" Text='<%# Bind("decisionFile") %>' />
        <br /><asp:Button ID="UpdateButton" runat="server" CommandName="Update"  Text="Update" />
        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel"  Text="Cancel" />
        </li>
                        </EditItemTemplate>
                        <EmptyDataTemplate></EmptyDataTemplate>
                        <InsertItemTemplate>
                            <li style="font-family:Tahoma,Arial;">Title: <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                        <br />Summury: <asp:TextBox ID="SummuryTextBox" runat="server" Text='<%# Bind("Summury") %>' />
                        <br />Type: <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                        <br />Owner: <asp:TextBox ID="OwnerTextBox" runat="server" Text='<%# Bind("Owner") %>' />
                        <br />Date: <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date", "{0:MM,yyyy}")%>' />
                        
                        <br />Classification: <asp:TextBox ID="ClassificationTextBox" runat="server" 
                    Text='<%# Bind("Classification") %>' />
                    <br />Filepath: <asp:TextBox ID="FilepathTextBox" runat="server" 
                    Text='<%# Bind("Filepath") %>' /><br /><asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" /></li></InsertItemTemplate>
                    <ItemSeparatorTemplate><br /></ItemSeparatorTemplate>
                    
                    <ItemTemplate><li style="background-color: #e3e3e3;color: #333333; font-family:Tahoma,Arial;">
                    <h4><asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("decTitle") %>' /></h4>
                    <br /><b>رقم القرار:</b> <asp:Label ID="SummuryLabel" runat="server" Text='<%# Eval("decNo") %>' />
                    <br /><b>تاريخ الإصدار:</b> <asp:Label ID="DateLabel" runat="server" Text='<%# Bind("decDate", "{0:dd/MM/yyyy}")%>' Style="direction:ltr;" />
                    <br /><b> نوع القرار:</b>
                    <asp:Label ID="langLabel" runat="server" Text='<%# Eval("decType") %>' />  
                   <%-- <br />  <a href="#" onclick="window.open('UploadedDecisions/<%#Eval("decisionFile")%>')" ><img src='<%#  "photo.aspx?photoID=" + Eval("photoID")+"&Width=45&Height=45"  %>' id="Photo"  alt="فتح ملف الدراسة" style="border:none;"/></a>--%>
                    <br /><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("decID", "decdetails.aspx?decID={0}") %>'>التفاصيل</asp:HyperLink></li>
                    </ItemTemplate>
                    <LayoutTemplate><ul ID="itemPlaceholderContainer" runat="server" 
                style="font-family:Tahoma,Arial;"><li ID="itemPlaceholder" runat="server" /></ul>
                <div class="bg-gradient-secondary text-white white-link" style="color:#ffffff;">
                    <asp:DataPager runat="server" ID="decsDataPager" PageSize="12">
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
                </div></LayoutTemplate><SelectedItemTemplate><tr style=""><td><asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></td><td><asp:Label ID="SummuryLabel" runat="server" Text='<%# Eval("Summury") %>' /></td><td><asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' /></td><td><asp:Label ID="OwnerLabel" runat="server" Text='<%# Eval("Owner") %>' /></td><td><asp:Label ID="DateLabel" runat="server" Text='<%# Bind("Date", "{0:MMMM,yyyy}")%>' /></td><td><asp:Label ID="ClassificationLabel" runat="server" 
                            Text='<%# Eval("Classification") %>' /></td><td><asp:Label ID="FilepathLabel" runat="server" Text='<%# Eval("decisionFile") %>' /></td></tr></SelectedItemTemplate></asp:ListView>
         <br />
         <asp:SqlDataSource ID="sdstest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
            SelectCommand="decKeywords" SelectCommandType="StoredProcedure" OnSelected="sdstest_Selected"><SelectParameters><asp:ControlParameter ControlID="txtSearch" Name="searchword" 
                    PropertyName="Text" Type="String" /></SelectParameters></asp:SqlDataSource>
            </div>

<%-----------------------igTabs-------------------------------- --%>

</asp:Content>

