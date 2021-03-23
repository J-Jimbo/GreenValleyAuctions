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
    public partial class Customer_Info : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //On Page load grab customer info

            string sqlQuery = "Select trim(FirstName)+' '+trim(LastName) as Name,CustomerPhone,CustomerEmail,CustomerAddress from Customer where customerID = @ID;";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //Create sql command
            SqlCommand sqlCommandID = new SqlCommand();
            sqlCommandID.Connection = sqlConnect;
            sqlCommandID.CommandType = CommandType.Text;
            sqlCommandID.CommandText = sqlQuery;

            sqlCommandID.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResponse = sqlCommandID.ExecuteReader();

          
            while (queryResponse.Read())
            {
                lblName.Text = queryResponse["Name"].ToString();
                lblAddress.Text = queryResponse["CustomerAddress"].ToString();
                lblPhone.Text = queryResponse["CustomerPhone"].ToString();
                lblEmail.Text = queryResponse["CustomerEmail"].ToString();
            }

            // Close conecctions
            queryResponse.Close();
            sqlConnect.Close();

            //----------------------------------------------------------------
            //On Page load grab customer info

            string Query = "select top 1 trim(ServiceType) as ServiceType, MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID=WF.WorkFlowID inner join Customer C on WF.CustomerID= C.CustomerID   where C.CustomerID = @ID group by ServiceType order by WFID DESC;";

           

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


                    if (queryResult["ServiceType"].ToString().Equals("Moving"))
                    {
                        btnCreateServiceEvent.Visible = false;
                        btnAuctionPickup.Visible = false;
                        btnAuctionSchedule.Visible = false;
                        btnAddInventory.Visible = false;
                    }
                    else if (queryResult["ServiceType"].ToString().Equals("Auction"))
                    {
                        btnCreateServiceEvent.Visible = false;
                        btnMoveForm.Visible = false;
                        btnMoveScreen.Visible = false;

                    }
                    else
                    {
                        btnMoveForm.Visible = false;
                        btnMoveScreen.Visible = false;
                        btnAuctionPickup.Visible = false;
                        btnAuctionSchedule.Visible = false;
                        btnCompletion.Visible = false;
                        btnAddInventory.Visible = false;
                }


                }

            if (queryResult.HasRows != true)
            {
                btnMoveForm.Visible = false;
                btnMoveScreen.Visible = false;
                btnAuctionPickup.Visible = false;
                btnAuctionSchedule.Visible = false;
                btnCompletion.Visible = false;
                btnAddInventory.Visible = false;
            }



            // Close conecctions
            queryResult.Close();
            sqlConnect.Close();
        }

        protected void btnCreateServiceEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_ServiceEvent.aspx");
        }

        protected void btnAuctionSchedule_Click(object sender, EventArgs e)
        {
            Response.Redirect("Auction_Scheduling.aspx");
        }

        protected void btnAuctionPickup_Click(object sender, EventArgs e)
        {
            Response.Redirect("Auction_Pick_Up.aspx");
        }

        protected void btnMoveForm_Click(object sender, EventArgs e)
        {
            Response.Redirect("Move_Form.aspx");
        }

        protected void btnMoveScreen_Click(object sender, EventArgs e)
        {
            Response.Redirect("Move_Schedule_Screen.aspx");
        }

        protected void btnCompletion_Click(object sender, EventArgs e)
        {
            Response.Redirect("Completion_Form.aspx");
        }

        protected void btnNote_Click(object sender, EventArgs e)
        {
            Response.Redirect("Service_Ticket.aspx");
        }

        protected void btnEditServiceTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_serviceTicket.aspx");
        }

        protected void btnCustomerHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_History.aspx");
        }

        protected void btnAddInventory_Click(object sender, EventArgs e)
        {
            Response.Redirect("Add_Inventory.aspx");
        }

        
    }
}