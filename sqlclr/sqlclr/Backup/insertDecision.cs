using System;
using System.Data;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using Microsoft.SqlServer.Server;


public partial class StoredProcedures
{
    [Microsoft.SqlServer.Server.SqlProcedure]
    public static void insertDecision
        (
        SqlInt32 decNo,
        SqlDateTime decDate,
        SqlString decTitle,
        SqlString decKeywords,
        SqlString decisionFile,
        SqlInt16 decTypeID
        
        )
    {
        using (SqlConnection cn = new SqlConnection("context connection=true"))
        {
            cn.Open();
            SqlTransaction tr = cn.BeginTransaction();
            SqlCommand cmd = new SqlCommand("insert into decisions_Info(decNo,decDate,decTitle,decKeywords,decisionFile,decTypeID) values(@decNo,@decDate,@decTitle,@decKeywords,@decisionFile,@decTypeID);select scope_identity();", cn, tr);

            cmd.Parameters.AddWithValue("@decNo", decNo);
            cmd.Parameters.AddWithValue("@decDate", decDate);
            cmd.Parameters.AddWithValue("@decTitle", decTitle);
            cmd.Parameters.AddWithValue("@decKeywords", decKeywords);
            cmd.Parameters.AddWithValue("@decisionFile", decisionFile);
            cmd.Parameters.AddWithValue("@decTypeID", decTypeID);
            cmd.ExecuteNonQuery();
            tr.Commit();
            cn.Close();
            
        }
        
    }
};
