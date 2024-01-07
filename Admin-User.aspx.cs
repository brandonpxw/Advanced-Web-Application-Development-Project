using System;
using System.Web.UI.WebControls;

namespace awad
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }



        protected void gvUsers_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int result = 0;
            Product prod = new Product();
            string UserID = gvUsers.DataKeys[e.RowIndex].Value.ToString();
            result = prod.UserDelete(UserID);

            if (result > 0)
            {
                Response.Write("<script>alert('User Removed successfully');</script>");
            }
            else
            {
                Response.Write("<script>alert('User Removal NOT successful');</script>");
            }

            Response.Redirect("Admin-User.aspx");
        }

        protected void gvUsers_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}