using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Members_insertInstruction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		txtTitle.Text = String.Empty;
		txtKeywords.Text = String.Empty;
		txtDate.Text = String.Empty;
		uploadInstructionFile.Dispose();
		
		if (!IsPostBack)
        {

            this.SelectAll();
        }
        string UpPath;
        //UpPath = "C:\\InstructionData";
        //if (!Directory.Exists(UpPath))
        //{
        //    Directory.CreateDirectory("C:\\InstructionData\\");
        //}

    }
	protected void btnSubmitDec_Click(object sender, EventArgs e)
	{

		if (uploadInstructionFile.HasFile)
		{
			string filepath = uploadInstructionFile.PostedFile.FileName;
			string filename = Path.GetFileName(filepath);
			string ext = Path.GetExtension(filename);
			SqlDataSource1.InsertParameters["insFile"].DefaultValue = filename;
		}
		uploadInstructionFile.SaveAs(Server.MapPath("~/InstructionData/") +uploadInstructionFile.FileName);
		//uncomment the following on the server
		//uploadInstructionFile.SaveAs(Server.MapPath("~/../InstructionData/") + uploadInstructionFile.FileName);
		SqlDataSource1.InsertParameters["aspuser"].DefaultValue = Page.User.Identity.Name;
		//Response.Write(txtDate.Text);
		SqlDataSource1.Insert();
		txtTitle.Text = String.Empty;
		txtKeywords.Text = String.Empty;
		txtDate.Text = String.Empty;
		uploadInstructionFile.Dispose();
		Response.Redirect("~/success.aspx");
	}
	private void SelectAll()
	{
		string constr = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;
		using (SqlConnection con = new SqlConnection(constr))
		{
			using (SqlCommand cmd = new SqlCommand())
			{
				string sql = "SELECT InstructionsData.ID, InstructionsData.title, InstructionsData.insDate, InstructionsData.insFile, InstructionsData.insKeywords FROM InstructionsData";
				cmd.CommandText = sql;
				cmd.Connection = con;
				using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
				{
					DataTable dt = new DataTable();
					sda.Fill(dt);
					GridView1.DataSource = dt;
					GridView1.DataBind();
				}
			}
		}

	}


	protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.Header)
		{
			//add the thead and tbody section programatically
			e.Row.TableSection = TableRowSection.TableHeader;
		}

	}

	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{
		this.SelectAll();
	}
	protected void OnDataBound(object sender, EventArgs e)
	{
		GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
		
		GridView1.HeaderRow.Parent.Controls.AddAt(1, row);

	}

	protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		GridView1.PageIndex = e.NewPageIndex;

		this.SelectAll();
	}

	protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
	{
		this.SelectAll();
		DataTable m_DataTable = GridView1.DataSource as DataTable;
		if (m_DataTable != null)
		{
			DataView m_DataView = new DataView(m_DataTable);
			m_DataView.Sort = e.SortExpression;
			GridView1.DataSource = m_DataView;
			GridView1.DataBind();

		}
	}
	protected void btnDel_Click(object sender, EventArgs e)
	{
		Button btn = sender as Button;
		GridViewRow row = btn.NamingContainer as GridViewRow;

		int id = Convert.ToInt32(GridView1.DataKeys[row.RowIndex].Values[0]);
		string constr = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;
		using (SqlConnection con = new SqlConnection(constr))
		{
			using (SqlCommand cmd = new SqlCommand())
			{
				string sql = " DELETE FROM InstructionsData WHERE (ID = @ID)";
				cmd.CommandText = sql;
				cmd.Parameters.AddWithValue("ID", id);
				cmd.Connection = con;
				con.Open();
				cmd.ExecuteNonQuery();
				con.Close();
			}
		}
		this.SelectAll();

		GridView1.DataBind();
	}
}