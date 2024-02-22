<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="decdetails.aspx.cs" Inherits="details" Title="نتائج البحث تفصيليا" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-right:10px;">
        <h2 class="text-info text-center">تفاصيل القرار</h2>
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="detailssds"   DataKeyNames="decID" HorizontalAlign="Justify" CssClass="table table-striped table-responsive-sm" > 
         
        <Fields>
            <asp:BoundField DataField="decNo" HeaderText="رقم القرار" 
                SortExpression="decNo" ItemStyle-Width="85%" >
           
<ItemStyle Width="85%"></ItemStyle>
           
            </asp:BoundField>
           
            <asp:BoundField DataField="decTitle" HeaderText="العنوان" 
                SortExpression="decTitle" >
            </asp:BoundField>
            <asp:BoundField DataField="decDate" HeaderText="تاريخ القرار" 
                SortExpression="decDate" DataFormatString="{0:dd/MM/yyyy}"  />
            <asp:TemplateField HeaderText="الملف" SortExpression="decisionFile">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decisionFile") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decisionFile") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("decisionFile") %>'></asp:Label>--%>
                     <a href="#" onclick='window.open(&#039;../DecisionsData/<%#Eval("decisionFile")%>&#039;)'>
                         <i class="far fa-file-pdf fa-3x text-info"></i>
                            <%--<img src="Images/pdf_logo_trefoil.gif" style="border-style: none;" alt="فتح الملف" /></a>--%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="decKeywords" HeaderText="الكلمات الدالة" 
                SortExpression="decKeywords" />
            <asp:BoundField DataField="decID" HeaderText="decID" 
                SortExpression="decID" InsertVisible="False" ReadOnly="True" Visible="False" />
            <asp:BoundField DataField="decsubjectNo" HeaderText="عدد مواد القرار" 
                SortExpression="decsubjectNo" />
            <asp:BoundField DataField="typename" HeaderText="typename" ReadOnly="True" SortExpression="typename" Visible="False" />
            <asp:BoundField DataField="decType" HeaderText="نوع القرار" SortExpression="decType" />
        </Fields>
        <HeaderStyle HorizontalAlign="Right" Wrap="True" />

       <%-- <cc1:PopupControlExtender ID="PopupControlExtender1" runat="server" Position="Center" >
        </cc1:PopupControlExtender>--%>
    </asp:DetailsView>
    <br />
    <asp:SqlDataSource ID="detailssds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
            SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decDate, decisions_Info.decisionFile, decisions_Info.decKeywords, decisions_Info.decID, decisions_Info.decsubjectNo, decision_Types.decType FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID WHERE (decisions_Info.decID = @decID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="decID" QueryStringField="decID" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
    </asp:Content>

