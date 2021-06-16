<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="branchSearch.aspx.cs" Inherits="searchData" Title="«·»ÕÀ ⁄‰ œ—«”…" EnableEventValidation="false" %>

<%@ Register Assembly="Infragistics2.WebUI.UltraWebTab.v8.2, Version=8.2.20082.1000, Culture=neutral, PublicKeyToken=7dd5c3163f2cd0cb"
    Namespace="Infragistics.WebUI.UltraWebTab" TagPrefix="igtab" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="direction:ltr;text-align:center; padding:0 10px;">
<%-----------------------total number -------------------------------- --%>

    
    <%-----------------------End of igTabs-------------------------------- --%>
<div class="rtlDirection">
            <%--<asp:DropDownList ID="ddlsearch" runat="server" AutoPostBack="True" 
        onselectedindexchanged="ddlsearch_SelectedIndexChanged" 
                AppendDataBoundItems="True"><asp:ListItem Value="0">«Œ —..</asp:ListItem><asp:ListItem Value="1">»ÕÀ »«·‰‘«ÿ «·—∆Ì”Ì </asp:ListItem><asp:ListItem Value="3">»ÕÀ Ì«”„ «·«œ«—…</asp:ListItem></asp:DropDownList>--%>
                <br /><asp:DropDownList ID="ddlmangment" runat="server" Width="350px"></asp:DropDownList><br /><cc1:CascadingDropDown ID="CascadingDropDown1" runat="server"
            TargetControlID="ddlmangment" Category="Manage" 
                ServicePath="filldropdown.asmx" ServiceMethod="GetMangment"
            LoadingText="«‰ Ÿ— ﬁ·Ì·«.."
            PromptText="«Œ — ÃÂ… «·≈’œ«—" Enabled="True" ></cc1:CascadingDropDown>
            <cc1:CascadingDropDown ID="CascadingDropDown3" runat="server"
        ParentControlID="ddlmangment" TargetControlID="ddlbranch_search" Category="brn"
        ServiceMethod="GeBranch" ServicePath="filldropdown.asmx"
        PromptText="«Œ — «·ÃÂ… «·„Œ ’… »«·œ—«”…"
        LoadingText="«‰ Ÿ— ﬁ·Ì·«" Enabled="True" onload="CascadingDropDown3_Load"  
        ></cc1:CascadingDropDown><br />
    <asp:DropDownList ID="ddlbranch_search" runat="server" 
                AppendDataBoundItems="True" DataSourceID="banchsds" DataTextField="BranchName" 
                DataValueField="BranchID" 
                OnSelectedIndexChanged="ddlbranch_search_SelectedIndexChanged" 
                Width="350px" onload="ddlbranch_search_Load">
               <%-- <asp:ListItem Value="0">---«Œ —----</asp:ListItem>--%>
                </asp:DropDownList><br />
				<br />
				
				<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="ddlbranch_search" ErrorMessage="„‰ ›÷·ﬂ «Œ — «·ÃÂ… «·„Œ ’… »«·œ—«”…"></asp:RequiredFieldValidator>
				
				<br />
            <asp:Button ID="btnBrnSearch" runat="server" Text="»ÕÀ" 
        onclick="btnBrnSearch_Click" Width="150px" Enabled="False" />
           
                <asp:SqlDataSource ID="banchsds" runat="server" 
        ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
        ProviderName="<%$ ConnectionStrings:dataBankConnectionString.ProviderName %>" 
        SelectCommand="SELECT [BranchID], [BranchName] FROM [branch_managment]"></asp:SqlDataSource>
                <br />
             <p><b>„·ÕÊŸ…: </b>Ì„ﬂ‰  — Ì» «·œ—«”«  »«·÷€ÿ ⁄·Ì ⁄‰Ê«‰ «· ’‰Ì› .    </p>
            
                <br />
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataSourceID="sdsbranch_search" Visible="False" AllowPaging="True" 
        AllowSorting="True" Width="95%" EnableTheming="True">
                    <PagerSettings Mode="NumericFirstLast" />
                    <Columns><asp:BoundField DataField="Title" HeaderText="⁄‰Ê«‰ «·œ—«”…" 
                SortExpression="Title" /><asp:BoundField DataField="Summury" HeaderText="«·„·Œ’" 
                SortExpression="Summury" Visible="False" />
                        <asp:BoundField DataField="Date" HeaderText=" «—ÌŒ «·≈’œ«—" 
                SortExpression="Date" DataFormatString="{0:MMMM,yyyy}" />
                        <asp:BoundField DataField="Branch" HeaderText="«·ÃÂÂ «·„Œ ’… »«·œ—«”…" 
                SortExpression="Branch" ReadOnly="True" />
                <asp:BoundField DataField="Management" 
                        HeaderText="«·≈œ«—… «·„—ﬂ“Ì…" ReadOnly="True" 
                SortExpression="Management" Visible="False" />
                <asp:TemplateField HeaderText="› Õ „·› «·œ—«”…" SortExpression="Filepath">
                <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Filepath") %>'></asp:TextBox></EditItemTemplate>
                <ItemTemplate>
                    <a href="#" onclick="window.open('UploadedUserFiles/<%#Eval("Filepath")%>')" ><img src="Images/pdf_logo_trefoil.gif" style="border-style:none;" alt="› Õ «·„·›" /></a>
                    </ItemTemplate>
                </asp:TemplateField>
                        <asp:BoundField DataField="LangName" HeaderText="·€Â «·œ—«”…" 
                            SortExpression="LangName" />
                        <asp:HyperLinkField DataNavigateUrlFields="dID" 
                        DataNavigateUrlFormatString="details.aspx?dID={0}" HeaderText="«· ›«’Ì·" 
                        Text=" ›«’Ì· «·œ—«”…" /></Columns>
                    <EmptyDataTemplate><h2 style="color:#bd0000;">
                        ⁄›Ê« .. ·«  ÊÃœ œ—«”«  ·Â–Â «·≈œ«—… Õ«·Ì«
                    </h2></EmptyDataTemplate>
                </asp:GridView>
				&nbsp; &nbsp; 
				<asp:SqlDataSource 
                ID="sdsbranch_search" runat="server" 
                ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                SelectCommand="select Title, Summury,Date,Filepath,Keywords,dID,
(select  branchname from branch_managment where(Fullinfo.BranchID=branch_managment.BranchID)) as Branch
,(select mangmentName from mangment,branch_managment  where (branch_managment.mangmentID=mangment.mangmentID)
and (Fullinfo.BranchID=branch_managment.BranchID)) as Management  

,(select  SectorName from industrialSector where(Fullinfo.SectorID=industrialSector.SectorID)) as Sector
,(select ClassName from Classification,industrialSector  where (industrialSector.ClassID=Classification.ClassID)
and (Fullinfo.SectorID=industrialSector.SectorID)) as CLass  ,
(select langName from Lang_Lockup where (Lang_Lockup.langId=Fullinfo.langId))as LangName


from dbo.Fullinfo  
where BranchID=@BranchID
order by [Date] desc"><SelectParameters>
                    <asp:ControlParameter ControlID="ddlbranch_search" 
                        Name="BranchID" PropertyName="SelectedValue" />
                	</SelectParameters>
            	</asp:SqlDataSource>
            </div>
</div>
</asp:Content>

