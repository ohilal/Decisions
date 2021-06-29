<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="allDecisions.aspx.cs" Inherits="allDecisions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                         
                    <asp:DataList ID="DataList2" runat="server" BorderColor="#660000" 
                        BorderWidth="1px" DataSourceID="sdsDate" GridLines="Both" RepeatColumns="2" 
                         CellPadding="3" CellSpacing="1" UseAccessibleHeader="True" CssClass="table table-striped">
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
WHERE decision_Types.decTypeID=@decTypeID 
order by decDate desc
SET DATEFORMAT dmy">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="decTypeID" QueryStringField="id" />
                        </SelectParameters>
                    </asp:SqlDataSource>
</asp:Content>

