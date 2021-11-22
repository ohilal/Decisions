using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.Globalization;
using System.Threading;
public partial class searchData : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
		this.SelectAll();

		//CultureInfo.CreateSpecificCulture("ar-EG");
		//Thread.CurrentThread.CurrentUICulture = new CultureInfo("ar-EG");



		//if (ddlsearch.SelectedValue == "3")
		//{
		//    ddlmangment.Visible = true;
		//    ddlbranch_search.Visible = true;
		//    GridView3.Visible = false;

		//}
		//else { ddlbranch_search.Visible = false;
		//ddlmangment.Visible = false;
		//}

		//if (ddlsearch.SelectedValue == "1")
		//{
		//    ddlactivity.Visible = true;
		//    ddlsubsector.Visible = true;
		//    GridView1.Visible = false;
		//}
		//else { ddlactivity.Visible = false;
		//ddlsubsector.Visible = false;
		//}

	}

	private void SelectAll()
	{
		string constr = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;
		using (SqlConnection con = new SqlConnection(constr))
		{
			using (SqlCommand cmd = new SqlCommand())
			{
				
				string sql = "SELECT TOP(20) decisions_Info.decID, decisions_Info.decNo, decisions_Info.decTitle, decisions_Info.decisionFile, decision_Types.decType, CONVERT(varchar, decisions_Info.decDate, 103) AS date, decisions_Info.decsubjectNo FROM decisions_Info INNER JOIN decision_Types ON decisions_Info.decTypeID = decision_Types.decTypeID ORDER BY decisions_Info.decDate DESC";
				cmd.CommandText = sql;
				cmd.Connection = con;
				using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
				{
					DataTable dt = new DataTable();
					sda.Fill(dt);
					gdvTotal.DataSource = dt;
					gdvTotal.DataBind();
				}
			}
		}

	}







	protected void gdvTotal_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		if (e.Row.RowType == DataControlRowType.Header)
		{
			//add the thead and tbody section programatically
			e.Row.TableSection = TableRowSection.TableHeader;
		}
	}

	protected void gdvTotal_SelectedIndexChanged(object sender, EventArgs e)
	{
		this.SelectAll();
	}

	protected void gdvTotal_DataBound(object sender, EventArgs e)
	{

	}
	protected void OnDataBound(object sender, EventArgs e)
	{
		GridViewRow row = new GridViewRow(0, 0, DataControlRowType.Header, DataControlRowState.Normal);
		//CalendarExtender cldr = new CalendarExtender();
		for (int i = 0; i < gdvTotal.Columns.Count; i++)
		{
			TableHeaderCell cell = new TableHeaderCell();
			TextBox txtSearch = new TextBox();
			txtSearch.Attributes["placeholder"] = gdvTotal.Columns[i].HeaderText;
			txtSearch.Attributes["title"] = "البحث بـ" + gdvTotal.Columns[i].HeaderText;
			// txtSearch.ID = "search" + i;
			txtSearch.ClientIDMode = ClientIDMode.Static;
			txtSearch.CssClass = "search_textbox";
			cell.Controls.Add(txtSearch);
			row.Controls.Add(cell);


		}
		gdvTotal.HeaderRow.Parent.Controls.AddAt(1, row);

	}


	protected void gdvTotal_Sorting(object sender, GridViewSortEventArgs e)
	{

		this.SelectAll();
		DataTable m_DataTable = gdvTotal.DataSource as DataTable;
		if (m_DataTable != null)
		{
			DataView m_DataView = new DataView(m_DataTable);
			m_DataView.Sort = e.SortExpression;
			gdvTotal.DataSource = m_DataView;
			gdvTotal.DataBind();

		}
	}

	protected void gdvTotal_PageIndexChanging(object sender, GridViewPageEventArgs e)
	{
		gdvTotal.PageIndex = e.NewPageIndex;

		this.SelectAll();
	}
}
