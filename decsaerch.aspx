<%@ Page Title="البحث فى قرارات الهيئة" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="decsaerch.aspx.cs" Inherits="testDate" UICulture="ar-EG" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register Assembly="Infragistics2.WebUI.WebDateChooser.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.WebSchedule" TagPrefix="igsch" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.DynamicData" TagPrefix="cc2" %>


<%@ Register Assembly="Infragistics2.WebUI.UltraWebTab.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" Namespace="Infragistics.WebUI.UltraWebTab" TagPrefix="igtab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
     <div class="card col-xl-5 col-lg-8 col-md-8 col-sm-12 mx-auto container " >
         <div class="card-header"><h2 class="text-info text-center">البحث بالتاريخ</h2></div>
   <div class="card-body">
   <div class="form-row">
       <label for="txtdate1" class="col-form-label ml-2">من</label> 
        <asp:TextBox ID="txtdate1" runat="server"
            ToolTip="من تاريخ..."  CssClass="form-control col-xl-5 col-lg-8 col-md-12 col-sm-12 " TextMode="Date" ></asp:TextBox>
<%--       <asp:RangeValidator ID="RangeValidator1" runat="server" 
ControlToValidate="txtdate1" CultureInvariantValues="True" ErrorMessage="ادخل رقم صحيح للتاريخ" 
MaximumValue="1/1/2050" MinimumValue="1/1/2000" >   
</asp:RangeValidator>--%>

    <%--    <cc1:CalendarExtender ID="txtdate1_CalendarExtender" runat="server"
            Enabled="True" TargetControlID="txtdate1" Format="MM/dd/yyyy">
        </cc1:CalendarExtender>--%>
        &nbsp; <label for="txtdate2" class="col-form-label ml-2">إلى</label> 
       
    &nbsp;<asp:TextBox ID="txtdate2" runat="server" 
        ToolTip="إلي تاريخ..." CssClass="form-control col-xl-5 col-lg-8 col-md-12 col-sm-12 "   TextMode="Date"></asp:TextBox>
       <%-- <cc1:CalendarExtender ID="txtdate2_CalendarExtender" runat="server"
            Enabled="True" TargetControlID="txtdate2" Format="MM/dd/yyyy" CssClass="txtDate">
        </cc1:CalendarExtender>--%>
        &nbsp;&nbsp;&nbsp;<%--<asp:DropDownList ID="ddlDectypes" Width="250px" runat="server" DataSourceID="sdsDecisions" 
                                    DataTextField="decType" DataValueField="decTypeID" AppendDataBoundItems="true">
                                    <asp:ListItem Value="" Text="اختر نوع القرار" Enabled="true" />
                                </asp:DropDownList>--%>

        <%--                                <asp:SqlDataSource ID="sdsDecisions" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                                    SelectCommand="SELECT [decTypeID], [decType] FROM [decision_Types]">
                                </asp:SqlDataSource>--%>
       </div>
        <asp:TreeView ID="TreeView1" runat="server" Font-Names="'noto_kufi_arabicregular',Tahoma,sans-serif" Font-Size="Medium" Font-Bold="True" CssClass="text-white">
            <Nodes>
                <asp:TreeNode Expanded="True" Text="قرارات إدارية" ToolTip="عرض كل القرارات الإدارية" NavigateUrl="~/allDecisions.aspx?id=20"  >
                    <asp:TreeNode Expanded="False" Text="شئون عاملين" ToolTip="شئون عاملين" Value="1">
                    </asp:TreeNode>
                    <asp:TreeNode Expanded="False" Text="اجراءات عمل" ToolTip="اجراءات عمل" Value="3" ImageToolTip="القرارات">
                    </asp:TreeNode>
                    <asp:TreeNode Text="لجان" ToolTip="لجان" Value="2"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="رسائل داخلية" Value="6" Expanded="True" NavigateUrl="~/allDecisions.aspx?id=30" ToolTip="عرض كل الرسائل الداخلية">
                    <asp:TreeNode Text="إعلانات" Value="8"></asp:TreeNode>
                    <asp:TreeNode Text="الشركة الطبية" Value="9"></asp:TreeNode>
                    <asp:TreeNode Text="رسائل داخلية" Value="6"></asp:TreeNode>
                </asp:TreeNode>
                <asp:TreeNode Text="أوامر إدارية" Value="7"></asp:TreeNode>
                <asp:TreeNode Expanded="True" Text="قرارات وزارية" ToolTip="عرض كل القرارات" NavigateUrl="~/allDecisions.aspx?id=10">
                    <asp:TreeNode Expanded="False" Text="قرارات رئيس مجلس الوزراء" ToolTip="قرارات رئيس مجلس الوزراء" Value="4"></asp:TreeNode>
                    <asp:TreeNode Text="قرارات وزارية" ToolTip="قرارات وزارية" Value="5"></asp:TreeNode>
                </asp:TreeNode>
            </Nodes>
            <RootNodeStyle CssClass="font-weight-bold" />
            <LeafNodeStyle CssClass="font-weight-light" />
            <ParentNodeStyle CssClass="font-weight-bold" />

        </asp:TreeView>

