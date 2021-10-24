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
    <div style="margin:0 auto;" class="col-lg-4 col-sm-12 mx-auto">
<%--<img alt="alert" src="App_Themes/Default/images/alert.png" style="float:right;"/>--%>
    <asp:Login ID="Login1" runat="server" BackColor="#e3e3e3" BorderColor="#f37121" 
        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" 
         ForeColor="Black" LoginButtonText="دخول" 
        PasswordLabelText=" كلمة السر:" PasswordRequiredErrorMessage="ادخل كلمة السر." 
        RememberMeText=" تذكر بياناتى ." TextLayout="TextOnTop" TitleText="تسجيل الدخول" 
        UserNameLabelText=" اسم المستخدم:" 
        UserNameRequiredErrorMessage="ادخل اسم المستخدم." Width="513px" 
        Font-Size="Medium" 
        Height="180px">
        <CheckBoxStyle Font-Names="Tahoma, Arial, Arabic Transparent" />
        <TextBoxStyle Font-Size="0.8em" Width="350px" />
        <LayoutTemplate>
            <table cellpadding="4" cellspacing="0" style="border-collapse:collapse;">
                <tr>
                    <td>
                        <table cellpadding="0" class="auto-style1">
                            <tr>
                                <td align="center" class="bg-gradient-info" style="font-weight:bold; color:#fff;">تسجيل الدخول</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="col-form-label"> اسم المستخدم:</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="ادخل اسم المستخدم." ToolTip="ادخل اسم المستخدم." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="col-form-label"> كلمة السر:</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:TextBox ID="Password" runat="server"  TextMode="Password" CssClass="form-control"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="ادخل كلمة السر." ToolTip="ادخل كلمة السر." ValidationGroup="Login1">*</asp:RequiredFieldValidator>
                                </td>
                            </tr>
                            <tr>
                                <td style="font-family:Tahoma,Arial,Arabic Transparent;">
                                    <asp:CheckBox ID="RememberMe" runat="server" Text="&nbsp;  تذكر بياناتى  . " />
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="color:Red;">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </td>
                            </tr>
                            <tr>
                                <td align="right">
                                    <asp:Button ID="LoginButton" runat="server" BorderStyle="Solid" BorderWidth="1px" CommandName="Login" CssClass="btn btn-info btn-lg float-left" Font-Bold="True"  Text="دخول" ValidationGroup="Login1" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </LayoutTemplate>
        <LoginButtonStyle CssClass="btn btn-info btn-lg" BorderStyle="Solid" 
            BorderWidth="1px" Font-Size="0.8em"  Font-Bold="true" />
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <TitleTextStyle Font-Bold="True"  
            CssClass="bg-gradient-info" BackColor="#fff" />
    </asp:Login>
    </div>
</asp:Content>

