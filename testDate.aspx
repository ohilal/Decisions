<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="testDate.aspx.cs" Inherits="testDate" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<%@ Register assembly="Infragistics2.WebUI.UltraWebNavigator.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.UltraWebNavigator" tagprefix="ignav" %>

<%@ Register assembly="Infragistics2.WebUI.UltraWebListbar.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.UltraWebListbar" tagprefix="iglbar" %>
<%@ Register assembly="Infragistics2.WebUI.Misc.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.Misc" tagprefix="igmisc" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript" id="igClientScript">
<!--

function WebPanel1_ExpandedStateChanged(oWebPanel, oEvent){
	//Add code to handle your event here.
}
// -->
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="rtlDirection">
                    <asp:TextBox ID="TextBox2" runat="server" Width="350px"></asp:TextBox>
 
                    <cc1:CalendarExtender ID="TextBox2_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox2">
                    </cc1:CalendarExtender>
 
                    &nbsp;<asp:Button ID="btnDate" runat="server" Text="عرض القرار" />
                    <ignav:UltraWebMenu ID="UltraWebMenu1" runat="server" JavaScriptFilename="" 
                        JavaScriptFileNameCommon="" LeafItemImageUrl="" ParentItemImageUrl="" 
                        StyleSetName="">
<ExpandEffects ShadowColor="LightGray"></ExpandEffects>

<MenuClientSideEvents InitializeMenu="" ItemChecked="" ItemClick="" SubMenuDisplay="" ItemHover=""></MenuClientSideEvents>
                    </ignav:UltraWebMenu>
                    <ignav:UltraWebMenu ID="UltraWebMenu2" runat="server" BackColor="White" 
                        BorderColor="#E0E0E0" BorderStyle="Solid" BorderWidth="1px" DisabledClass="" 
                        FileUrl="" ForeColor="Black" ItemPaddingSubMenus="0" ItemPaddingTop="0" 
                        ItemSpacingSubMenus="1" ItemSpacingTop="0" JavaScriptFilename="" 
                        JavaScriptFileNameCommon="" LeafItemImageUrl="/ig_common/images/LeafImage.bmp" 
                        ParentItemImageUrl="/ig_common/images/LeafImage.bmp" SeparatorClass="" 
                        StyleSetName="" TargetFrame="" TargetUrl="" TopItemSpacing="Compact" 
                        TopSelectedClass="">
                        <Styles>
                            <ignav:Style BackColor="#303030" CssClass="TopHover" ForeColor="White">
                                <Margin Bottom="0px" Left="0px" Right="0px" Top="0px" />
                                <BorderDetails ColorBottom="255, 128, 0" ColorLeft="255, 128, 0" 
                                    ColorRight="255, 128, 0" ColorTop="255, 128, 0" StyleBottom="Solid" 
                                    StyleLeft="Solid" StyleRight="Solid" StyleTop="Solid" WidthBottom="1px" 
                                    WidthLeft="2px" WidthRight="1px" WidthTop="1px" />
                            </ignav:Style>
                        </Styles>
                        <IslandStyle BackColor="Black" BorderColor="#FF8000" BorderStyle="Solid" 
                            BorderWidth="1px" Cursor="Hand" Font-Names="Verdana" Font-Size="8pt" 
                            ForeColor="Silver">
                        </IslandStyle>
                        <HoverItemStyle BackColor="#303030" Cursor="Hand" ForeColor="White">
                        </HoverItemStyle>
                        <Images>
                            <ScrollTopDisabledImage Url="ig_menu_scrollup_disabled.gif" />
                            <ScrollBottomDisabledImage Url="ig_menu_scrolldown_disabled.gif" />
                            <LeafItemImage Url="/ig_common/images/LeafImage.bmp" />
                            <BackgroundImage Url="/ig_common/images/bg_navigation.jpg" />
                            <ParentItemImage Url="/ig_common/images/LeafImage.bmp" />
                            <SubMenuImage Url="igNone" />
                            <TopLevelItemImage Url="/ig_common/images/RootLeafImage.gif" />
                            <ScrollBottomImage Url="ig_menu_scrolldown.gif" />
                            <ScrollTopImage Url="ig_menu_scrollup.gif" />
                            <XPSpacerImage Width="1px" />
                        </Images>
                        <ItemStyle Font-Size="9pt" />
                        <TopLevelLeafItemStyle Cursor="Default" Font-Bold="True" Font-Size="8pt" 
                            Height="25px">
                            <Margin Bottom="1px" Left="2px" Right="1px" Top="1px" />
                        </TopLevelLeafItemStyle>
                        <DisabledStyle ForeColor="LightGray">
                        </DisabledStyle>
                        <SeparatorStyle BackgroundImage="ig_menuSep.gif" CssClass="SeparatorClass" 
                            CustomRules="background-repeat:repeat-x; " />
