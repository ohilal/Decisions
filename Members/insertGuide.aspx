<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="insertGuide.aspx.cs" Inherits="InsertDecesion" Title="إدخال قرارات الهيئة" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<style type="text/css">
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
        .style1
        {
            width: 95%;
        }
        .style2       
        {
            width: 113px;
            font-weight: bold;
        }
        .style3
        {
            width: 113px;
            font-weight: bold;
            height: 23px;
        }
        .style4
        {
            height: 23px;
        }
    	.auto-style1 {
			width: 113px;
			font-weight: bold;
			height: 87px;
		}
		.auto-style2 {
			height: 87px;
			width: 729px;
		}
		.auto-style3 {
			width: 729px;
		}
		.auto-style4 {
			height: 23px;
			width: 729px;
		}
    	.auto-style5 {
			width: 113px;
			font-weight: bold;
			height: 33px;
		}
		.auto-style6 {
			width: 729px;
			height: 33px;
		}
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<h1 style="text-align:center;" class="h1">إدخال الأدلة</h1>
<asp:LoginView ID="LoginView1" runat="server">
    <LoggedInTemplate>
        مرحبا..<asp:LoginName ID="LoginName1" runat="server" />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </LoggedInTemplate>
</asp:LoginView>
    <table class="style1" cellpadding="3" cellspacing="3" dir="rtl">
        <tr>
            <td class="style2">
                اسم الدليل</td>
            <td class="auto-style3">
                <asp:TextBox ID="txtGuideTitle" runat="server" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
            </td>
        </tr>
        
        <tr>
            <td class="style3">
              التاريخ</td>
            <td class="auto-style4">
                <asp:TextBox ID="txtDate" runat="server" CssClass="form-control col-lg-6 col-sm-12" TextMode="Date"></asp:TextBox>
                
            </td>
        </tr>
        
        <tr>
            <td class="style2">
                نوع الدليل</td>
            <td class="auto-style3">
                <asp:DropDownList ID="ddlGuideType" runat="server" DataSourceID="sdsGuideType" 
                    DataTextField="GuideTypeName" DataValueField="GuideTypeID" CssClass="form-control col-lg-6 col-sm-12" AppendDataBoundItems="True" style="right: 0px; top: 0px">
                    <asp:ListItem Text="اختر نوع الدليل" Enabled="true"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsGuideType" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    SelectCommand="SELECT GuideTypeName, GuideTypeID FROM GuideTypes WHERE (GuideTypeID &lt; 4)">
                </asp:SqlDataSource>
            </td>
        </tr>
        
        <tr>
            <td class="auto-style5">
                تحميل الملف</td>
            <td class="auto-style6">
                <asp:FileUpload ID="uploadGuideFile" runat="server" CssClass="form-control col-lg-6 col-sm-12" />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                </td>
            <td class="auto-style2">
                <input id="Reset1" type="reset" value="reset" class="btn btn-secondary btn-lg"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="btnSubmitDec" runat="server" Text="إدخال " 
                    onclick="btnSubmitDec_Click" CssClass="btn btn-info btn-lg" />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" InsertCommand="insertGuide" InsertCommandType="StoredProcedure" SelectCommand="SELECT Title, ID, guideType, InsertDate, guideFileExt FROM guidebook">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtGuideTitle" Name="Title" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="ddlGuideType" Name="guideType" PropertyName="SelectedValue" Type="Int32" />
                        <asp:ControlParameter ControlID="txtDate" DbType="Date" Name="InsertDate" PropertyName="Text" />
                        <asp:Parameter Name="guideFileExt" Type="String" />
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                    </InsertParameters>
                </asp:SqlDataSource>

				<br />
				
				<div class="card container mx-auto topMargin">
        <div class="card-header">
            <h1 class="h1 text-center" >تعديل دليل</h1>
        </div>
        <div class="card-body">
 <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover"   AutoGenerateColumns="False" Style="width: 100%" FooterStyle-CssClass="pagination" ClientIDMode="Static" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" HeaderStyle-CssClass="table-secondary" >
    <Columns>
         <asp:BoundField DataField="Title" HeaderText="الدليل" SortExpression="Title" />
         <asp:BoundField DataField="guideFileExt" HeaderText="مسار الملف" SortExpression="guideFileExt" />
          <asp:BoundField DataField="GuideTypeName" HeaderText="النوع" SortExpression="GuideTypeName" />
         <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="editguide.aspx?ID={0}" HeaderText="التفاصيل " 
                Text="اظهر التفاصيل "  ControlStyle-CssClass="btn btn-secondary" >
<ControlStyle CssClass="btn btn-secondary"></ControlStyle>
            </asp:HyperLinkField>

 <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:Button ID="btnDel" runat="server" CausesValidation="False" CommandName="Delete"  Text=" حذف" OnClick="btnDel_Click" OnClientClick="return confirm('هل انت متأكد من المسح؟');"/>
                        </ItemTemplate>
                        <ControlStyle CssClass="btn btn-danger" />
                    </asp:TemplateField>
     </Columns>
<FooterStyle CssClass="pagination"></FooterStyle>


<HeaderStyle CssClass="table-secondary"></HeaderStyle>


    </asp:GridView>
			<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="select guidebook.ID,guidebook.Title, guidebook.guideFileExt, GuideTypes.GuideTypeName from guidebook inner join GuideTypes on guidebook.guideType= GuideTypes.GuideTypeID"></asp:SqlDataSource>
					</div></div>
            </td>
        </tr>
		
				

    </table>
	<script>
                $(document).ready(function () {
                    $('#<%= GridView1.ClientID %>').DataTable();
                });
            </script>
</asp:Content>

