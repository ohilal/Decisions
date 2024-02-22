<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="insertInstruction.aspx.cs" Inherits="Members_insertInstruction" %>

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
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <h1 style="text-align:center;" class="h1">&nbsp;تعليمات</h1>
<asp:LoginView ID="LoginView1" runat="server">
    <LoggedInTemplate>
        مرحبا..<asp:LoginName ID="LoginName1" runat="server" />
        <br />
        <asp:LoginStatus ID="LoginStatus1" runat="server" />
    </LoggedInTemplate>
</asp:LoginView>
    
    <div class="card col-lg-6 col-sm-12 mx-auto container">
        <div class="card-header">
            <h2 class="text-center text-info">إدخال التعليمات</h2>
        </div>
        <div class="card-body">
        <div class="form-group ">
            <label for="txtTitle">العنوان</label>
            <asp:TextBox runat="server" id="txtTitle" CssClass="form-control"></asp:TextBox>
        </div>
           
        <div class="form-group">
            <label for="txtDate">تاريخ القرار</label>
 <asp:TextBox runat="server" id="txtDate"  CssClass="form-control" TextMode="Date"></asp:TextBox>  
        </div>
 <div class="form-group">
     <label for="txtKeywords">الكلمات الدالة</label>
     <asp:TextBox runat="server" id="txtKeywords"  CssClass="form-control" TextMode="MultiLine" ></asp:TextBox>
    </div>
 <div class="form-group">
  <asp:FileUpload ID="uploadInstructionFile" runat="server" CssClass="form-control" />
     </div>
    </div>
        <div class="card-footer">
              <input id="Reset1" type="reset" value="reset" class="btn btn-secondary btn-lg"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                <asp:Button ID="btnSubmitDec" runat="server" Text="إدخال " 
                    onclick="btnSubmitDec_Click" CssClass="btn btn-info btn-lg" />
        </div>
    </div>
 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dataBankConnectionString %>" InsertCommand="insertInstruction" InsertCommandType="StoredProcedure" SelectCommand="SELECT InstructionsData.title, decision_Types.decType, InstructionsData.insDate, InstructionsData.insFile, InstructionsData.insKeywords, InstructionsData.ID FROM decision_Types INNER JOIN InstructionsData ON decision_Types.decTypeID = InstructionsData.insType">
                    <InsertParameters>
                        <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
                        <asp:ControlParameter ControlID="txtTitle" Name="Title" PropertyName="Text" Type="String" />
                        <asp:ControlParameter ControlID="txtDate" DbType="Date" Name="insDate" PropertyName="Text" />
                        <asp:Parameter Name="insFile" Type="String" />
                        <asp:ControlParameter ControlID="txtKeywords" Name="insKeywords" PropertyName="Text" Type="String" />
                        <asp:Parameter Name="aspUser" Type="String" />
                    </InsertParameters>
                </asp:SqlDataSource>
				<div class="card col-12">
        <div class="card-header">
            <h1 class="h1 text-center" >تعديل التعليمات</h1>
        </div>
        <div class="card-body">
 <div class="row">         
 <asp:GridView ID="GridView1" runat="server" CssClass="table table-bordered table-striped table-hover"   
     AutoGenerateColumns="False" Style="width: 100%" FooterStyle-CssClass="pagination" ClientIDMode="Static" 
     OnSelectedIndexChanged="GridView1_SelectedIndexChanged" 
     OnRowDataBound="GridView1_RowDataBound" HeaderStyle-CssClass="table-secondary" DataKeyNames="ID" >
     <Columns>
         <asp:BoundField DataField="ID" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" Visible="False"  />
         <asp:BoundField DataField="title" HeaderText="العنوان" SortExpression="title" />
         <asp:BoundField DataField="decType" HeaderText="decType" SortExpression="decType" />
         <asp:BoundField DataField="insDate" HeaderText="تاريخ القرار" SortExpression="insDate" DataFormatString="{0:dd/MMM/yyyy}" />
         <asp:TemplateField HeaderText="مسار الملف" SortExpression="insFile">
             <EditItemTemplate>
                 <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("insFile") %>'></asp:TextBox>
             </EditItemTemplate>
             <ItemTemplate>
                <%-- <asp:Label ID="Label1" runat="server" Text='<%# Bind("insFile") %>'></asp:Label>--%>
                   <a href="#" onclick="window.open('/InstructionData/<%#Eval("insFile")%>')" >
                      <i class="far fa-file-pdf fa-2x text-info"></i>&nbsp;
                       <asp:Label ID="Label2" runat="server" Text='<%# Bind("insFile") %>'></asp:Label>
             </a>
             </ItemTemplate>
         </asp:TemplateField>
         <asp:BoundField DataField="insKeywords" HeaderText="الكلمات الدالة" SortExpression="insKeywords" />
                  <asp:HyperLinkField DataNavigateUrlFields="ID" 
                DataNavigateUrlFormatString="editInstruction.aspx?ID={0}" HeaderText="التفاصيل " 
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


    </asp:GridView></div>  
					</div></div>
         
	<script>
                $(document).ready(function () {
                    $('#<%= GridView1.ClientID %>').DataTable();
                });
    </script>
</asp:Content>

