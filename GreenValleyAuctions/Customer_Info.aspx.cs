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
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

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

            string Query = "select trim(ServiceType) as ServiceType, MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID=WF.CustomerID inner join Customer C on WF.CustomerID= C.CustomerID   where C.CustomerID = @ID group by ServiceType;";

           

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
                    }

                
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
            
        }

        protected void btnAuctionPickup_Click(object sender, EventArgs e)
        {

        }

        protected void btnMoveForm_Click(object sender, EventArgs e)
        {

        }

        protected void btnMoveScreen_Click(object sender, EventArgs e)
        {
            Response.Redirect("Move_Schedule_Screen.aspx");
        }

        protected void btnCompletion_Click(object sender, EventArgs e)
        {

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

        //protected void ddlHistory_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //define connection to the DB
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


        //    // query to check workflow id
        //    //try: dddl/listbox catch: if no service event created
        //    try
        //    {
        //        int workFlowID = int.Parse(ddlHistory.SelectedValue);


        //        string sqlQueryID = "SELECT ISNULL(TicketName, 'Employee Switch') as TicketName, WFHistoryID from WorkFlowHistory wfh inner join WorkFlow wf on wfh.WorkFlowID = wf.WorkFlowID  where wf.WorkFlowID = " + workFlowID;
        //        //Create sql command to receive ID
        //        SqlCommand sqlCommandID = new SqlCommand();
        //        sqlCommandID.Connection = sqlConnect;
        //        sqlCommandID.CommandType = CommandType.Text;
        //        sqlCommandID.CommandText = sqlQueryID;

        //        //open connection to send ID query 
        //        sqlConnect.Open();
        //        SqlDataReader queryValue = sqlCommandID.ExecuteReader();
        //        lbTitleList.Items.Clear();
        //        txtNoteBody.Text = " ";

        //        while (queryValue.Read())
        //        {

        //            lbTitleList.Items.Add(queryValue["TicketName"].ToString());


        //        }

        //        // close connection

        //        queryValue.Close();
        //        sqlConnect.Close();


        //        //----------------------------------------------------------------------------------------
        //        // query to check employee history 

        //        string sqlQueryEmployee = "SELECT WFHistoryID, EmployeeFirstName + ' '+ EmployeeLastName as employeeName from WorkFlowHistory wfh inner join WorkFlow wf on wfh.WorkFlowID = wf.WorkFlowID inner join Employee e on wfh.EmployeeID = e.EmployeeID  where wf.WorkFlowID = " + workFlowID;


        //        //Create sql command to receive EMps
        //        SqlCommand sqlCommandEmployee = new SqlCommand();
        //        sqlCommandEmployee.Connection = sqlConnect;
        //        sqlCommandEmployee.CommandType = CommandType.Text;
        //        sqlCommandEmployee.CommandText = sqlQueryEmployee;

        //        sqlConnect.Open();
        //        SqlDataReader queryAnswer = sqlCommandEmployee.ExecuteReader();

        //        lbEmployeeList.Items.Clear();
        //        while (queryAnswer.Read())
        //        {


        //            lbEmployeeList.Items.Add(queryAnswer["employeeName"].ToString());

        //        }

        //        // close connection

        //        queryAnswer.Close();
        //        sqlConnect.Close();
        //    }
        //    catch (Exception)
        //    {
        //        lbTitleList.Items.Clear();
        //        lbEmployeeList.Items.Clear();
        //        txtNoteBody.Text = "No Service Event Created For Selected Customer";
        //    }
        //}

        //protected void lbTitleList_SelectedIndexChanged(object sender, EventArgs e)
        //{

        //}
    }
}