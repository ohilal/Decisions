<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" Title="أحدث القرارات" EnableEventValidation="false" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .search_textbox, .date {
            width: 90%;
            font-size: .8em;
        }

        .date {
            cursor: pointer;
        }


        ::-webkit-input-placeholder {
            color: silver;
        }

        .search_textbox:-moz-placeholder {
            color: silver;
        }

        ::-moz-placeholder {
            color: silver;
        }

        :-ms-input-placeholder {
            color: silver;
        }

        :-moz-placeholder {
            color: red;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h1 class="text-center text-info">أحدث ما  تم نشره </h1>
                <asp:SqlDataSource ID="countsds" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    SelectCommand="SELECT TOP(20) decisions_Info.decID, decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decisionFile, decision_Types.decType, CONVERT(varchar, decisions_Info.decDate, 103) AS date, decisions_Info.decsubjectNo FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID ORDER BY decisions_Info.decDate DESC">
                </asp:SqlDataSource>
          <div> 

              
<asp:GridView ID="gdvTotal" runat="server" AutoGenerateColumns="False" 
                    EnableTheming="False" CellPadding="4" ForeColor="Black" 
                    GridLines="None" AllowPaging="True" AllowSorting="True" Width="80%" 
    CssClass="table table-bordered table-striped table-hover table-responsive" 
    ClientIDMode="Static" 
    OnSelectedIndexChanged="gdvTotal_SelectedIndexChanged" 
   OnSorting="gdvTotal_Sorting" 
    OnPageIndexChanging="gdvTotal_PageIndexChanging" 
    DataKeyNames="decID" OnRowDataBound="gdvTotal_RowDataBound">
                    <RowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="decNo" HeaderText="رقم القرار" SortExpression="decNo"/>                           
                        <asp:BoundField DataField="decTitle" HeaderText="القرار" SortExpression="decTitle"  />
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
    
                    <EmptyDataTemplate>
                        <div class="alert-info text-center align-items-center ">
                        لا توجد قرارات بتاريخ اليوم.
                    </div></EmptyDataTemplate>
    
                    <FooterStyle BackColor="#CCCCCC" CssClass="pagination-lg" />
                <HeaderStyle CssClass="table-secondary"></HeaderStyle>
                <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" CssClass=" cssPager pagination-lg" Font-Bold="True" Font-Size="Medium" />
                </asp:GridView> 
</div>
                <br />
				
	   <script>
               
             $(document).ready(function () {
                    $('#<%=gdvTotal.ClientID%>').dataTable();
                });
            </script>
    
</asp:Content>

