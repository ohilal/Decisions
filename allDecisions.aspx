<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="allDecisions.aspx.cs" Inherits="allDecisions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   

    <asp:ListView ID="ListView1" runat="server" GroupItemCount="2" DataSourceID="sdsDate" >
        <AlternatingItemTemplate>
            <td runat="server" class="col-6" > <b>رقم القرار:</b>
                <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                <br />
                <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle")  %>' CssClass="col-form-label text-info h3" />
                <br /> <b>تاريخ القرار:</b>
                <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate", "{0:dd/MMM/yyyy}") %>' Style="direction:ltr;" />
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
                    <td>No data was returned.</td>
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
                <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate", "{0:dd/MMM/yyyy}") %>'  Style="direction:ltr;" />
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
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="12">
                            <Fields>
                               <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" ShowNextPageButton="False" ShowPreviousPageButton="True" FirstPageText="الأول" LastPageText="الأخير" NextPageText=">>" PreviousPageText="<<" ButtonCssClass="btn btn-secondary" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" ShowNextPageButton="True" ShowPreviousPageButton="False" LastPageText="الأخير" NextPageText=">>" ButtonCssClass="btn btn-secondary" />
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
                    <asp:SqlDataSource ID="sdsDate" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SelectDec" EnableCaching="True" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="decTypeID" QueryStringField="id" />
                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
</asp:Content>

