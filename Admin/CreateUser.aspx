<%@ Page  Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" Title="مستخدم جديد" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>مستخدم جديد</h1>
    <div style="padding-top:20px; padding-right:100px;text-align:center;">
     <div class="card container-md" style="width:40%;">
            <div class="card-header bg-gradient-info text-white">Sign Up for Your New Account</div>      
          <div class="card-body ">  
        <asp:CreateUserWizard ID="CreateUserWizard1" runat="server" 
        RequireEmail="False" Width="503px" >
        <ContinueButtonStyle 
             CssClass="btn btn-info" />
        <CreateUserButtonStyle 
              CssClass="btn btn-info"/>
        <WizardSteps>
            <asp:CreateUserWizardStep ID="CreateUserWizardStep1" runat="server" >
                <ContentTemplate>
                    
      
                <div class="form-group-lg right text-right">
                                    <!-- ----------------------- Row Start----------------->
                                  <div class="row form-horizontal">                                         
                                      <div class="col-lg-4 text-nowrap">
 <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="control-label text-right">اسم المستخدم:</asp:Label>
                                            </div>
                                         <div class="col-lg-8">
 <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" 
                                    ControlToValidate="UserName" ErrorMessage="User Name is required." 
                                    ToolTip="User Name is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                             </div> 
                    

                                        </div>
                            <!-- ----------------------- Row End----------------->
                          <!-- ----------------------- Row Start----------------->
                                    <div class="row form-horizontal">
                                       <div class="col-lg-4 text-nowrap">
                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" CssClass="control-label text-right">كلمة السر:</asp:Label>
                                            </div>
                                         <div class="col-lg-8">
                                             <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" 
                                    ControlToValidate="Password" ErrorMessage="Password is required." 
                                    ToolTip="Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                             </div> 
                                        
                                        </div>
                            <!-- ----------------------- Row End----------------->
                          <!-- ----------------------- Row Start----------------->
                                    <div class="row form-horizontal">
                                     <div class="col-lg-4 text-nowrap text-right">
 <asp:Label ID="ConfirmPasswordLabel" runat="server" 
                                    AssociatedControlID="ConfirmPassword" CssClass="control-label ">تأكيد كلمة السر:</asp:Label>
                                            </div>          
                                         <div class="col-lg-8">
<asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" 
                                    CssClass="form-control"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" 
                                    ControlToValidate="ConfirmPassword" 
                                    ErrorMessage="Confirm Password is required." 
                                    ToolTip="Confirm Password is required." ValidationGroup="CreateUserWizard1">*</asp:RequiredFieldValidator>
                                             </div> 

                                        </div>
                            <!-- ----------------------- Row End----------------->
                          <!-- ----------------------- Row Start----------------->
                                    <div class="row form-horizontal">
                                        <div class="col-lg-3 text-nowrap text-right">
                                            </div>
                                         <div class="col-lg-8">
 <asp:CompareValidator ID="PasswordCompare" runat="server" 
                                    ControlToCompare="Password" ControlToValidate="ConfirmPassword" 
                                    Display="Dynamic" 
                                    ErrorMessage="The Password and Confirmation Password must match." 
                                    ValidationGroup="CreateUserWizard1"></asp:CompareValidator> 
                                    <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                             </div>
                                        </div>
                            <!-- ----------------------- Row End----------------->
                        </div>
            </div>
        </div>
                    

                    
                </ContentTemplate>
            </asp:CreateUserWizardStep>
            <asp:CompleteWizardStep ID="CompleteWizardStep1" runat="server" />
        </WizardSteps>
    </asp:CreateUserWizard>

    </div>
         </div>
        </div>
</asp:Content>

