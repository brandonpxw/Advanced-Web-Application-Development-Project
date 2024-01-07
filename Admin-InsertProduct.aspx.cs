using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI.HtmlControls;

namespace awad
{
    public partial class WebForm6 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            int result = 0;
            string queryStr = "SELECT COUNT(PRODUCT_ID) FROM Product";

            SqlConnection conn = new SqlConnection(constr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);

            conn.Open();
            result = (int)cmd.ExecuteScalar();
            conn.Close();
            result += 1;
            txtProductID.Text = result.ToString();
        }

        protected void btnInsertItems_Click(object sender, EventArgs e)
        {
            int result = 0;
            string image = "";

            if (FileUpload1.HasFile == true)
            {
                image = "/assets/images/" + FileUpload1.FileName;
            }

            Product prod = new Product(txtProductID.Text, txtProductName.Text, txtProductDesc.Text, decimal.Parse(txtProductPrice.Text), image, txtProductColour.Text, txtProductCollection.Text, txtProductOwner.Text);
            result = prod.ProductInsert();

            if (result > 0)
            {
                string saveimg = Server.MapPath(" ") + "\\" + image;
                FileUpload1.SaveAs(saveimg);
                //loadProductInfo();
                //loadProduct();
                //clear1();
                Response.Write("<script>alert('Insert Successful');</script>");
                HtmlMeta meta = new HtmlMeta();
                meta.HttpEquiv = "Refresh";
                meta.Content = "2;url=Admin-Product.aspx";
                this.Page.Controls.Add(meta);
                return;
            }
            else { Response.Write("<script>alert('Failed to Insert');</script>"); }

            txtProductColour.Text = "";
            txtProductDesc.Text = "";
            txtProductCollection.Text = "";
            txtProductID.Text = "";
            txtProductName.Text = "";
            txtProductPrice.Text = "";
            txtProductOwner.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin-Product.aspx");
        }
    }

}