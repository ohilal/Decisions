using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;


public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void updatedata
        (
        SqlInt32 dID,
        SqlString Title
        , SqlString Summury
        //, SqlString job
        //, SqlString Owner
        , SqlDateTime Date
        , SqlInt32 activityCode

        , SqlInt32 BranchID
        //, SqlInt32 KeyID
        //, SqlString Filepath

        //, SqlString Resource
        , SqlString Keywords
        //,out SqlInt32 photoID 
        
        
        
        )
    {
        using (SqlConnection cn = new SqlConnection("context connection=true"))
        {
            cn.Open();
            SqlTransaction tr = cn.BeginTransaction();
            //try
            //{

            SqlCommand cmdMain = new SqlCommand(
              "UPDATE [Fullinfo] SET [Title] = @Title, [Summury] = @Summury,  [Date] = @Date, [activityCode] =@activityCode, [BranchID] = @BranchID,  [Keywords] = @Keywords  WHERE [dID] = @dID"
              , cn, tr);
            cmdMain.Parameters.AddWithValue("@dID", dID);
            cmdMain.Parameters.AddWithValue("@Title", Title);
            cmdMain.Parameters.AddWithValue("@Summury", Summury);
            //cmdMain.Parameters.AddWithValue("@job", job);
            //cmdMain.Parameters.AddWithValue("@Owner", Owner);
            cmdMain.Parameters.AddWithValue("@Date", Date);
            cmdMain.Parameters.AddWithValue("@BranchID", BranchID);
            cmdMain.Parameters.AddWithValue("@activityCode",activityCode);
            //cmdMain.Parameters.AddWithValue("@Filepath", Filepath);
            cmdMain.Parameters.AddWithValue("@Keywords", Keywords);
            //}
            cmdMain.ExecuteNonQuery();
            tr.Commit();
        cn.Close();
        }
       
        
    }
};
