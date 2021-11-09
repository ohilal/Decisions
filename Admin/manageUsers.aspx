<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="manageUsers.aspx.cs" Inherits="Admin_manageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div style="padding-top:20px; padding-right:15px; font-size:small; height:550px; margin:0 25px;">
   <table style="width:75%;" cellspacing="5" dir="ltr" cellpadding="2" class="table table-striped  table-responsive ">
        <tr>
            <td colspan="2">
                <asp:Label ID="lblAddRoles" runat="server"></asp:Label>
              </td>
            
            <td>
                
                <asp:TextBox ID="txtrole" runat="server" Width="317px"></asp:TextBox>
            </td>
            <td colspan="2">
                <asp:Button ID="dtnaddrole" runat="server" Text="Add Role" 
                    onclick="dtnaddrole_Click" CssClass="btn btn-info" /> 
                                </td>
       </tr>
        <tr>
            
            <td>Select User &nbsp; &nbsp;</td>
            
            <td><asp:DropDownList ID="ddlusers" runat="server" Width="100px">
                
                </asp:DropDownList>
               
            </td>
            <td >
                Select Role &nbsp;</td>
            <td >
                <asp:DropDownList ID="ddlroles" runat="server" Width="100px">
                </asp:DropDownList>
                </td>
            <td> 
                <asp:Button ID="btnaddusertorole" runat="server" Text="Add User to role" 
                    onclick="btnaddusertorole_Click" CssClass="btn btn-info" Width="165px" />
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <asp:Label ID="lbladduserstorole" runat="server" Font-Bold="True" 
                    ForeColor="#3333CC" BackColor="#CCFFCC" ></asp:Label>
            </td>
        </tr>
        <tr>
            
            <td>Check User &nbsp; &nbsp;&nbsp;</td>
            
            <td><asp:DropDownList ID="ddluserisinrole" runat="server" Width="100px">
                </asp:DropDownList>
                
            </td>
            <td class="style1">
                Is in Role &nbsp; &nbsp;&nbsp;</td>
            <td class="style1">
                <asp:DropDownList ID="ddlinrole" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
            <td><asp:Button ID="btnisinrole" runat="server" Text="Check User" 
                    onclick="btnisinrole_Click" CssClass="btn btn-info" Width="165px" />
                
            </td>
        </tr>
        <tr>
            <td colspan="5" align="center">
                <asp:Label ID="lblChkUser" runat="server" Font-Bold="True" ForeColor="#3333CC" 
                    BackColor="#CCFFCC" ></asp:Label>  </td>
        </tr>
        <tr>
            
            <td nowrap="nowrap">Remove User 
                
            </td>
            
            <td> <asp:DropDownList ID="ddlremoveuser" runat="server" Width="100px" 
                    AutoPostBack="True" onselectedindexchanged="ddlremoveuser_SelectedIndexChanged">
                </asp:DropDownList>
                
            </td>
            <td class="style1">
                From Role &nbsp; &nbsp;</td>
            <td class="style1">
                <asp:DropDownList ID="ddldeletinrole" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
            <td>
              <asp:Button ID="btndeleteuser" runat="server" Text="Remove User From Role" 
                    CssClass="btn btn-info" onclick="btndeleteuser_Click" />  
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <%--<asp:Label ID="lblDeletedRole" runat="server" ></asp:Label>--%>
            </td>
           <td colspan="2">
              <%--   <asp:Button ID="btnDeleteRole" runat="server" Text="DeleteRole" 
                    CssClass="buttonStyle" onclick="btnDeleteRole_Click" Width="157px" />--%>
            </td>
             <td class="style1">
                <%-- <asp:DropDownList ID="ddlDeleteRole" runat="server">
                </asp:DropDownList>--%>
            </td>
           
        </tr>
        <tr>
            <td colspan="5" align="center">
                <asp:Label ID="lblDeleted" runat="server" BackColor="#CCFFCC" Font-Bold="True" 
                    ForeColor="#3333CC" ></asp:Label>  
                
            </td>
        </tr>
        
        <tr>
            
            <td colspan="2">
                
            </td>
            <td class="style1" nowrap="nowrap">
                Delete User: 
            </td>
            <td class="style1">
				<asp:DropDownList ID="ddldeleteusers" runat="server" Width="100px">
                </asp:DropDownList>
            </td>
            <td>
               <asp:Button ID="btnDeleteusers" runat="server" CssClass="btn btn-danger" 
                    Text="Delete User" onclick="btnDeleteusers_Click" Width="165px" /> </td>
        </tr>
        
        <tr>
            <td colspan="5" align="center">
                <asp:Label ID="lblDeleteUser" runat="server" BackColor="#CCFFCC" 
                    Font-Bold="True" ForeColor="#3333CC" ></asp:Label>
                
            </td>
        </tr>
        
        <tr>
            
            <td colspan="2"><asp:Button ID="Button1" runat="server" Text="Create User" 
                    CssClass="buttonStyle" PostBackUrl="~/Admin/CreateUser.aspx" Width="165px" />
                
            </td>
            <td class="style1" colspan="2" align="right">
                <asp:Button ID="btnshowusers" runat="server" Text="Show Users in Roles" 
                    CssClass="buttonStyle" onclick="btnshowusers_Click" Width="165px" />
            </td>
            <td align="left">
                <asp:Button ID="btnhide" runat="server" CssClass="buttonStyle" Height="30px" 
                    onclick="btnhide_Click" Text="Hide User Role" Width="165px" />
                </td>
        </tr>
        
    </table>  
    
    <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            onrowcreated="GridView1_RowCreated" Visible="False"  
            Width="500px" HorizontalAlign="Left" CellPadding="7" ForeColor="#333333" cellspacing="5"
             GridLines="None" CssClass="table table-striped table-bordered table-responsive-sm table-hover" Style="margin:0 25%;">
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <RowStyle BackColor="#EFF3FB" />
            <Columns>
                <asp:BoundField HeaderText="roles" />
                <asp:BoundField HeaderText="Users in Roles" />
            </Columns>
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <HeaderStyle CssClass="bg-gradient-secondary text-white" Font-Bold="True"  />
            <EditRowStyle BackColor="#2461BF" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        
    </div>
</asp:Content>

