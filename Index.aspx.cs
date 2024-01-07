using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace awad
{
    public partial class WebForm1 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //DataSet is an in-memory cache of data retrieved from a data source
            //step 1: create Dataset with a GET method
            DataSet prod1 = GetNature();
            DataSet prod2 = GetFood();
            DataSet prod3 = GetFashion();


            //DataSource is used to pull the data from the database and populate them
            //step 8: pull data using DataSource
            Repeater1.DataSource = prod1;
            Repeater2.DataSource = prod2;
            Repeater3.DataSource = prod3;


            //step 9: bind the data to the repeater
            Repeater1.DataBind();
            Repeater2.DataBind();
            Repeater3.DataBind();
        }
        private DataSet GetNature()
        {
            //step 2: retrieve connection info from web.config
            string database = ConfigurationManager.ConnectionStrings["database"].ConnectionString;

            //step 3: define a connection to the database
            using (SqlConnection conn = new SqlConnection(database))
            {
                //step 4: create a command to retrieve data from a table in your database
                SqlDataAdapter cmd = new SqlDataAdapter("SELECT * FROM Product WHERE (Product_Collection = 'Nature')", conn);

                //step 5: create a new DataSet
                DataSet prod = new DataSet();

                //step 6: pass the retrieved data into the newly created Dataset
                cmd.Fill(prod);

                //step 7: return
                return prod;
            }
        }

        private DataSet GetFood()
        {
            //step 2: retrieve connection info from web.config
            string database = ConfigurationManager.ConnectionStrings["database"].ConnectionString;

            //step 3: define a connection to the database
            using (SqlConnection conn = new SqlConnection(database))
            {
                //step 4: create a command to retrieve data from a table in your database
                SqlDataAdapter cmd = new SqlDataAdapter("SELECT * FROM Product WHERE (Product_Collection = 'Food')", conn);

                //step 5: create a new DataSet
                DataSet prod = new DataSet();

                //step 6: pass the retrieved data into the newly created Dataset
                cmd.Fill(prod);

                //step 7: return
                return prod;
            }
        }

        private DataSet GetFashion()
        {
            //step 2: retrieve connection info from web.config
            string database = ConfigurationManager.ConnectionStrings["database"].ConnectionString;

            //step 3: define a connection to the database
            using (SqlConnection conn = new SqlConnection(database))
            {
                //step 4: create a command to retrieve data from a table in your database
                SqlDataAdapter cmd = new SqlDataAdapter("SELECT * FROM Product WHERE (Product_Collection = 'Fashion')", conn);

                //step 5: create a new DataSet
                DataSet prod = new DataSet();

                //step 6: pass the retrieved data into the newly created Dataset
                cmd.Fill(prod);

                //step 7: return
                return prod;
            }
        }
    }

}