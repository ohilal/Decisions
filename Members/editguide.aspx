<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editguide.aspx.cs" Inherits="Members_editdetails" Title="تعديل الدراسات" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="ID" DataSourceID="SqlDataSource2" Height="50px" 
        Width="95%" onitemupdating="DetailsView1_ItemUpdating" 
        onitemcreated="DetailsView1_ItemCreated" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HeaderStyle-Width="30%">
        <Fields>
            <asp:BoundField DataField="Title" HeaderText="عنوان الدليل" 
                SortExpression="Title" />
            <asp:TemplateField HeaderText="مسار الملف" SortExpression="guideFileExt">
                <EditItemTemplate> 
                    <asp:Label ID="LabelUpload" runat="server" Text='<%# Eval("guideFileExt") %>'></asp:Label> 
                        <br />
                     <asp:FileUpload ID="uploadTemp" runat="server" CssClass="form-control col-6"    />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("guideFileExt") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                         <a href="#" onclick="window.open('../UploadedDecisions/<%#Eval("guideFileExt")%>')"><i class="far fa-file-pdf fa-2x text-info"></i></a>
                </ItemTemplate>
                <ItemStyle CssClass="form-control col-6" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="النوع" InsertVisible="False" SortExpression="guideType">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlType" runat="server" DataSourceID="sdsType" DataTextField="GuideTypeName" DataValueField="GuideTypeID" CssClass="form-control  dropdown col-8" SelectedValue='<%# Bind("guideType") %>' >
                    </asp:DropDownList>
                   <%-- <asp:Label ID="Label1" runat="server" Text='<%# Eval("GuideTypeName") %>'></asp:Label>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("GuideTypeName") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ButtonType="Button" CancelText="إلغاء التعديل" EditText="تعديل" UpdateText="تحديث البيانات" >
            <ControlStyle CssClass="btn btn-lg btn-secondary" />
            </asp:CommandField>
            <asp:TemplateField HeaderText="InsertDate" SortExpression="InsertDate">
				<EditItemTemplate>
					<asp:TextBox ID="TextBox1" runat="server" TextMode="Date" Text='<%# Bind("InsertDate") %>'></asp:TextBox>
				</EditItemTemplate>
				<InsertItemTemplate>
					<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("InsertDate") %>'></asp:TextBox>
				</InsertItemTemplate>
				<ItemTemplate>
					<asp:Label ID="Label1" runat="server" Text='<%# Bind("InsertDate") %>'></asp:Label>
				</ItemTemplate>
			</asp:TemplateField>
        </Fields>
        <AlternatingRowStyle BackColor="#ffffff" ForeColor="black" />
        <EditRowStyle  CssClass="table-striped" BackColor="#cac7c7" Font-Bold="True" ForeColor="#F7F7F7" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" Width="30%" CssClass="col-lg-2 col-sm-6" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E3e3e3" ForeColor="#4A3C8C"  />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT GuideTypes.GuideTypeName, guidebook.ID, guidebook.Title, guidebook.guideType, guidebook.InsertDate, guidebook.guideFileExt FROM guidebook INNER JOIN GuideTypes ON guidebook.guideType = GuideTypes.GuideTypeID WHERE (guidebook.ID = @ID)" UpdateCommand="updateGuide" UpdateCommandType="StoredProcedure">
		<SelectParameters>
			<asp:QueryStringParameter Name="ID" QueryStringField="ID" />
		</SelectParameters>
		<UpdateParameters>
			<asp:Parameter Name="ID" Type="Int32" />
			<asp:Parameter Name="Title" Type="String" />
			<asp:Parameter Name="guideFileExt" Type="String" />
			<asp:Parameter Name="guideType" Type="Int32" />
			<asp:Parameter DbType="Date" Name="InsertDate" />
		</UpdateParameters>
	</asp:SqlDataSource>
<asp:SqlDataSource ID="sdsType" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT GuideTypeName, GuideTypeID FROM GuideTypes WHERE (GuideTypeID &lt; 4)"></asp:SqlDataSource>
   <br />
   <br />
    <asp:Button ID="Button1" runat="server" Text="عودة إلى صفحة التعديل" 
        PostBackUrl="~/Members/insertGuide.aspx" />
</asp:Content>

