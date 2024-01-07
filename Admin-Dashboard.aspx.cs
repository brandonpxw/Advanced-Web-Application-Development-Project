using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;

namespace awad
{
    public partial class WebForm4 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static List<object> GetChartData()
        {
            string query = "SELECT TOP 5 Name, COUNT(Name) as pCount FROM [Owned] GROUP BY Name ORDER BY pCount DESC";
            string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            List<object> chartData = new List<object>();
            chartData.Add(new object[]
            {
                "Name", "Number Of Purchase"
            });
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(query))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        while (sdr.Read())
                        {
                            chartData.Add(new object[]
                            {
                        sdr["Name"], sdr["pCount"]
                            });
                        }
                    }
                    con.Close();
                    return chartData;
                }
            }
        }
    }
}