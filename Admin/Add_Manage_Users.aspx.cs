using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Add_Manage_Users : System.Web.UI.Page
{
    private string connString;

    protected void Page_Load(object sender, EventArgs e)
    {
        // ✅ التحقق من أن المستخدم مسجل دخول وهو Admin
        if (!User.Identity.IsAuthenticated)
        {
            Response.Redirect("~/Login.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Request.RawUrl));
            return;
        }

        // التحقق من الصلاحية (Admin فقط)
        if (!AuthHelper.IsAdmin())
        {
            Response.Redirect("~/UnauthorizedAccess.aspx");
            return;
        }

        connString = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;

        if (!IsPostBack)
        {
            LoadUsers();
            LoadStats();
        }
    }

    /// <summary>
    /// تحميل قائمة المستخدمين
    /// </summary>
    private void LoadUsers(string searchTerm = "")
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = @"SELECT ID, UserName, RoleName, IsActive, CreatedDate, CreatedBy 
                              FROM UserRoles";

                if (!string.IsNullOrEmpty(searchTerm))
                {
                    sql += " WHERE UserName LIKE @search OR RoleName LIKE @search";
                }

                sql += " ORDER BY CreatedDate DESC";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    if (!string.IsNullOrEmpty(searchTerm))
                    {
                        cmd.Parameters.AddWithValue("@search", "%" + searchTerm + "%");
                    }

                    using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();
                        da.Fill(dt);
                        gvUsers.DataSource = dt;
                        gvUsers.DataBind();
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ShowMessage("danger", "خطأ في تحميل البيانات: " + ex.Message);
        }
    }

    /// <summary>
    /// تحميل الإحصائيات
    /// </summary>
    private void LoadStats()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = @"SELECT 
                                COUNT(*) AS Total,
                                SUM(CASE WHEN RoleName = 'Admin' THEN 1 ELSE 0 END) AS Admins,
                                SUM(CASE WHEN RoleName = 'Member' THEN 1 ELSE 0 END) AS Members,
                                SUM(CASE WHEN IsActive = 1 THEN 1 ELSE 0 END) AS Active
                              FROM UserRoles";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            lblTotalUsers.Text = reader["Total"].ToString();
                            lblAdmins.Text = reader["Admins"].ToString();
                            lblMembers.Text = reader["Members"].ToString();
                            lblActive.Text = reader["Active"].ToString();
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            System.Diagnostics.Debug.WriteLine("Stats Error: " + ex.Message);
        }
    }

    /// <summary>
    /// إضافة مستخدم جديد
    /// </summary>
    protected void btnAddUser_Click(object sender, EventArgs e)
    {
        string userName = txtNewUserName.Text.Trim();
        string roleName = ddlNewRole.SelectedValue;
        bool isActive = chkNewActive.Checked;

        // التحقق من صحة المدخلات
        if (string.IsNullOrEmpty(userName))
        {
            lblNewError.Text = "اسم المستخدم مطلوب";
            return;
        }

        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // التحقق من عدم وجود المستخدم مسبقاً
                string checkSql = "SELECT COUNT(*) FROM UserRoles WHERE UserName = @userName";
                using (SqlCommand checkCmd = new SqlCommand(checkSql, conn))
                {
                    checkCmd.Parameters.AddWithValue("@userName", userName);
                    conn.Open();
                    int count = (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        lblNewError.Text = "اسم المستخدم موجود مسبقاً";
                        return;
                    }
                }

                // إضافة المستخدم
                string insertSql = @"INSERT INTO UserRoles (UserName, RoleName, IsActive, CreatedDate, CreatedBy) 
                                    VALUES (@userName, @roleName, @isActive, GETDATE(), @createdBy)";

                using (SqlCommand insertCmd = new SqlCommand(insertSql, conn))
                {
                    insertCmd.Parameters.AddWithValue("@userName", userName);
                    insertCmd.Parameters.AddWithValue("@roleName", roleName);
                    insertCmd.Parameters.AddWithValue("@isActive", isActive);
                    insertCmd.Parameters.AddWithValue("@createdBy", AuthHelper.GetCurrentFullUsername());

                    insertCmd.ExecuteNonQuery();
                }
            }

            ShowMessage("success", "تم إضافة المستخدم '" + userName + "' بنجاح");
            ClearAddForm();
            LoadUsers();
            LoadStats();
        }
        catch (Exception ex)
        {
            lblNewError.Text = "خطأ: " + ex.Message;
        }
    }

    /// <summary>
    /// تحديث مستخدم
    /// </summary>
    //protected void btnUpdateUser_Click(object sender, EventArgs e)
    //{
    //    int id = 0;
    //    if (!int.TryParse(hfEditId.Value, out id))
    //    {
    //        lblEditError.Text = "معرف المستخدم غير صحيح";
    //        return;
    //    }

    //    string userName = txtEditUserName.Text.Trim();
    //    string roleName = ddlEditRole.SelectedValue;
    //    bool isActive = chkEditActive.Checked;

    //    if (string.IsNullOrEmpty(userName))
    //    {
    //        lblEditError.Text = "اسم المستخدم مطلوب";
    //        return;
    //    }

    //    try
    //    {
    //        using (SqlConnection conn = new SqlConnection(connString))
    //        {
    //            // التحقق من عدم وجود اسم المستخدم مستخدم لمستخدم آخر
    //            string checkSql = "SELECT COUNT(*) FROM UserRoles WHERE UserName = @userName AND ID <> @id";
    //            using (SqlCommand checkCmd = new SqlCommand(checkSql, conn))
    //            {
    //                checkCmd.Parameters.AddWithValue("@userName", userName);
    //                checkCmd.Parameters.AddWithValue("@id", id);
    //                conn.Open();
    //                int count = (int)checkCmd.ExecuteScalar();

    //                if (count > 0)
    //                {
    //                    lblEditError.Text = "اسم المستخدم موجود مسبقاً لمستخدم آخر";
    //                    return;
    //                }
    //            }

    //            // تحديث المستخدم
    //            string updateSql = @"UPDATE UserRoles 
    //                                SET UserName = @userName, 
    //                                    RoleName = @roleName, 
    //                                    IsActive = @isActive,
    //                                    ModifiedDate = GETDATE(),
    //                                    ModifiedBy = @modifiedBy
    //                                WHERE ID = @id";

    //            using (SqlCommand updateCmd = new SqlCommand(updateSql, conn))
    //            {
    //                updateCmd.Parameters.AddWithValue("@userName", userName);
    //                updateCmd.Parameters.AddWithValue("@roleName", roleName);
    //                updateCmd.Parameters.AddWithValue("@isActive", isActive);
    //                updateCmd.Parameters.AddWithValue("@modifiedBy", AuthHelper.GetCurrentFullUsername());
    //                updateCmd.Parameters.AddWithValue("@id", id);

    //                updateCmd.ExecuteNonQuery();
    //            }
    //        }

    //        ShowMessage("success", "تم تحديث بيانات المستخدم بنجاح");
    //        LoadUsers();
    //        LoadStats();

    //        // إغلاق Modal عبر JavaScript
    //        ScriptManager.RegisterStartupScript(this, GetType(), "closeEditModal",
    //            "$('#editUserModal').modal('hide');", true);
    //    }
    //    catch (Exception ex)
    //    {
    //        lblEditError.Text = "خطأ: " + ex.Message;
    //    }
    //}

    /// <summary>
    /// معالجة أوامر GridView (حذف، تفعيل/تعطيل)
    /// </summary>
    protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "DeleteUser")
        {
            int id = 0;
            if (int.TryParse(e.CommandArgument.ToString(), out id))
            {
                DeleteUser(id);
            }
        }
        else if (e.CommandName == "ToggleStatus")
        {
            int id = 0;
            if (int.TryParse(e.CommandArgument.ToString(), out id))
            {
                // ✅ جلب الحالة الحالية من قاعدة البيانات
                ToggleUserStatus(id);
            }
        }
        else if (e.CommandName == "EditUser")
        {
            int id = 0;
            if (int.TryParse(e.CommandArgument.ToString(), out id))
            {
                // ✅ تحميل بيانات المستخدم وفتح Modal
                LoadUserForEdit(id);
            }
        }
    }
    /// <summary>
    /// تحميل بيانات المستخدم للتعديل وفتح Modal
    /// </summary>
    private void LoadUserForEdit(int id)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = "SELECT UserName, RoleName, IsActive FROM UserRoles WHERE ID = @id";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            // ✅ تخزين البيانات في HiddenFields
                            hfEditId.Value = id.ToString();
                            hfEditUserName.Value = reader["UserName"].ToString();
                            hfEditRole.Value = reader["RoleName"].ToString();
                            hfEditIsActive.Value = reader["IsActive"].ToString();

                            // ✅ ملء controls في Modal
                            txtEditUserName.Text = reader["UserName"].ToString();
                            ddlEditRole.SelectedValue = reader["RoleName"].ToString();
                            chkEditActive.Checked = Convert.ToBoolean(reader["IsActive"]);

                            // ✅ فتح Modal عبر JavaScript
                            ScriptManager.RegisterStartupScript(this, GetType(), "openEditModal",
                                "$('#editUserModal').modal('show');", true);
                        }
                    }
                }
            }
        }
        catch (Exception ex)
        {
            ShowMessage("danger", "خطأ في تحميل بيانات المستخدم: " + ex.Message);
        }
    }

    /// <summary>
    /// تبديل حالة المستخدم (نشط/معطل)
    /// </summary>
    private void ToggleUserStatus(int id)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // ✅ جلب الحالة الحالية
                string checkSql = "SELECT IsActive FROM UserRoles WHERE ID = @id";
                bool currentStatus = false;

                using (SqlCommand checkCmd = new SqlCommand(checkSql, conn))
                {
                    checkCmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    object result = checkCmd.ExecuteScalar();
                    if (result != null && result != DBNull.Value)
                    {
                        currentStatus = Convert.ToBoolean(result);
                    }
                }

                // ✅ تبديل الحالة
                bool newStatus = !currentStatus;
                string updateSql = @"UPDATE UserRoles 
                                SET IsActive = @isActive
                                   -- , ModifiedDate = GETDATE(),
                                  --  ModifiedBy = @modifiedBy
                                WHERE ID = @id";

                using (SqlCommand updateCmd = new SqlCommand(updateSql, conn))
                {
                    updateCmd.Parameters.AddWithValue("@isActive", newStatus);
                   // updateCmd.Parameters.AddWithValue("@modifiedBy", AuthHelper.GetCurrentFullUsername());
                    updateCmd.Parameters.AddWithValue("@id", id);
                    updateCmd.ExecuteNonQuery();
                }

                string statusText = newStatus ? "تفعيل" : "تعطيل";
                ShowMessage("success", "تم " + statusText + " المستخدم بنجاح");
                LoadUsers();
                LoadStats();
            }
        }
        catch (Exception ex)
        {
            ShowMessage("danger", "خطأ: " + ex.Message);
        }
    }

    /// <summary>
    /// تحديث بيانات المستخدم
    /// </summary>
    protected void btnUpdateUser_Click(object sender, EventArgs e)
    {
        int id = 0;
        if (!int.TryParse(hfEditId.Value, out id))
        {
            lblEditError.Text = "معرف المستخدم غير صحيح";
            return;
        }

        string userName = txtEditUserName.Text.Trim();
        string roleName = ddlEditRole.SelectedValue;
        bool isActive = chkEditActive.Checked;

        if (string.IsNullOrEmpty(userName))
        {
            lblEditError.Text = "اسم المستخدم مطلوب";
            return;
        }

        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                // التحقق من عدم وجود اسم المستخدم مستخدم لمستخدم آخر
                string checkSql = "SELECT COUNT(*) FROM UserRoles WHERE UserName = @userName AND ID <> @id";
                using (SqlCommand checkCmd = new SqlCommand(checkSql, conn))
                {
                    checkCmd.Parameters.AddWithValue("@userName", userName);
                    checkCmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    int count = (int)checkCmd.ExecuteScalar();

                    if (count > 0)
                    {
                        lblEditError.Text = "اسم المستخدم موجود مسبقاً لمستخدم آخر";
                        ScriptManager.RegisterStartupScript(this, GetType(), "reopenEditModal",
                            "$('#editUserModal').modal('show');", true);
                        return;
                    }
                }

                // ✅ تحديث المستخدم - بدون ModifiedDate و ModifiedBy
                string updateSql = @"UPDATE UserRoles 
                                SET UserName = @userName, 
                                    RoleName = @roleName, 
                                    IsActive = @isActive
                                WHERE ID = @id";

                using (SqlCommand updateCmd = new SqlCommand(updateSql, conn))
                {
                    updateCmd.Parameters.AddWithValue("@userName", userName);
                    updateCmd.Parameters.AddWithValue("@roleName", roleName);
                    updateCmd.Parameters.AddWithValue("@isActive", isActive);
                    updateCmd.Parameters.AddWithValue("@id", id);

                    updateCmd.ExecuteNonQuery();
                }
            }

            ShowMessage("success", "تم تحديث بيانات المستخدم بنجاح");
            LoadUsers();
            LoadStats();

            ScriptManager.RegisterStartupScript(this, GetType(), "closeEditModal",
                "$('#editUserModal').modal('hide');", true);
        }
        catch (Exception ex)
        {
            lblEditError.Text = "خطأ: " + ex.Message;
            ScriptManager.RegisterStartupScript(this, GetType(), "reopenEditModal",
                "$('#editUserModal').modal('show');", true);
        }
    }
    /// <summary>
    /// حذف مستخدم
    /// </summary>
    private void DeleteUser(int id)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = "DELETE FROM UserRoles WHERE ID = @id";
                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            ShowMessage("success", "تم حذف المستخدم بنجاح");
            LoadUsers();
            LoadStats();
        }
        catch (Exception ex)
        {
            ShowMessage("danger", "خطأ في الحذف: " + ex.Message);
        }
    }

    /// <summary>
    /// تفعيل/تعطيل مستخدم
    /// </summary>
    private void ToggleUserStatus(int id, bool newStatus)
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(connString))
            {
                string sql = @"UPDATE UserRoles 
                              SET IsActive = @isActive 
                                 -- ,ModifiedDate = GETDATE(),
                                 -- ModifiedBy = @modifiedBy
                              WHERE ID = @id";

                using (SqlCommand cmd = new SqlCommand(sql, conn))
                {
                    cmd.Parameters.AddWithValue("@isActive", newStatus);
                  // cmd.Parameters.AddWithValue("@modifiedBy", AuthHelper.GetCurrentFullUsername());
                    cmd.Parameters.AddWithValue("@id", id);
                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            string statusText = newStatus ? "تفعيل" : "تعطيل";
            ShowMessage("success", "تم " + statusText + " المستخدم بنجاح");
            LoadUsers();
            LoadStats();
        }
        catch (Exception ex)
        {
            ShowMessage("danger", "خطأ: " + ex.Message);
        }
    }

    /// <summary>
    /// البحث
    /// </summary>
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string searchTerm = txtSearch.Text.Trim();
        LoadUsers(searchTerm);
    }

    /// <summary>
    /// مسح البحث
    /// </summary>
    protected void btnClearSearch_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        LoadUsers("");  // ✅ الأهم: تحميل جميع المستخدمين بدون بحث
    }

    /// <summary>
    /// تنسيق الصفوف عند ربط البيانات
    /// </summary>
    protected void gvUsers_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    // يمكن إضافة تنسيقات إضافية هنا
        //}
    }

    /// <summary>
    /// إرجاع كلاس CSS للدور
    /// </summary>
    protected string GetRoleBadgeClass(string roleName)
    {
        switch (roleName.ToLower())
        {
            case "admin":
                return "role-badge-admin";
            case "member":
                return "role-badge-member";
            
            default:
                return "role-badge-reader";
        }
    }

    /// <summary>
    /// عرض رسالة
    /// </summary>
    private void ShowMessage(string type, string message)
    {
        pnlMessage.Visible = true;
        divMessage.Attributes["class"] = "alert alert-" + type + " alert-dismissible fade show";
        divMessage.InnerHtml = message +
            "<button type='button' class='close' data-dismiss='alert'><span>&times;</span></button>";
    }

    /// <summary>
    /// مسح نموذج الإضافة
    /// </summary>
    private void ClearAddForm()
    {
        txtNewUserName.Text = "";
        ddlNewRole.SelectedIndex = 0;
        chkNewActive.Checked = true;
        lblNewError.Text = "";
    }
}