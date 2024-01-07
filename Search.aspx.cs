using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace awad
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //retrieve the session variable
            txtSearch.Text = Session["Search"].ToString();

            //PostBack allows the search function to run again when another string is entered into the textbox.
            //if PostBack is not true/enabled, the method will only run one time and not run again if a new
            //string is entered.
            if (!IsPostBack)
            {
                //retrieve connection info from web.config
                string strConnectionString = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
                SqlConnection myConnect = new SqlConnection(strConnectionString);

                //open the connection
                myConnect.Open();

                //create search command to retrieve data from table
                string checksearch = "SELECT COUNT(*) FROM [Product] WHERE Product_Name LIKE @search OR Product_Colour LIKE @search OR Product_Collection LIKE @search";
                SqlCommand com = new SqlCommand(checksearch, myConnect);

                //declare @search
                com.Parameters.AddWithValue("@search", txtSearch.Text);
                com.Parameters["@search"].Value = "%" + txtSearch.Text + "%";

                //use temp to create a fucntion
                int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

                //close the connection
                myConnect.Close();

                //if the record exists
                if (temp > 0)
                {
                    string strCommandText = "SELECT *";
                    strCommandText += " FROM Product WHERE Product_Name LIKE @title OR Product_Colour LIKE @colour OR Product_Collection LIKE @collection";
                    SqlCommand cmd = new SqlCommand(strCommandText, myConnect);

                    //declare cmd parameters for title and author to be dispayed
                    cmd.Parameters.Add("@title", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@title"].Value = "%" + txtSearch.Text + "%";
                    cmd.Parameters.Add("@colour", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@colour"].Value = "%" + txtSearch.Text + "%";
                    cmd.Parameters.Add("@collection", SqlDbType.NVarChar, 50);
                    cmd.Parameters["@collection"].Value = "%" + txtSearch.Text + "%";

                    //open the connection
                    myConnect.Open();

                    cmd.ExecuteNonQuery();
                    SqlDataAdapter da = new SqlDataAdapter();
                    da.SelectCommand = cmd;
                    DataSet ds = new DataSet();
                    da.Fill(ds, "Title");
                    Repeater1.DataSource = ds;
                    Repeater1.DataBind();

                    //close the connection
                    myConnect.Close();
                }

                else
                {
                    noResult.Visible = true;
                }

            }
        }

    }
}