<ExpandEffects ShadowColor="LightGray" delay="100" removaldelay="500" type="Slide"></ExpandEffects>

<MenuClientSideEvents InitializeMenu="" ItemChecked="" ItemClick="" SubMenuDisplay="" ItemHover=""></MenuClientSideEvents>

                        <TopLevelParentItemStyle Font-Size="8pt" Height="22px">
                            <Margin Bottom="1px" Left="2px" Right="1px" Top="1px" />
                        </TopLevelParentItemStyle>
                        <LeafItemStyle BackColor="#303030" Cursor="Default" Font-Size="8pt" 
                            ForeColor="#B0B0B0" Height="24px">
                        </LeafItemStyle>
                    </ignav:UltraWebMenu>
                    <igmisc:WebPanel ID="WebPanel1" runat="server" BackColor="White" 
                        StyleSetName="">
                        <PanelStyle BorderWidth="1px" BorderStyle="Solid">
                            <Padding Top="5px" Left="5px" Right="5px" Bottom="5px">
                            </Padding>
                            <BorderDetails ColorLeft="158, 190, 245" ColorTop="0, 45, 150" ColorRight="0, 45, 150" ColorBottom="0, 45, 150">
                            </BorderDetails>
                        </PanelStyle>
                        <ClientSideEvents ExpandedStateChanged="WebPanel1_ExpandedStateChanged" />
                        <Header TextAlignment="Left" Text="menu 1">
                            <ExpandedAppearance>
                                <Styles BackgroundImage="igpnl_office2k3.png" BorderWidth="1px" BorderStyle="Solid" Font-Names="Times New Roman" Font-Size="9pt">
                                    <Padding Top="1px" Left="4px" Bottom="1px">
                                    </Padding>
                                    <BorderDetails ColorLeft="158, 190, 245" ColorTop="158, 190, 245" ColorRight="0, 45, 150" WidthBottom="0px">
                                    </BorderDetails>
                                </Styles>
                            </ExpandedAppearance>
                            <ExpansionIndicator Height="0px" Width="0px">
                            </ExpansionIndicator>
                        </Header>
                        <Template>
                            inner1<br />
                            inner 2
                        </Template>
                    </igmisc:WebPanel>
                    <igmisc:WebPanel ID="WebPanel2" runat="server" Expanded="False">
                    <Header Text="Menu 2"></Header>
                    <Template><a href="Decresults.aspx">decisionsmain</a></Template>
                    <Template><a href="Default.aspx">main</a></Template>
                    </igmisc:WebPanel>
                    <asp:Menu ID="Menu1" runat="server" BackColor="#E3EAEB" 
                        DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" 
                        ForeColor="#666666" StaticSubMenuIndent="10px">
                        <StaticSelectedStyle BackColor="#1C5E55" />
                        <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <DynamicHoverStyle BackColor="#666666" ForeColor="White" />
                        <DynamicMenuStyle BackColor="#E3EAEB" />
                        <DynamicItemTemplate>
<%# Eval("Text") %>
                        </DynamicItemTemplate>
                        <DynamicSelectedStyle BackColor="#1C5E55" />
                        <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                        <StaticHoverStyle BackColor="#666666" ForeColor="White" />
                    </asp:Menu>
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
                            <asp:ControlParameter ControlID="TextBox2" Name="Date" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    </div>
                    <br />
<%---------------------------------------------------------------------------------------%>
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
                       <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'> <%#Eval("decisionFile")%></a>
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
<%-- ------------------------------------------------------------------------------------------%> 
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
</asp:Content>

