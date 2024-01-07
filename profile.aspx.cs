using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;

namespace awad
{
    public partial class WebForm13 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DataSet is an in-memory cache of data retrieved from a data source
            //step 1: create Dataset with a GET method
            DataSet prod = GetProduct();


            //DataSource is used to pull the data from the database and populate them
            //step 8: pull data using DataSource
            Repeater1.DataSource = prod;


            //step 9: bind the data to the repeater
            Repeater1.DataBind();
        }

        private DataSet GetProduct()
        {
            //step 2: retrieve connection info from web.config
            string database = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            string email = "";
            email = (string)HttpContext.Current.Session["email"];

            //step 3: define a connection to the database
            using (SqlConnection conn = new SqlConnection(database))
            {
                //step 4: create a command to retrieve data from a table in your database
                SqlCommand cmd = new SqlCommand("SELECT * FROM Owned WHERE (Email = @email)", conn);
                cmd.Parameters.AddWithValue("@email", email);

                //step 5: create a new DataSet
                DataSet prod = new DataSet();

                //step 6: pass the retrieved data into the newly created Dataset
                using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                {
                    adapter.Fill(prod);
                }

                //step 7: return
                return prod;
            }
        }
    }

}