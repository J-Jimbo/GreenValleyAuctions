using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace GreenValleyAuctions
{
    public partial class Add_Inventory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            // random number 
            Random random = new Random();
            //create arrays to draw random data from
            string[] price = { "20", "400", "90", "10", "110", "210", "150", "30", "300" };
            string[] items = { "fridge", "sofa", "tv", "desk", "dining table" };

            HttpUtility.HtmlEncode(txtCost.Text = price[random.Next(0, price.Length)]);
            HttpUtility.HtmlEncode(txtItem.Text = items[random.Next(0, items.Length)]);

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

       

            string Query = "INSERT INTO Inventory (ItemID, ItemDescription, ItemCost, InventoryDate) Values ((Select ISNULL(max(ItemID)+1,1) from Inventory),@Item,@ItemCost,GetDate()) ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //Create sql command 
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = Query;

            
            sqlCommand.Parameters.AddWithValue("@Item", HttpUtility.HtmlEncode(txtItem.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@ItemCost", HttpUtility.HtmlEncode(txtCost.Text.ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommand.ExecuteReader();


            queryResult.Close();
            //-------------------------------------------------------------
            //update service event based on customer

            string updateQuery = "UPDATE ServiceEvent SET ItemID =(Select max(ItemID) from Inventory) FROM ServiceEvent SE inner join WorkFlow WF on SE.WorkFlowID = WF.WorkFlowID inner join Customer C on WF.CustomerID=C.CustomerID Where C.CustomerID=@ID and WF.CurrentStatus='In Progress'; ";
            //Create sql command 
            SqlCommand sqlCommandUpdate = new SqlCommand();
            sqlCommandUpdate.Connection = sqlConnect;
            sqlCommandUpdate.CommandType = CommandType.Text;
            sqlCommandUpdate.CommandText = updateQuery;

            sqlCommandUpdate.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
        
            //open connection to send ID query 
            SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();



            queryAnswer.Close();
            sqlConnect.Close();

            lblStatus.Text = "Item Created";
            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtCost.Text = "";
            txtItem.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Info.aspx");
        }
    }
}