using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_manageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DisplayRoles();
            ddlusers.DataTextField = "Username";
            ddlusers.DataSource = Membership.GetAllUsers();
            ddlremoveuser.DataTextField = "Username";
            ddlremoveuser.DataSource = Membership.GetAllUsers();
            ddldeleteusers.DataTextField = "Username";
            ddldeleteusers.DataSource = Membership.GetAllUsers();
            ddluserisinrole.DataTextField = "Username";
            ddluserisinrole.DataSource = Membership.GetAllUsers();
            //----------------------------------------------------
            ddlusers.DataBind();
            ddlremoveuser.DataBind();
            ddldeleteusers.DataBind();
            ddluserisinrole.DataBind();
            BindRoleLists();
            //----------------------------------------------
            //txtrole.Text = String.Empty;
            lblChkUser.Text = String.Empty;
        }

    }
    private void BindRoleLists()
    {
        ddlroles.DataSource = Roles.GetAllRoles();
        ddlinrole.DataSource = Roles.GetAllRoles();
        //ddlDeleteRole.DataSource = Roles.GetAllRoles();

        if (ddlremoveuser.SelectedItem != null)
        {
            ddldeletinrole.DataSource = Roles.GetRolesForUser(ddlremoveuser.SelectedItem.Text);
        }
        else
        {
            ddldeletinrole.DataSource = Roles.GetAllRoles();
        }
        ddlroles.DataBind();
        ddlinrole.DataBind();
        //ddlDeleteRole.DataBind();
        ddldeletinrole.DataBind();

    }

    //----------------- end Method-----------------------------

    //--------------------------------------------------------
    private void DisplayRoles()
    {
        GridView1.DataSource = Roles.GetAllRoles();
        GridView1.DataBind();
    }

    protected void dtnaddrole_Click(object sender, EventArgs e)
    {
        Roles.CreateRole(txtrole.Text);
        ddlroles.DataBind();
        lblAddRoles.Text = "Role was added successfully";
        txtrole.Text = String.Empty;
        BindRoleLists();
        DisplayRoles();

    }

    protected void btnaddusertorole_Click(object sender, EventArgs e)
    {
        string strusers = ddlusers.SelectedItem.Text;
        Roles.AddUserToRole(strusers, ddlroles.SelectedItem.Text);

        lbladduserstorole.Text = "The User( " + strusers + " ) Added To Role (" +
            ddlroles.SelectedItem.Text + ")  Successfully.";
        DisplayRoles();
        BindRoleLists();

    }
    protected void btnisinrole_Click(object sender, EventArgs e)
    {
        bool chkState = Roles.IsUserInRole(ddluserisinrole.SelectedItem.Text, ddlinrole.SelectedItem.Text);
        lblChkUser.Text = chkState.ToString();
        DisplayRoles();
        BindRoleLists();
    }
    protected void btndeleteuser_Click(object sender, EventArgs e)
    {
        string deleteUser = ddlremoveuser.SelectedItem.Text;
        Roles.RemoveUserFromRole(deleteUser, ddldeletinrole.SelectedItem.Text);
        lblDeleted.Text = "The User( " + deleteUser + " ) has been deleted from Role (" +
            ddldeletinrole.SelectedItem.Text + ")  Successfully.";
        DisplayRoles();
        BindRoleLists();
    }
    //protected void btnDeleteRole_Click(object sender, EventArgs e)
    //{

    //    Roles.DeleteRole(ddlDeleteRole.SelectedItem.Text);
    //    lblDeletedRole.Text = "the Role " + ddlDeleteRole.SelectedItem.Text + " has been deleted.";
    //    DisplayRoles();
    //    BindRoleLists();
    //}
    protected void btnDeleteusers_Click(object sender, EventArgs e)
    {
        Membership.DeleteUser(ddldeleteusers.SelectedItem.Text);
        lblDeleteUser.Text = "the user " + ddldeleteusers.SelectedItem.Text + " has been deleted.";
        DisplayRoles();
        BindRoleLists();
    }
    protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string strRole = Roles.GetAllRoles()[e.Row.RowIndex];
            e.Row.Cells[0].Text = strRole;
            e.Row.Cells[1].Text = string.Join(", ", Roles.GetUsersInRole(strRole));
        }
    }
    protected void btnshowusers_Click(object sender, EventArgs e)
    {
        GridView1.Visible = true;
    }
    protected void btnhide_Click(object sender, EventArgs e)
    {
        GridView1.Visible = false;
    }

    protected void ddlremoveuser_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlremoveuser.SelectedItem != null)
        {
            ddldeletinrole.DataSource = Roles.GetRolesForUser(ddlremoveuser.SelectedItem.Text);
        }
        else
        {
            ddldeletinrole.DataSource = Roles.GetAllRoles();
        }

        ddldeletinrole.DataBind();
    }
}
