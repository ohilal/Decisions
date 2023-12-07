<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editdetails.aspx.cs" Inherits="Members_editdetails" Title="تعديل الدراسات" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="decID" DataSourceID="SqlDataSource1" Height="50px" 
        Width="95%" onitemupdating="DetailsView1_ItemUpdating" 
        onitemcreated="DetailsView1_ItemCreated" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal">
        <Fields>
            <asp:BoundField DataField="decNo" HeaderText="decNo" 
                SortExpression="decNo" />
            <asp:BoundField DataField="decTitle" HeaderText="العنوان" SortExpression="decTitle" ItemStyle-CssClass="form-control col-6" >
<ItemStyle CssClass="form-control col-6"></ItemStyle>
            </asp:BoundField>
            <asp:TemplateField HeaderText="تاريخ القرار" SortExpression="decDate">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" CssClass="form-control col-6"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decDate", "{0:dd/MMM/yyyy}") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("decDate", "{0:dd/MMM/yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الملف" SortExpression="decisionFile">
                <EditItemTemplate>
                    <asp:FileUpload ID="uploadDecesion" runat="server" CssClass="form-control col-6"    />
                    <%--<asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("decisionFile") %>'></asp:TextBox>--%>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("decisionFile") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("decisionFile") %>'></asp:Label>
                    
                     <a href="#" onclick="window.open('../../DecisionsData/<%#Eval("decisionFile")%>')"><i class="far fa-file-pdf fa-2x text-info"></i></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الكلمات الدالة" SortExpression="decKeywords">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("decKeywords") %>' TextMode="MultiLine" CssClass="form-control col-6"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("decKeywords") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("decKeywords") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="decID" HeaderText="decID" InsertVisible="False" ReadOnly="True" SortExpression="decID" Visible="False" />
            <asp:BoundField DataField="decsubjectNo" HeaderText="عدد مواد القرار" SortExpression="decsubjectNo"  ControlStyle-CssClass="form-control col-6" />
            <asp:TemplateField HeaderText="نوع القرار" SortExpression="decType" ControlStyle-CssClass="form-control col-6">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddEditType" runat="server"   DataSourceID="sdsType"
                        DataTextField="decType" DataValueField="decTypeID" 
                        SelectedValue='<%# Bind("decTypeID") %>' CssClass="form-control  dropdown col-8">
                    </asp:DropDownList>


                    <%--<asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("decType") %>'></asp:TextBox>--%>
               </EditItemTemplate>
                               <%-- <EditItemTemplate>
                    <asp:DropDownList ID="ddEditlLang" runat="server" DataSourceID="sdsEditLang" 
                        DataTextField="langName" DataValueField="langId" Height="17px" 
                        SelectedValue='<%# Bind("langId") %>' Width="108px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsEditLang" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT [langName], [langId] FROM [Lang_Lockup]">
                    </asp:SqlDataSource>
                </EditItemTemplate>--%>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("decType") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("decType") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-info" EditText="تعديل" CancelText="إلغاء التعديل">
<ControlStyle CssClass="btn btn-info"></ControlStyle>
            </asp:CommandField>
        </Fields>
        <AlternatingRowStyle BackColor="#ffffff" ForeColor="black" />
        <EditRowStyle  CssClass="table-striped" BackColor="#cac7c7" Font-Bold="True" ForeColor="#F7F7F7" />
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E3e3e3" ForeColor="#4A3C8C" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decDate, decisions_Info.decisionFile, decisions_Info.decKeywords, decisions_Info.decID, decisions_Info.decsubjectNo, decision_Types.decType, decisions_Info.decTypeID FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID WHERE (decisions_Info.decID = @decID)" 
        UpdateCommand="updateDec" UpdateCommandType="StoredProcedure" 
        onupdating="SqlDataSource1_Updating">
        <SelectParameters>
            <asp:QueryStringParameter Name="decID" QueryStringField="decID"  />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:QueryStringParameter Name="ddd" QueryStringField="decID" Type="Int32" />
            <asp:Parameter Name="decNO" Type="Int32" />
            <asp:Parameter Name="decTitle" Type="String" />
            <asp:Parameter Name="decKeywords" Type="String" />
            <asp:Parameter Name="decisionFile" Type="String" />
            <asp:Parameter Name="decTypeId" Type="Int32" />
            <asp:Parameter Name="decDate" Type="DateTime" />
            <asp:Parameter Name="decSubjectNo" Type="Int32" />
            <asp:Parameter Name="aspuser" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
                     <asp:SqlDataSource ID="sdsType" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                         SelectCommand="SELECT [decTypeID], [decType] FROM [decision_Types]"></asp:SqlDataSource>
   <br />
   <br />
    <asp:Button ID="Button1" runat="server" Text="عودة إلى صفحة التعديل" 
        PostBackUrl="~/Members/membersdataresult.aspx" CssClass="btn btn-secondary btn-group-lg" />
    <asp:Button ID="Button2" runat="server" Text="عودة إلى البحث برقم القرار" CssClass="btn btn-secondary btn-group-lg" PostBackUrl="~/Members/membersdecNosearch.aspx" />
</asp:Content>

