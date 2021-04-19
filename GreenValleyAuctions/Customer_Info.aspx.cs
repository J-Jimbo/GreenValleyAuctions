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

                if( queryUResponse["CompletionDate"].ToString() != null)
                {
                    btnEditServiceTicket.Visible = false;
                }
            }
            // Close conecctions
            queryUResponse.Close();
            sqlConnect.Close();


            
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

                    moveimages.Visible = true;
                    DDLMovingProg.Visible = true;
                    MoveProgBtn.Visible = true;
                    auction.Visible = false;
                }
                else if (queryResult["ServiceType"].ToString().Equals("Auction"))
                {
                    btnCreateServiceEvent.Visible = false;
                    btnMoveForm.Visible = false;
                    btnMoveScreen.Visible = false;
                    move.Visible = false;

                    auctionImages.Visible = true;
                    ddlAuctionProg.Visible = true;
                    AuctionProgBtn.Visible = true;
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
                    auction.Visible = false;
                    move.Visible = false;
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

            
            //Images 
            string Photo = "Select AP.PhotoPath as EmpPhoto, CP.PhotoPath as CustomerPhoto From Customer C inner join WorkFlow wf on C.CustomerID = wf.CustomerID full join AuctionSchedulingForm asf on wf.WorkFlowID = asf.WorkFlowID full join AuctionPhotos ap on asf.SchedulingFormID = ap.SchedulingFormID full join CustomerPhotos CP on C.CustomerID = CP.CustomerID where C.CustomerID = @ID";

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
                imgCustomer.ImageUrl = "~\\Customer_Photos\\" + PhotoResult["CustomerPhoto"].ToString();
                imgtest.ImageUrl = "~\\Auction_Photos\\" + PhotoResult["EmpPhoto"].ToString();
                if(PhotoResult.HasRows)
                {
                    photoCell.Visible = true;
                }
            }

            PhotoResult.Close();
            sqlConnect.Close();

            //----progress bar--------------

            //query to check for existing form based on workflow
            //query to grab workflow
            string WFQuery = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID;";

            //Define the connection to the Database
            

            //Create sql command 
            SqlCommand sqlCommandWF= new SqlCommand();
            sqlCommandWF.Connection = sqlConnect;
            sqlCommandWF.CommandType = CommandType.Text;
            sqlCommandWF.CommandText = WFQuery;

            sqlCommandWF.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader Result = sqlCommandWF.ExecuteReader();

            string workFLow = "";
            while (Result.Read())
            {
                workFLow = Result["WFID"].ToString();


            }

            Result.Close();



            if(!IsPostBack)
            {
                string progress = "select * from WorkflowProgress where WorkFlowID = @ID";

                //Define the connection to the Database


                //Create sql command 
                SqlCommand sqlCommandProg = new SqlCommand();
                sqlCommandProg.Connection = sqlConnect;
                sqlCommandProg.CommandType = CommandType.Text;
                sqlCommandProg.CommandText = progress;

                sqlCommandProg.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow.ToString()));
                //open connection to send ID query 

                SqlDataReader queryprogress = sqlCommandProg.ExecuteReader();


                while (queryprogress.Read())
                {
                    if (queryprogress.HasRows)
                    {

                        ddlAuctionProg.SelectedValue = queryprogress["AuctionProgress"].ToString();
                        AuctionProgBtn_Click(sender, e);
                        DDLMovingProg.SelectedValue = queryprogress["MoveProgress"].ToString();
                        MoveProgBtn_Click(sender, e);
                    }



                }
                queryprogress.Close();
                sqlConnect.Close();
            }
           
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

        protected void btnReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_PrintOut.aspx");
        }

        protected void MoveProgBtn_Click(object sender, EventArgs e)
        {
            //grab workflow id

            string WFQuery = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


            //Create sql command 
            SqlCommand sqlCommandID = new SqlCommand();
            sqlCommandID.Connection = sqlConnect;
            sqlCommandID.CommandType = CommandType.Text;
            sqlCommandID.CommandText = WFQuery;

            sqlCommandID.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader Result = sqlCommandID.ExecuteReader();

            string workFLow = "";
            while (Result.Read())
            {
                workFLow = Result["WFID"].ToString();


            }

            Result.Close();

            //-------------------
            string Query = "Update  WorkFlowProgress SET MoveProgress = @Progress where WorkFlowID = @ID ";

            //Define the connection to the Database
           

            //Create sql command 
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = Query;


            sqlCommand.Parameters.AddWithValue("@Progress", HttpUtility.HtmlEncode(DDLMovingProg.SelectedValue.ToString()));
            sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));
            //open connection to send ID query 
            
            SqlDataReader queryResult = sqlCommand.ExecuteReader();


            queryResult.Close();
            sqlConnect.Close();
            //---------------------------------------
            if (DDLMovingProg.SelectedValue == "1")
            {
                MoveImage1.Visible = false;
                MoveImage2.Visible = true;
                MoveImage3.Visible = false;
                MoveImage4.Visible = false;
                MoveImage5.Visible = false;
                MoveImage6.Visible = false;
                MoveImage7.Visible = false;
                MoveImage8.Visible = false;
                MoveImage9.Visible = false;
            }
            if (DDLMovingProg.SelectedValue == "2")
            {
                MoveImage1.Visible = false;
                MoveImage2.Visible = false;
                MoveImage3.Visible = true;
                MoveImage4.Visible = false;
                MoveImage5.Visible = false;
                MoveImage6.Visible = false;
                MoveImage7.Visible = false;
                MoveImage8.Visible = false;
                MoveImage9.Visible = false;
            }

            if (DDLMovingProg.SelectedValue == "3")
            {
                MoveImage1.Visible = false;
                MoveImage2.Visible = false;
                MoveImage3.Visible = false;
                MoveImage4.Visible = true;
                MoveImage5.Visible = false;
                MoveImage6.Visible = false;
                MoveImage7.Visible = false;
                MoveImage8.Visible = false;
                MoveImage9.Visible = false;
            }

            if (DDLMovingProg.SelectedValue == "4")
            {
                MoveImage1.Visible = false;
                MoveImage2.Visible = false;
                MoveImage3.Visible = false;
                MoveImage4.Visible = false;
                MoveImage5.Visible = true;
                MoveImage6.Visible = false;
                MoveImage7.Visible = false;
                MoveImage8.Visible = false;
                MoveImage9.Visible = false;
            }

            if (DDLMovingProg.SelectedValue == "5")
            {
                MoveImage1.Visible = false;
                MoveImage2.Visible = false;
                MoveImage3.Visible = false;
                MoveImage4.Visible = false;
                MoveImage5.Visible = false;
                MoveImage6.Visible = true;
                MoveImage7.Visible = false;
                MoveImage8.Visible = false;
                MoveImage9.Visible = false;

            }
            if (DDLMovingProg.SelectedValue == "6")
            {
                MoveImage1.Visible = false;
                MoveImage2.Visible = false;
                MoveImage3.Visible = false;
                MoveImage4.Visible = false;
                MoveImage5.Visible = false;
                MoveImage6.Visible = false;
                MoveImage7.Visible = true;
                MoveImage8.Visible = false;
                MoveImage9.Visible = false;
            }
            if (DDLMovingProg.SelectedValue == "7")
            {
                MoveImage1.Visible = false;
                MoveImage2.Visible = false;
                MoveImage3.Visible = false;
                MoveImage4.Visible = false;
                MoveImage5.Visible = false;
                MoveImage6.Visible = false;
                MoveImage7.Visible = false;
                MoveImage8.Visible = true;
                MoveImage9.Visible = false;
            }
            if (DDLMovingProg.SelectedValue == "8")
            {
                MoveImage1.Visible = false;
                MoveImage2.Visible = false;
                MoveImage3.Visible = false;
                MoveImage4.Visible = false;
                MoveImage5.Visible = false;
                MoveImage6.Visible = false;
                MoveImage7.Visible = false;
                MoveImage8.Visible = false;
                MoveImage9.Visible = true;

                btnEditServiceTicket.Visible = false;
            }

            dropdowns.Visible = false;
            buttons.Visible = false;
        }

        protected void AuctionProgBtn_Click(object sender, EventArgs e)
        {


            //grab workflow id

            string WFQuery = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


            //Create sql command 
            SqlCommand sqlCommandID = new SqlCommand();
            sqlCommandID.Connection = sqlConnect;
            sqlCommandID.CommandType = CommandType.Text;
            sqlCommandID.CommandText = WFQuery;

            sqlCommandID.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader Result = sqlCommandID.ExecuteReader();

            string workFLow = "";
            while (Result.Read())
            {
                workFLow = Result["WFID"].ToString();


            }

            Result.Close();

            //-------------------
            string Query = "Update  WorkFlowProgress SET AuctionProgress = @Progress where WorkFlowID = @ID ";

            //Define the connection to the Database


            //Create sql command 
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = Query;


            sqlCommand.Parameters.AddWithValue("@Progress", HttpUtility.HtmlEncode(ddlAuctionProg.SelectedValue.ToString()));
            sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));
            //open connection to send ID query 
            
            SqlDataReader queryResult = sqlCommand.ExecuteReader();


            queryResult.Close();
            sqlConnect.Close();
            if (ddlAuctionProg.SelectedValue == "1")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = true;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "2")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = true;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "3")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = true;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "4")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = true;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "5")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = true;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "6")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = true;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "7")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = true;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "8")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = true;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "9")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = true;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "10")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = true;
                AuctionImage12.Visible = false;

            }
            if (ddlAuctionProg.SelectedValue == "11")
            {
                AuctionImage1.Visible = false;
                AuctionImage2.Visible = false;
                AuctionImage3.Visible = false;
                AuctionImage4.Visible = false;
                AuctionImage5.Visible = false;
                AuctionImage6.Visible = false;
                AuctionImage7.Visible = false;
                AuctionImage8.Visible = false;
                AuctionImage9.Visible = false;
                AuctionImage10.Visible = false;
                AuctionImage11.Visible = false;
                AuctionImage12.Visible = true;

                btnEditServiceTicket.Visible = false;
            }

            buttons.Visible = false;
            dropdowns.Visible = false;
        }

        protected void btnEditProgress_Click(object sender, EventArgs e)
        {
            if (buttons.Visible == false)
            {
                buttons.Visible = true;
                dropdowns.Visible = true;
            }
                
            else
            {
                buttons.Visible = false;
                dropdowns.Visible = false;
            }
                
        }
    }
}