using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.OleDb;
using System.IO;
using System.Web.Security;
using System.Configuration;

public partial class Admin_BulkImport : System.Web.UI.Page
{
    private const string InitialPassword = "ChangeMe123!";
    // Ensure this meets your web.config minRequiredPasswordLength/complexity settings

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (!fuExcel.HasFile)
        {
            lblError.Text = "Please select a file.";
            return;
        }

        string extension = Path.GetExtension(fuExcel.FileName).ToLower();
        string connectionString = "";
        string excelPath = Server.MapPath("~/App_Data/") + fuExcel.FileName;

        // Save file temporarily to App_Data
        fuExcel.SaveAs(excelPath);

        try
        {
            // Determine connection string based on Excel version
            if (extension == ".xls")
                connectionString = $"Provider=Microsoft.Jet.OLEDB.4.0;Data Source={excelPath};Extended Properties='Excel 8.0;HDR=YES'";
            else if (extension == ".xlsx")
                connectionString = $"Provider=Microsoft.ACE.OLEDB.12.0;Data Source={excelPath};Extended Properties='Excel 12.0 Xml;HDR=YES'";
            else
            {
                lblError.Text = "Invalid file format. Use .xls or .xlsx";
                return;
            }

            using (OleDbConnection conn = new OleDbConnection(connectionString))
            {
                conn.Open();
                // Get the first sheet name
                DataTable dtSheets = conn.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);
                string sheetName = dtSheets.Rows[0]["TABLE_NAME"].ToString();

                string query = $"SELECT * FROM [{sheetName}]";
                OleDbDataAdapter da = new OleDbDataAdapter(query, conn);
                DataTable dtUsers = new DataTable();
                da.Fill(dtUsers);

                int successCount = 0;
                int failCount = 0;
                DataTable errorLog = new DataTable();
                errorLog.Columns.Add("Row");
                errorLog.Columns.Add("UserName");
                errorLog.Columns.Add("Error");

                MembershipCreateStatus createStatus;

                foreach (DataRow row in dtUsers.Rows)
                {
                    // Skip header row if accidentally included or empty rows
                    if (string.IsNullOrWhiteSpace(row["UserName"]?.ToString())) continue;

                    string userName = row["UserName"].ToString().Trim();
                    string email = row["Email"]?.ToString().Trim() ?? $"{userName}@temp.local"; // Fallback if email missing

                    try
                    {
                        // CRITICAL: Use the API, do not INSERT SQL directly
                        MembershipUser newUser = Membership.CreateUser(
                            userName,
                            InitialPassword,
                            email,
                            null, // Password Question (null if disabled in config)
                            null, // Password Answer
                            true, // IsApproved (True so they can login immediately)
                            out createStatus
                        );

                        if (createStatus == MembershipCreateStatus.Success)
                        {
                            // Optional: Add to a specific role
                            // if (!Roles.RoleExists("StandardUser")) Roles.CreateRole("StandardUser");
                            // if (!Roles.IsUserInRole(userName, "StandardUser")) Roles.AddUserToRole(userName, "StandardUser");

                            // Optional: Store FirstName/LastName in Profile if configured
                            // ProfileBase profile = ProfileBase.Create(userName);
                            // profile.SetPropertyValue("FirstName", row["FirstName"]);
                            // profile.SetPropertyValue("LastName", row["LastName"]);
                            // profile.Save();

                            successCount++;
                        }
                        else
                        {
                            failCount++;
                            errorLog.Rows.Add(row.RowNumber, userName, $"Status: {createStatus}");
                        }
                    }
                    catch (Exception ex)
                    {
                        failCount++;
                        errorLog.Rows.Add(row.RowNumber, userName, ex.Message);
                    }
                }

                lblStatus.Text = $"Import Complete. Success: {successCount}, Failed: {failCount}";

                if (failCount > 0)
                {
                    gvErrors.DataSource = errorLog;
                    gvErrors.DataBind();
                    gvErrors.Visible = true;
                }
            }
        }
        catch (Exception ex)
        {
            lblError.Text = "System Error: " + ex.Message;
        }
        finally
        {
            // Clean up uploaded file
            if (File.Exists(excelPath))
                File.Delete(excelPath);
        }
    }

}