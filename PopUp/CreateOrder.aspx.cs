using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Web.App.Transaction
{
    public partial class CreateOrder : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                fillGridData();
            }
        }

        private void fillGridData()
        {
            try
            {
                List<Product> products = new List<Product>
        {
            new Product { ProductID = 1, ProductName = "Product 1", Price = 100, Description = "Description for Product 1" },
            new Product { ProductID = 2, ProductName = "Product 2", Price = 200, Description = "Description for Product 2" },
            new Product { ProductID = 3, ProductName = "Product 3", Price = 300, Description = "Description for Product 3" }
        };

                GridView1.DataSource = products;
                GridView1.DataBind();
            }
            catch (Exception)
            {

                throw;
            }
        }

        protected void btnShow_Click(object sender, EventArgs e)
        {

            // Register the script to show the modal
            ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "showModal();", true);

        }

        public class Product
        {
            public int ProductID { get; set; }
            public string ProductName { get; set; }
            public decimal Price { get; set; }
            public string Description { get; set; }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Select")
            {
                // Get the index of the row that was clicked
                int index = Convert.ToInt32(e.CommandArgument);

                // Get the row data
                GridViewRow selectedRow = GridView1.Rows[index];
                string id = selectedRow.Cells[0].Text;
                lblTitle.Text = selectedRow.Cells[1].Text;
                string age = selectedRow.Cells[2].Text;

                HF_rowIndex.Value = index.ToString();
                ScriptManager.RegisterStartupScript(this, this.GetType(), "ShowModalScript", "showModal();", true);
                return;
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            int index = Convert.ToInt32(HF_rowIndex.Value);
            GridViewRow selectedRow = GridView1.Rows[index];
            selectedRow.Cells[3].Text = TextBox1.Text;
        }
    }
}