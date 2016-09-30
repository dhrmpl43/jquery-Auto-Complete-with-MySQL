<%@ WebHandler Language="C#" Class="Search_CS" %>

using System;
using System.Web;

using System.Configuration;
using System.Text;
using MySql.Data.MySqlClient;
using MySql.Data;

public class Search_CS : IHttpHandler {
   
    public void ProcessRequest (HttpContext context) {
        string prefixText = context.Request.QueryString["q"];
        BranchData cg = new BranchData();
        System.Data.DataSet ds = cg.getBranch("select gardenname from garden where gardenname like '%"+prefixText+"%'");
        StringBuilder sb = new StringBuilder();
        for(int i=0;i<ds.Tables[0].Rows.Count;i++)
        {
            sb.Append(ds.Tables[0].Rows[i]["gardenname"].ToString())
            .Append(Environment.NewLine);
        }
         context.Response.Write(sb.ToString()); 
            }
    //    }
    //}

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }
}