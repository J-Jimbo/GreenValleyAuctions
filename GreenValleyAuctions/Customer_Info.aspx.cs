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
                lblAddress.Text = queryResponse["CustomerAddress"].ToString();
                lblPhone.Text = queryResponse["CustomerPhone"].ToString();
                lblEmail.Text = queryResponse["CustomerEmail"].ToString();
                lblName.Text = queryResponse["Name"].ToString();
            }

            // Close conecctions
            queryResponse.Close();
            sqlConnect.Close();


            //-----------------------------------------------------------------
            // Page Load grab Customer Info
            string QueryUpdate = "SELECT WorkFlowID, EngagmentDate, CompletionDate, Review, CurrentStatus, CustomerID FROM WorkFlow where CustomerID = @ID";

            //Create sql command
            SqlCommand sqlCommandU = new SqlCommand();
            sqlCommandU.Connection = sqlConnect;
            sqlCommandU.CommandType = CommandType.Text;
            sqlCommandU.CommandText = QueryUpdate;

            sqlCommandU.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryUResponse = sqlCommandU.ExecuteReader();

            while (queryUResponse.Read())
            {
                lblEngagement.Text = queryUResponse["EngagmentDate"].ToString();
                lblCompletion.Text = queryUResponse["CompletionDate"].ToString();
                lblCurrentStatus.Text = queryUResponse["CurrentStatus"].ToString();
                lblReview.Text = queryUResponse["Review"].ToString();
            }
            // Close conecctions
            queryUResponse.Close();
            sqlConnect.Close();


            ////----------------------------------------------------------------
            ////Pulling Job Details onto customer profile 
            //String ServiceRequestQuery = "SELECT ServiceType, DateCreated, Description FROM ServiceRequest";

            ////Sql Command
            //SqlCommand SRQCommand = new SqlCommand();
            //SRQCommand.Connection = sqlConnect;
            //SRQCommand.CommandType = CommandType.Text;
            //SRQCommand.CommandText = ServiceRequestQuery;

            //ServiceRequestQuery.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            ////open connection to send ID query 
            //sqlConnect.Open();
            //SqlDataReader queryINQuery = sqlINQuery.ExecuteReader();

            //while (queryINQuery.Read())
            //{
            //    lblCurrentStatus.Text = queryINQuery["DateContacted"].ToString();
            //    lblInitialNotes.Text = queryINQuery["ConversationNotes"].ToString();


            //}
            //// Close conecctions
            //queryUResponse.Close();
            //sqlConnect.Close();

            //----------------------------------------------------------------
            //Pulling Notes from seperate forms to put onto customer profile 



            String InitialNotesQuery = "SELECT ConversationNotes, CustomerID FROM InitialContact where CustomerID = @ID";


            //Sql Command
            SqlCommand sqlINQuery = new SqlCommand();
            sqlINQuery.Connection = sqlConnect;
            sqlINQuery.CommandType = CommandType.Text;
            sqlINQuery.CommandText = InitialNotesQuery;

            sqlINQuery.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryINQuery = sqlINQuery.ExecuteReader();

            while (queryINQuery.Read())
            {
                lblInitialNotes.Text = queryINQuery["ConversationNotes"].ToString();

            }
            // Close conecctions
            queryINQuery.Close();
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
                    btnAuctionAssessment.Visible = false;
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
                    btnAuctionAssessment.Visible = false;
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
                btnAuctionAssessment.Visible = false;
                btnAuctionSchedule.Visible = false;
                btnCompletion.Visible = false;
                btnAddInventory.Visible = false;
            }



            // Close conecctions
            queryResult.Close();
            sqlConnect.Close();

            //PROGRESS BAR -- Initial Contact 
            string ContactQuery = "select * from InitialContact  where CustomerID = @ID;";

            //Create sql command
            SqlCommand ContactCommand = new SqlCommand();
            ContactCommand.Connection = sqlConnect;
            ContactCommand.CommandType = CommandType.Text;
            ContactCommand.CommandText = ContactQuery;

            ContactCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader ContactResult = ContactCommand.ExecuteReader();

            if (ContactResult.HasRows == true)
            {
                InitialContact.Visible = true;
                ServicePage.Visible = false;
                DateFinal.Visible = false;
                ServiceComplete.Visible = false;
                FollowUp.Visible = false;
            }

            ContactResult.Close();
            sqlConnect.Close();

            // Progress Bar -- Date Option 
            string DateOptionQuery = "SELECT * FROM ServiceEvent SE inner join WorkFlow WF on WF.WorkFLowID = SE.WorkFlowID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID and SE.ServiceEndDate is null;";

            //Create sql command
            SqlCommand DateOptCommand = new SqlCommand();
            DateOptCommand.Connection = sqlConnect;
            DateOptCommand.CommandType = CommandType.Text;
            DateOptCommand.CommandText = DateOptionQuery;

            DateOptCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader DateOptResult = DateOptCommand.ExecuteReader();

            if (DateOptResult.HasRows == true)
            {
                InitialContact.Visible = false;
                ServicePage.Visible = true;
                DateFinal.Visible = false;
                ServiceComplete.Visible = false;
                FollowUp.Visible = false;
            }

            DateOptResult.Close();
            sqlConnect.Close();

            //Progress Bar -- Final Dates 
            string DateFinalQuery = "SELECT * FROM  WorkFlow WF inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID and WF.CompletionDate is not null;";

            //Create sql command
            SqlCommand DateFinalCommand = new SqlCommand();
            DateFinalCommand.Connection = sqlConnect;
            DateFinalCommand.CommandType = CommandType.Text;
            DateFinalCommand.CommandText = DateFinalQuery;

            DateFinalCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader DateFinalResult = DateFinalCommand.ExecuteReader();

            if (DateFinalResult.HasRows == true)
            {
                InitialContact.Visible = false;
                ServicePage.Visible = false;
                DateFinal.Visible = true;
                ServiceComplete.Visible = false;
                FollowUp.Visible = false;
            }

            DateFinalResult.Close();
            sqlConnect.Close();

            //Progress Bar -- Service Completed 
            string CompletionQuery = "Select WF.WorkFlowID,Com.CustomerName,Cust.CustomerID from Customer as Cust inner join Workflow as WF on WF.CustomerID = Cust.CustomerID inner join CompletionForm as Com on Com.WorkFlowID = WF.WorkFlowID where cust.CustomerID = @ID;";



            //Create sql command
            SqlCommand CompletionCommand = new SqlCommand();
            CompletionCommand.Connection = sqlConnect;
            CompletionCommand.CommandType = CommandType.Text;
            CompletionCommand.CommandText = CompletionQuery;

            CompletionCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader CompletionResult = CompletionCommand.ExecuteReader();

            if (CompletionResult.HasRows == true)
            {
                InitialContact.Visible = false;
                ServicePage.Visible = false;
                DateFinal.Visible = false;
                ServiceComplete.Visible = true;
                FollowUp.Visible = false;
            }

            CompletionResult.Close();
            sqlConnect.Close();

            string ReviewQuery = "Select * from WorkFlow where CustomerID = @ID and Review is not null";

            SqlCommand ReviewCommand = new SqlCommand();
            ReviewCommand.Connection = sqlConnect;
            ReviewCommand.CommandType = CommandType.Text;
            ReviewCommand.CommandText = ReviewQuery;

            ReviewCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader ReviewResult = ReviewCommand.ExecuteReader();

            if (ReviewResult.HasRows == true)
            {
                InitialContact.Visible = false;
                ServicePage.Visible = false;
                DateFinal.Visible = false;
                ServiceComplete.Visible = false;
                FollowUp.Visible = true;

                btnEditServiceTicket.Visible = false;
            }

            ReviewResult.Close();
            sqlConnect.Close();
            //Images 
            string Photo = "Select PhotoPath From Customer C inner join WorkFlow wf on C.CustomerID = wf.CustomerID inner join AuctionSchedulingForm asf on wf.WorkFlowID = asf.WorkFlowID inner join AuctionPhotos ap on asf.SchedulingFormID = ap.SchedulingFormID where C.CustomerID = @ID";

            //Create sql command
            SqlCommand PhotoCommand = new SqlCommand();
            PhotoCommand.Connection = sqlConnect;
            PhotoCommand.CommandType = CommandType.Text;
            PhotoCommand.CommandText = Photo;

            PhotoCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader PhotoResult = PhotoCommand.ExecuteReader();

            while (PhotoResult.Read())
            {
                imgtest.ImageUrl = "~\\Auction_Photos\\" + PhotoResult["PhotoPath"].ToString();
                if(PhotoResult.HasRows)
                {
                    photoCell.Visible = true;
                }
            }

            PhotoResult.Close();
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

        protected void btnCustomerNotes_Click(object sender, EventArgs e)
        {
            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            String sqlNotes = "Insert into CustomerNotes (Notes, CustomerID) Values ( @Notes, @ID)";

            //Trying to add Notes to Customer profile and updating them 
            SqlCommand sqlNoteCommand = new SqlCommand();
            sqlNoteCommand.Connection = sqlConnect;
            sqlNoteCommand.CommandType = CommandType.Text;
            sqlNoteCommand.CommandText = sqlNotes;

            sqlConnect.Open();

            sqlNoteCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            sqlNoteCommand.Parameters.AddWithValue("@Notes", HttpUtility.HtmlEncode(txtCustomerNotes.Text));
            //sqlNoteCommand.Parameters.AddWithValue("@CustomerID", customerID);


            SqlDataReader NoteResults = sqlNoteCommand.ExecuteReader();
            NoteResults.Close();

            //Display Notes that have been saved to the profile
            String SqlDisplayNotes = "Select Notes, CustomerID from CustomerNotes where CustomerID= @ID";

            SqlCommand sqlDisplayCommand = new SqlCommand();
            sqlDisplayCommand.Connection = sqlConnect;
            sqlDisplayCommand.CommandType = CommandType.Text;
            sqlDisplayCommand.CommandText = SqlDisplayNotes;

            sqlDisplayCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            sqlDisplayCommand.Parameters.AddWithValue("@Notes", HttpUtility.HtmlEncode(txtCustomerNotes.Text));

            SqlDataReader DisplayResults = sqlDisplayCommand.ExecuteReader();

            while (DisplayResults.Read())
            {
                lblRecordedNotes.Text = DisplayResults["Notes"].ToString();
            }


            // Close conecctions
            sqlConnect.Close();
        }

        protected void btnAuctionAssessment_Click(object sender, EventArgs e)
        {
            Response.Redirect("Auction_Assessment.aspx");
        }
    }
}