<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editInstruction.aspx.cs" Inherits="Members_editInstruction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" Height="50px"  AutoGenerateRows="False" DataKeyNames="ID" DataSourceID="SqlDataSource1"  CssClass="col-lg-8 col-sm-12" onitemupdating="DetailsView1_ItemUpdating" 
        onitemcreated="DetailsView1_ItemCreated" BackColor="White" BorderColor="#E7E7FF" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Horizontal" HeaderStyle-Width="30%">
        <Fields>
            <asp:TemplateField HeaderText="العنوان" SortExpression="title">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("title") %>' CssClass="form-control"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("title") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاريخ القرار" SortExpression="insDate">
                <EditItemTemplate>
                     <asp:Label ID="Label1" runat="server" Text='<%# Bind("insDate","{0:dd-MM-yyyy}") %>' CssClass="text-light small" ></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control col-6" Text='<%# Bind("insDate") %>' TextMode="Date"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("insDate") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("insDate","{0:dd-MM-yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الملف" SortExpression="insFile">
                <EditItemTemplate>
                     <asp:Label ID="LabelUpload" runat="server" Text='<%# Eval("insFile") %>' CssClass="text-light small"></asp:Label>  
  <asp:FileUpload ID="uploadTemp" runat="server" CssClass="form-control"  />
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("insFile") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>  
                   <%--  <a href="#" onclick="window.open('../../InstructionData/<%#Eval("insFile")%>')" >--%>
                  <a href="#" onclick="window.open('/InstructionData/<%#Eval("insFile")%>')" >
                      <asp:Label ID="Label2" runat="server" Text='<%# Bind("insFile") %>'></asp:Label>
                      <i class="far fa-file-pdf fa-2x text-info"></i></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الكلمات الدالة" SortExpression="insKeywords">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("insKeywords") %>' TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
                  
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("insKeywords") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("insKeywords") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="aspUser" HeaderText="aspUser" SortExpression="aspUser" Visible="False" />
            <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False" />
               <asp:CommandField ShowEditButton="True" ButtonType="Button" CancelText="إلغاء التعديل" EditText="تعديل" UpdateText="تعديل البيانات" >
            <ControlStyle CssClass="btn btn-secondary" />
            </asp:CommandField>
        </Fields>
         <AlternatingRowStyle BackColor="#ffffff" ForeColor="black" />
        <EditRowStyle  CssClass="table-striped" BackColor="#cac7c7" Font-Bold="True" ForeColor="#000" /> 
        <FooterStyle BackColor="#B5C7DE" ForeColor="#4A3C8C" />
        <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#F7F7F7" Width="30%" CssClass="col-lg-2 col-sm-6" />
        <PagerStyle BackColor="#E7E7FF" ForeColor="#4A3C8C" HorizontalAlign="Right" />
        <RowStyle BackColor="#E3e3e3" ForeColor="#4A3C8C"  />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="SELECT title, insDate, insFile, insKeywords, aspUser, ID FROM InstructionsData WHERE (ID = @ID)" 
        UpdateCommand="updateInstruction" 
        UpdateCommandType="StoredProcedure"
        onupdating="SqlDataSource1_Updating">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID"  />
        </SelectParameters>
        <UpdateParameters>
          <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
            <asp:QueryStringParameter Name="nID" QueryStringField="ID" Type="Int32" />
            <asp:Parameter Name="title" Type="String" />
            <asp:Parameter DbType="Date" Name="insDate" />
            <asp:Parameter Name="insFile" Type="String" />
            <asp:Parameter Name="insKeywords" Type="String" />
            <asp:Parameter Name="aspUser" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

