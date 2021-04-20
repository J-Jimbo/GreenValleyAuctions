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
            ddlStorage_SelectedIndexChanged(sender, e);

            


                string Query = "Select * from SideNotes where WorkFlowID = (Select MAX(WorkFLowID) from WorkFLow where CustomerID = @ID);";

                //Define the connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

                //Create sql command 
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = Query;
                sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));


                //open connection to send ID query 
                sqlConnect.Open();
                SqlDataReader queryResult = sqlCommand.ExecuteReader();
                while (queryResult.Read())
                {
                    txtSideNotes.Text = queryResult["Note"].ToString();
                }

                queryResult.Close();
                sqlConnect.Close();
           
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

       

            string Query = "INSERT INTO Inventory (ItemID, ItemDescription, ItemCost, InventoryDate,ItemStorage,ItemLocation) Values ((Select ISNULL(max(ItemID)+1,1) from Inventory),@Item,@ItemCost,GetDate(),@Storage,@Location) ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //Create sql command 
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = Query;

            
            sqlCommand.Parameters.AddWithValue("@Item", HttpUtility.HtmlEncode(txtItem.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@ItemCost", HttpUtility.HtmlEncode(txtCost.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@Storage", HttpUtility.HtmlEncode(ddlBay.SelectedValue.ToString()));
            sqlCommand.Parameters.AddWithValue("@Location", HttpUtility.HtmlEncode(ddlPlace.SelectedValue.ToString()));
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

        

        protected void ddlStorage_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlStorage.SelectedValue == "L" )
            {
                ddlBay.Items.Clear();
                ddlPlace.Items.Clear();

                ListItem L1 = new ListItem("1", "L1");
                ListItem L2 = new ListItem("2", "L2");
                ListItem L3 = new ListItem("3", "L3");
                ListItem L4 = new ListItem("4", "L4");
                ListItem L5 = new ListItem("5", "L5");
                ddlBay.Items.Add( L1 );
                ddlBay.Items.Add(L2);
                ddlBay.Items.Add(L3);
                ddlBay.Items.Add(L4);
                ddlBay.Items.Add(L5);

                ddlPlace.Items.Add("Front");
                ddlPlace.Items.Add("Middle");
                ddlPlace.Items.Add("Back");
            }
            else if(ddlStorage.SelectedValue == "R")
            {
                ddlBay.Items.Clear();
                ddlPlace.Items.Clear();

                ListItem R1 = new ListItem("1", "R1");
                ListItem R2 = new ListItem("2", "R2");
                ListItem R3 = new ListItem("3", "R3");
                ListItem R4 = new ListItem("4", "R4");
                ListItem R5 = new ListItem("5", "R5");
                ddlBay.Items.Add(R1);
                ddlBay.Items.Add(R2);
                ddlBay.Items.Add(R3);
                ddlBay.Items.Add(R4);
                ddlBay.Items.Add(R5);

                ddlPlace.Items.Add("Front");
                ddlPlace.Items.Add("Middle");
                ddlPlace.Items.Add("Back");
            }
            else
            {
                ddlBay.Items.Clear();
                ddlPlace.Items.Clear();

                ListItem T1 = new ListItem("1", "T1");
                ListItem T2 = new ListItem("2", "T2");
                ListItem T3 = new ListItem("3", "T3");
                ListItem T4 = new ListItem("4", "T4");
                ListItem T5 = new ListItem("5", "T5");
                ListItem T6 = new ListItem("6", "T6");
                ListItem T7 = new ListItem("7", "T7");
                ListItem T8 = new ListItem("8", "T8");
                ddlBay.Items.Add(T1);
                ddlBay.Items.Add(T2);
                ddlBay.Items.Add(T3);
                ddlBay.Items.Add(T4);
                ddlBay.Items.Add(T5);
                ddlBay.Items.Add(T6);
                ddlBay.Items.Add(T7);
                ddlBay.Items.Add(T8);

                ddlPlace.Items.Add("Doors");
                ddlPlace.Items.Add("Middle");
                ddlPlace.Items.Add("Nose");
                
            }
        }

        protected void txtSideNotes_TextChanged(object sender, EventArgs e)
        {
            string Query = "UPDATE SideNotes SET Note = @Note where WorkFlowID = (Select MAX(WorkFLowID) from WorkFLow where CustomerID = @ID);";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //Create sql command 
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = Query;


            sqlCommand.Parameters.AddWithValue("@Note", HttpUtility.HtmlEncode(txtSideNotes.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommand.ExecuteReader();


            queryResult.Close();
            sqlConnect.Close();
        }
    }
}