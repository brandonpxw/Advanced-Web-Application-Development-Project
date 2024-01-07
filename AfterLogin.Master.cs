using System;

namespace awad
{
    public partial class Site2 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["CHANGE_MASTERPAGE2"] = "~/MasterPage.Master";
            Session["CHANGE_MASTERPAGE"] = null;
            Session["currentEmail"] = null;
            Response.Redirect("Index.aspx");
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Session["Search"] = txtSearch.Text;
            Response.Redirect("Search.aspx");
        }
    }
}