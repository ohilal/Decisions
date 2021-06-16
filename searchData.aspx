<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchData.aspx.cs" Inherits="searchData" Title="البحث عن دراسة" EnableEventValidation="false" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" 
        Width="875px" > 
<%-- ----------------------------ِِAll data -----------  --%>     
        <cc1:TabPanel runat="server" HeaderText="عرض البيانات" ID="TabPanel1" CssClass="ajax__tab_header">
			<HeaderTemplate>
				عرض البيانات
        </HeaderTemplate>
			
<ContentTemplate>
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="dID" DataSourceID="dataresultssds"><Columns>
                <asp:BoundField DataField="dID" HeaderText="dID" InsertVisible="False" 
                ReadOnly="True" SortExpression="dID" Visible="False" />
                <asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                    SortExpression="Title" />
                <asp:BoundField DataField="Summury" HeaderText="الملخص" 
                SortExpression="Summury" /><asp:BoundField DataField="Owner" 
                    HeaderText="معد الدراسة" SortExpression="Owner" />
                <asp:BoundField DataField="Date" HeaderText="تاريخ الإصدار" 
                    SortExpression="Date" />
                <asp:BoundField DataField="BranchName" HeaderText="الإدارة العامة" 
                SortExpression="BranchName" /><asp:TemplateField HeaderText="فتح ملف الدراسة" 
                    SortExpression="Filepath"><ItemTemplate><%--<a href="UploadedUserFiles/<%#Eval("Filepath")%>" ><%#Eval("Filepath")%></a>--%><a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a></ItemTemplate></asp:TemplateField>
                <asp:HyperLinkField DataNavigateUrlFields="dID" 
                    DataNavigateUrlFormatString="details.aspx?dID={0}" HeaderText="تفاصيل الدراسة" 
                    Text="اظهر التفاصيل" />
            	</Columns></asp:GridView><asp:SqlDataSource ID="dataresultssds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
        
                SelectCommand="SELECT Fullinfo.dID, Fullinfo.Title, Fullinfo.Summury,  Fullinfo.Owner, Fullinfo.Date, branch_managment.BranchName, Fullinfo.Filepath FROM Fullinfo INNER JOIN branch_managment ON Fullinfo.BranchID = branch_managment.BranchID"></asp:SqlDataSource>
				
				
				
				
        </ContentTemplate>
			
			
			
</cc1:TabPanel>
<%--------------- Adavnced Search---------------------------%>
        <cc1:TabPanel runat="server" HeaderText="بحث متقدم" ID="catSearch" CssClass="ajax__tab_header">
			
			<HeaderTemplate>
بحث متقدم
        </HeaderTemplate>
			
