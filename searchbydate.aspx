<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="searchbydate.aspx.cs" Inherits="searhbydate" Title="searchByDate" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    من <asp:TextBox ID="txtdatefrom" runat="server"></asp:TextBox>

    <cc1:CalendarExtender ID="txtdatefrom_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtdatefrom" Format="MM/dd/yyyy">
    </cc1:CalendarExtender>

    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;إلى&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   <asp:TextBox ID="txtdateto" runat="server"></asp:TextBox>
    <cc1:CalendarExtender ID="txtdateto_CalendarExtender" runat="server" 
        Enabled="True" TargetControlID="txtdateto" Format="MM/dd/yyyy">
    </cc1:CalendarExtender>
    &nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnsearchbydate" runat="server" Text="بحث" Width="75px" />
<br />
    <asp:ListView ID="ListView1" runat="server" DataKeyNames="did" 
        DataSourceID="searchbydate">
            <ItemTemplate>
                <li style="background-color: #edfdb8;color: #333333; font-family:Tahoma,Arial;"><h1>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></h1>
                    
                    الملخص:
                    <asp:Label ID="SummuryLabel" runat="server" Text='<%# Eval("Summury") %>' />
                    
                    <br />
                    تاريخ الإصدار:
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date","{0:MMMM yyyy}") %>' />
                    <br />
                    ملف الدراسة:
                                       <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><img src="Images/pdf_logo_trefoil.gif" style="border-style:none;" alt="فتح الملف" /></a>

                    <br />
                   الكلمات الدالة:
                    <asp:Label ID="KeywordsLabel" runat="server" Text='<%# Eval("Keywords") %>' />
                    <br />
                    
                    الجهة المختصة بالدراسة:
                    <asp:Label ID="الإدارة_العامةLabel" runat="server" 
                        Text='<%# Eval("[الإدارة العامة]") %>' />
                    <br />
                    جهة الإصدار:
                    <asp:Label ID="الإدارة_المركزيةLabel" runat="server" 
                        Text='<%# Eval("[الإدارة المركزية]") %>' />
                    <br />
                    النشاط:
                    <asp:Label ID="النشاطLabel" runat="server" Text='<%# Eval("النشاط") %>' />
                    <br />
                    التصنيف:
                    <asp:Label ID="التصنيفLabel" runat="server" Text='<%# Eval("التصنيف") %>' />
                    <br />
                     لغة الدراسة:
                    <asp:Label ID="langLabel" runat="server" Text='<%# Eval("LangName") %>' />
                    <br />
                </li>
            </ItemTemplate>
            <AlternatingItemTemplate>
                 <li style="background-color: #ffffff;color: #333333; font-family:Tahoma,Arial;"><h1>
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' /></h1>
                    
                    الملخص:
                    <asp:Label ID="SummuryLabel" runat="server" Text='<%# Eval("Summury") %>' />
                    
                    <br />
                    تاريخ الإصدار:
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date","{0:MMMM yyyy}") %>' />
                    <br />
                    ملف الدراسة:
                                       <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><img src="Images/pdf_logo_trefoil.gif" style="border-style:none;" alt="فتح الملف" /></a>

                    <br />
                   الكلمات الدالة:
                    <asp:Label ID="KeywordsLabel" runat="server" Text='<%# Eval("Keywords") %>' />
                    <br />
                    
                    الجهة المختصة بالدراسة:
                    <asp:Label ID="الإدارة_العامةLabel" runat="server" 
                        Text='<%# Eval("[الإدارة العامة]") %>' />
                    <br />
                    جهة الإصدار:
                    <asp:Label ID="الإدارة_المركزيةLabel" runat="server" 
                        Text='<%# Eval("[الإدارة المركزية]") %>' />
                    <br />
                    النشاط:
                    <asp:Label ID="النشاطLabel" runat="server" Text='<%# Eval("النشاط") %>' />
                    <br />
                    التصنيف:
                    <asp:Label ID="التصنيفLabel" runat="server" Text='<%# Eval("التصنيف") %>' />
                    <br />
                     لغة الدراسة:
                    <asp:Label ID="langLabel" runat="server" Text='<%# Eval("LangName") %>' />
                    <br />
                </li>
            </AlternatingItemTemplate>
            <EmptyDataTemplate>
                لم يتم إسترجاع أي بيانات.
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <li style="">Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <br />
                    Summury:
                    <asp:TextBox ID="SummuryTextBox" runat="server" Text='<%# Bind("Summury") %>' />
                    <br />
                    Date:
                    <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                    <br />
                    Filepath:
                    <asp:TextBox ID="FilepathTextBox" runat="server" 
                        Text='<%# Bind("Filepath") %>' />
                    <br />
                    Keywords:
                    <asp:TextBox ID="KeywordsTextBox" runat="server" 
                        Text='<%# Bind("Keywords") %>' />
                    <br />
                    الإدارة العامة:
                    <asp:TextBox ID="الإدارة_العامةTextBox" runat="server" 
                        Text='<%# Bind("[الإدارة العامة]") %>' />
                    <br />
                    الإدارة المركزية:
                    <asp:TextBox ID="الإدارة_المركزيةTextBox" runat="server" 
                        Text='<%# Bind("[الإدارة المركزية]") %>' />
                    <br />
                    النشاط:
                    <asp:TextBox ID="النشاطTextBox" runat="server" 
                        Text='<%# Bind("النشاط") %>' />
                    <br />
                    التصنيف:
                    <asp:TextBox ID="التصنيفTextBox" runat="server" 
                        Text='<%# Bind("التصنيف") %>' />
                    <br />
                    <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                        Text="Insert" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Clear" />
                </li>
            </InsertItemTemplate>
            <LayoutTemplate>
                <ul ID="itemPlaceholderContainer" runat="server" 
                    style="font-family: Verdana, Arial, Helvetica, sans-serif;">
                    <li ID="itemPlaceholder" runat="server" />
                    </ul>
                    <div style="text-align: center;background-color: #99bf46;font-family: Tahoma, Arial, Helvetica, sans-serif;color: #FFFFFF;">
                        <asp:DataPager ID="DataPager2" runat="server" PageSize="10">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" ShowLastPageButton="True" 
                                    ShowNextPageButton="False" ShowPreviousPageButton="False" />
                            </Fields>
                        </asp:DataPager>
                    </div>
            </LayoutTemplate>
            <EditItemTemplate>
                <li style="background-color: #999999;">Title:
                    <asp:TextBox ID="TitleTextBox" runat="server" Text='<%# Bind("Title") %>' />
                    <br />
                    Summury:
                    <asp:TextBox ID="SummuryTextBox" runat="server" Text='<%# Bind("Summury") %>' />
                    <br />
                    Date:
                    <asp:TextBox ID="DateTextBox" runat="server" Text='<%# Bind("Date") %>' />
                    <br />
                    Filepath:
                    <asp:TextBox ID="FilepathTextBox" runat="server" 
                        Text='<%# Bind("Filepath") %>' />
                    <br />
                    Keywords:
                    <asp:TextBox ID="KeywordsTextBox" runat="server" 
                        Text='<%# Bind("Keywords") %>' />
                    <br />
                    did:
                    <asp:Label ID="didLabel1" runat="server" Text='<%# Eval("did") %>' />
                    <br />
                    الإدارة العامة:
                    <asp:TextBox ID="الإدارة_العامةTextBox" runat="server" 
                        Text='<%# Bind("[الإدارة العامة]") %>' />
                    <br />
                    الإدارة المركزية:
                    <asp:TextBox ID="الإدارة_المركزيةTextBox" runat="server" 
                        Text='<%# Bind("[الإدارة المركزية]") %>' />
                    <br />
                    النشاط:
                    <asp:TextBox ID="النشاطTextBox" runat="server" 
                        Text='<%# Bind("النشاط") %>' />
                    <br />
                    التصنيف:
                    <asp:TextBox ID="التصنيفTextBox" runat="server" 
                        Text='<%# Bind("التصنيف") %>' />
                    <br />
                    <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                        Text="Update" />
                    <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                        Text="Cancel" />
                </li>
            </EditItemTemplate>
                <ItemSeparatorTemplate>
                    <br />
                </ItemSeparatorTemplate>
            <SelectedItemTemplate>
                <li style="background-color: #E2DED6;font-weight: bold;color: #333333;">Title:
                    <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
                    <br />
                    Summury:
                    <asp:Label ID="SummuryLabel" runat="server" Text='<%# Eval("Summury") %>' />
                    <br />
                    Date:
                    <asp:Label ID="DateLabel" runat="server" Text='<%# Eval("Date") %>' />
                    <br />
                    Filepath:
                    <asp:Label ID="FilepathLabel" runat="server" Text='<%# Eval("Filepath") %>' />
                    <br />
                    Keywords:
                    <asp:Label ID="KeywordsLabel" runat="server" Text='<%# Eval("Keywords") %>' />
                    <br />
                    did:
                    <asp:Label ID="didLabel" runat="server" Text='<%# Eval("did") %>' />
                    <br />
                    الإدارة العامة:
                    <asp:Label ID="الإدارة_العامةLabel" runat="server" 
                        Text='<%# Eval("[الإدارة العامة]") %>' />
                    <br />
                    الإدارة المركزية:
                    <asp:Label ID="الإدارة_المركزيةLabel" runat="server" 
                        Text='<%# Eval("[الإدارة المركزية]") %>' />
                    <br />
                    النشاط:
                    <asp:Label ID="النشاطLabel" runat="server" 
                        Text='<%# Eval("النشاط") %>' />
                    <br />
                    التصنيف:
                    <asp:Label ID="التصنيفLabel" runat="server" 
                        Text='<%# Eval("التصنيف") %>' />
                    <br />
                </li>
            </SelectedItemTemplate>
        </asp:ListView>
        <br />
        <asp:SqlDataSource ID="searchbydate" runat="server" 
            ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
            
                
                SelectCommand="select Title, Summury,Date,Filepath,Keywords,did,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as [الإدارة العامة]
,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
and (Fullinfo.BranchID=branch_managment.BranchID)) as [الإدارة المركزية] 

,(select  SectorName from industrialSector where(Fullinfo.SectorID=industrialSector.SectorID)) as [النشاط]
,(select ClassName from Classification,industrialSector  where (industrialSector.ClassID=Classification.ClassID)
and (Fullinfo.SectorID=industrialSector.SectorID)) as [التصنيف] 
,(select langName from Lang_Lockup where (Lang_Lockup.langId=Fullinfo.langId))as LangName
 from Fullinfo WHERE Date between @searchdatefrom and @searchdateto
order by [Date] desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="txtdatefrom" Name="searchdatefrom" 
                    PropertyName="Text" />
                <asp:ControlParameter ControlID="txtdateto" Name="searchdateto" 
                    PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
</asp:Content>

