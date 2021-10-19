<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="templets.aspx.cs" Inherits="searchData" Title="البحث عن دراسة" EnableEventValidation="false" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h1 class="text-center text-info">طلبات  ونماذج </h1>
                <asp:SqlDataSource ID="countsds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decisionFile, decisions_Info.decDate, decisions_Info.decsubjectNo, decisions_Info.decTypeID, decision_Types.decType FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID WHERE (decisions_Info.decTypeID = 11)">
                </asp:SqlDataSource>
                  
		<asp:ListView ID="ListView1" runat="server" DataSourceID="countsds" GroupItemCount="1" >
        <AlternatingItemTemplate>
            <td runat="server" class="col-6" > <b>رقم القرار:</b>
                <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                <br />
                <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle")  %>' CssClass="col-form-label text-info h3" />
                <br /> <b>تاريخ القرار:</b>
                <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate", "{0:dd/MMM/yyyy}") %>' />
                <br /><b>نوع القرار</b>
                <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                <br /> القرار:
                        <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'><i class="far fa-file-pdf fa-2x text-info"></i></a>
                <%--<asp:Label ID="decisionFileLabel" runat="server" Text='<%# Eval("decisionFile") %>' />--%>
                <br /></td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server">decNo:
                <asp:TextBox ID="decNoTextBox" runat="server" Text='<%# Bind("decNo") %>' />
                <br />decTitle:
                <asp:TextBox ID="decTitleTextBox" runat="server" Text='<%# Bind("decTitle") %>' />
                <br />decDate:
                <asp:TextBox ID="decDateTextBox" runat="server" Text='<%# Bind("decDate") %>' />
                <br />decType:
                <asp:TextBox ID="decTypeTextBox" runat="server" Text='<%# Bind("decType") %>' />
                <br />decisionFile:
                <asp:TextBox ID="decisionFileTextBox" runat="server" Text='<%# Bind("decisionFile") %>' />
                <br />
                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                <br /></td>
        </EditItemTemplate>
        <EmptyDataTemplate>
            <table runat="server" style="">
                <tr>
                    <td></td>
                </tr>
            </table>
        </EmptyDataTemplate>
        <EmptyItemTemplate>
<td runat="server" />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server">decNo:
                <asp:TextBox ID="decNoTextBox" runat="server" Text='<%# Bind("decNo") %>' />
                <br />decTitle:
                <asp:TextBox ID="decTitleTextBox" runat="server" Text='<%# Bind("decTitle") %>' />
                <br />decDate:
                <asp:TextBox ID="decDateTextBox" runat="server" Text='<%# Bind("decDate") %>' />
                <br />decType:
                <asp:TextBox ID="decTypeTextBox" runat="server" Text='<%# Bind("decType") %>' />
                <br />
                <asp:TextBox ID="decisionFileTextBox" runat="server" Text='<%# Bind("decisionFile") %>' />
                <br />
                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                <br />
                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                <br /></td>
        </InsertItemTemplate>
        <ItemTemplate>
            <td runat="server" class="col-6" > <b>رقم القرار:</b>
                <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                <br />
                <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle")  %>' CssClass="col-form-label text-info h3" />
                <br /> <b>تاريخ القرار:</b>
                <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate", "{0:dd/MMM/yyyy}") %>' />
                <br /><b>نوع القرار</b>
                <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                <br /> القرار:
                        <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'><i class="far fa-file-pdf fa-2x text-info"></i></a>
                <%--<asp:Label ID="decisionFileLabel" runat="server" Text='<%# Eval("decisionFile") %>' />--%>
                <br /></td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="table table table-striped table-bordered table-responsive-lg">
                <tr runat="server">
                    <td runat="server">
                        <table id="groupPlaceholderContainer" runat="server" border="0" class="table table table-striped table-bordered table-responsive-lg">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                               <tr runat="server">
                    <td runat="server" class="pagination" dir="ltr">
                        <asp:DataPager runat="server" ID="templateDataPager" PageSize="12">
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
            <td runat="server" style="">decNo:
                <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                <br />decTitle:
                <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle") %>' />
                <br />decDate:
                <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate") %>' />
                <br />decType:
                <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                <br />decisionFile:
                <asp:Label ID="decisionFileLabel" runat="server" Text='<%# Eval("decisionFile") %>' />
                <br /></td>
        </SelectedItemTemplate>
                    </asp:ListView>


                <br />
				&nbsp; &nbsp; 

</asp:Content>

