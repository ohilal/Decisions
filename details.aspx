<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="details.aspx.cs" Inherits="details" Title="نتائج البحث تفصيليا" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-right:10px;">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="detailssds"   DataKeyNames="dID" HorizontalAlign="Justify" > 
         
        <Fields>
            <asp:TemplateField HeaderText="عنوان الدراسة" SortExpression="Title" 
                ShowHeader="False">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <h1><asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
               </h1> </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Summury" HeaderText="الملخص" 
                SortExpression="Summury" />
           
            <asp:BoundField DataField="Date" HeaderText="تاريخ الإصدار" 
                SortExpression="Date" DataFormatString="{0:MMMM,yyyy}" >
                <HeaderStyle Width="350px" />
            </asp:BoundField>
            <asp:BoundField DataField="Management" HeaderText="جهة الإصدار" ReadOnly="True" 
                SortExpression="Management" />
            <asp:BoundField DataField="Branch" HeaderText="الجهة المختصة بالدراسة" ReadOnly="True" 
                SortExpression="Branch" />
            <asp:BoundField DataField="Keywords" HeaderText="الكلمات الدالة" 
                SortExpression="Keywords" />
            <asp:BoundField DataField="dID" HeaderText="dID" ReadOnly="True" 
                SortExpression="dID" InsertVisible="False" Visible="False" />
            <asp:BoundField DataField="CLass" HeaderText="التصنيف" SortExpression="CLass" />
            <asp:BoundField DataField="Sector" HeaderText="القطاع " 
                SortExpression="Sector" />
            <asp:BoundField DataField="activity" HeaderText="النشاط الصناعي" 
                SortExpression="activity" />
            <asp:BoundField DataField="activityCode" HeaderText="كود النشاط" 
                SortExpression="activityCode" />
            <asp:BoundField DataField="LangName" HeaderText="لغه الدراسة" 
                SortExpression="LangName" />
            <asp:TemplateField HeaderText="فتح ملف الدراسة" SortExpression="Filepath">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><%#Eval("Filepath")%></a>
                </ItemTemplate>
            </asp:TemplateField>
        </Fields>
        <HeaderStyle HorizontalAlign="Right" Wrap="True" />
    </asp:DetailsView>
    <br />
    <asp:SqlDataSource ID="detailssds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
            SelectCommand="select Title, Summury,Date,Filepath,Keywords,dID,activityCode,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as Branch
,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
and (Fullinfo.BranchID=branch_managment.BranchID)) as Management  

,(select  SectorName from industrialSector,Activities where(dbo.Activities.SectorID=industrialSector.SectorID)
and (Activities.activityCode=Fullinfo.activityCode)) as Sector
,(select ClassName from Classification,industrialSector,Activities  where (industrialSector.ClassID=Classification.ClassID)
and (Activities.SectorID=industrialSector.SectorID)
and (Fullinfo.activityCode=Activities.activityCode)) as CLass 
,(select activityName from Activities where (Fullinfo.activityCode=Activities.activityCode))as activity,
(select langName from Lang_Lockup where (Lang_Lockup.langId=Fullinfo.langId))as LangName

 from Fullinfo  
where dID=@dID">
        <SelectParameters>
            <asp:QueryStringParameter Name="dID" QueryStringField="dID" />
        </SelectParameters>
    </asp:SqlDataSource>
    </div>
</asp:Content>

