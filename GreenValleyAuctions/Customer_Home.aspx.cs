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
            //on page load filter if recognized as client 
            string QueryEmail = "Select * from Customer where CustomerEmail = @ID;";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //Create sql command
            SqlCommand sqlCommandEmail = new SqlCommand();
            sqlCommandEmail.Connection = sqlConnect;
            sqlCommandEmail.CommandType = CommandType.Text;
            sqlCommandEmail.CommandText = QueryEmail;

            sqlCommandEmail.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader QResponse = sqlCommandEmail.ExecuteReader();

            string customer = "no";
            while (QResponse.Read())
            {
                if (QResponse.HasRows.Equals(true))
                {
                    btnMedia.Visible = true;
                    btnReview.Visible = true;
                    customer = "yes";
                }
                else
                {
                    btnMedia.Visible = false;
                    btnReview.Visible = false;
                    customer = "no";
                }

            }

            // Close conecctions
            QResponse.Close();
            sqlConnect.Close();

            //--------------------------------------------------------------
            //On Page load grab customer info
            string sqlQuery = "";
            if (customer.Equals("no"))
                sqlQuery = "Select trim(FirstName)+' '+trim(LastName) as Name,Phone,Email, trim(Street)+' '+trim(City)+' '+trim(State)+' '+trim(Zip) as CustomerAddress from CustomerRequest where Email = @ID;";
            else
                sqlQuery = "Select trim(FirstName)+' '+trim(LastName) as Name,CustomerPhone as Phone,CustomerEmail as Email,CustomerAddress from Customer where CustomerEmail = @ID; ";


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
                lblCompletion.Text = queryUResponse["CompletionDate"].ToString();
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
            //----------------new progress bar
            string progress = "select * from WorkflowProgress WFP inner join WorkFLow WF on WFP.WorkFlowID = WF.WorkFlowID inner join ServiceEvent SE on WF.WorkFlowID = SE.WorkFlowID where WF.CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID);";

            //Define the connection to the Database


            //Create sql command 
            SqlCommand sqlCommandProg = new SqlCommand();
            sqlCommandProg.Connection = sqlConnect;
            sqlCommandProg.CommandType = CommandType.Text;
            sqlCommandProg.CommandText = progress;

            sqlCommandProg.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryprogress = sqlCommandProg.ExecuteReader();


            while (queryprogress.Read())
            {
                if (queryprogress.HasRows)
                {

                    if (queryprogress["ServiceType"].ToString().Trim() == "Moving")
                    {




                        //---------------------------------------
                        if (queryprogress["MoveProgress"].ToString() == "1")
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
                        if (queryprogress["MoveProgress"].ToString() == "2")
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

                        if (queryprogress["MoveProgress"].ToString() == "3")
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

                        if (queryprogress["MoveProgress"].ToString() == "4")
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

                        if (queryprogress["MoveProgress"].ToString() == "5")
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
                        if (queryprogress["MoveProgress"].ToString() == "6")
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
                        if (queryprogress["MoveProgress"].ToString() == "7")
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
                        if (queryprogress["MoveProgress"].ToString() == "8")
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


                        }
                    }
                    else
                    {


                        //--------------------------------------------------------
                        if (queryprogress["AuctionProgress"].ToString() == "1")
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
                        if (queryprogress["AuctionProgress"].ToString() == "2")
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
                        if (queryprogress["AuctionProgress"].ToString() == "3")
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
                        if (queryprogress["AuctionProgress"].ToString() == "4")
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
                        if (queryprogress["AuctionProgress"].ToString() == "5")
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
                        if (queryprogress["AuctionProgress"].ToString() == "6")
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
                        if (queryprogress["AuctionProgress"].ToString() == "7")
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
                        if (queryprogress["AuctionProgress"].ToString() == "8")
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
                        if (queryprogress["AuctionProgress"].ToString() == "9")
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
                        if (queryprogress["AuctionProgress"].ToString() == "10")
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
                        if (queryprogress["AuctionProgress"].ToString() == "11")
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


                        }
                    }
                }



            }
            queryprogress.Close();
            sqlConnect.Close();

           
            //Images 
            string Photo = "Select AP.PhotoPath as EmpPhoto, CP.PhotoPath as CustomerPhoto From Customer C inner join WorkFlow wf on C.CustomerID = wf.CustomerID full join AuctionSchedulingForm asf on wf.WorkFlowID = asf.WorkFlowID full join AuctionPhotos ap on asf.SchedulingFormID = ap.SchedulingFormID full join CustomerPhotos CP on C.CustomerID = CP.CustomerID where C.CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID)";

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
                    if (PhotoResult.HasRows)
                    {
                        photoCell.Visible = true;
                    }
                }

                PhotoResult.Close();
                sqlConnect.Close();
            


        }

        protected void btnMedia_Click(object sender, EventArgs e)
        {
            if (btnUpload.Visible == false)
            {
                btnUpload.Visible = true;
                fuPhotos.Visible = true;
            }
            else
            {
                btnUpload.Visible = false;
                fuPhotos.Visible = false;
            }

        }

        protected void btnReview_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Review.aspx");
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

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            foreach (HttpPostedFile file in fuPhotos.PostedFiles)
            {
                //Define the connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

                string FinalQuery = "Insert into CustomerPhotos(CustomerPhotoID, PhotoPath,CustomerID  )Values((Select ISNULL(max(CustomerPhotoID)+1,1) from CustomerPhotos), @PhotoPath,(Select CustomerID from Customer where CustomerEmail = @ID)); ";
                //Create sql command 
                SqlCommand sqlCommandUpdate = new SqlCommand();
                sqlCommandUpdate.Connection = sqlConnect;
                sqlCommandUpdate.CommandType = CommandType.Text;
                sqlCommandUpdate.CommandText = FinalQuery;
                sqlCommandUpdate.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
                // get string path

                string strPath = Request.PhysicalApplicationPath + "Customer_Photos\\" + file.FileName.ToString();

                try
                {
                    // save photo to directory
                    fuPhotos.SaveAs(strPath);
                    //put path into database
                    sqlCommandUpdate.Parameters.AddWithValue("@PhotoPath", HttpUtility.HtmlEncode(file.FileName.ToString()));
                    //open connection to send  query 
                }
                catch
                {
                    sqlCommandUpdate.Parameters.AddWithValue("@PhotoPath", HttpUtility.HtmlEncode("None"));
                }
                sqlConnect.Open();
                SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                queryAnswer.Close();
                sqlConnect.Close();
            }
        }
    }
}