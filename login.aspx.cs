using Salt_Password_Sample;
using System;
using System.Configuration;
using System.Data.SqlClient;

namespace awad
{
    public partial class WebForm3 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            Session["Email"] = txt_Email.Text;
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);

            conn.Open();

            string checkuser = "SELECT COUNT(*) FROM REGISTRATION WHERE Email = @email";
            SqlCommand com = new SqlCommand(checkuser, conn);
            com.Parameters.AddWithValue("@email", txt_Email.Text);

            int temp = Convert.ToInt32(com.ExecuteScalar().ToString());

            conn.Close();

            if (temp == 1)//checks if email exists inside DB
            {
                conn.Open();

                string checkPasswordQuery = "SELECT Password FROM REGISTRATION WHERE Email = @email2";
                string CheckisAdmin = "SELECT isAdmin FROM REGISTRATION WHERE Email = @email2";

                SqlCommand pwcomm = new SqlCommand(checkPasswordQuery, conn);
                pwcomm.Parameters.AddWithValue("@email2", txt_Email.Text);
                string password = pwcomm.ExecuteScalar().ToString();

                SqlCommand isAdmincomm = new SqlCommand(CheckisAdmin, conn);
                isAdmincomm.Parameters.AddWithValue("@email2", txt_Email.Text);
                string isAdmin = isAdmincomm.ExecuteScalar().ToString();

                bool flag = Hash.VerifyHash(txt_Password.Text, "SHA512", password);//verifies password through hash function

                if (flag == true)
                {
                    if (isAdmin == "Yes")
                    {
                        Session["CHANGE_MASTERPAGE"] = "~/AdminMaster.Master";
                        Session["CHANGE_MASTERPAGE2"] = null;
                        Session["currentEmail"] = txt_Email;
                        Response.Redirect("Admin-Dashboard.aspx");
                    }
                    else
                    {
                        Session["CHANGE_MASTERPAGE"] = "~/AfterLogin.Master";
                        Session["CHANGE_MASTERPAGE2"] = null;
                        Session["currentEmail"] = txt_Email;
                        Response.Redirect("Index.aspx");
                    }
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Password or Username is not correct')</script>");
                }
            }
            else
            {
                Response.Write("<script language=javascript>alert('Password or Username is not correct')</script>");
            }

            txt_Email.Text = ""; //clears textbox after login
        }
    }
}