using System;
using System.Configuration;
using System.Data;
using System.IO;


namespace awad
{
    public partial class WebForm14 : System.Web.UI.Page
    {
        Product prod = null;
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            Product aProd = new Product();

            //Get Product ID from querystring
            string prodID = Request.QueryString["ID"].ToString();
            prod = aProd.getProduct(prodID);

            Name.Text = prod.Product_Name;
            Image.ImageUrl = prod.Product_Image;

        }
        protected void DownloadButton_Click(object sender, EventArgs e)
        {
            var imageData = Image.ImageUrl;

            if (!string.IsNullOrEmpty(imageData))
            {
                var imageBytes = File.ReadAllBytes(Server.MapPath(imageData));
                Response.Clear();
                Response.ContentType = "application/octet-stream";
                Response.AddHeader("Content-Disposition", "attachment; filename=" + Name.Text + ".jpg");
                Response.BinaryWrite(imageBytes);
                Response.End();
            }
        }
    }

}