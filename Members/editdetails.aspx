<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="editdetails.aspx.cs" Inherits="Members_editdetails" Title="تعديل الدراسات" EnableEventValidation="false" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataKeyNames="dID" DataSourceID="SqlDataSource1" Height="50px" 
        Width="95%" onitemupdating="DetailsView1_ItemUpdating" 
        onitemcreated="DetailsView1_ItemCreated">
        <Fields>
            <asp:BoundField DataField="Title" HeaderText="عنوان الدراسة" 
                SortExpression="Title" />
            <asp:TemplateField HeaderText="الملخص" SortExpression="Summury">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Height="50px" 
                        Text='<%# Bind("Summury") %>' TextMode="MultiLine" Width="350px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Summury") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    
                    
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="تاريخ الإصدار" SortExpression="Date">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                    <cc1:CalendarExtender ID="TextBox1_CalendarExtender" runat="server" 
                        Enabled="True" TargetControlID="TextBox1" Format="MMMM yyyy">
                    </cc1:CalendarExtender>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Date") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="lblDate" runat="server" Text='<%# Eval("Date","{0:MMMM yyyy}") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الكلمات الدالة" SortExpression="Keywords">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Height="50px" 
                        Text='<%# Bind("Keywords") %>' TextMode="MultiLine" Width="350px"></asp:TextBox>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("Keywords") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Keywords") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="dID" InsertVisible="False" SortExpression="dID">
                <EditItemTemplate>
                    <asp:Label ID="lblid" runat="server" Text='<%# Bind("dID") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("dID") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="لغه الدراسة" SortExpression="langId">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddEditlLang" runat="server" DataSourceID="sdsEditLang" 
                        DataTextField="langName" DataValueField="langId" Height="17px" 
                        SelectedValue='<%# Bind("langId") %>' Width="108px">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="sdsEditLang" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT [langName], [langId] FROM [Lang_Lockup]">
                    </asp:SqlDataSource>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox9" runat="server" Text='<%# Bind("langId") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("langId") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="التصنيف">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddleditclass" runat="server">
                    </asp:DropDownList>
                    <cc1:CascadingDropDown ID="CascadingDropDown4" runat="server"
                    TargetControlID="ddleditclass"
            Category="Classify"
            PromptText="اختر التصنيف"
            LoadingText="انتظر قليلا"
            ServicePath="~/Class_Sectorservice.asmx"
            ServiceMethod="GetSectorfromClass"
                    
                    
                    >
                    </cc1:CascadingDropDown>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label6" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="النشاط">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddleditactivity" runat="server">
                    </asp:DropDownList>
                    <cc1:CascadingDropDown ID="CascadingDropDown3" runat="server"
                     TargetControlID="ddleditactivity"
            ParentControlID="ddleditclass"
            PromptText=" اختر القطاع "
            LoadingText="انتظر قليلا"
            ServicePath="~/Class_Sectorservice.asmx"
            ServiceMethod="Getsector"
            Category="active"
                    
                    >
                    </cc1:CascadingDropDown>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label5" runat="server"></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="كود النشاط" SortExpression="activityCode">
                <EditItemTemplate>
                    <asp:DropDownList ID="editcode" runat="server" DataSourceID="sdscode" 
                         DataValueField="activityCode" 
                        SelectedValue='<%# Bind("activityCode") %>' AppendDataBoundItems="True" 
                        DataTextField="activityCode">
                        <asp:ListItem Enabled="true" Value="" Text="" />
                    </asp:DropDownList>
                    &nbsp;  <asp:Label ID="lblEditCode" runat="server" Text='<%# Eval("activity") %>' ForeColor="#666666"></asp:Label>
                    
                    <asp:SqlDataSource ID="sdscode" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT [activityCode] FROM [Activities]">
                    </asp:SqlDataSource>
                    <cc1:CascadingDropDown ID="CascadingDropDown5" runat="server"
                    Enabled="True" TargetControlID="editcode"
               ParentControlID="ddleditactivity"
            PromptText=" اختر مسمى النشاط الصناعى "
            LoadingText="انتظر قليلا"
            ServicePath="~/Class_Sectorservice.asmx"
            ServiceMethod="GetactivitiesMethod"
            Category="code"
            EmptyText="هذا النشاط ليس له كود">
                    </cc1:CascadingDropDown> 
                 
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("activityCode") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("activity") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الإداره المركزية">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddleditmangment" runat="server" DataSourceID="sdsmanage" 
                        DataTextField="mangmentName" DataValueField="mangmentID">
                    </asp:DropDownList>
                     <asp:SqlDataSource ID="sdsmanage" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT [mangmentID], [mangmentName] FROM [mangment]">
                    </asp:SqlDataSource>
                     <cc1:CascadingDropDown ID="CascadingDropDown1" runat="server"
                TargetControlID="ddleditmangment" Category="Manage" ServicePath="~/filldropdown.asmx" ServiceMethod="GetMangment"
            LoadingText="انتظر قليلا.."
            PromptText="اختر الإدارة المركزية" 
                
                
                >
                </cc1:CascadingDropDown>
                </EditItemTemplate>
               
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </InsertItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="الإدارة العامة" SortExpression="BranchID">
                <EditItemTemplate>
                    <asp:DropDownList ID="ddleditbranch" runat="server" DataSourceID="brnsds" 
                        DataTextField="BranchName" DataValueField="BranchID" 
                        SelectedValue='<%# bind("BranchID") %>'  >
                    </asp:DropDownList>
                    &nbsp;<asp:Label ID="lblEditMN" runat="server" Text='<%# Eval("Branch") %>' ForeColor="#666666"></asp:Label>
                    <asp:SqlDataSource ID="brnsds" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                        SelectCommand="SELECT [BranchID], [BranchName] FROM [branch_managment]">
                    </asp:SqlDataSource>
                    <cc1:CascadingDropDown ID="CascadingDropDown2" runat="server"
                    ParentControlID="ddleditmangment" TargetControlID="ddleditbranch" Category="brn"
        ServiceMethod="GeBranch" ServicePath="~/filldropdown.asmx"
        PromptText="اختر الاداره العامة"
        LoadingText="انتظر قليلا"
                    >
                    </cc1:CascadingDropDown> 
                </EditItemTemplate>
                <InsertItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("BranchID") %>'></asp:TextBox>
                </InsertItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Branch") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:CommandField ShowEditButton="True" CancelText="إلغاء التعديل" 
                EditText="تعديل البيانات" UpdateText="تعديل" ControlStyle-CssClass="updateControl" >
                <ControlStyle Font-Bold="True" Font-Size="Medium" ForeColor="Maroon"  />
            </asp:CommandField>
        </Fields>
        <EditRowStyle BackColor="#E4FFCA" />
    </asp:DetailsView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        
        SelectCommand="select Title, Summury,Date,Keywords,dID,activityCode,BranchID,langId,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as Branch
