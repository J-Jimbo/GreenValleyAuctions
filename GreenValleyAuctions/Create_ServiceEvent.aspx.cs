using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab2
{
    public partial class Create_ServiceEvent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
            // set visiblity of destination address
            if (dplServiceType.SelectedValue.Equals("Moving"))
                tblDestination.Visible = true;
            else
                tblDestination.Visible = false;

                //-----------------------------------------
                // continue workflow
                if (Session["ServiceRequest"] != null && IsPostBack.Equals(false))
                {
                    dplCustomer.Enabled = false;
                    dplServiceType.Enabled = false;

                    //Get CustomerID
                    String sqlQID = "Select MAX(CustomerID) as CID from Customer";

                    //Parse Service request info

                    string sqlQuery = "SELECT * from ServiceRequest sr inner join CustomerRequest cr on sr.CustomerRequestID = cr.CustomerRequestID where sr.CustomerRequestID = @CustomerRequestID";

                    //Define the connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                    //Create sql command
                    SqlCommand sqlCommandID = new SqlCommand();
                    sqlCommandID.Connection = sqlConnect;
                    sqlCommandID.CommandType = CommandType.Text;
                    sqlCommandID.CommandText = sqlQID;

                    //open connection to send ID query 
                    sqlConnect.Open();
                    SqlDataReader queryResponse = sqlCommandID.ExecuteReader();

                    int CustomerID;
                    while (queryResponse.Read())
                    {
                        CustomerID = int.Parse(queryResponse["CID"].ToString());
                        dplCustomer.SelectedValue = CustomerID.ToString();
                    }

                    // Close conecctions
                    queryResponse.Close();
                    sqlConnect.Close();

                    //Create sql command 
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = sqlQuery;
                    sqlCommand.Parameters.AddWithValue("@CustomerRequestID", Session["ServiceRequest"].ToString());

                    //open connection to send ID query 
                    sqlConnect.Open();
                    SqlDataReader queryValue = sqlCommand.ExecuteReader();

                    while (queryValue.Read())
                    {

                        dplServiceType.SelectedValue = queryValue["ServiceType"].ToString();
                    }

                    // Close conecctions
                    queryValue.Close();
                    sqlConnect.Close();
                    
                }
                
            
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //  used to confirm validation before saving to DB
            if(dplServiceType.SelectedIndex.Equals("Moving"))
            {
                rfvDestCity.IsValid = true;
                rfvDestState.IsValid = true;
                rfvDestStrt.IsValid = true;
                rfvDestZip.IsValid = true;
            }
            if (cbRange.Checked.Equals(false))
                cvDateRange.IsValid = true;
            if (Page.IsValid == true)
            {
                //define connection to the DB
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                // query to check workflow id
                string sqlQueryID = "SELECT MAX(WorkFlowID) from WorkFlow";

                //Create sql command to receive ID
                SqlCommand sqlCommandID = new SqlCommand();
                sqlCommandID.Connection = sqlConnect;
                sqlCommandID.CommandType = CommandType.Text;
                sqlCommandID.CommandText = sqlQueryID;

                //open connection to send ID query 
                sqlConnect.Open();
                SqlDataReader queryValue = sqlCommandID.ExecuteReader();

                //loop to read query value and increment workflowID if needed
                int workFlowID = 0;
                while (queryValue.Read())
                {
                    try
                    {
                        workFlowID = queryValue.GetInt32(0);
                    }
                    catch (Exception)
                    {
                        workFlowID = 0;
                    }

                }

                workFlowID++;

                // Close conecctions
                queryValue.Close();
                sqlConnect.Close();

                //-----------------------------------------------------------------

                // query to check service event id
                string sqlQuerySEID = "SELECT MAX(ServiceEventID) from ServiceEvent";

                //Create sql command to receive ID
                SqlCommand sqlCommandSEID = new SqlCommand();
                sqlCommandSEID.Connection = sqlConnect;
                sqlCommandSEID.CommandType = CommandType.Text;
                sqlCommandSEID.CommandText = sqlQuerySEID;

                //open connection to send ID query 
                sqlConnect.Open();
                SqlDataReader queryAsnwer = sqlCommandID.ExecuteReader();

                // loop to check and increment serviceID
                int serviceEventID = 0;
                while (queryAsnwer.Read())
                {

                    try
                    {
                        serviceEventID = queryAsnwer.GetInt32(0);
                    }
                    catch (Exception)
                    {
                        serviceEventID = 0;
                    }

                }

                serviceEventID++;

                // Close conecctions
                queryAsnwer.Close();
                sqlConnect.Close();

                //--------------------------------------------------------

                //Prsing for Customer ID
                int customerID = int.Parse(dplCustomer.SelectedValue);

                //parse empID
                int employeeID = int.Parse(ddlEmpList.SelectedValue);
                //query to create a workflow 

                String sqlQueryWF = "Insert INTO Workflow (WorkflowID, EngagmentDate, CurrentStatus,CustomerID,EmployeeID) VALUES (  @WorkFlowID ,GetDate(), 'In Progress' , @CustomerID, @EmployeeID )";


                //Create SQL command to send query
                SqlCommand sqlCommandWF = new SqlCommand();
                sqlCommandWF.Connection = sqlConnect;
                sqlCommandWF.CommandType = CommandType.Text;
                sqlCommandWF.CommandText = sqlQueryWF;

                sqlCommandWF.Parameters.AddWithValue("@WorkFLowID", workFlowID);
                sqlCommandWF.Parameters.AddWithValue("@CustomerID", customerID);
                sqlCommandWF.Parameters.AddWithValue("@EmployeeID", employeeID);

                //Open connection to send query
                sqlConnect.Open();
                SqlDataReader queryResult = sqlCommandWF.ExecuteReader();

                // close connection

                queryResult.Close();
                sqlConnect.Close();




                //query to create service event
                String sqlQuerySE = "";
                if (cbRange.Checked.Equals(false))
                {
                     sqlQuerySE = "Insert INTO ServiceEvent (ServiceID, ServiceDate, ServiceCost, ServiceType, WorkFlowID ) VALUES ( @ServiceEventID, @ServiceDate,@ServiceCost," +
                        "@ServiceType ,  @WorkFlowID )";
                }
                else
                {
                     sqlQuerySE = "Insert INTO ServiceEvent (ServiceID, ServiceDate, ServiceEndDate, ServiceCost, ServiceType, WorkFlowID ) VALUES ( @ServiceEventID , @ServiceDate  , @DateRange, @ServiceCost, @ServiceType, @WorkFlowID )";
                }
                
                
                //Create SQL command to send query
                SqlCommand sqlCommandSE = new SqlCommand();
                sqlCommandSE.Connection = sqlConnect;
                sqlCommandSE.CommandType = CommandType.Text;
                sqlCommandSE.CommandText = sqlQuerySE;

                sqlCommandSE.Parameters.AddWithValue("@ServiceEventID", serviceEventID);
                sqlCommandSE.Parameters.AddWithValue("@ServiceDate", HttpUtility.HtmlEncode(txtServiceDate.Text));
                sqlCommandSE.Parameters.AddWithValue("@DateRange", HttpUtility.HtmlEncode(txtDateRange.Text));
                sqlCommandSE.Parameters.AddWithValue("@ServiceCost", int.Parse(HttpUtility.HtmlEncode(txtServiceCost.Text)));
                sqlCommandSE.Parameters.AddWithValue("@ServiceType", dplServiceType.SelectedValue);
                sqlCommandSE.Parameters.AddWithValue("@WorkFLowID", workFlowID);

                //Open connection to send query
                sqlConnect.Open();
                SqlDataReader queryResponse = sqlCommandSE.ExecuteReader();
                //Close Connection
                queryResponse.Close();
                sqlConnect.Close();


                //--------------------------------------------------------------------
                // send to database only if moving event
                string sqlQueryServiceType = "";
                if (dplServiceType.SelectedValue == "Moving")
                {
                    sqlQueryServiceType = "Insert INTO Moving (ServiceID, OriginAddress, DestinationAddress) VALUES( @ServiceEventID, @Street +' ' + @City + ' '+ @State + ' ' + @Zip, " +
                        "@DestStreet + ' ' + @DestCity + ' ' + @DestState + ' ' + @DestZip)";

                    




                }
                //Send to DB only if Auction
                else
                {
                    sqlQueryServiceType= "INSERT Into Auction(ServiceID, Status, Address) VALUES(  @ServiceEventID , 'In Progress', @Street +' ' + @City + ' '+ @State + ' ' + @Zip)";
                }
                //Create SQL command to send query
                SqlCommand sqlCommandSET = new SqlCommand();
                sqlCommandSET.Connection = sqlConnect;
                sqlCommandSET.CommandType = CommandType.Text;
                sqlCommandSET.CommandText = sqlQueryServiceType;

                sqlCommandSET.Parameters.AddWithValue("@ServiceEventID", serviceEventID);
                sqlCommandSET.Parameters.AddWithValue("@Street", HttpUtility.HtmlEncode(txtStreet.Text));
                sqlCommandSET.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(txtCIty.Text));
                sqlCommandSET.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(txtState.Text));
                sqlCommandSET.Parameters.AddWithValue("@Zip", HttpUtility.HtmlEncode(txtZip.Text));
                sqlCommandSET.Parameters.AddWithValue("@DestStreet", HttpUtility.HtmlEncode(txtDestStrt.Text));
                sqlCommandSET.Parameters.AddWithValue("@DestCity", HttpUtility.HtmlEncode(txtDestCity.Text));
                sqlCommandSET.Parameters.AddWithValue("@DestState", HttpUtility.HtmlEncode(txtDestState.Text));
                sqlCommandSET.Parameters.AddWithValue("@DestZip", HttpUtility.HtmlEncode(txtDestZip.Text));

                //Open connection to send query
                sqlConnect.Open();
                SqlDataReader queryFeedBack = sqlCommandSET.ExecuteReader();
                //Close Connection
                queryFeedBack.Close();
                sqlConnect.Close();
                //--------------------------------------
                lblStatus.ForeColor = Color.Green;
                lblStatus.Font.Bold = true;
                lblStatus.Text = "Service Event Created";
            }

            if(Session["ServiceRequest"] != null)
            {
                Session["Delete"] = Session["ServiceRequest"].ToString();
                Session["ServiceRequest"] = null;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            //clear genral service info
            HttpUtility.HtmlEncode(txtServiceDate.Text = "");
            HttpUtility.HtmlEncode(txtServiceCost.Text = "");
            //Clear Origin address
            HttpUtility.HtmlEncode(txtState.Text = "");
            HttpUtility.HtmlEncode(txtStreet.Text = "");
            HttpUtility.HtmlEncode(txtZip.Text = "");
            HttpUtility.HtmlEncode(txtCIty.Text = "");
            //clear destination address
            HttpUtility.HtmlEncode(txtDestCity.Text = "");
            HttpUtility.HtmlEncode(txtDestState.Text = "");
            HttpUtility.HtmlEncode(txtDestStrt.Text = "");
            HttpUtility.HtmlEncode(txtDestZip.Text = "");



        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            // creaing random number
            Random random = new Random();

            //creating array to draw random data from
            string[] serviceDate = { "01/18/2021", "03/24/2021", "08/2/2021", "12/5/2021", "06/17/2021", "04/21/2021", "09/6/2021", "02/7/2021" };
            string[] serviceCost = { "20", "500", "75", "5000", "2500", "100", "3000", "45", };
            string[] street = { "1787 Go Dukes Rd", "10 Maple Way", "20 Main St" };
            string[] zip = { "38469", "08740", "27548", "01129", "05380", "02340" };
            string[] city = { "New York", "HarrisonBurg", "Chicago", "Trenton", "Boston", "D.C." };
            string[] state = { "New York", "Virginia", "Massachusetts", "Washington", "New Jersey", "Illinois" };
            Boolean[] check = { true, false };
            string[] endRangeDate = { "01/24/2021", "05/13/2021", "12/21/2021", "9/17/2021", "06/12/2021" };
            
            //filling textboxes
            txtServiceDate.Text = serviceDate[random.Next(0, serviceDate.Length)];
            txtServiceCost.Text = serviceCost[random.Next(0, serviceCost.Length)];
            //origin
            txtStreet.Text = street[random.Next(0, street.Length)];
            txtZip.Text = zip[random.Next(0, zip.Length)];
            txtCIty.Text = city[random.Next(0, city.Length)];
            txtState.Text = state[random.Next(0, state.Length)];






            // random drop down lists
            if (dplServiceType.Enabled.Equals(true))
            {
                dplServiceType.SelectedIndex = random.Next(0, dplServiceType.Items.Count);
                dplCustomer.SelectedIndex = random.Next(0, dplCustomer.Items.Count);
            }
            //random check box
            cbRange.Checked = check[random.Next(0,check.Length)];

            //end range
            if (cbRange.Checked.Equals(true))
            {
                lblEndDate.Visible = true;
                txtDateRange.Visible = true;
                txtDateRange.Text = endRangeDate[random.Next(0, endRangeDate.Length)];
            }
            else
            {
                lblEndDate.Visible = false;
                txtDateRange.Visible = false;
                txtDateRange.Text = " ";
            }

            //destination
            if (dplServiceType.SelectedValue.Equals("Moving"))
            {
                tblDestination.Visible = true;
                txtDestStrt.Text = street[random.Next(0, street.Length)];
                txtDestZip.Text = zip[random.Next(0, zip.Length)];
                txtDestCity.Text = city[random.Next(0, city.Length)];
                txtDestState.Text = state[random.Next(0, state.Length)];

            }
            else
                tblDestination.Visible = false;
        }
        

        protected void cvCustomer_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string customer = dplCustomer.SelectedValue;


            // query to check workflow id
            string sqlQueryCompletionDate = "Select CurrentStatus from Customer c inner join WorkFlow wf on c.CustomerID = wf.CustomerID  where c.CustomerID = " + customer;

            //define connection to the DB
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);




            //Create sql command to receive ID
            SqlCommand sqlCommandCompletionDate = new SqlCommand();
            sqlCommandCompletionDate.Connection = sqlConnect;
            sqlCommandCompletionDate.CommandType = CommandType.Text;
            sqlCommandCompletionDate.CommandText = sqlQueryCompletionDate;

            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResponse = sqlCommandCompletionDate.ExecuteReader();

            //reading the query
            while (queryResponse.Read())
            {
                //accept values if not in porgress, deny values that are null assuming they are not complete
                try
                {
                    if (queryResponse.GetString(0).Trim() == "In Progress")
                    {
                        args.IsValid = false;
                    }
                    else
                        args.IsValid = true;

                }
                catch (Exception)
                {
                    args.IsValid = false;
                }

            }


            // Close conecctions
            queryResponse.Close();
            sqlConnect.Close();


        }
      

        

        protected void btnNotes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Service_Ticket.aspx");
        }

        protected void cbRange_CheckedChanged(object sender, EventArgs e)
        {
            //set visiblity for range deadline
            if(cbRange.Checked.Equals(true))
            {
                lblEndDate.Visible = true;
                txtDateRange.Visible = true;
            }
            else
            {
                lblEndDate.Visible = false;
                txtDateRange.Visible = false;
            }
        }

        protected void dplServiceType_SelectedIndexChanged(object sender, EventArgs e)
        {
            //visibility for destination address
           if(dplServiceType.SelectedValue.Equals("Moving"))
            tblDestination.Visible = true;
           else
                tblDestination.Visible = false;
        }
    }
}