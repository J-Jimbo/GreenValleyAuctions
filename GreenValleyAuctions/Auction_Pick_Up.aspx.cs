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
    public partial class Auction_Pick_Up : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // On page load check for existing file to view/edit
            if (IsPostBack != true)
            {
                try
                {
                    //query to check for existing form based on workflow
                    //query to grab workflow
                    string WFQuery = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

                    //Define the connection to the Database
                    SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

                    //Create sql command 
                    SqlCommand sqlCommandID = new SqlCommand();
                    sqlCommandID.Connection = sqlConnection;
                    sqlCommandID.CommandType = CommandType.Text;
                    sqlCommandID.CommandText = WFQuery;

                    sqlCommandID.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
                    //open connection to send ID query 
                    sqlConnection.Open();
                    SqlDataReader Result = sqlCommandID.ExecuteReader();

                    string workFLow = "";
                    while (Result.Read())
                    {
                        workFLow = Result["WFID"].ToString();


                    }

                    Result.Close();

                    //query to grab move screww form 
                    string formQuery = "Select * from AuctionPickUP where WorkFlowID = @ID;";

                    //Create sql command 
                    SqlCommand sqlCommandScreen = new SqlCommand();
                    sqlCommandScreen.Connection = sqlConnection;
                    sqlCommandScreen.CommandType = CommandType.Text;
                    sqlCommandScreen.CommandText = formQuery;


                    sqlCommandScreen.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

                    SqlDataReader answer = sqlCommandScreen.ExecuteReader();
                    while (answer.Read())
                    {
                        
                        //fill info
                      
                        txtAppraisal.Text = DateTime.Parse(answer["AppraisalDate"].ToString()).ToString("yyyy-MM-dd").Trim();
                        txtAppraisalConfirmed.Text = DateTime.Parse(answer["AppraisalDateConfirmed"].ToString()).ToString("yyyy-MM-dd").Trim();
                        txtBringIn.Text = DateTime.Parse(answer["BringinDate"].ToString()).ToString("yyyy-MM-dd").Trim();
                        txtBringInConfirmed.Text= DateTime.Parse(answer["BringInDateConfirmed"].ToString()).ToString("yyyy-MM-dd").Trim();
                        txtLookAt.Text= DateTime.Parse(answer["LookAtDate"].ToString()).ToString("yyyy-MM-dd").Trim();
                        txtLookAtConfirmed.Text= DateTime.Parse(answer["LookAtDateConfirmed"].ToString()).ToString("yyyy-MM-dd").Trim();
                        txtPickUp.Text= DateTime.Parse(answer["PickupDate"].ToString()).ToString("yyyy-MM-dd").Trim();
                        txtPickUpConfirmed.Text= DateTime.Parse(answer["PickUpDateConfirmed"].ToString()).ToString("yyyy-MM-dd").Trim();
                        txtSaleDateConfirmed.Text= DateTime.Parse(answer["SaleDate"].ToString()).ToString("yyyy-MM-dd").Trim();
                        txtLocation.Text = answer["Location"].ToString().Trim();
                        if (answer["Location"].ToString().Trim().Equals(null))
                        {
                            rblStorage.SelectedValue = "No";
                            rblStorage_SelectedIndexChanged(sender, e);
                        }
                        else
                        {
                            rblStorage.SelectedValue = "Yes";
                            rblStorage_SelectedIndexChanged(sender, e);
                        }

                    }

                    answer.Close();
                }
                catch
                {

                }
            }
            else
            {

            }
            //-------------------------------------------------------------
            //On Page load grab customer info

            string Query = "Select trim(FirstName) +' ' + trim(LastName) as CustomerName,CustomerPhone,CustomerEmail,IC.DateContacted ,MAX(IC.ContactID) as ID from Customer C inner join InitialContact IC on C.CustomerID = IC.CustomerID where c.customerID = @ID group by trim(FirstName) +' ' + trim(LastName),CustomerPhone,CustomerEmail,DateContacted; ";

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
                lblShowName.Text = queryResult["CustomerName"].ToString();
                lblShowPhone.Text = queryResult["CustomerPhone"].ToString();
                lblSHowEmai.Text = queryResult["CustomerEmail"].ToString();
                lblShowDate.Text = queryResult["DateContacted"].ToString().Trim();
            }

            queryResult.Close();
            sqlConnect.Close();
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            // random number 
            Random random = new Random();
            //create arrays to draw random data from
            string[] Date = {"1/25/2021","3/12/2021","6/7/2021","8/10/2021","2/1/2021","9/2/2021","10/20/2021","4/17/2021","10/1/2021","9/7/2021"  };
            string[] Location = {"L1 ","H2","A1 ","A7","J8","K10","C3","D4" };
           

            //filling txtboxes
            txtAppraisal.Text = Date[random.Next(0, Date.Length)];
            txtAppraisalConfirmed.Text = Date[random.Next(0, Date.Length)];
            txtBringIn.Text = Date[random.Next(0, Date.Length)];
            txtBringInConfirmed.Text = Date[random.Next(0, Date.Length)];
            txtLookAt.Text = Date[random.Next(0, Date.Length)];
            txtLookAtConfirmed.Text = Date[random.Next(0, Date.Length)];
            txtPickUp.Text = Date[random.Next(0, Date.Length)];
            txtPickUpConfirmed.Text = Date[random.Next(0, Date.Length)];
            txtSaleDateConfirmed.Text = Date[random.Next(0, Date.Length)];
            txtLocation.Text = Location[random.Next(0, Location.Length)];
            //select ddl

            rblStorage.SelectedIndex = random.Next(0, 2);
            if (rblStorage.SelectedValue.ToString().Equals("Yes"))
            {
                lblLocation.Visible = true;
                txtLocation.Visible = true;
            }
            else
            {
                lblLocation.Visible = false;
                txtLocation.Visible = false;
            }
        }

            protected void btnSave_Click(object sender, EventArgs e)
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
            SqlDataReader response = sqlCommandID.ExecuteReader();

            string workFLow = "";
            while (response.Read())
            {
                workFLow = response["WFID"].ToString();


            }

            response.Close();

            //----------------------------------------------------

            //check for existing form

            string AuctionPickUpID = "None";



            string existsQuery = "Select AuctionPickUpID  from AuctionPickUP where WorkFlowID = @ID; ";


            //Create sql command 
            SqlCommand sqlCommandExists = new SqlCommand();
            sqlCommandExists.Connection = sqlConnect;
            sqlCommandExists.CommandType = CommandType.Text;
            sqlCommandExists.CommandText = existsQuery;

            sqlCommandExists.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow.ToString()));
            //open connection to send ID query 

            SqlDataReader answer = sqlCommandExists.ExecuteReader();


            while (answer.Read())
            {
                if (answer.HasRows)
                    AuctionPickUpID = answer["AuctionPickUpID"].ToString().Trim();
                else
                    AuctionPickUpID = "None";

            }

            answer.Close();

            //--------------------------------------------------------------------------------------------------------------------------


            // query to check workflow id
            string sqlQueryID = "";
            if (AuctionPickUpID.Equals("None"))
            {
                sqlQueryID = "Insert into AuctionPickUP(AuctionPickUpID , BringInDate, PickupDate, LookAtDate, AppraisalDate," +
               " BringInDateConfirmed,PickUpDateConfirmed ,LookAtDateConfirmed ,AppraisalDateConfirmed ,SaleDate ,Location ,WorkFlowID)" +
               "Values((Select ISNULL(max(AuctionPickUPID)+1,1) from AuctionPickUP),@BringIn,@PickUp,@LookAt,@Appraisal,@BringInConfirmed,@PickUpConfirmed,@LookAtConfirmed,@AppraisalConfirmed" +
               ",@Sale,@Location,@ID)";
            }
            else
            {
                sqlQueryID = "UPDATE AuctionPickUP SET BringInDate =@BringIn, PickupDate = @PickUp, LookAtDate = @LookAt, AppraisalDate =@Appraisal," +
                    "BringInDateConfirmed = @BringInConfirmed,PickUpDateConfirmed =@PickUpConfirmed ,LookAtDateConfirmed =@LookAtConfirmed ,AppraisalDateConfirmed =@AppraisalConfirmed ," +
                    "SaleDate =@Sale ,Location = @Location WHERE WorkFlowID = @ID ";
            }
            //Create sql command to receive ID
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQueryID;

           


            //Parameter
            sqlCommand.Parameters.AddWithValue("@Appraisal", HttpUtility.HtmlEncode(txtAppraisal.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@AppraisalConfirmed", HttpUtility.HtmlEncode(txtAppraisalConfirmed.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@BringIn", HttpUtility.HtmlEncode(txtBringIn.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@BringInConfirmed", HttpUtility.HtmlEncode(txtBringInConfirmed.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@Location", HttpUtility.HtmlEncode(txtLocation.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@LookAt", HttpUtility.HtmlEncode(txtLookAt.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@LookAtConfirmed", HttpUtility.HtmlEncode(txtLookAtConfirmed.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@PickUp", HttpUtility.HtmlEncode(txtPickUp.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@PickUpConfirmed", HttpUtility.HtmlEncode(txtPickUpConfirmed.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@Sale", HttpUtility.HtmlEncode(txtSaleDateConfirmed.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

           


            //open connection to send ID query 
            SqlDataReader queryValue = sqlCommand.ExecuteReader();

            // Close conecctions
            queryValue.Close();
            sqlConnect.Close();
            
           
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            
            HttpUtility.HtmlEncode(txtAppraisal.Text = " ");
            HttpUtility.HtmlEncode(txtAppraisalConfirmed.Text = " ");
            HttpUtility.HtmlEncode(txtBringIn.Text = " ");
            HttpUtility.HtmlEncode(txtBringInConfirmed.Text = " ");
            HttpUtility.HtmlEncode(txtLocation.Text = " ");
            HttpUtility.HtmlEncode(txtLookAt.Text = " ");
            HttpUtility.HtmlEncode(txtLookAtConfirmed.Text = " ");
            HttpUtility.HtmlEncode(txtPickUpConfirmed.Text = " ");
            HttpUtility.HtmlEncode(txtSaleDateConfirmed.Text = " ");
            HttpUtility.HtmlEncode(txtPickUp.Text = " ");


        }

        protected void rblStorage_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rblStorage.SelectedValue.ToString().Equals("Yes"))
            {
                lblLocation.Visible = true;
                txtLocation.Visible = true;
            }
            else
            {
                lblLocation.Visible = false;
                txtLocation.Visible = false;
            }
        }

        
    }
}