<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" Title="أحدث القرارات" EnableEventValidation="false" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function reveal() {
            var reveals = document.querySelectorAll(".reveal");

            for (var i = 0; i < reveals.length; i++) {
                var windowHeight = window.innerHeight;
                var elementTop = reveals[i].getBoundingClientRect().top;
                var elementVisible = 150;


                if (elementTop < windowHeight - elementVisible) {
                    reveals[i].classList.add("active");
                } else {
                    reveals[i].classList.remove("active");
                }
            }
        }

        window.addEventListener("load", reveal);
        window.addEventListener("scroll", reveal);
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
        <!--========================================= Marquee============================================ -->
        <div class="row">
	<div class="alert alert-primary alert-dismissible" style="background-color: #EDF4EA;" role="alert">
  <button type="button" onclick="this.parentNode.parentNode.removeChild(this.parentNode);" class="close" data-dismiss="alert"><span aria-hidden="true">×</span><span class="sr-only">غلق</span></button>
  <h2 class="text-center text-info"><i class="fa-solid fa-bullhorn"></i> إعلانات</h2> <marquee  onmouseover="this.stop();" onmouseout="this.start();" >
      <a href="success.aspx">إعلانات وتنبيهات</a>
      <a href="decsaerch.aspx" style="font-family: Impact; font-size: 18pt">Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor Lorem ipsum dolor!</a></marquee>
