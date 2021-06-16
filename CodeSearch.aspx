<%@ Page Title="البحث عن دراسة بكود أو مسمى النشاط" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CodeSearch.aspx.cs" Inherits="testMenu" EnableEventValidation="false" %>

<%@ Register Assembly="Infragistics2.WebUI.WebCombo.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.WebCombo" TagPrefix="igcmbo" %>

<%@ Register Assembly="Infragistics2.WebUI.UltraWebNavigator.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.UltraWebNavigator" TagPrefix="ignav" %>

<%@ Register assembly="Infragistics2.WebUI.UltraWebToolbar.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.UltraWebToolbar" tagprefix="igtbar" %>

<%@ Register assembly="System.Web, Version=2.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a" namespace="System.Web.UI" tagprefix="cc1" %>

<%@ Register assembly="Infragistics2.WebUI.UltraWebGrid.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb" namespace="Infragistics.WebUI.UltraWebGrid" tagprefix="igtbl" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="width:900px; direction:rtl;">
	   
        <%--<igcmbo:WebCombo ID="WebCombo1" runat="server" BackColor="White" 
            BorderColor="Silver" BorderStyle="Solid" BorderWidth="1px" 
            ComboTypeAhead="Suggest" DataSourceID="SqlDataSource1" Editable="True" 
            EnableXmlHTTP="True" ForeColor="Black" SelBackColor="DarkBlue" 
            SelForeColor="White" Version="4.00">
            <Columns>
                <igtbl:UltraGridColumn BaseColumnName="activityName" IsBound="True" 
                    Key="activityName">
                    <Header Caption="activityName">
                    </Header>
                </igtbl:UltraGridColumn>
                <igtbl:UltraGridColumn BaseColumnName="كود_النشاط" DataType="System.Double" 
                    IsBound="True" Key="كود_النشاط">
                    <Header Caption="كود_النشاط">
                        <RowLayoutColumnInfo OriginX="1" />
                    </Header>
                    <Footer>
                        <RowLayoutColumnInfo OriginX="1" />
                    </Footer>
                </igtbl:UltraGridColumn>
            </Columns>
            <ExpandEffects ShadowColor="LightGray" />
            <DropDownLayout BaseTableName="" BorderCollapse="Separate" 
                RowHeightDefault="20px" Version="4.00" XmlLoadOnDemandType="Accumulative">
                <FrameStyle BackColor="Silver" BorderStyle="Ridge" BorderWidth="2px" 
                    Cursor="Default" Font-Names="Verdana" Font-Size="10pt" Height="130px" 
                    Width="325px">
                </FrameStyle>
                <HeaderStyle BackColor="LightGray" BorderStyle="Solid">
                <BorderDetails ColorLeft="White" ColorTop="White" WidthLeft="1px" 
                    WidthTop="1px" />
                </HeaderStyle>
                <RowStyle BackColor="White" BorderColor="Gray" BorderStyle="Solid" 
                    BorderWidth="1px">
                <BorderDetails WidthLeft="0px" WidthTop="0px" />
                </RowStyle>
                <SelectedRowStyle BackColor="DarkBlue" ForeColor="White" />
            </DropDownLayout>
        </igcmbo:WebCombo>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
            SelectCommand="SELECT [activityName], ['activityCode'] AS كود_النشاط FROM [Activities]">
        </asp:SqlDataSource>--%>
        <h1>يمكنك البحث عن الدراسة بالكود أو مسمى النشاط
        </h1>
        <br /><asp:TextBox ID="txtCodeSearch" runat="server" Height="19px" Width="332px"></asp:TextBox>
        <cc1:AutoCompleteExtender ID="txtCodeSearch_AutoCompleteExtender" runat="server" 
            DelimiterCharacters="" Enabled="True" ServiceMethod="GetActivity" 
            ServicePath="autoComplete.asmx" TargetControlID="txtCodeSearch"
            CompletionSetCount="20" MinimumPrefixLength="2" CompletionInterval="500">
        </cc1:AutoCompleteExtender>
        &nbsp; &nbsp;<asp:Button ID="BtncodeSearch" runat="server" Text="بحث بالكود العربى" />
        <br />
         
        <%--<asp:Label ID="lblactCode" runat="server"></asp:Label>--%>
        <br />
        <p><b>ملحوظة: </b>يمكن ترتيب الدراسات بالضغط علي عنوان التصنيف .    </p>
        <br />
    </div>
    <asp:GridView ID="grdCode" runat="server" DataSourceID="sdsCode" 
        AutoGenerateColumns="False" DataKeyNames="dID" AllowPaging="True" 
        AllowSorting="True" PageSize="20" >
        
        <PagerSettings Mode="NumericFirstLast" />
        <Columns>
            <asp:BoundField DataField="dID" HeaderText="dID" InsertVisible="False" 
                ReadOnly="True" SortExpression="dID" Visible="False" />
            <asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                SortExpression="Title" />
            <asp:BoundField DataField="Date" DataFormatString="{0: MMMM yyyy}" 
                HeaderText="تاريخ الإصدار" SortExpression="Date" />
            <asp:BoundField DataField="BranchName" HeaderText="الجهة المختصة بالدراسة" 
                SortExpression="BranchName" />
            <asp:BoundField DataField="activityCode" HeaderText="كود النشاط" 
                SortExpression="activityCode" />
            <asp:TemplateField HeaderText="الملف" SortExpression="Filepath">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><img src="Images/pdf_logo_trefoil.gif" style="border-style:none;" alt="فتح الملف" /></a>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="activityName" HeaderText="مسمى النشاط" 
                SortExpression="activityName" />
            <asp:HyperLinkField HeaderText="التفاصيل" Text="تفاصيل الدراسة" 
                DataNavigateUrlFields="dID" 
                DataNavigateUrlFormatString="details.aspx?dID={0}" />
        </Columns>
        <EmptyDataTemplate>
        <h2 style="color:Red;">عفوا.. لا توجد دراسات متوفرة لهذا الكود حاليا</h2>
        </EmptyDataTemplate>
    </asp:GridView>
  
    <asp:SqlDataSource ID="sdsCode" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="SELECT dID,Title,Date, branch_managment.BranchName,
 Fullinfo.Filepath, Activities.activityName, Fullinfo.activityCode 
FROM Fullinfo INNER JOIN branch_managment ON Fullinfo.BranchID = branch_managment.BranchID INNER JOIN Activities ON Fullinfo.activityCode = Activities.activityCode 
WHERE (Activities.activityName = @actCode)
order by [Date] desc">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtCodeSearch" Name="actCode" 
                PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
  
    </asp:Content>