<ContentTemplate>
				<asp:DropDownList ID="ddlsearch" runat="server" AutoPostBack="True" 
        onselectedindexchanged="ddlsearch_SelectedIndexChanged" 
                AppendDataBoundItems="True"><asp:ListItem Value="0">اختر..</asp:ListItem> 
 <asp:ListItem Value="1">بحث بالنشاط الرئيسي </asp:ListItem>
            <asp:ListItem Value="3">بحث ياسم الادارة</asp:ListItem></asp:DropDownList>
				
				<br />
				
				<asp:DropDownList ID="ddlmangment" runat="server" Width="350px">
                            </asp:DropDownList><br />
				<cc1:CascadingDropDown ID="CascadingDropDown1" runat="server"
            TargetControlID="ddlmangment" Category="Manage" 
                ServicePath="filldropdown.asmx" ServiceMethod="GetMangment"
            LoadingText="انتظر قليلا.."
            PromptText="اختر الإدارة المركزية" Enabled="True" >
            </cc1:CascadingDropDown><cc1:CascadingDropDown ID="CascadingDropDown3" runat="server"
        ParentControlID="ddlmangment" TargetControlID="ddlbranch_search" Category="brn"
        ServiceMethod="GeBranch" ServicePath="filldropdown.asmx"
        PromptText="اختر الاداره العامة"
        LoadingText="انتظر قليلا" Enabled="True"
        >
        </cc1:CascadingDropDown>
				<br />
				<asp:DropDownList ID="ddlbranch_search" runat="server" 
                AppendDataBoundItems="True" DataSourceID="banchsds" DataTextField="BranchName" 
                DataValueField="BranchID" 
                OnSelectedIndexChanged="ddlbranch_search_SelectedIndexChanged" 
                Width="350px">
                <asp:ListItem Value="0">---اختر----</asp:ListItem>
            	</asp:DropDownList>
				<br />
				<asp:DropDownList ID="ddlactivity" runat="server" 
                DataSourceID="sdsactivity_search" DataTextField="industrialname" 
                DataValueField="ClassificationID" Width="350px">
            	</asp:DropDownList>&nbsp;<br />
				<asp:SqlDataSource ID="sdsactivity_search" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                SelectCommand="SELECT [ClassificationID], [industrialname] FROM [industrialtype]">
            	</asp:SqlDataSource>
				<br /><asp:Button ID="btnBrnSearch" runat="server" Text="بحث" 
        onclick="btnBrnSearch_Click" Width="277px" /><asp:SqlDataSource ID="banchsds" runat="server" 
        ConnectionString="Data Source=.;Initial Catalog=databank;Integrated Security=True" 
        ProviderName="System.Data.SqlClient" 
        SelectCommand="SELECT [BranchID], [BranchName] FROM [branch_managment]"></asp:SqlDataSource>
				
				
				
				
				
				
				<asp:GridView ID="GridView3" runat="server" AllowPaging="True" 
                AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="dID" 
                DataSourceID="sdsactivityresult">
                <Columns>
                    <asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                        SortExpression="Title" />
                    <asp:BoundField DataField="Summury" HeaderText="Summury" 
                        SortExpression="Summury" Visible="False" />
                    <asp:BoundField DataField="Owner" HeaderText="معد الدراسة" 
                        SortExpression="Owner" />
                    <asp:BoundField DataField="job" HeaderText="الوظيفة" SortExpression="job" />
                    <asp:BoundField DataField="Date" HeaderText="تاريخ الاصدار" 
                        SortExpression="Date" />
                    <asp:BoundField DataField="Filepath" HeaderText="فتح ملف الدراسة" 
                        SortExpression="Filepath" />
                    <asp:BoundField DataField="Keywords" HeaderText="Keywords" 
                        SortExpression="Keywords" Visible="False" />
                    <asp:BoundField DataField="dID" HeaderText="dID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="dID" Visible="False" />
                    <asp:BoundField DataField="Branch" HeaderText="الادارة العامة" ReadOnly="True" 
                        SortExpression="Branch" />
                    <asp:BoundField DataField="Management" HeaderText="Management" ReadOnly="True" 
                        SortExpression="Management" Visible="False" />
                    <asp:BoundField DataField="Mainactivity" HeaderText="النشاط الرئيسي" 
                        ReadOnly="True" SortExpression="Mainactivity" />
                    <asp:TemplateField HeaderText="فتح ملف الدراسة" SortExpression="Filepath">
                    
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                             <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a>
                        </ItemTemplate>
                    
                    </asp:TemplateField>
                    <asp:HyperLinkField DataNavigateUrlFields="dID" 
                        DataNavigateUrlFormatString="details.aspx?dID={0}" HeaderText="أظهر التفاصيل" 
                        Text="التفاصيل" />
                	</Columns>
            	</asp:GridView>
				<br />
				
				
				
				<asp:SqlDataSource ID="sdsactivityresult" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="select Title, Summury,Owner,job,Date,Filepath,Keywords,dID,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as Branch