</div>
	</div>

      <!-- ====== Preloader ======  -->
    <div id="loader-wrapper">
        <div id="loader"></div>
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>
    <!-- ======End Preloader ======  -->

    <!--------------------------------------- Layout-------------------------------------------------->
    <div class="container" style="height: 90vh;">
        <section id="Laptop" style="box-shadow: 10px 10px 25px #506a6e;">
            <div class="container">
                <!-- {% block content%} -->
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6 rounded  " style="left: 0px; top: 0px;">
                        <img src="Images/documents.svg" style="max-height: 80vh;" />
                    </div>
                    <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6" style="left: 0px; top: 0px">
                        <div class="laptop-text">
                            <h1 class="h1 text-white">
                                <br class="d-none d-lg-none d-xl-block">
                                النشر الالكترونى</h1>
                            <br class="d-none d-lg-none d-xl-block">
                            <p>
                                في
			 
              إطار تطوير الخدمات الالكترونية للهيئة العامة للتنمية الصناعية تم تفعيل الإصدار الأول من " النشر الاليكترونى" على الشبكة الداخلية للهيئة والذي يتيح لموظفى الهيئة البحث فى القرارات والتعرف على أحدث ما تم نشره على الشبكة الداخلية للهيئة،
               وكذلك المستندات الهامة مثل  <a href="guidebooks.aspx?gID=1" class="badge badge-info">دليل أكواد الأنشطة و المنتجات</a>  و <a href="guidebooks.aspx?gID=3" class="badge badge-info">دليل التليفونات الداخلية</a>  
                            </p>
                            <p>
                                ويمكنك من خلال التطبيق البحث فى القرارات من خلال <a href="decNosearch.aspx" class="badge badge-info"> رقم القرار</a> 
                                أو <a href="decsaerch.aspx" class="badge badge-info">تاريخ النشر</a> أو <a href="decwordsearch.aspx" class="badge badge-info">بحث بالكلمات الدالة</a>
                            </p>
                            <p>  ولمتابعة   <a href="Default.aspx#latest" class="badge badge-info">أحدث ما تم نشره
   
                                            </a></p>
                          <%--  <!-- --------------------------------------->
                            <a href="Default.aspx#latest">
                                <div class="arrow-container animated fadeInDown">
                                    <div class="arrow-2">
                                        <i class="fa fa-angle-down"></i>
                                    </div>
                                    <div class="arrow-1 animated hinge infinite zoomIn"></div>
                                </div>
                            </a>--%>
                            <!-- --------------------------------------->
                             <a href="Default.aspx#latest">
                            <svg class="arrows">
							<path class="a1" d="M0 0 L15 16 L30 0"></path>
							<path class="a2" d="M0 10 L15 26 L30 10"></path>
							<path class="a3" d="M0 20 L15 36 L30 20"></path>
						</svg>
      <%--                            <svg class="arrows">
        <path class="a1" d="M0 0 L25 26 L50 0"></path>
        <path class="a2" d="M0 10 L25 36 L50 10"></path>
        <path class="a3" d="M0 20 L25 46 L50 20"></path>
    </svg>--%>
                                  </a>
        <!-- ------------------------------------------------>

                            <%--           <a href="Default.aspx#latest"><i class="fas fa-2x fa-hand-point-down text-white text-center animated hinge infinite slideInDown" style="animation-delay:0.5"></i></a>--%>
                        </div>
                    </div>
                </div>
            </div>
            <!--{% endblock %}-->
        </section>
    </div>
    <!-- ==================================================================== -->
    <asp:SqlDataSource ID="countsds" runat="server"
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>"
        SelectCommand="SELECT TOP (15) decisions_Info.decID, decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decisionFile, decision_Types.decType, CONVERT (varchar, decisions_Info.decDate, 103) AS date, decisions_Info.decsubjectNo FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID ORDER BY decisions_Info.decDate DESC"></asp:SqlDataSource>
    <!--  ===============================================================================    -->
    <br class="d-none d-lg-none d-xl-block">
    <h1 class="text-center text-info h1" id="latest">أحدث ما  تم نشره </h1>
    <div class="section_our_solution">
        <div class="row">
            <div class="col-12">
                <div class="our_solution_category ">
                    <!-- ========================================================================= -->

                    <!-- ========================================================================= -->

                    <asp:ListView ID="ListView1" runat="server" DataKeyNames="decID" DataSourceID="countsds" GroupItemCount="3">
                        <AlternatingItemTemplate>
                            <td runat="server" style="">
                                <!-- sol_card_top_3-->
                                <div class="solution_cards_box reveal  ">
                                    <div class="solution_card">
                                        <div class="hover_color_bubble"></div>

                                        <div class="solu_title text-wrap">
                                            <p style='display: <%# GetVisibility(DataBinder.Eval(Container.DataItem,"[decNo]").ToString())%>'>
                                                <span class="dbresults">قرار رقم: </span>
                                                <label id="link2" runat="server" class=" badge badge-pill badge-info ml-2 font-weight-bold display-1"><%# Eval("[decNo]")%></label>
                                            </p>

                                            <a href="#" onclick="window.open('../DecisionsData/<%#Eval("decisionFile")%>')"><i class="far fa-file-pdf fa-1x text-info" title="فتح الملف"></i>
                                                <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle") %>' />
                                            </a>
                                        </div>
                                        <br />
                                        <div class="solu_description">

                                            <span>نوع القرار:</span>
                                            <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' class="font-weight-bold" />
                                            <br />
                                            <span>تاريخ القرار:</span>
                                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' class="font-weight-bold" />
                                            <br />

                                            <p style='display: <%# GetVisibility(DataBinder.Eval(Container.DataItem,"[decsubjectNo]").ToString())%>'>
                                                <span class="dbresults ">عدد مواد القرار:</span><label id="decsubjectNoLabel" runat="server" class="dbresults font-weight-bold ml-2"><%# Eval("[decsubjectNo]")%></label><br /></div>
                                    </div>
                                </div>

                            </td>
                        </AlternatingItemTemplate>
                        <EditItemTemplate>
                            <td runat="server" style="">decID:
                            <asp:Label ID="decIDLabel1" runat="server" Text='<%# Eval("decID") %>' />
                                <br />
                                decNo:
                            <asp:TextBox ID="decNoTextBox" runat="server" Text='<%# Bind("decNo") %>' />
                                <br />
                                decTitle:
                            <asp:TextBox ID="decTitleTextBox" runat="server" Text='<%# Bind("decTitle") %>' />
                                <br />
                                decisionFile:
                            <asp:TextBox ID="decisionFileTextBox" runat="server" Text='<%# Bind("decisionFile") %>' />
                                <br />
                                decType:
                            <asp:TextBox ID="decTypeTextBox" runat="server" Text='<%# Bind("decType") %>' />
                                <br />
                                date:
                            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                <br />
                                decsubjectNo:
                            <asp:TextBox ID="decsubjectNoTextBox" runat="server" Text='<%# Bind("decsubjectNo") %>' />
                                <br />
                                <asp:Button ID="UpdateButton" runat="server" CommandName="Update" Text="Update" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Cancel" />
                                <br />
                            </td>
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
                                <td id="itemPlaceholder" runat="server" class="solution_cards_box  sol_card_top_3"></td>
                            </tr>
                        </GroupTemplate>
                        <InsertItemTemplate>
                            <td runat="server" style="">decNo:
                            <asp:TextBox ID="decNoTextBox" runat="server" Text='<%# Bind("decNo") %>' />
                                <br />
                                decTitle:
                            <asp:TextBox ID="decTitleTextBox" runat="server" Text='<%# Bind("decTitle") %>' />
                                <br />
                                decisionFile:
                            <asp:TextBox ID="decisionFileTextBox" runat="server" Text='<%# Bind("decisionFile") %>' />
                                <br />
                                decType:
                            <asp:TextBox ID="decTypeTextBox" runat="server" Text='<%# Bind("decType") %>' />
                                <br />
                                date:
                            <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>' />
                                <br />
                                decsubjectNo:
                            <asp:TextBox ID="decsubjectNoTextBox" runat="server" Text='<%# Bind("decsubjectNo") %>' />
                                <br />
                                <asp:Button ID="InsertButton" runat="server" CommandName="Insert" Text="Insert" />
                                <br />
                                <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" Text="Clear" />
                                <br />
                            </td>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <td runat="server" style="">
                                <div class="solution_cards_box reveal ">
                                    <div class="solution_card">
                                        <div class="hover_color_bubble"></div>
                                        <div class="solu_title text-wrap">
                                            <p style='display: <%# GetVisibility(DataBinder.Eval(Container.DataItem,"[decNo]").ToString())%>'>
                                                <span>قرار رقم: </span>
                                                <label id="link2" runat="server" class="dbresults badge badge-pill badge-info ml-2 font-weight-bold"><%# Eval("[decNo]")%></label>
                                            </p>
                                            <a href="#" onclick="window.open('../DecisionsData/<%#Eval("decisionFile")%>')"><i class="far fa-file-pdf fa-1x text-info" title="فتح الملف"></i>
                                                <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle") %>' />
                                            </a>
                                        </div>
                                        <br />
                                        <div class="solu_description">

                                            <span>نوع القرار:</span>
                                            <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' class="font-weight-bold" />
                                            <br />
                                            <span>تاريخ القرار:</span>
                                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' class="font-weight-bold" />
                                            <br />

                                            <p style='display: <%# GetVisibility(DataBinder.Eval(Container.DataItem,"[decsubjectNo]").ToString())%>'>
                                                <span class="dbresults ">عدد مواد القرار:</span><label id="decsubjectNoLabel" runat="server" class="dbresults font-weight-bold ml-2"><%# Eval("[decsubjectNo]")%></label><br /></div>
                                    </div>
                                </div>
                            </td>
                        </ItemTemplate>
                        <LayoutTemplate>
