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
using System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.IO;

public partial class photo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string photoID =
            Request.QueryString["PhotoID"].ToString();

        SqlDataReader imageReader;
        string dbConn =
            ConfigurationManager.ConnectionStrings[
            "IdaportalConnectionString"].ConnectionString;
        SqlConnection sqlConn = new SqlConnection(dbConn);
        sqlConn.Open();
        string Query = "SELECT [PhotoID], [Photo] FROM [Photos] "
            + " WHERE PhotoID = ";

        SqlCommand imageCommand = new SqlCommand(
            Query + photoID, sqlConn);
        imageReader = imageCommand.ExecuteReader(
            CommandBehavior.CloseConnection);
        imageReader.Read();

        byte[] imageBytes = (byte[])imageReader["Photo"];
        //Width Height
        int Width = 0, Height = 0;
        if (Request.QueryString["Width"] != null)
            Width = int.Parse( Request.QueryString["Width"].ToString());

        if (Request.QueryString["Height"] != null)
            Height = int.Parse(Request.QueryString["Height"].ToString());

        Bitmap originalBitmap = (Bitmap) Bitmap.FromStream(new MemoryStream(imageBytes));
        Bitmap finalBitmap = null;
        if (Width != 0)
        {
           int finalHeight = Width * originalBitmap.Height / originalBitmap.Width;
           finalBitmap = BitmapManipulator.ResizeBitmap(originalBitmap, Width, finalHeight);
       
        
        }
        else if (Height != 0)
        {
            int finalWidth = Height * originalBitmap.Width / originalBitmap.Height;
            finalBitmap = BitmapManipulator.ResizeBitmap(originalBitmap, finalWidth, Height);
        }
        

        Response.ContentType = "image/jpg";
        
        System.Drawing.Bitmap bmp = finalBitmap;
        System.IO.MemoryStream stream = new System.IO.MemoryStream();
        bmp.Save(stream, System.Drawing.Imaging.ImageFormat.Jpeg);
        stream.Position = 0;
        byte[] data = new byte[stream.Length];
        stream.Read(data, 0,(int) stream.Length);
        
        Response.BinaryWrite(data);
    }
}
