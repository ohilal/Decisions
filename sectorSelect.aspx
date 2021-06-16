<%@ Page Title="الدراسات طبقا لنوع النشاط" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="sectorSelect.aspx.cs" Inherits="sectorSelect" %>

<%@ Register Assembly="System.Web.DynamicData, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.DynamicData" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

   
   <asp:DetailsView ID="dvTitle" runat="server" Height="50px" Width="95%" 
        AutoGenerateRows="False" BackColor="White" 
        BorderStyle="None" CellPadding="4" DataSourceID="sdsTitle" 
        ForeColor="Black" GridLines="Vertical" EnableTheming="False">
        <FooterStyle BackColor="#CCCC99" />
        <RowStyle BackColor="#F7F7DE" />
        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
        <Fields>
            <asp:TemplateField ShowHeader="False" SortExpression="SectorName">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SectorName") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SectorName") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate><h2>الدراسات طبقا للتصنيف:</h2>
                   <h1 style="color:#660000;"> <asp:Label ID="Label1" runat="server" Text='<%# Bind("SectorName") %>'></asp:Label>
                </h1>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
        <AlternatingRowStyle BackColor="White" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsTitle" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        SelectCommand="SELECT [SectorName] FROM [industrialSector] WHERE ([SectorID] = @SectorID)">
        <SelectParameters>
            <asp:QueryStringParameter Name="SectorID" QueryStringField="secID" 
                Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    <p><b>ملحوظة: </b>يمكن ترتيب الدراسات بالضغط علي عنوان التصنيف .    </p>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="dID" DataSourceID="sdsSector" AllowSorting="True" 
        AllowPaging="True">
        <Columns><asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                        SortExpression="Title" /><asp:BoundField DataField="Summury" HeaderText="Summury" 
                        SortExpression="Summury" Visible="False" />
                        <asp:BoundField DataField="Date" HeaderText="تاريخ الاصدار" 
                        SortExpression="Date" DataFormatString="{0:MMMM,yyyy}"  /><asp:BoundField DataField="Keywords" HeaderText="Keywords" 
                        SortExpression="Keywords" Visible="False" /><asp:BoundField DataField="dID" HeaderText="dID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="dID" Visible="False" />
            <asp:BoundField DataField="Branch" HeaderText="الجهة المختصة بالدراسة" ReadOnly="True" 
                        SortExpression="Branch" /><asp:BoundField DataField="Management" HeaderText="Management" ReadOnly="True" 
                        SortExpression="Management" Visible="False" /><asp:TemplateField HeaderText="فتح ملف الدراسة" SortExpression="Filepath"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox></EditItemTemplate>
                        <ItemTemplate>
                        <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><img src="Images/pdf_logo_trefoil.gif" style="border-style:none;" alt="فتح الملف" /></a>
                        </ItemTemplate></asp:TemplateField>
            <asp:BoundField DataField="LangName" HeaderText="لغه الدراسة" 
                SortExpression="LangName" />
            <asp:HyperLinkField DataNavigateUrlFields="dID" 
                        DataNavigateUrlFormatString="details.aspx?dID={0}" HeaderText="أظهر التفاصيل" 
                        Text="التفاصيل" /></Columns>
        <EmptyDataTemplate><h2 style="color:Red;">
            عفوا .. لا توجد دراسات تحت هذا النشاط حاليا
        </h2></EmptyDataTemplate>
    </asp:GridView>
    <asp:SqlDataSource ID="sdsSector" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="select Title, Summury,Date,Filepath,Keywords,dID,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as Branch
,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
and (Fullinfo.BranchID=branch_managment.BranchID)) as Management  

,(select  SectorName from industrialSector where(Fullinfo.SectorID=industrialSector.SectorID)) as Sector
,(select ClassName from Classification,industrialSector  where (industrialSector.ClassID=Classification.ClassID)
and (Fullinfo.SectorID=industrialSector.SectorID)) as CLass  
,(select langName from Lang_Lockup where (Lang_Lockup.langId=Fullinfo.langId))as LangName

from dbo.Fullinfo
where SectorID=@SectorID
order by [Date] desc">
        <SelectParameters>
            <asp:QueryStringParameter Name="SectorID" QueryStringField="secID" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />     
   
</asp:Content>