--,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
--and (Fullinfo.BranchID=branch_managment.BranchID)) as Management  
--
--,(select  SectorName from industrialSector,Activities where(dbo.Activities.SectorID=industrialSector.SectorID)
--and (Activities.activityCode=Fullinfo.activityCode)) as Sector
--,(select ClassName from Classification,industrialSector,Activities  where (industrialSector.ClassID=Classification.ClassID)
--and (Activities.SectorID=industrialSector.SectorID)
--and (Fullinfo.activityCode=Activities.activityCode)) as CLass 
,(select activityName from Activities where (Fullinfo.activityCode=Activities.activityCode))as activity

 from Fullinfo 
where dID=@dID" 
        UpdateCommand="updatedata" UpdateCommandType="StoredProcedure" 
        onupdating="SqlDataSource1_Updating">
        <SelectParameters>
            <asp:QueryStringParameter Name="dID" QueryStringField="dID" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="dID" Type="Int32" />
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="Summury" Type="String" />
            <asp:Parameter Name="Date" Type="DateTime" />
            <asp:Parameter Name="activityCode" Type="Int32" />
            <asp:Parameter Name="BranchID" Type="Int32" />
            <asp:Parameter Name="Filepath" Type="String" />
            <asp:Parameter Name="Keywords" Type="String" />
            <asp:Parameter Name="langId" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
   <br />
   <br />
    <asp:Button ID="Button1" runat="server" Text="عودة إلى صفحة التعديل" 
        PostBackUrl="~/Members/membersdataresult.aspx" />
</asp:Content>