,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
and (Fullinfo.BranchID=branch_managment.BranchID)) as Management  
,(select industrialname from industrialtype where(Fullinfo.ClassificationID=industrialtype.ClassificationID)) as Mainactivity
from dbo.Fullinfo 
where ClassificationID=@ClassificationID">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ddlactivity" Name="ClassificationID" 
                        PropertyName="SelectedValue" />
                	</SelectParameters>
            	</asp:SqlDataSource>
				<br /><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sdsbranch_search" Visible="False" AllowPaging="True" 
        AllowSorting="True"><Columns><asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                SortExpression="Title" />
                    <asp:BoundField DataField="Owner" HeaderText="معد الدراسة" 
                SortExpression="Owner" />
                    <asp:BoundField DataField="job" HeaderText="الوظيفه " 
                SortExpression="job" /><asp:BoundField DataField="Summury" HeaderText="الملخص" 
                SortExpression="Summury" Visible="False" /><asp:BoundField DataField="Date" HeaderText="تاريخ الإصدار" 
                SortExpression="Date" /><asp:BoundField DataField="Branch" HeaderText="الإدارة العامة" 
                SortExpression="Branch" ReadOnly="True" /><asp:BoundField DataField="Management" 
                        HeaderText="الإدارة المركزية" ReadOnly="True" 
                SortExpression="Management" Visible="False" />
                    <asp:TemplateField HeaderText="فتح ملف الدراسة" SortExpression="Filepath"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox></EditItemTemplate><ItemTemplate>
                <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a></ItemTemplate></asp:TemplateField><asp:HyperLinkField DataNavigateUrlFields="dID" 
                        DataNavigateUrlFormatString="details.aspx?dID={0}" HeaderText="التفاصيل" 
                        Text="تفاصيل الدراسة" /></Columns></asp:GridView>
				<asp:SqlDataSource ID="sdsbranch_search" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="select Title, Summury,Owner,job,Date,Filepath,Keywords,dID,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as Branch
,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
and (Fullinfo.BranchID=branch_managment.BranchID)) as Management  
,(select industrialname from industrialtype where(Fullinfo.ClassificationID=industrialtype.ClassificationID)) as Mainactivity
from dbo.Fullinfo 
where BranchID=@BranchID"><SelectParameters><asp:ControlParameter ControlID="ddlbranch_search" Name="BranchID" 
                PropertyName="SelectedValue" /></SelectParameters></asp:SqlDataSource>
        </ContentTemplate>
			
			
			
			
			
			
			
</cc1:TabPanel>
<%-- -------------------end of advanced search----------------------------%>
        <cc1:TabPanel runat="server" HeaderText="بحث بالكلمات الدالة" ID="wordSearch" CssClass="ajax__tab_header"><HeaderTemplate>
بحث بالكلمات
        </HeaderTemplate>
