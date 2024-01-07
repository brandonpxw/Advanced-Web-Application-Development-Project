using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.HtmlControls;

namespace awad
{
    public partial class WebForm12 : BasePage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadCart();
            }
        }

        protected void LoadCart()
        {
            //bind the Items inside the Session/ ShoppingCart Instance with the Datagrid

            decimal shipping = 0.0m;
            decimal subtotal = 0.0m;
            decimal total = 0.0m;

            foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
            {
                subtotal = subtotal + item.TotalPrice;
            }
            if (subtotal < 30 && subtotal > 0)
            {
                shipping = 5.0m;
                total = subtotal + shipping;
            }

            if (subtotal == 0)
            {
                shipping = 0.0m;
            }

            if (subtotal > 30)
            {
                shipping = 0.0m;
                total = subtotal + shipping;
            }

            TotalPrice.Text = subtotal.ToString("C");
            TotalPrice2.Text = total.ToString("C");
            ShippingPrice.Text = shipping.ToString("C");
            lblSS.Text = shipping.ToString("C");
        }

        protected void rbSS_CheckedChanged(object sender, EventArgs e)
        {
            decimal shipping = 0.0m;
            decimal subtotal = 0.0m;
            decimal total = 0.0m;

            foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
            {
                subtotal = subtotal + item.TotalPrice;
            }
            if (subtotal < 30 && subtotal > 0)
            {
                shipping = 5.0m;
                total = subtotal + shipping;
            }

            if (subtotal == 0)
            {
                shipping = 0.0m;
            }

            if (subtotal > 30)
            {
                shipping = 0.0m;
                total = subtotal + shipping;
            }

            TotalPrice.Text = subtotal.ToString("C");
            TotalPrice2.Text = total.ToString("C");
            ShippingPrice.Text = shipping.ToString("C");
            lblSS.Text = shipping.ToString("C");
        }

        protected void rbES_CheckedChanged(object sender, EventArgs e)
        {
            decimal shipping = 0.0m;
            decimal subtotal = 0.0m;
            decimal total = 0.0m;

            foreach (ShoppingCartItem item in ShoppingCart.Instance.Items)
            {
                subtotal = subtotal + item.TotalPrice;
            }
            if (subtotal < 30 && subtotal > 0 && rbES.Checked == false)
            {
                shipping = 5.0m;
                total = subtotal + shipping;
            }

            if (subtotal == 0 && rbES.Checked == true)
            {
                shipping = 0.0m;
            }

            if (subtotal > 30 && rbES.Checked == false)
            {
                shipping = 0.0m;
                total = subtotal + shipping;
            }

            if (subtotal > 0 && rbES.Checked == true)
            {
                shipping = 9.99m;
                total = subtotal + 9.99m;
            }

            TotalPrice.Text = subtotal.ToString("C");
            TotalPrice2.Text = total.ToString("C");
            ShippingPrice.Text = shipping.ToString("C");
        }

        protected void btnSubmitOrder_Click(object sender, EventArgs e)
        {
            Guid newGUID = Guid.NewGuid();
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["database"].ConnectionString);

            conn.Open();

            string check = "SELECT COUNT(*) FROM Owned WHERE (Email = @email AND ID = @ID)";

            string insertQuery = "INSERT INTO Orders (OrderID, Email, Address, ZipCode, PhoneNumber) " +
                "VALUES (@ID, @email, @address, @zip, @phone)";

            SqlCommand com = new SqlCommand(insertQuery, conn);
            string email = "";
            email = (string)HttpContext.Current.Session["email"];
            com.Parameters.AddWithValue("@ID", newGUID.ToString());
            com.Parameters.AddWithValue("@email", email);
            com.Parameters.AddWithValue("@address", txtAddress.Text);
            com.Parameters.AddWithValue("@zip", txtZipCode.Text);
            com.Parameters.AddWithValue("@phone", txtPhoneNumber.Text);

            for (int i = 0; i < ShoppingCart.Instance.Items.Count; i++)
            {
                SqlCommand cmdCheck = new SqlCommand(check, conn);
                cmdCheck.Parameters.AddWithValue("@email", email);
                cmdCheck.Parameters.AddWithValue("@ID", ShoppingCart.Instance.Items[i].ItemID);
                int own = (int)cmdCheck.ExecuteScalar();
                if (own > 0)
                {
                    Response.Write("<script language=javascript>alert('You already own one or more of these items.')</script>");
                    HtmlMeta meta = new HtmlMeta();
                    meta.HttpEquiv = "Refresh";
                    meta.Content = "5;url=viewCart.aspx";
                    this.Page.Controls.Add(meta);
                    return;
                }
            }

            for (int i = 0; i < ShoppingCart.Instance.Items.Count; i++)
            {
                SqlCommand cmdGet = new SqlCommand("SELECT Product_Name FROM Product WHERE Product_Id = @id", conn);
                cmdGet.Parameters.AddWithValue("@id", ShoppingCart.Instance.Items[i].ItemID);
                SqlDataReader reader = cmdGet.ExecuteReader();
                reader.Read();

                string insert = "INSERT INTO [OWNED] (Id, Email, Image, Name) VALUES (@id, @email, @image, @name)";
                SqlCommand cmdInsert = new SqlCommand(insert, conn);
                cmdInsert.Parameters.AddWithValue("@id", ShoppingCart.Instance.Items[i].ItemID);
                cmdInsert.Parameters.AddWithValue("@email", email);
                cmdInsert.Parameters.AddWithValue("@image", ShoppingCart.Instance.Items[i].Product_Image);
                cmdInsert.Parameters.AddWithValue("@name", reader["Product_Name"].ToString());
                reader.Close();
                cmdInsert.ExecuteNonQuery();
            }

            com.ExecuteNonQuery();

            Response.Redirect("Index.aspx");

            conn.Close();
        }
    }
}