<%--

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnDate" runat="server"
            Text="القرارات" CssClass="btn btn-info btn-lg  topMargin "  />--%>

</div></div>
        <br />
        <br />

    <asp:Label ID="noDataLabel" runat="server" Text="   " />
    <asp:ListView ID="ListView1" runat="server" DataSourceID="sdsDate" GroupItemCount="2" >
        <AlternatingItemTemplate>
            <td runat="server"  > <b>رقم القرار:</b>
                <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                <br />
                <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle")  %>' CssClass="col-form-label text-info h3" />
                <br /> <b>تاريخ القرار:</b>
                <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate", "{0:dd/MMM/yyyy}") %>' />
                <br /><b>نوع القرار</b>
                <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                <br /> القرار:
                        <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'><i class="far fa-file-pdf fa-2x text-info" title="فتح الملف"></i></a>
                <%--<asp:Label ID="decisionFileLabel" runat="server" Text='<%# Eval("decisionFile") %>' />--%>
                <br /></td>
        </AlternatingItemTemplate>
        <EditItemTemplate>
            <td runat="server" >decNo:
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
<td runat="server"  />
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer" runat="server">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <InsertItemTemplate>
            <td runat="server" >decNo:
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
            <td runat="server"  > <b>رقم القرار:</b>
                <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                <br />
                <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle")  %>' CssClass="col-form-label text-info h3" />
                <br /> <b>تاريخ القرار:</b>
                <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate", "{0:dd/MMM/yyyy}") %>' />
                <br /><b>نوع القرار</b>
                <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                <br /> القرار:
                        <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'><i class="far fa-file-pdf fa-2x text-info" title="فتح الملف"></i></a>
                <%--<asp:Label ID="decisionFileLabel" runat="server" Text='<%# Eval("decisionFile") %>' />--%>
                <br /></td>
        </ItemTemplate>
        <LayoutTemplate>
            <table runat="server" class="table table-striped table-bordered table-responsive-lg">
                <tr runat="server">
                    <td runat="server" class="col-lg-6 col-sm-12">
                        <table id="groupPlaceholderContainer" runat="server" border="0" class="table table-striped  table-bordered table-responsive-lg">
                            <tr id="groupPlaceholder" runat="server">
                            </tr>
                        </table>
                    </td>
                </tr>
                               <tr runat="server">
                    <td runat="server" class="pagination" dir="ltr">
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
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <SelectedItemTemplate>
            <td runat="server" class="col-lg-6 col-sm-12">decNo:
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
            SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, 
decDate, 
decision_Types.decType, decisions_Info.decisionFile FROM decision_Types INNER JOIN decisions_Info ON decision_Types.decTypeID = decisions_Info.decTypeID 
WHERE decDate between @searchdateone and @searchdatetwo 
and decision_Types.decTypeID=@decTypeID 
order by decDate desc
SET DATEFORMAT dmy" OnSelected="sdsDate_Selected">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtdate1" Name="searchdateone"
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="txtdate2" Name="searchdatetwo"
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="TreeView1" Name="decTypeID"
                    PropertyName="SelectedValue" />
            </SelectParameters>
        </asp:SqlDataSource>
 
  

</asp:Content>