<%--                            <table runat="server" >
                                <tr runat="server">
                                    <td runat="server">--%>
                                        <table id="groupPlaceholderContainer" runat="server" border="0" style="">
                                            <tr id="groupPlaceholder" runat="server">
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <%--        <table runat="server">--%>
                                <tr runat="server">
                                    <td runat="server" class="pagination">
                                        <%--<asp:DataPager runat="server" ID="decsDataPager" PageSize="12">
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
      </asp:DataPager>--%>
                                    </td>
                                </tr>
                            </table>
                        </LayoutTemplate>
                        <SelectedItemTemplate>
                            <td runat="server" class="solution_cards_box  sol_card_top_3">decID:
                            <asp:Label ID="decIDLabel" runat="server" Text='<%# Eval("decID") %>' />
                                <br />
                                decNo:
                            <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                                <br />
                                decTitle:
                            <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle") %>' />
                                <br />
                                decisionFile:
                            <asp:Label ID="decisionFileLabel" runat="server" Text='<%# Eval("decisionFile") %>' />
                                <br />
                                decType:
                            <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                                <br />
                                date:
                            <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date") %>' />
                                <br />
                                decsubjectNo:
                            <asp:Label ID="decsubjectNoLabel" runat="server" Text='<%# Eval("decsubjectNo") %>' />
                                <br />
                            </td>
                        </SelectedItemTemplate>
                    </asp:ListView>
                </div>
            </div>
        </div>
    </div>
    <!------------------------ new listView ----------------------------------------------------------->
 
</asp:Content>

