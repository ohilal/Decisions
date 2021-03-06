<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Insertdata.aspx.cs" Inherits="_Default" Title="ادخال بيانات الدراسة" EnableEventValidation="false" Culture="ar-EG" ValidateRequest="false" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


    <style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
            width: 96px;
        }
        .style3
        {
            width: 96px;
            height: 11px;
        }
        .style4
        {
            height: 11px;
        }
        .style5
        {
            width: 96px;
            height: 52px;
        }
        .style6
        {
            height: 52px;
        }
        .style7
        {
            direction: ltr;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
   <h1 style="text-align:center;">Member's Area</h1>
<asp:LoginView ID="LoginView1" runat="server">
    <LoggedInTemplate>
        مرحبا..<asp:LoginName ID="LoginName1" runat="server" />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </LoggedInTemplate>
</asp:LoginView>
    <table class="style1" dir="rtl" style="font-weight: bold">
    <tr>
        <td class="style2">
            عنوان الدراسة</td>
        <td>
            <asp:TextBox ID="txtTitle" runat="server" Width="350px"></asp:TextBox>
        </td>
    </tr>
        <%--<tr>
        <td class="style2">
            المصادر</td>
        <td>
            <asp:Panel ID="titlePanel" runat="server" Width="343px">
                <asp:Label ID="Label1" runat="server" Text="أظهر المصادر" ></asp:Label>
            </asp:Panel>
            <asp:Panel ID="Panel1" runat="server">
                <asp:TextBox ID="txtrec1" runat="server" Width="350px"></asp:TextBox>
                 <br />
                 <asp:TextBox ID="txtrec2" runat="server" Width="350px"></asp:TextBox>
                  <br />
                  <asp:TextBox ID="txtrec3" runat="server" Width="350px"></asp:TextBox>
                   <br />
                   <asp:TextBox ID="txtrec4" runat="server" Width="350px"></asp:TextBox>
                    <br />
                    <asp:TextBox ID="txtrec5" runat="server" Width="350px"></asp:TextBox>
                     <br />
                     <asp:TextBox ID="txtrec6" runat="server" Width="350px"></asp:TextBox>
                      <br />
                      <asp:TextBox ID="txtrec7" runat="server" Width="350px"></asp:TextBox>
                       <br />
                       <asp:TextBox ID="txtrec8" runat="server" Width="350px"></asp:TextBox>
                        <br />
                       <asp:TextBox ID="txtrec9" runat="server" Width="350px"></asp:TextBox>
                       <br />
                       <asp:TextBox ID="txtrec10" runat="server" Width="350px"></asp:TextBox>
            </asp:Panel>
            
            <cc1:CollapsiblePanelExtender ID="CollapsiblePanelExtender1" runat="server"
            Enabled="true"
            TargetControlID="Panel1"
            ExpandedText="الاكتفاء بما سبق" 
            CollapsedText="اظهر المصادر"
           ExpandControlID="titlePanel"
           CollapseControlID="titlePanel"
            TextLabelID="Label1" Collapsed="true"
            >
            </cc1:CollapsiblePanelExtender>
            </td>
    </tr>--%>
    <tr>
        <td class="style5">
            الإدارة المركزية</td>
        <td class="style6">
                        <asp:DropDownList ID="ddlmangment" runat="server" Width="350px">
                            </asp:DropDownList>

                            
            <cc1:CascadingDropDown ID="CascadingDropDown1" runat="server"
            TargetControlID="ddlmangment" Category="Manage" ServicePath="~/filldropdown.asmx" ServiceMethod="GetMangment"
            LoadingText="انتظر قليلا.."
            PromptText="اختر الإدارة المركزية" >
            </cc1:CascadingDropDown>          
                            
            </td>
    </tr>
    <tr>
        <td class="style5">
            الإدارة العامة</td>
        <td class="style6">
        <asp:DropDownList ID="ddlbranch" runat="server" Width="350px">
                            </asp:DropDownList> 

                            </td>
    </tr>
        <cc1:CascadingDropDown ID="CascadingDropDown3" runat="server"
        ParentControlID="ddlmangment" TargetControlID="ddlbranch" Category="brn"
        ServiceMethod="GeBranch" ServicePath="~/filldropdown.asmx"
        PromptText="اختر الاداره العامة"
        LoadingText="انتظر قليلا"
        
        >
       
        </cc1:CascadingDropDown>
   
    <tr>
        <td class="style5">
            لغة الدراسة</td>
        <td class="style6">
            <asp:RadioButtonList ID="rbllang" runat="server" DataSourceID="langsds" 
                DataTextField="langName" DataValueField="langId" RepeatDirection="Horizontal">
            </asp:RadioButtonList>
            <asp:SqlDataSource ID="langsds" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                SelectCommand="SELECT [langName], [langId] FROM [Lang_Lockup]">
            </asp:SqlDataSource>

                            </td>
    </tr>
   
    <tr>
        <td class="style2">
            التصنيف</td>
        <td>
            <cc1:CascadingDropDown ID="CascadingDropDown2" runat="server"
            TargetControlID="ddlClassification"
            Category="Classify"
            PromptText="اختر التصنيف"
            LoadingText="انتظر قليلا"
            ServicePath="~/Class_Sectorservice.asmx"
            ServiceMethod="GetSectorfromClass"
            
            
            >
            </cc1:CascadingDropDown>
            <asp:DropDownList ID="ddlClassification" runat="server" Width="350px">
            </asp:DropDownList>
            <br />
        </td>
    </tr>
   
    <tr>
        <td class="style2">
            النشاط </td>
        <td>
            <asp:DropDownList ID="ddlSector" runat="server" Width="350px">
            </asp:DropDownList>
            <cc1:CascadingDropDown ID="CascadingDropDown4" runat="server"
            TargetControlID="ddlSector"
            ParentControlID="ddlClassification"
            PromptText=" اختر القطاع "
            LoadingText="انتظر قليلا"
            ServicePath="~/Class_Sectorservice.asmx"
            ServiceMethod="Getsector"
            Category="active"
            
            
            
            >
        </cc1:CascadingDropDown>
        </td>
        
    </tr>
   
    <tr>
        <td class="style2">
            كود النشاط</td>
        <td>
            <asp:DropDownList ID="ddlCode" runat="server" Width="350px">
            </asp:DropDownList>
            
            <cc1:CascadingDropDown ID="ddlCode_CascadingDropDown" runat="server" 
                Enabled="True" TargetControlID="ddlCode"
               ParentControlID="ddlSector"
            PromptText=" اختر مسمى النشاط الصناعى "
            LoadingText="انتظر قليلا"
            ServicePath="~/Class_Sectorservice.asmx"
            ServiceMethod="GetactivitiesMethod"
            Category="code"
            EmptyText="هذا النشاط ليس له كود">
                 
            </cc1:CascadingDropDown>
            
        </td>
        
    </tr>
    <tr>
        <td class="style2">
            تاريخ الدراسة</td>
        <td>
            <asp:TextBox runat="server" ID="txtDate" Width="350px"></asp:TextBox>
            <cc1:CalendarExtender ID="txtDate_CalendarExtender" runat="server" 
                Enabled="True" TargetControlID="txtDate" Format="MMMM,yyyy">
            </cc1:CalendarExtender>
            
        </td>
       
    </tr>
        <%--<tr>
        <td class="style3">
            ادخال الغلاف</td>
        <td class="style4">
            <asp:FileUpload ID="uploadImage" runat="server" Width="434px" />
            <asp:Button ID="btnuploadImage" runat="server" Text="تحميل صورة" 
                onclick="btnuploadImage_Click" Width="87px" />
        </td>
    </tr>--%>
    <tr>
        <td class="style2">
            ملخص الدراسة</td>
        <td>
            <asp:TextBox ID="txtSummary" runat="server" TextMode="MultiLine" Width="435px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style2">
            الكلمات الدالة</td>
        <td>
            <asp:TextBox ID="txtKeywords" runat="server" TextMode="MultiLine" Width="435px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style3">
            تحميل الملف</td>
        <td class="style4">
            <asp:FileUpload ID="FileUpload1" runat="server"  Width="434px" />
            <br />
        </td>
    </tr>
    <%--<tr>
        <td class="style3">
            ادخال الغلاف</td>
        <td class="style4">
            <asp:FileUpload ID="uploadImage" runat="server" Width="434px" />
            <asp:Button ID="btnuploadImage" runat="server" Text="تحميل صورة" 
                onclick="btnuploadImage_Click" Width="87px" />
        </td>
    </tr>--%>
    <tr>
        <td class="style3">
            &nbsp;</td>
        <td class="style4">
            <asp:Label ID="lblUploadImage" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style2">
            &nbsp;</td>
        <td class="style7">

            <div class="style7">

            <input id="Reset1" type="reset" value="Reset" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button 
                ID="btnSubmit" runat="server" Text="إدخال" onclick="btnSubmit_Click" 
                Width="53px"  />
               
                
                 <br />
            <asp:Label ID="lblerror" runat="server" ></asp:Label>
            <br />
            <asp:Label ID="lblSuccess" runat="server" Font-Bold="True" Font-Size="Medium"></asp:Label>
            </div>
            <asp:SqlDataSource ID="sdsInsert" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                InsertCommand="InsertData" InsertCommandType="StoredProcedure" 
                SelectCommand="SELECT Title, Summury  FROM Fullinfo">
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtTitle" Name="Title" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtSummary" Name="Summury" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="txtDate" Name="Date" PropertyName="Text" 
                        Type="DateTime" />
                    <asp:ControlParameter ControlID="ddlSector" Name="SectorID" 
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="ddlbranch" Name="BranchID" 
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:Parameter Name="Filepath" Type="String" />
                    <asp:ControlParameter ControlID="txtKeywords" Name="Keywords" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="ddlCode" Name="activityCode" 
                        PropertyName="SelectedValue" Type="Int32" />
                    <asp:ControlParameter ControlID="rbllang" Name="langId" 
                        PropertyName="SelectedValue" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table></div>
</asp:Content>

