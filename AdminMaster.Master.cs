using System;

namespace awad
{
    public partial class Site3 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSignOut_Click(object sender, EventArgs e)
        {
            Session["CHANGE_MASTERPAGE2"] = "~/MasterPage.Master";
            Session["CHANGE_MASTERPAGE"] = null;
            Response.Redirect("Index.aspx");
        }
    }
}
