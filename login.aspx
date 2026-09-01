<%@ Page Title="login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 180px;
            width: 513px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="margin:0 auto;" class=" mx-auto col-lg-6 center-block align-self-lg-center">
<%--<img alt="alert" src="App_Themes/Default/images/alert.png" style="float:right;"/>--%>
       <%-- <div class="alert-danger h3 ">
       هذه الصفحة مخصصة فقط لإدارة الموقع. 
        </div>--%>
   
<div class="topMargin">

    </div>
          <div class="card  bg-light col-lg-6 mx-auto" >
      <div class="card-header bg-gradient-info" ><h3 class="text-center text-white">تسجيل الدخول</h3></div>
        <div class="card-body">
  
           <asp:Label ID="lblUserName" CssClass="label h4" runat="server" Text="اسم المستخدم:"   Font-Size="Medium" ></asp:Label>
            <div class="input-group">

    <span class="input-group-text"><i class="fa fa-user fa-2x"></i></span>
   
   <asp:TextBox ID="txtUserName" runat="server" class="form-control  col-lg-12 " placeholder="User Name"  data-bs-toggle="tooltip" data-bs-placement="top" title=" ادخل اسم المستخدم الخاص بك للدخول على الكمبيوتر"></asp:TextBox>
          </div>  

     <div class="input-group"> <span class="input-group-addon"></span>

    
    </div>
<br />
   <asp:Label ID="lblPassword" runat="server" Text="كلمة المرور: "  CssClass="label" Font-Size="Medium"></asp:Label>
       <div class="input-group"><span class="input-group-text"><i class="fa fa-lock fa-2x"></i></span>
<asp:TextBox ID="txtPassword" runat="server" TextMode="Password" class="form-control col-lg-12 " name="password" placeholder="Password" data-bs-toggle="tooltip" data-bs-placement="top" title="ادخل كلمة المرور التى تستخدمها للدخول على الكمبيوتر" ></asp:TextBox>
        </div> 

            <br />
    <div class="card-footer">
<asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click" CssClass="btn btn-info btn-lg float-left" Text="تسجيل الدخول"  />
        </div>  
        </div>
    </div>          
     <div style="margin-right:30px;text-align:center;direction:rtl">
 <asp:Label ID="lblerror" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
 </div>  
        </div>
</asp:Content>

