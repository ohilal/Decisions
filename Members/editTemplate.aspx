<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editTemplate.aspx.cs" Inherits="Members_editdetails" Title="تعديل الدراسات" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="TemplateID" DataSourceID="SqlDataSource1" Height="50px" 
        Width="95%" onitemupdating="DetailsView1_ItemUpdating" 
        onitemcreated="DetailsView1_ItemCreated" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HeaderStyle-Width="30%">
        <Fields>
            <asp:BoundField DataField="TemplateName" HeaderText="عنوان النموذج/ القانون" 
                SortExpression="TemplateName" />
            <asp:TemplateField HeaderText="مسار الملف" SortExpression="TemplatePath">
                <EditItemTemplate> 
                    <asp:Label ID="LabelUpload" runat="server" Text='<%# Eval("TemplatePath") %>'></asp:Label> 
                        <br />
                     <asp:FileUpload ID="uploadTemp" runat="server" CssClass="form-control col-6"    />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TemplatePath") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                         <a href="#" onclick="window.open('../UploadedDecisions/<%#Eval("TemplatePath")%>')"><i class="far fa-file-pdf fa-2x text-info"></i></a>
                </ItemTemplate>
                <ItemStyle CssClass="form-control col-6" />
            </asp:TemplateField>
            <asp:TemplateField HeaderText="النوع" InsertVisible="False" SortExpression="typeID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddlType" runat="server" DataSourceID="sdsType" DataTextField="GuideTypeName" DataValueField="GuideTypeID" CssClass="form-control  dropdown col-8" SelectedValue='<%# Bind("typeID") %>' >
                    </asp:DropDownList>
                   <%-- <asp:Label ID="Label1" runat="server" Text='<%# Eval("GuideTypeName") %>'></asp:Label>--%>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("typeID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ButtonType="Button" CancelText="إلغاء التعديل" EditText="تعديل" UpdateText="تحديث البيانات" ShowDeleteButton="True" DeleteText="مسح">
            <ControlStyle CssClass="btn btn-lg btn-secondary" />
            </asp:CommandField>
        </Fields>
        <AlternatingRowStyle BackColor="#ffffff" ForeColor="black" />
        <EditRowStyle  CssClass="table-striped" BackColor="#cac7c7" Font-Bold="True" ForeColor="#F7F7F7" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" Width="30%" CssClass="col-lg-2 col-sm-6" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E3e3e3" ForeColor="#4A3C8C"  />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>"        
        SelectCommand="SELECT Templates.TemplateName, Templates.TemplatePath, Templates.typeID, GuideTypes.GuideTypeName, Templates.TemplateID FROM GuideTypes INNER JOIN Templates ON GuideTypes.GuideTypeID = Templates.typeID WHERE (Templates.TemplateID = @ID)" 
        UpdateCommand="updateTemp" UpdateCommandType="StoredProcedure" 
        onupdating="SqlDataSource1_Updating" DeleteCommand="DELETE FROM Templates WHERE (TemplateID = @TemplateID)">
        <DeleteParameters>
			<asp:Parameter Name="TemplateID" />
		</DeleteParameters>
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID"  />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
            <asp:Parameter Name="TemplateName" Type="String" />
            <asp:Parameter Name="tempPath" Type="String" />
            <asp:Parameter Name="typeID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<asp:SqlDataSource ID="sdsType" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT GuideTypeName, GuideTypeID FROM GuideTypes WHERE (GuideTypeID &gt; 3)"></asp:SqlDataSource>
   <br />
   <br />
    <asp:Button ID="Button1" runat="server" Text="عودة إلى صفحة التعديل" 
        PostBackUrl="~/Members/InsertTemplate.aspx" />
</asp:Content>

