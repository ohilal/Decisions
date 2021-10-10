<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="membersdataresult.aspx.cs" Inherits="Members_membersdataresult" Title="عرض لتعديل الدراسة" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    
    <h3>البحث فى الدراسات بالعنوان أو بالكلمات الدالة</h3>
    <asp:TextBox ID="TextBox2" runat="server" Width="350"></asp:TextBox>&nbsp;
    <asp:Button ID="Button1"
        runat="server" Text="بحـث" />
    <asp:GridView ID="grdSearch" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="decID" DataSourceID="sdsSearch" 
        onrowdatabound="grdSearch_RowDataBound" AllowPaging="True" AllowSorting="True" CssClass="table table-bordered table-hover table-striped">
        <Columns>
            <asp:BoundField DataField="decID" HeaderText="decID" InsertVisible="False" 
                ReadOnly="True" SortExpression="decID" Visible="False" />
            <asp:BoundField DataField="decNo" HeaderText="رقم القرار" 
                SortExpression="decNo" />
            <asp:BoundField DataField="decTitle" HeaderText="عنوان القرار" 
                SortExpression="decTitle" />
            <asp:BoundField DataField="decDate" 
                HeaderText="تاريخ القرار" SortExpression="decDate" DataFormatString="{0:dd-MMM-yyyy}"  />
            <asp:BoundField DataField="decisionFile" HeaderText="الملف" SortExpression="decisionFile" Visible="False" />
            <asp:BoundField DataField="decType" HeaderText="نوع القرار" ReadOnly="True" SortExpression="decType" />

  <asp:HyperLinkField DataNavigateUrlFields="decID" 
                DataNavigateUrlFormatString="editdetails.aspx?decID={0}" HeaderText="التفاصيل " 
                Text="اظهر التفاصيل "  ControlStyle-CssClass="btn btn-secondary" >
<ControlStyle CssClass="btn btn-secondary"></ControlStyle>
            </asp:HyperLinkField>
            <%--<asp:CommandField ShowDeleteButton="True"  ButtonType="Button" ControlStyle-CssClass="btn btn-danger" DeleteText="حذف" >


<ControlStyle CssClass="btn btn-danger"></ControlStyle>
            </asp:CommandField>--%>
 <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnDel" runat="server" CausesValidation="False" CommandName="Delete"  Text=" حذف" OnClick="btnDel_Click" OnClientClick="return confirm('هل انت متأكد من المسح؟');"/>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:TemplateField>
        </Columns>
       
    </asp:GridView>
  
    <asp:SqlDataSource ID="sdsSearch" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="decKeywords" SelectCommandType="StoredProcedure" 
        DeleteCommand="DELETE FROM decisions_Info WHERE (decID = @decID)">
        <DeleteParameters>
            <asp:ControlParameter ControlID="grdSearch" Name="decID" 
                PropertyName="SelectedValue" />
        </DeleteParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox2" Name="searchword" 
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
  <br />
  <h3 class="text-info">عرض كل القرارات</h3>
  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" 
        AllowSorting="True" onrowdatabound="GridView1_RowDataBound" DataKeyNames="decID" CssClass="table table-striped table-bordered table-hover ">
        <HeaderStyle CssClass="table-secondary" />
        <PagerSettings Mode="NumericFirstLast" />
        <Columns>

            
            <asp:BoundField DataField="decTitle" HeaderText="العنوان" 
                SortExpression="decTitle" />
            <asp:BoundField DataField="decNo" HeaderText="رقم القرار" SortExpression="decNo" ItemStyle-CssClass="tdTiny" HeaderStyle-CssClass="tdTiny">

            
<HeaderStyle CssClass="tdTiny"></HeaderStyle>

<ItemStyle CssClass="tdTiny"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="decKeywords" HeaderText="الكلمات الدالة" 
                SortExpression="decKeywords" />
            <asp:BoundField DataField="decisionFile" HeaderText="الملف" 
                SortExpression="decisionFile" />
            <asp:BoundField DataField="decDate" HeaderText="تاريخ القرار" 
                SortExpression="decDate" DataFormatString="{0:dd/MMM/yyyy}" />
            <asp:BoundField DataField="decsubjectNo" HeaderText="عدد مواد القرار" SortExpression="decsubjectNo" />
            <asp:BoundField DataField="decType" HeaderText="نوع القرار" SortExpression="decType" />
            <asp:HyperLinkField DataNavigateUrlFields="decID" 
                DataNavigateUrlFormatString="editdetails.aspx?decID={0}" HeaderText="التفاصيل " 
                Text="اظهر التفاصيل " ControlStyle-CssClass="btn btn-secondary"  >
<ControlStyle CssClass="btn btn-secondary"></ControlStyle>
            </asp:HyperLinkField>
            <asp:CommandField ShowDeleteButton="True" ButtonType="Button" ControlStyle-CssClass="btn btn-danger" DeleteText="حذف" >
<ControlStyle CssClass="btn btn-danger"></ControlStyle>
            </asp:CommandField>
        </Columns>
        <PagerStyle CssClass="cssPager pagination" />
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
        
        SelectCommand="SELECT decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decKeywords, decisions_Info.decisionFile, decisions_Info.decDate, decisions_Info.decsubjectNo, decision_Types.decType, decisions_Info.decID FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID ORDER BY decisions_Info.decDate DESC" 
        UpdateCommand="updatedata" UpdateCommandType="StoredProcedure" 
        DeleteCommand="DELETE FROM decisions_Info WHERE (decID = @decID)">
        <DeleteParameters>
            <asp:Parameter Name="decID" />
        </DeleteParameters>
        <UpdateParameters>
            <asp:QueryStringParameter Name="dID" QueryStringField="decID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Summury" Type="String" />
            <asp:Parameter DbType="Date" Name="Date" />
            <asp:Parameter Name="activityCode" Type="Int32" />
            <asp:Parameter Name="BranchID" Type="Int32" />
            <asp:Parameter Name="Keywords" Type="String" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>

