using System;
using System.Configuration;
using System.Data;

namespace awad
{
    public partial class WebForm8 : BasePage
    {
        Product prod = null;
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            Product aProd = new Product();

            //Get Product ID from querystring
            string prodID = Request.QueryString["pdID"].ToString();
            prod = aProd.getProduct(prodID);

            pdName.Text = prod.Product_Name;
            pdDesc.Text = prod.Product_Desc;
            pdPrice.Text = prod.Product_Price.ToString("C");
            pdColour.Text = prod.Product_Colour;
            pdImg.ImageUrl = prod.Product_Image;
            pdCollection.Text = prod.Product_Collection;
            pdOwner.Text = prod.Product_Owner;
        }
        protected void btnAddCart_Click(object sender, EventArgs e)
        {
            if (Session["currentEmail"] == null)
            {
                Response.Write("<script language=javascript>alert('Please create an account before making a purchase!')</script>");
            }
            else
            {
                string iProductID = prod.Product_ID.ToString();
                ShoppingCart.Instance.AddItem(iProductID, prod);
            }
        }
    }

}