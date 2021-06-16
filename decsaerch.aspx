﻿<%@ Page Title="البحث فى قرارات الهيئة" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="decsaerch.aspx.cs" Inherits="testDate" UICulture="ar-EG" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="Infragistics2.WebUI.WebDateChooser.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebSchedule" tagprefix="igsch" %>

<%@ Register assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.DynamicData" tagprefix="cc2" %>

<%--<%@ Register assembly="Infragistics2.WebUI.WebSchedule.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebSchedule" tagprefix="igsch" %>
<%@ Register assembly="Infragistics2.WebUI.WebDataInput.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebDataInput" tagprefix="igtxt" %>
--%>
<%@ Register assembly="Infragistics2.WebUI.UltraWebTab.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.UltraWebTab" tagprefix="igtab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <div class="rtlDirection">
                                <b>من</b>
                            <asp:TextBox ID="txtdate1" runat="server" BackColor="#FFFFCC" 
        ToolTip="من تاريخ..." Height="20px" Width="124px"></asp:TextBox>
   <cc1:CalendarExtender ID="txtdate1_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtdate1" Format="MM/dd/yyyy" >
    </cc1:CalendarExtender>
                                &nbsp; &nbsp;<b>إلى </b>&nbsp; &nbsp; &nbsp;
    <asp:TextBox ID="txtdate2" runat="server" BackColor="#edfbbd" 
        ToolTip="إلي تاريخ..."></asp:TextBox>
    <cc1:CalendarExtender ID="txtdate2_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtdate2" Format="MM/dd/yyyy" >
    </cc1:CalendarExtender>
 &nbsp;&nbsp;&nbsp;<%--<asp:DropDownList ID="ddlDectypes" Width="250px" runat="server" DataSourceID="sdsDecisions" 
                                    DataTextField="decType" DataValueField="decTypeID" AppendDataBoundItems="true">
                                    <asp:ListItem Value="" Text="اختر نوع القرار" Enabled="true" />
                                </asp:DropDownList>--%>
 
<%--                                <asp:SqlDataSource ID="sdsDecisions" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                                    SelectCommand="SELECT [decTypeID], [decType] FROM [decision_Types]">
                                </asp:SqlDataSource>--%>
 
                    			<asp:TreeView ID="TreeView1" runat="server" Font-Names="'noto_kufi_arabicregular',Tahoma,sans-serif" Font-Size="Medium">
									<Nodes>
										<asp:TreeNode Expanded="False" Text="القرارات" ToolTip="القرارات" NavigateUrl="~/allDecisions.aspx?id=3">
											<asp:TreeNode Expanded="False" Text="قرارات رئيس مجلس الوزراء" ToolTip="قرارات رئيس مجلس الوزراء" Value="4">
											</asp:TreeNode>
										    <asp:TreeNode Text="قرارات وزارية" ToolTip="قرارات وزارية" Value="5"></asp:TreeNode>
										</asp:TreeNode>
										<asp:TreeNode Expanded="False" Text="قرارات إدارية" ToolTip="قرارات إدارية" Value="قرارات إدارية" NavigateUrl="~/allDecisions.aspx?id=1">
											<asp:TreeNode Expanded="False" Text="شئون عاملين" ToolTip="شئون عاملين" Value="1">
                                                <asp:TreeNode Expanded="False" Text="اجازات" ToolTip="اجازات" Value="6"></asp:TreeNode>
                                                <asp:TreeNode Text="ترقيات" ToolTip="ترقيات" Value="7"></asp:TreeNode>
                                            </asp:TreeNode>
											<asp:TreeNode Expanded="False" Text="اجراءات عمل" ToolTip="اجراءات عمل" Value="3" ImageToolTip="القرارات">
                                                <asp:TreeNode Text="اجراءات حالية" ToolTip="اجراءات حالية" Value="8"></asp:TreeNode>
                                                <asp:TreeNode Text="اجراءات استثنائية" Value="9" ToolTip="اجراءات استثنائية"></asp:TreeNode>
                                            </asp:TreeNode>
										    <asp:TreeNode Text="لجان" ToolTip="لجان" Value="2"></asp:TreeNode>
										</asp:TreeNode>
									</Nodes>
								</asp:TreeView>
 
                    			              
 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnDate" runat="server" 
                                    Text="القرارات" Width="150px"  />

                     
                                <br />
                                <br />

                     
                    <asp:DataList ID="DataList2" runat="server" BorderColor="#660000" 
                        BorderWidth="1px" DataSourceID="sdsDate" GridLines="Both" RepeatColumns="2" 
                        Width="880px" CellPadding="3" CellSpacing="1" UseAccessibleHeader="True">
                        <SeparatorStyle BorderWidth="1px" />
                        <SelectedItemStyle BorderWidth="1px" />
                        <HeaderStyle BackColor="#660000" />
                    <ItemTemplate>
                    <b>رقم القرار:</b>
                        <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                        <br />
                       
                        <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle") %>' Font-Bold="true" ForeColor="#660000" />
                        <br />
                        <b>تاريخ القرار:</b>
                        <asp:Label ID="decDateLabel" runat="server" 
                            Text='<%# Eval("decDate", "{0:d}") %>'  />
                        <br />
                      <b>التصنيف:</b>
                        <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                        <br />
                        القرار:
                        <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'><img src="Images/pdf_logo_trefoil.gif" style="border-style:none;" alt="فتح الملف" /></a>
                        <br />
                        <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="sdsDate" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, 
decDate, 
decision_Types.decType, decisions_Info.decisionFile FROM decision_Types INNER JOIN decisions_Info ON decision_Types.decTypeID = decisions_Info.decTypeID 
WHERE decDate between @searchdateone and @searchdatetwo 
and decision_Types.decTypeID=@decTypeID 
order by decDate desc
SET DATEFORMAT dmy">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtdate1" Name="searchdateone" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="txtdate2" Name="searchdatetwo" 
                                PropertyName="Text" />
                            <asp:ControlParameter ControlID="TreeView1" Name="decTypeID" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
            <div style="font-family: Arial">     
             </asp:Content>