<ContentTemplate>
<asp:TextBox ID="txtSearch" runat="server"></asp:TextBox><asp:Button ID="btnSearch" runat="server" Text="بحث" 
        onclick="btnSearch_Click" />&nbsp; <asp:Label ID="lblSearch" runat="server" >
        </asp:Label><br />
			&nbsp;<asp:ListView ID="ListView1" runat="server" 
        DataSourceID="sdstest">
        <AlternatingItemTemplate><li style="background-color: #FFFFFF;color: #284775;font-family:Tahoma,Arial;">
        <b>عنوان الدراسة:</b> <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /><br /><b>الملخص:</b> 
        <asp:Label ID="SummuryLabel" runat="server" Text='<%# Eval("Summury") %>' /><br />
        
        <b>اسم معد الدراسة:</b> <asp:Label ID="OwnerLabel" runat="server" Text='<%# Eval("Owner") %>' /><br />
        <b>تاريخ الإصدار:</b> 
        <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' /><br />
        <b>الملف:</b> <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a> <br />
        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# Eval("dID", "details.aspx?dID={0}") %>'>التفاصيل</asp:HyperLink></li></AlternatingItemTemplate>
        <EditItemTemplate><li style="background-color: #999999;font-family:Tahoma,Arial;">Title: <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' /><br />Summury: <asp:TextBox ID="SummuryTextBox" runat="server" Text='<%# Bind("Summury") %>' /><br />
        Owner: <asp:TextBox ID="OwnerTextBox" runat="server" Text='<%# Bind("Owner") %>' /><br />Date: <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' /><br />
                       Filepath: <asp:TextBox ID="FilepathTextBox" runat="server" 
                        Text='<%# Bind("Filepath") %>' /><br /><asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" /></li></EditItemTemplate>
                        <EmptyDataTemplate>No data was returned.</EmptyDataTemplate><InsertItemTemplate><li style="font-family:Tahoma,Arial;">Title: <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' /><br />Summury: <asp:TextBox ID="SummuryTextBox" runat="server" Text='<%# Bind("Summury") %>' /><br />Type: <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' /><br />Owner: <asp:TextBox ID="OwnerTextBox" runat="server" Text='<%# Bind("Owner") %>' /><br />Date: <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' /><br />Classification: <asp:TextBox ID="ClassificationTextBox" runat="server" 
                    Text='<%# Bind("Classification") %>' /><br />Filepath: <asp:TextBox ID="FilepathTextBox" runat="server" 
                    Text='<%# Bind("Filepath") %>' /><br /><asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                    Text="Insert" /><asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                    Text="Clear" /></li></InsertItemTemplate><ItemSeparatorTemplate><br /></ItemSeparatorTemplate><ItemTemplate><li style="background-color: #E0FFFF;color: #333333; font-family:Tahoma,Arial;"><b>عنوان الدراسة: </b><asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /><br /><b>الملخص:</b> <asp:Label ID="SummuryLabel" runat="server" Text='<%# Eval("Summury") %>' /><br />
                    <b>اسم معد الدراسة:</b> <asp:Label ID="OwnerLabel" runat="server" Text='<%# Eval("Owner") %>' /><br /><b>تاريخ الإصدار:</b> <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' /><br />
                    <b>الملف:</b> <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a> <br /><asp:HyperLink runat="server" NavigateUrl='<%# Eval("dID", "details.aspx?dID={0}") %>'>التفاصيل</asp:HyperLink></li></ItemTemplate><LayoutTemplate><ul ID="itemPlaceholderContainer" runat="server" 
                style="font-family:Tahoma,Arial;"><li ID="itemPlaceholder" runat="server" /></ul><div style="text-align: center;background-color: #5D7B9D;font-family: Verdana, Arial, Helvetica, sans-serif;color: #FFFFFF;">
  <asp:DataPager ID="DataPager1" runat="server" PageSize="5" ><Fields><asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                ShowNextPageButton="False" ShowPreviousPageButton="False" /><asp:NumericPagerField /><asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                ShowNextPageButton="False" ShowPreviousPageButton="False" /></Fields></asp:DataPager></div></LayoutTemplate><SelectedItemTemplate><tr style=""><td><asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></td><td><asp:Label ID="SummuryLabel" runat="server" Text='<%# Eval("Summury") %>' /></td><td><asp:Label ID="TypeLabel" runat="server" Text='<%# Eval("Type") %>' /></td><td><asp:Label ID="OwnerLabel" runat="server" Text='<%# Eval("Owner") %>' /></td><td><asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' /></td><td><asp:Label ID="ClassificationLabel" runat="server" 
                            Text='<%# Eval("Classification") %>' /></td><td><asp:Label ID="FilepathLabel" runat="server" Text='<%# Eval("Filepath") %>' /></td></tr></SelectedItemTemplate></asp:ListView><br /><asp:SqlDataSource ID="sdstest" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
            SelectCommand="searchKeywords" SelectCommandType="StoredProcedure"><SelectParameters><asp:ControlParameter ControlID="txtSearch" Name="searchword" 
                    PropertyName="Text" Type="String" /></SelectParameters></asp:SqlDataSource>&#160;
			
			
        </ContentTemplate>
		
</cc1:TabPanel>
    </cc1:TabContainer>
   
</asp:Content>

