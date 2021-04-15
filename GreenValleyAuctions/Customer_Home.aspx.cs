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
    public partial class Customer_Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["Customer"] != null)
            {

            }
            else
            {
                Session["NoCustomer"] = "You Must first Login or create an Account";
                Response.Redirect("Customer_Login.aspx");
            }
            

                //--------------------------------------------------------------
                //On Page load grab customer info

                string sqlQuery = "Select trim(FirstName)+' '+trim(LastName) as Name,Phone,Email, trim(Street)+' '+trim(City)+' '+trim(State)+' '+trim(Zip) as CustomerAddress from CustomerRequest where Email = @ID;";

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
                    lblPhone.Text = queryResponse["Phone"].ToString();
                    lblEmail.Text = queryResponse["Email"].ToString();
                    lblName.Text = queryResponse["Name"].ToString();
                }

                // Close conecctions
                queryResponse.Close();
                sqlConnect.Close();

            try
            {
                //-----------------------------------------------------------------
                // Page Load grab Customer Info
                string QueryUpdate = "SELECT WorkFlowID, EngagmentDate, CompletionDate, Review, CurrentStatus, CustomerID FROM WorkFlow where CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID)";

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
                    lblCompletion.Text = queryUResponse["CompletionDate"].ToString().Trim().Substring(0, queryUResponse["CompletionDate"].ToString().IndexOf(' '));
                    lblCurrentStatus.Text = queryUResponse["CurrentStatus"].ToString();
                    lblReview.Text = queryUResponse["Review"].ToString();
                }
                // Close conecctions
                queryUResponse.Close();
                sqlConnect.Close();


                //----------------------------------



                String InitialNotesQuery = "SELECT ConversationNotes, CustomerID FROM InitialContact where CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID)";


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


                //PROGRESS BAR -- Initial Contact 
                string ContactQuery = "select * from InitialContact  where CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID)";

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
                string DateOptionQuery = "SELECT * FROM ServiceEvent SE inner join WorkFlow WF on WF.WorkFLowID = SE.WorkFlowID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID) and SE.ServiceEndDate is null;";

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
                string DateFinalQuery = "SELECT * FROM  WorkFlow WF inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID) and WF.CompletionDate is not null;";

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
                string CompletionQuery = "Select WF.WorkFlowID,Com.CustomerName,Cust.CustomerID from Customer as Cust inner join Workflow as WF on WF.CustomerID = Cust.CustomerID inner join CompletionForm as Com on Com.WorkFlowID = WF.WorkFlowID where cust.CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID);";



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

                string ReviewQuery = "Select * from WorkFlow where CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID) and Review is not null";

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
                }

                ReviewResult.Close();
                sqlConnect.Close();
                //Images 
                string Photo = "Select PhotoPath From Customer C inner join WorkFlow wf on C.CustomerID = wf.CustomerID inner join AuctionSchedulingForm asf on wf.WorkFlowID = asf.WorkFlowID inner join AuctionPhotos ap on asf.SchedulingFormID = ap.SchedulingFormID where C.CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID)";

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
                    if (PhotoResult.HasRows)
                    {
                        photoCell.Visible = true;
                    }
                }

                PhotoResult.Close();
                sqlConnect.Close();
            }
            catch
            {
                System.Diagnostics.Debug.WriteLine("Catch was triggered");
            }


        }

        protected void btnMedia_Click(object sender, EventArgs e)
        {

        }

        protected void btnReview_Click(object sender, EventArgs e)
        {

        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Request.aspx");
        }

        

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx?loggedOut=true");
        }

        protected void btnILogOut_Click(object sender, ImageClickEventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx?loggedOut=true");
        }
    }
}