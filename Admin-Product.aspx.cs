using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace awad
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindRepeater();
            }

        }
        private void BindRepeater()
        {
            string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Product_CRUD"))
                {
                    cmd.Parameters.AddWithValue("@Action", "SELECT");
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.CommandType = CommandType.StoredProcedure;
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            Repeater1.DataSource = dt;
                            Repeater1.DataBind();
                        }
                    }
                }
            }
        }


        protected void OnEdit(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            this.ToggleElements(item, true);
        }

        private void ToggleElements(RepeaterItem item, bool isEdit)
        {
            //Toggle Buttons.
            item.FindControl("lnkEdit").Visible = !isEdit;
            item.FindControl("lnkUpdate").Visible = isEdit;
            item.FindControl("lnkCancel").Visible = isEdit;


            //Toggle Labels.
            item.FindControl("Product_Name").Visible = !isEdit;
            item.FindControl("Product_Desc").Visible = !isEdit;
            item.FindControl("Product_Price").Visible = !isEdit;
            item.FindControl("Product_Colour").Visible = !isEdit;
            item.FindControl("Product_Collection").Visible = !isEdit;
            item.FindControl("Product_Image").Visible = !isEdit;
            item.FindControl("Product_Owner").Visible = !isEdit;

            //Toggle TextBoxes.
            item.FindControl("txtTitle").Visible = isEdit;
            item.FindControl("txtDesc").Visible = isEdit;
            item.FindControl("txtPrice").Visible = isEdit;
            item.FindControl("txtColour").Visible = isEdit;
            item.FindControl("txtCollection").Visible = isEdit;
            item.FindControl("txtImage").Visible = isEdit;
            item.FindControl("txtOwner").Visible = isEdit;
        }

        protected void OnCancel(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            this.ToggleElements(item, false);
        }

        protected void OnUpdate(object sender, EventArgs e)
        {
            //Find the reference of the Repeater Item.
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;

            //Finds the matching BS_ID in the row of data
            int prodID = int.Parse((item.FindControl("Product_ID") as Label).Text);
            //Trim() allows data to be modified
            string name = (item.FindControl("txtTitle") as TextBox).Text.Trim();
            string desc = (item.FindControl("txtDesc") as TextBox).Text.Trim();
            string price = (item.FindControl("txtPrice") as TextBox).Text.Trim();
            string colour = (item.FindControl("txtColour") as TextBox).Text.Trim();
            string collection = (item.FindControl("txtCollection") as TextBox).Text.Trim();
            string image = (item.FindControl("txtImage") as TextBox).Text.Trim();
            string owner = (item.FindControl("txtOwner") as TextBox).Text.Trim();

            string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                //using stored procedure
                using (SqlCommand cmd = new SqlCommand("Product_CRUD"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    //call the action UPDATE
                    cmd.Parameters.AddWithValue("@Action", "UPDATE");
                    //pass in new values
                    cmd.Parameters.AddWithValue("@ID", prodID);
                    cmd.Parameters.AddWithValue("@Desc", desc);
                    cmd.Parameters.AddWithValue("@Price", price);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Colour", colour);
                    cmd.Parameters.AddWithValue("@Image", image);
                    cmd.Parameters.AddWithValue("@Collection", collection);
                    cmd.Parameters.AddWithValue("@Owner", owner);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            //display
            this.BindRepeater();
        }

        protected void OnDelete(object sender, EventArgs e)
        {
            RepeaterItem item = (sender as LinkButton).Parent as RepeaterItem;
            int prodID = int.Parse((item.FindControl("Product_ID") as Label).Text);

            string constr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("Product_CRUD"))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Action", "DELETE");
                    cmd.Parameters.AddWithValue("@ID", prodID);
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
            this.BindRepeater();
        }



        protected void btnAddItem_Click(object sender, EventArgs e)
        {
            Response.Redirect("Admin-InsertProduct.aspx");
        }
    }

    public class Product
    {
        //System.Configuration.ConnectionStringSettings _connStr;
        string _connStr = ConfigurationManager.ConnectionStrings["database"].ConnectionString;
        private string _prodID = null;
        private string _prodName = string.Empty;
        private string _prodDesc = "";
        private decimal _prodPrice = 0;
        private string _prodImage = "";
        private string _prodColour = "";
        private string _prodCollection = "";
        private string _prodOwner = "";

        // Default constructor
        public Product()
        {
        }

        // PRODUCTS
        public Product(string prodID, string prodName, string prodDesc, decimal prodPrice, string prodImage, string prodColour, string prodCollection, string prodOwner)
        {
            _prodID = prodID;
            _prodName = prodName;
            _prodDesc = prodDesc;
            _prodPrice = prodPrice;
            _prodImage = prodImage;
            _prodColour = prodColour;
            _prodCollection = prodCollection;
            _prodOwner = prodOwner;

        }

        // Constructor that take in all except product ID
        public Product(string prodName, string prodDesc, decimal prodPrice, string prodImage, string prodColour, string prodCollection, string prodOwner)
            : this(null, prodName, prodDesc, prodPrice, prodImage, prodColour, prodCollection, prodOwner)
        {
        }

        // Constructor that take in only Product ID. The other attributes will be set to 0 or empty.
        public Product(string prodID)
            : this(prodID, "", "", 0, "", "", "", "")
        {
        }

        // Get/Set the attributes of the Product object.
        // Note the attribute name (e.g. Product_ID) is same as the actual database field name.
        // This is for ease of referencing.
        public string Product_ID
        {
            get { return _prodID; }
            set { _prodID = value; }
        }
        public string Product_Name
        {
            get { return _prodName; }
            set { _prodName = value; }
        }

        public string Product_Desc
        {
            get { return _prodDesc; }
            set { _prodDesc = value; }
        }

        public decimal Product_Price
        {
            get { return _prodPrice; }
            set { _prodPrice = value; }
        }

        public string Product_Image
        {
            get { return _prodImage; }
            set { _prodImage = value; }
        }
        public string Product_Colour
        {
            get { return _prodColour; }
            set { _prodColour = value; }
        }
        public string Product_Collection
        {
            get { return _prodCollection; }
            set { _prodCollection = value; }
        }
        public string Product_Owner
        {
            get { return _prodOwner; }
            set { _prodOwner = value; }
        }

        public Product getProduct(string prodID)
        {
            Product prodDetail = null;

            string pdName, pdDesc, pdColour, pdImg, pdCollection, pdOwner;
            decimal pdPrice;

            string queryStr = "SELECT * FROM Product WHERE Product_ID = @ProdID";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ProdID", prodID);

            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                pdName = dr["Product_Name"].ToString();
                pdDesc = dr["Product_Desc"].ToString();
                pdImg = dr["Product_Image"].ToString();
                pdPrice = decimal.Parse(dr["Product_Price"].ToString());
                pdColour = dr["Product_Colour"].ToString();
                pdCollection = dr["Product_Collection"].ToString();
                pdOwner = dr["Product_Owner"].ToString();

                prodDetail = new Product(prodID, pdName, pdDesc, pdPrice, pdImg, pdCollection, pdColour, pdOwner);
            }
            else
            {
                prodDetail = null;
            }

            conn.Close();
            dr.Close();
            dr.Dispose();

            return prodDetail;
        }

        public int ProductInsert()
        {
            int result = 0;
            string queryStr = "INSERT INTO Product(Product_ID, Product_Name, Product_Desc, Product_Price, Product_Image, Product_Colour, Product_Collection, Product_Owner)" + "values (@Product_ID, @Product_Name, @Product_Desc, @Product_Price, @Product_Image, @Product_Colour, @Product_Collection, @Product_Owner)";

            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@Product_ID", this.Product_ID);
            cmd.Parameters.AddWithValue("@Product_Name", this.Product_Name);
            cmd.Parameters.AddWithValue("@Product_Desc", this.Product_Desc);
            cmd.Parameters.AddWithValue("@Product_Price", this.Product_Price);
            cmd.Parameters.AddWithValue("@Product_Colour", this.Product_Colour);
            cmd.Parameters.AddWithValue("@Product_Image", this.Product_Image);
            cmd.Parameters.AddWithValue("@Product_Collection", this.Product_Collection);
            cmd.Parameters.AddWithValue("@Product_Owner", this.Product_Owner);

            conn.Open();
            result += cmd.ExecuteNonQuery();
            conn.Close();

            return result;
        }//end Insert
        public int UserDelete(string ID)
        {
            string queryStr = "DELETE FROM Registration WHERE ID=@ID";
            SqlConnection conn = new SqlConnection(_connStr);
            SqlCommand cmd = new SqlCommand(queryStr, conn);
            cmd.Parameters.AddWithValue("@ID", ID);
            conn.Open();
            int nofRow = 0;
            nofRow = cmd.ExecuteNonQuery();
            conn.Close();
            return nofRow;
        }
    }

}