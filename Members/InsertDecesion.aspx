<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="InsertDecesion.aspx.cs" Inherits="InsertDecesion" Title="إدخال قرارات الهيئة" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1 style="text-align:center;">إدخال القرارات</h1>

    
     
    <div class="card col-lg-9 col-sm-12 mx-auto container">
    <div class="card-body  ">

   <div class="form-inline rowTop">
                <label class="col-form-label col-lg-2 col-sm-12">رقم القرار</label>
                <asp:TextBox ID="txtNo" runat="server" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
          </div>
<div class="form-inline rowTop">
<label class="col-form-label col-lg-2 col-sm-12">العنوان</label>
                     <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
    </div>  
<div class="form-inline rowTop"> 
 <label class="col-form-label col-lg-2 col-sm-12"> تاريخ القرار</label>   
<asp:TextBox ID="txtDate" runat="server" CssClass="form-control col-lg-6 col-sm-12" TextMode="Date"></asp:TextBox>
    </div>
<div class="form-inline rowTop">
    <label class="col-form-label col-lg-2 col-sm-12">عدد مواد القرار</label>
<asp:TextBox ID="txtsubNo" runat="server" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
    </div>
<div class="form-inline rowTop">
    <label class="col-form-label col-lg-2 col-sm-12">التصنيف</label>
                    <asp:DropDownList ID="ddlDecType" runat="server" DataSourceID="sdsDecType" 
                    DataTextField="decType" DataValueField="decTypeID" CssClass="form-control col-lg-6 col-sm-12" AppendDataBoundItems="true">
                    <asp:ListItem Text="اختر تصنيف القرار" Enabled="true"></asp:ListItem>
                </asp:DropDownList>
                <asp:SqlDataSource ID="sdsDecType" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    SelectCommand="SELECT decTypeID, decType FROM decision_Types WHERE (decTypeID NOT IN (10, 11))">
                </asp:SqlDataSource>
    </div>
   <div class="form-inline rowTop">
    <label class="col-form-label col-lg-2 col-sm-12"> الكلمات الدالة</label> 
<asp:TextBox ID="txtKeywords" runat="server" TextMode="MultiLine" CssClass="form-control col-lg-6 col-sm-12"></asp:TextBox>
       </div>
   <div class="form-inline rowTop">
    <label class="col-form-label col-lg-2 col-sm-12">   تحميل الملف</label>
                       <asp:FileUpload ID="uploadDecesion" runat="server" CssClass="form-control col-lg-4 col-sm-12" />

       </div>
     <div class="rowTop col-6 mx-auto ">                    
         <input id="Reset1" type="reset" value="reset" class="btn btn-secondary btn-lg"/>
                <asp:Button ID="btnSubmitDec" runat="server" Text="إدخال القرار" 
                    onclick="btnSubmitDec_Click" CssClass="btn btn-info btn-lg " />
         </div>
    </div>
        </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" 
                    InsertCommand="insertDecision2" InsertCommandType="StoredProcedure" 
                    SelectCommand="SELECT decNo, decTitle, decKeywords, decisionFile FROM decisions_Info">
                    <InsertParameters>
                        <asp:ControlParameter ControlID="txtNo" Name="decNo" PropertyName="Text" 
                            Type="Int32" />
                        <asp:ControlParameter ControlID="txtTitle" Name="decTitle" PropertyName="Text" 
                            Type="String" />
                        <asp:ControlParameter ControlID="txtKeywords" Name="decKeywords" 
                            PropertyName="Text" Type="String" />
                        <asp:Parameter Name="decisionFile" Type="String" />
                        <asp:ControlParameter ControlID="ddlDecType" Name="decTypeID" 
                            PropertyName="SelectedValue" Type="Int16" />
                        <asp:ControlParameter ControlID="txtDate" DbType="DateTime" Name="decDate" 
                            PropertyName="Text" />
                        <asp:ControlParameter ControlID="txtsubNo" Name="decsubjectNo" 
                            PropertyName="Text" Type="Int16" />
                    	<asp:Parameter Name="aspuser" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>

</asp:Content>

