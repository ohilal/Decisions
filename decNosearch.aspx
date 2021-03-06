<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="decNosearch.aspx.cs" Inherits="decNosearch" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
         <div class="card col-xl-4 col-lg-5 col-md-8 col-sm-12 mx-auto container  m-card-with-icon " >
         <div class="top bg-gradient-secondary card-header"><img class="icon " src="Images/numbers.svg" />
         <h2 class="text-center text-right text-white">البحث برقم القرار</h2>
 </div>

       <div class="form-group card-body text-white">
                   <%-- <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control col-3" style="right: 0px; top: 0px"></asp:TextBox>&nbsp; &nbsp; &nbsp;--%>
	   <asp:TextBox ID="txtdecNosearch" runat="server" CssClass="form-control col-lg-6 col-sm-12" placeholder="رقم القرار" required style="right: 0px; top: 0px"></asp:TextBox>
	   <br /> 
       <asp:CompareValidator ID="CompareValidator1" runat="server" Operator="DataTypeCheck" Type="Integer" 
 ControlToValidate="txtdecNosearch" ErrorMessage="أدخل رقم القرار" CssClass="alert-danger" ></asp:CompareValidator>
	    <asp:TextBox ID="txtyear" runat="server" CssClass="form-control col-lg-6 col-sm-12 yearsOnly" placeholder="سنة الإصدار" required ></asp:TextBox>&nbsp; &nbsp; &nbsp;
       <br />

	   <asp:Button 
                        ID="btnSearch" runat="server" Text="بحث" 
        onclick="btnSearch_Click" CssClass="btn btn-lg btn-info col-lg-2 float-left" />&nbsp; <asp:Label ID="lblSearch" runat="server" ></asp:Label>
       </div>
    <div></div></div><br />
       <div class="container-fluid">
         <asp:Label ID="noDataLabel" runat="server" Text="   " />
         <asp:DataList ID="DataList1" runat="server" DataKeyField="decID" DataSourceID="sdsdecNO" BorderColor="Silver" 
            BorderWidth="1px"  GridLines="Both" RepeatColumns="2" 
            Width="80%">
			 <ItemTemplate>
				<%-- decID:
				 <asp:Label ID="decIDLabel" runat="server" Text='<%# Eval("decID") %>' />
					<br /> 
					--%>
				 <h4 class="text-info">
				 <asp:Label ID="decTitleLabel" runat="server" Text='<%# Eval("decTitle") %>' /></h4>
				 
		 قرار رقم: 
				 <asp:Label ID="decNoLabel" runat="server" Text='<%# Eval("decNo") %>' />
				 <br />
				 تاريخ القرار:
				 <asp:Label ID="decDateLabel" runat="server" Text='<%# Eval("decDate", "{0:dd/MM/yyyy}") %>' CssClass="text-right"/>
				 <br />نوع القرار:
				 <asp:Label ID="decTypeLabel" runat="server" Text='<%# Eval("decType") %>' />
                
				 <br />
				 ملف القرار:
                 <a href="#" onclick='window.open(&#039;UploadedDecisions/<%#Eval("decisionFile")%>&#039;)'><i class="far fa-file-pdf fa-2x text-info" title="فتح الملف"></i></a>
				 <br />
<%--                 <asp:Button ID="Button1" runat="server" Text="Button" CssClass="btn btn-info" PostBackUrl="~/Members/editdetails.aspx" />--%>

			 </ItemTemplate>
		 </asp:DataList>
         <asp:SqlDataSource ID="sdsdecNO" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" SelectCommand="decNOsearch" SelectCommandType="StoredProcedure">
			 <SelectParameters>
				 <asp:ControlParameter ControlID="txtdecNosearch" Name="searchNO" PropertyName="Text" Type="Int32" />
				 <asp:ControlParameter ControlID="txtyear" Name="decDate" PropertyName="Text" Type="Int32" />
			 </SelectParameters>
		 </asp:SqlDataSource>
        </div>
         
            

<%-----------------------igTabs-------------------------------- --%>

</asp:Content>