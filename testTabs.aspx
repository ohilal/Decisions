<%@ Page Title="البحث فى قرارات الهيئة" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="testTabs.aspx.cs" Inherits="testDate" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="Infragistics2.WebUI.WebDateChooser.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebSchedule" tagprefix="igsch" %>

<%--<%@ Register assembly="Infragistics2.WebUI.WebSchedule.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebSchedule" tagprefix="igsch" %>
<%@ Register assembly="Infragistics2.WebUI.WebDataInput.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.WebDataInput" tagprefix="igtxt" %>
--%>
<%@ Register assembly="Infragistics2.WebUI.UltraWebTab.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.UltraWebTab" tagprefix="igtab" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
                    <igtab:UltraWebTab ID="UltraWebTab1" runat="server" Width="95%" 
                        SelectedTab="2" >
                        <Tabs>
                            <igtab:Tab Text="عرض">
                            <ContentTemplate>
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                        DataSourceID="decsds" CssClass="rtlDirection">
                        <Columns>
                            <asp:BoundField DataField="decNo" HeaderText="decNo" SortExpression="decNo" />
                            <asp:BoundField DataField="decTitle" HeaderText="decTitle" 
                                SortExpression="decTitle" />
                            <asp:BoundField DataField="decKeywords" HeaderText="decKeywords" 
                                SortExpression="decKeywords" Visible="False" />
                            <asp:BoundField DataField="decDate" HeaderText="decDate" 
                                SortExpression="decDate" />
                            <asp:BoundField DataField="decType" HeaderText="decType" 
                                SortExpression="decType" />
                            <asp:TemplateField HeaderText="decisionFile" SortExpression="decisionFile">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decisionFile") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <a href="#" 
                                        onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'>
                                    <%#Eval("decisionFile")%></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>  
                     <asp:SqlDataSource ID="decsds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decKeywords, decisions_Info.decisionFile, decisions_Info.decTypeID, decisions_Info.decDate, decision_Types.decType FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID">
    </asp:SqlDataSource>  
                            </ContentTemplate>
                            </igtab:Tab>
                            <igtab:Tab Text="بحث بالتاريخ">
                            <ContentTemplate>
                            <div class="rtlDirection">

 <igsch:webdatechooser id="DateOfBirth" style="Z-INDEX: 101" runat="server" Width="350px" 
                                    NullDateLabel=" " Height="19px" MinDate="1900-01-01" 
                                    Font-Size="9pt" Font-Names="Tahoma">
                                                    <EditStyle Width="350px"></EditStyle>
                                                    <ClientSideEvents ValueChanged="DateOfBirth_ValueChanged"></ClientSideEvents>
                                                    <CalendarLayout FooterFormat="<img src='untitled.gif' width=16 height=16 align=absmiddle  /> Today: {0:d}" MaxDate="" ShowTitle="False">
                                                        <DayStyle Font-Size="Small"></DayStyle>
                                                        <FooterStyle Font-Size="Small" BackColor="WhiteSmoke">
                                                            <Padding Bottom="3px" Left="3px" Top="3px" Right="3px"></Padding>
                                                        </FooterStyle>
                                                        <SelectedDayStyle ForeColor="HighlightText" BackgroundImage="Images/OrangeExplorer.gif"></SelectedDayStyle>
                                                        <OtherMonthDayStyle ForeColor="#E0E0E0"></OtherMonthDayStyle>
                                                        <NextPrevStyle BorderWidth="1px" BorderStyle="Outset" BackgroundImage="Images/BlueExplorer.gif"></NextPrevStyle>
                                                        <TodayDayStyle BackColor="White"></TodayDayStyle>
                                                        <DropDownStyle Font-Size="Small" Font-Names="Tahoma" BackColor="WhiteSmoke"></DropDownStyle>
                                                        <DayHeaderStyle Font-Size="Small" Font-Bold="True" BorderColor="White" BackgroundImage="Images/BlueExplorer.gif" BackColor="WhiteSmoke">
                                                            <Padding Bottom="3px" Left="3px" Top="3px" Right="3px"></Padding>
                                                        </DayHeaderStyle>
                                                        <TitleStyle BorderWidth="1px" BorderStyle="Outset" BackgroundImage="Images/BlueExplorer.gif"></TitleStyle>
                                                    </CalendarLayout>
                                                    <DropDownStyle Width="200px" BackColor="White" Font-Names="Tahoma"></DropDownStyle>
                                                    <ExpandEffects Type="Fade" Duration="500"></ExpandEffects>
                                                </igsch:webdatechooser>

 
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnDate" runat="server" 
                                    Text="عرض القرار" Width="239px" />

                     
                    <asp:DataList ID="DataList2" runat="server" BorderColor="Silver" 
                        BorderWidth="1px" DataSourceID="sdsDate" GridLines="Both" RepeatColumns="2" 
                        Width="890px">
                    <ItemTemplate>decNo:
                        <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                        <br />
                        decTitle:
                        <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle") %>' />
                        <br />
                        decDate:
                        <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate") %>' />
                        <br />
                        decType:
                        <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                        <br />
                        decisionFile:
                        <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'> <%#Eval("decisionFile")%></a>
                        <br />
                        <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="sdsDate" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decDate, decision_Types.decType, decisions_Info.decisionFile FROM decision_Types INNER JOIN decisions_Info ON decision_Types.decTypeID = decisions_Info.decTypeID WHERE (decisions_Info.decDate = @Date)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DateOfBirth" Name="Date" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
                    </ContentTemplate>
                            </igtab:Tab>
                            <igtab:Tab Text="بحث بالتصنيف">
                            <ContentTemplate>
                            <div class="rtlDirection">
                    <asp:DropDownList ID="DropDownList3" runat="server" DataSourceID="SqlDataSource3" 
                        DataTextField="decType" DataValueField="decTypeID" Width="350px" 
                                    AppendDataBoundItems="True" >
                    <asp:ListItem Value="0">اختر التصنيف...</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:Button ID="Button2" runat="server" Text="عرض القرار" />
                    <br />
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT [decTypeID], [decType] FROM [decision_Types]">
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList4" runat="server" RepeatColumns="2" CellPadding="2" 
                        DataSourceID="sdsCl_Res" Width="890px" BorderColor="Silver" 
                        BorderWidth="1px" GridLines="Both">
                        <ItemStyle Font-Bold="False" Font-Italic="False" Font-Overline="False" 
                            Font-Strikeout="False" Font-Underline="False" VerticalAlign="Middle" />
                        <HeaderStyle Font-Bold="False" Font-Italic="False" Font-Names="Tahoma" 
                            Font-Overline="False" Font-Strikeout="False" Font-Underline="False" />
                    <ItemTemplate>
                        <h1>
                        <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle") %>' /></h1>
                        <br />             
                       رقم القرار:
                        <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
                        <br />
                        التاريخ:
                        <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate") %>' />
                        <br />
                        التصنيف:
                        <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                        <br />
                        فتح القرار:
                       <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'> <%#Eval("decisionFile")%></a>
                        <br />
                        <br />
                    
                    </ItemTemplate>
                    </asp:DataList>
                                        <asp:SqlDataSource ID="sdsCl_Res" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        
                        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decDate, decision_Types.decType, decisions_Info.decisionFile FROM decision_Types INNER JOIN decisions_Info ON decision_Types.decTypeID = decisions_Info.decTypeID WHERE (decision_Types.decTypeID = @Type)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList3" Name="Type" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
                            </ContentTemplate></igtab:Tab>
                        </Tabs>
                    </igtab:UltraWebTab>
                    <br />
<%---------------------------------------------------------------------------------------%>
<div class="rtlDirection">
                    &nbsp;<br />
                    </div>
<%-- ------------------------------------------------------------------------------------------%> 
                   
              
</asp:Content>

