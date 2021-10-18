<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="searchData" Title="البحث عن دراسة" EnableEventValidation="false" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h1 class="text-center text-info">ما تم نشره اليوم </h1>
                <asp:SqlDataSource ID="countsds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decisionFile, decision_Types.decType, CONVERT (varchar, decisions_Info.decDate, 103) AS date, decisions_Info.decsubjectNo FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID WHERE (CONVERT (date, decisions_Info.decDate, 101) = CONVERT (date, GETDATE(), 101))">
                </asp:SqlDataSource>
                  
<asp:GridView ID="gdvTotal" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="countsds" 
                    EnableTheming="False" CellPadding="4" ForeColor="Black" 
                    GridLines="None" AllowPaging="True" AllowSorting="True" EnableModelValidation="True" CssClass="table table-bordered table-striped table-hover">
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="decNo" HeaderText="رقم القرار" SortExpression="decNo"/>                           
                        <asp:BoundField DataField="decTitle" 
                            HeaderText="القرار" SortExpression="decTitle"  />
                        <asp:BoundField DataField="decType" HeaderText="نوع القرار" SortExpression="decType" />
                        <asp:BoundField DataField="date" HeaderText="التاريخ" ReadOnly="True" SortExpression="date" />
                        <asp:BoundField DataField="decsubjectNo" HeaderText="عدد مواد القرار" SortExpression="decsubjectNo" />
                        <asp:TemplateField HeaderText="ملف القرار" SortExpression="decisionFile">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("decisionFile") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <ItemTemplate>
                    <a href="#" onclick="window.open('UploadedDecisions/<%#Eval("decisionFile")%>')" ><i class="far fa-file-pdf fa-2x text-info" title="فتح الملف"></i></a>
                </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
    
                    <FooterStyle BackColor="#CCCCCC" CssClass="pagination-lg" />
                <HeaderStyle CssClass="table-secondary"></HeaderStyle>
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" CssClass=" cssPager pagination-lg" Font-Bold="True" Font-Size="Medium" />
                </asp:GridView> 

                <br />
				&nbsp; &nbsp; 


</asp:Content>

