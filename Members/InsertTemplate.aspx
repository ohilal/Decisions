<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InsertTemplate.aspx.cs" Inherits="InsertDecesion" Title="إدخال قرارات الهيئة" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
	<style>
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
	<h1 style="text-align:center;" class="h1">إدخال النماذج أو القوانين</h1>
<div class="card col-lg-5 col-sm-12 mx-auto container">
    <div class="card-body">
    <div class="row form-inline">
        <label class="col-form-label col-lg-3 text-nowrap">اسم النموذج: &nbsp;</label>
                <asp:TextBox ID="txtTemplate" runat="server" CssClass="form-control col-lg-9 col-sm-12" placeholder="اسم النموذج"></asp:TextBox>

    </div>
         <div class="row form-inline topMargin">
                <label class="col-form-label col-lg-3 text-nowrap">نوع النموذج/ القانون: &nbsp;</label>
             <asp:DropDownList ID="ddlType" runat="server" DataSourceID="sdsType" DataTextField="GuideTypeName" DataValueField="GuideTypeID" CssClass="dropdown col-lg-9 col-cm-12" >
<asp:ListItem Text="اختر نوع النموذج/ القانون" Enabled="true"></asp:ListItem>
             </asp:DropDownList>
                <asp:SqlDataSource ID="sdsType" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="SELECT GuideTypeName, GuideTypeID FROM GuideTypes WHERE (GuideTypeID &gt; 3)"></asp:SqlDataSource>
             </div>
    <div class="row form-inline topMargin">
 <label class="col-form-label col-lg-3 text-nowrap">تحميل الملف: &nbsp;</label>
     <asp:FileUpload ID="uploadGuideFile" runat="server" CssClass="form-control col-lg-9 col-sm-12"  />
    </div>

    </div>
   <div class="card-footer">
    <asp:Button ID="btnSubmitDec" runat="server" Text="إدخال" OnClick="btnSubmitDec_Click" CssClass="btn btn-lg btn-info float-left" />
     </div>

</div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" InsertCommand="insertTemp" InsertCommandType="StoredProcedure" SelectCommand="SELECT TemplateName, TemplatePath FROM Templates">
	<InsertParameters>
		<asp:ControlParameter ControlID="txtTemplate" Name="TemplateName" PropertyName="Text" Type="String" />
		<asp:Parameter Name="TemplatePath" Type="String" />
	    <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
        <asp:ControlParameter ControlID="ddlType" Name="typeID" PropertyName="SelectedValue" Type="Int32" />
	</InsertParameters>
			</asp:SqlDataSource>
    <br />
    <div class="card container mx-auto topMargin">
        <div class="card-header">
            <h1 class="h1 text-center" >تعديل نموذج أو قانون</h1>
        </div>
        <div class="card-body">
 <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover"   AutoGenerateColumns="False" Style="width: 100%" FooterStyle-CssClass="pagination" ClientIDMode="Static" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowDataBound="GridView1_RowDataBound" HeaderStyle-CssClass="table-secondary" >
    <Columns>
         <asp:BoundField DataField="TemplateName" HeaderText="النموذج" SortExpression="TemplateName" />
         <asp:BoundField DataField="TemplatePath" HeaderText="مسار الملف" SortExpression="TemplatePath" />
          <asp:BoundField DataField="GuideTypeName" HeaderText="النوع" SortExpression="TemplatePath" />
         <asp:HyperLinkField DataNavigateUrlFields="TemplateID" 
                DataNavigateUrlFormatString="editTemplate.aspx?ID={0}" HeaderText="التفاصيل " 
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


    </asp:GridView></div></div>
     <script>
                $(document).ready(function () {
                    $('#<%= GridView1.ClientID %>').DataTable();
                });
            </script>
</asp:Content>

