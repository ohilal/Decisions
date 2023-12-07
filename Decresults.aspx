<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Decresults.aspx.cs" Inherits="Decresults" Title="Untitled Page" %>

<%@ Register assembly="Infragistics2.WebUI.UltraWebTab.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.UltraWebTab" tagprefix="igtab" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:ltr;">
    <igtab:UltraWebTab ID="UltraWebTab1" runat="server" BorderColor="#0056D7" 
        BorderStyle="Solid" BorderWidth="1px" ThreeDEffect="False" Width="895px"
        TabOrientation="TopRight" SelectedTab="4">
        <Tabs>
            <igtab:Tab Text="بحث بالكلمة">
            </igtab:Tab>
            <igtab:Tab Text="البحث برقم القرار">
            </igtab:Tab>
            <igtab:Tab Text="البحث بالتاريخ">
                <ContentTemplate>
                <div class="rtlDirection">
                    <asp:TextBox ID="TextBox2" runat="server" Width="350px"></asp:TextBox>
                    
                    <cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox2"> 
                    </cc1:CalendarExtender>
                    &nbsp;<asp:Button ID="btnDate" runat="server" Text="عرض القرار" />
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
                        <a href="#" onclick='window.open(&#039;../DecisionsData/<%#Eval("decisionFile")%>&#039;)'> <%#Eval("decisionFile")%></a>
                        <br />
                        <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="sdsDate" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decDate, decision_Types.decType, decisions_Info.decisionFile FROM decision_Types INNER JOIN decisions_Info ON decision_Types.decTypeID = decisions_Info.decTypeID WHERE (decisions_Info.decDate = @Date)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="TextBox2" Name="Date" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
                </ContentTemplate>
            </igtab:Tab>
            <igtab:Tab Text="البحث بنوع القرار">
                <ContentTemplate>
                <div class="rtlDirection">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="sdsClassify" 
                        DataTextField="decType" DataValueField="decTypeID" Width="350px" AppendDataBoundItems="true" >
                    <asp:ListItem Value="0">اختر التصنيف...</asp:ListItem>
                    </asp:DropDownList>
                    &nbsp;<asp:Button ID="btnClassify" runat="server" Text="عرض القرار" />
                    <br />
                    <asp:SqlDataSource ID="sdsClassify" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT [decTypeID], [decType] FROM [decision_Types]">
                    </asp:SqlDataSource>
                    <asp:DataList ID="DataList1" runat="server" RepeatColumns="2" CellPadding="2" 
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
                       <a href="#" onclick='window.open(&#039;../DecisionsData/<%#Eval("decisionFile")%>&#039;)'> <%#Eval("decisionFile")%></a>
                        <br />
                        <br />
                    
                    </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="sdsCl_Res" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        
                        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decDate, decision_Types.decType, decisions_Info.decisionFile FROM decision_Types INNER JOIN decisions_Info ON decision_Types.decTypeID = decisions_Info.decTypeID WHERE (decision_Types.decTypeID = @Type)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList1" Name="Type" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
                </ContentTemplate>
            </igtab:Tab>
            <igtab:Tab Text="عرض القرارات">
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
                                        onclick='window.open(&#039;../DecisionsData/<%#Eval("decisionFile")%>&#039;)'>
                                    <%#Eval("decisionFile")%></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </ContentTemplate>
            </igtab:Tab>
        </Tabs>
        <RoundedImage FillStyle="LeftMergedWithCenter" NormalImage="ig_tab_blueb1.gif" 
            SelectedImage="ig_tab_blueb2.gif" />
        <DefaultTabStyle BackColor="White" Height="20px">
        </DefaultTabStyle>
    </igtab:UltraWebTab>
    <asp:SqlDataSource ID="decsds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decKeywords, decisions_Info.decisionFile, decisions_Info.decTypeID, decisions_Info.decDate, decision_Types.decType FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID">
    </asp:SqlDataSource>
    </div>
</asp:Content>

