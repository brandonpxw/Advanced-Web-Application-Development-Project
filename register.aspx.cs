using Salt_Password_Sample;
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace awad
{
    public partial class WebForm2 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Guid newGUID = Guid.NewGuid();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);

            conn.Open();

            bool exists = false;

            using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM [REGISTRATION] WHERE Email = @email", conn))
            {
                //checks if the email that the user has entered exists in the database table
                cmd.Parameters.AddWithValue("Email", txt_RegEmail.Text);
                exists = (int)cmd.ExecuteScalar() > 0;
            }

            //if the email exists, send an alert
            if (exists)
            {
                Response.Write("<script>alert('Sorry, Email is already taken!');</script>");
            }

            //else, insert 
            else
            {
                string isAdmin = "";
                if (txt_isAdmin.Text == "1111")
                {
                    isAdmin = "Yes";
                }
                else
                {
                    isAdmin = "No";
                }

                string insertQuery = "INSERT INTO REGISTRATION (Id, First_Name, Last_Name, Email, Password, isAdmin) " +
                    "values (@id, @first, @last, @email, @password, @admin)";

                SqlCommand com = new SqlCommand(insertQuery, conn);
                string ePass = Hash.ComputeHash(txt_RegPassword.Text, "SHA512", null);

                com.Parameters.AddWithValue("@password", ePass);
                com.Parameters.AddWithValue("@id", newGUID.ToString());
                com.Parameters.AddWithValue("@email", txt_RegEmail.Text);
                com.Parameters.AddWithValue("@first", txt_FirstName.Text);
                com.Parameters.AddWithValue("@last", txt_LastName.Text);
                com.Parameters.AddWithValue("@admin", isAdmin);

                com.ExecuteNonQuery();

                Response.Write("<script>alert('Successfully created account! Welcome! ');</script>");
            }

            conn.Close();

            txt_FirstName.Text = "";
            txt_LastName.Text = "";
            txt_RegEmail.Text = "";
        }

    }

}