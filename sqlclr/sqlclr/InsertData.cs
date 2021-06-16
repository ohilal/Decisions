using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;


public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void InsertData(


        SqlString Title
        , SqlString Summury
        //, SqlString job
        //, SqlString Owner
        , SqlDateTime Date
        , SqlInt32 SectorID

        , SqlInt32 BranchID
        //, SqlInt32 KeyID
        , SqlString Filepath

        //,SqlString Resource
        , SqlString Keywords
        , SqlInt32 activityCode
        //,out SqlInt32 photoID 
        )
    {
        using (SqlConnection cn = new SqlConnection("context connection=true"))
        {
            cn.Open();
            SqlTransaction tr = cn.BeginTransaction();
            try
            {
                SqlCommand cmdMain = new SqlCommand("insert into Fullinfo(Title,Summury,Date,SectorID,BranchID,Filepath,Keywords,activityCode)values(@Title,@Summury,@Date,@SectorID,@BranchID,@Filepath,@Keywords,@activityCode);"
                   + " select scope_identity();", cn, tr);
                cmdMain.Parameters.AddWithValue("@Title", Title);
                cmdMain.Parameters.AddWithValue("@Summury", Summury);
                //cmdMain.Parameters.AddWithValue("@Owner", Owner);
                cmdMain.Parameters.AddWithValue("@Date", Date);
                cmdMain.Parameters.AddWithValue("@SectorID", SectorID);
                //cmdMain.Parameters.AddWithValue("@job", job);
                cmdMain.Parameters.AddWithValue("@BranchID", BranchID);
                cmdMain.Parameters.AddWithValue("@Keywords", Keywords);
                cmdMain.Parameters.AddWithValue("@Filepath", Filepath);
                cmdMain.Parameters.AddWithValue("@activityCode",activityCode);
                //cmdMain.Parameters.AddWithValue("@photoID", photoID);


                //---------------------------------------------------------------------------


                int DataID = int.Parse(cmdMain.ExecuteScalar().ToString());
                //if (!Resource.IsNull)
                //{
                //    string[] rec = Resource.ToString().Split('|');
                //    SqlCommand cmdResource = new SqlCommand(
                //            "insert into dbo.Resourses (dId,Resourcename) values (@did,@Resourcename)", cn, tr);
                //    cmdResource.Parameters.AddWithValue("@did", DataID);
                //    cmdResource.Parameters.Add("@Resourcename", SqlDbType.NVarChar, 200);


                //    foreach (string OP in rec)
                //    {
                //        cmdResource.Parameters["@Resourcename"].Value = OP;
                //        cmdResource.ExecuteNonQuery();
                //    }
                //}

                tr.Commit();
                cn.Close();

            }
            catch (SqlException ex)
            {
                // for debugging ....
                SqlContext.Pipe.Send(ex.Message);
                tr.Rollback();

            }
        }

    }
};
