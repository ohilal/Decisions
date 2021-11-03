using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class InsertDecesion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //if (!IsPostBack)
        //{

        //    this.SelectAll();
        //}
        this.SelectAll();
        string UpPath;
        UpPath = "C:\\UploadedDecisions";
        if (!Directory.Exists(UpPath))
        {
            Directory.CreateDirectory("C:\\UploadedDecisions\\");
        }


    }
    protected void btnSubmitDec_Click(object sender, EventArgs e)
    {
        
        if (uploadGuideFile.HasFile)
        {
            string filepath = uploadGuideFile.PostedFile.FileName;
            string filename = Path.GetFileName(filepath);
            string ext = Path.GetExtension(filename);
            SqlDataSource1.InsertParameters["TemplatePath"].DefaultValue = filename;
        }

        uploadGuideFile.SaveAs(Server.MapPath("~/UploadedDecisions/") + uploadGuideFile.FileName);
		//Response.Write(txtDate.Text);
          SqlDataSource1.Insert();
          Response.Redirect("~/success.aspx");
    }
    private void SelectAll()
    {
        string constr = ConfigurationManager.ConnectionStrings["dataBankConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand())
            {
                string sql = "select templates.TemplateID, templates.TemplateName, templates.TemplatePath, GuideTypes.GuideTypeName from Templates inner join GuideTypes on Templates.typeID= GuideTypes.GuideTypeID";
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
        //CalendarExtender cldr = new CalendarExtender();
        for (int i = 0; i < GridView1.Columns.Count; i++)
        {
            TableHeaderCell cell = new TableHeaderCell();
            TextBox txtSearch = new TextBox();
            txtSearch.Attributes["placeholder"] = GridView1.Columns[i].HeaderText;
            txtSearch.Attributes["title"] = "البحث بـ" + GridView1.Columns[i].HeaderText;
            // txtSearch.ID = "search" + i;
            txtSearch.ClientIDMode = ClientIDMode.Static;
            txtSearch.CssClass = "search_textbox";
            cell.Controls.Add(txtSearch);
            row.Controls.Add(cell);


        }
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
                string sql = " DELETE FROM Templates WHERE (TemplateID = @TemplateID)";
                cmd.CommandText = sql;
                cmd.Parameters.AddWithValue("TemplateID", id);
                cmd.Connection = con;
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        GridView1.DataBind();
    }
    }
