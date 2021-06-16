<%@ Page Title="login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-right:100px;">
<%--<img alt="alert" src="App_Themes/Default/images/alert.png" style="float:right;"/>--%>
    <asp:Login ID="Login1" runat="server" BackColor="#CCCCCC" BorderColor="#99BF46" 
        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
         ForeColor="Black" LoginButtonText="دخول" 
        PasswordLabelText=" كلمة السر:" PasswordRequiredErrorMessage="ادخل كلمة السر." 
        RememberMeText=" تذكر بياناتى ." TextLayout="TextOnTop" TitleText="تسجيل الدخول" 
        UserNameLabelText=" اسم المستخدم:" 
        UserNameRequiredErrorMessage="ادخل اسم المستخدم." Width="513px" 
        Font-Names="Tahoma, Arial, Arabic Transparent" Font-Size="Medium" 
        Height="180px">
        <CheckBoxStyle Font-Names="Tahoma, Arial, Arabic Transparent" />
        <TextBoxStyle Font-Size="0.8em" Width="350px" />
        <LoginButtonStyle BackColor="#99bf46" BorderColor="#C5BBAF" BorderStyle="Solid" 
            BorderWidth="1px" Font-Names="Tahoma, Arial, Arabic Transparent" Font-Size="0.8em" ForeColor="black" Width="75px" Font-Bold="true" />
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <TitleTextStyle BackColor="#99BF46" Font-Bold="True" Font-Size="0.9em" 
            ForeColor="White" />
    </asp:Login>
    </div>
</asp:Content>

