//Created by Ben Ortt

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Lab1
{
    public partial class AddCustomer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //loads the contents of the drop down menues when not a postback
            if (!this.IsPostBack)
            {
                List<String> contactTypes = new List<String>() { "In Person", "Phone", "Email", "Text", "Other" };
                foreach (String type in contactTypes)
                {
                    ddlInitialContact.Items.Add(type);
                }

                List<String> services = new List<String>() { "Move", "Auction" };
                foreach (String service in services)
                {
                    ddlServiceRequested.Items.Add(service);
                }

                String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT employeeName FROM Employee"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlEmployeeName.DataSource = cmd.ExecuteReader();
                        ddlEmployeeName.DataTextField = "employeeName";
                        ddlEmployeeName.DataBind();
                        con.Close();
                    }

                    using (SqlCommand cmd1 = new SqlCommand("SELECT employeeName FROM Employee"))
                    {
                        cmd1.CommandType = CommandType.Text;
                        cmd1.Connection = con;
                        con.Open();
                        ddlContactEmployee.DataSource = cmd1.ExecuteReader();
                        ddlContactEmployee.DataTextField = "employeeName";
                        ddlContactEmployee.DataBind();
                        con.Close();
                    }

                    //fills in info if the user is coming from a customer request
                    if (Session["NewCustomer"] != null)
                    {
                        ddlInitialContact.SelectedValue = "Other";
                        txtbxOtherContact.Text = "Website";

                        using (SqlCommand cmd2 = new SqlCommand("SELECT customerName, customerAddress, customerPhone, typeOfService, requestDate " +
                            "FROM ServiceRequest WHERE customerName = '" + Session["NewCustomer"].ToString() + "'"))
                        {
                            cmd2.CommandType = CommandType.Text;
                            cmd2.Connection = con;
                            con.Open();
                            SqlDataReader reader = cmd2.ExecuteReader();
                            while (reader.Read())
                            {
                                txtbxCustomerName.Text = reader[0].ToString();
                                txtbxCustomerAddress.Text = reader[1].ToString();
                                txtbxCustomerPhone.Text = reader[2].ToString();
                                ddlServiceRequested.SelectedValue = reader[3].ToString();
                                txtbxServiceDeadline.Text = reader[4].ToString();
                            }
                            Session["NewCustomer"] = null;
                            con.Close();
                        }
                    }
                }

                

            }
            
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            //sets the text boxes for Customer info
            txtbxCustomerName.Text = "Jimmy Bob";
            txtbxCustomerAddress.Text = "8072 Charles Lane";
            txtbxCustomerEmail.Text = "JimmyBob@fake.com";
            txtbxCustomerPhone.Text = "(730) 508-8001";
            ddlInitialContact.SelectedValue = "Phone";
            txtbxHDYH.Text = "Internet Ad";
            ddlServiceRequested.SelectedValue = "Move";
            txtbxServiceDeadline.Text = "2021-04-20";
            ddlEmployeeName.SelectedValue = "Scott Barth";

            //sets the text boxes for move info
            txtbxOriginAddress.Text = "7238 Prospect Street";
            txtbxDestinationAddress.Text = "50 Oak Valley Drive";
            txtbxFuelCost.Text = "$150.42";
            txtbxFoodCost.Text = "63.94";
            txtbxLodgingCost.Text = "95.12";
        }

        
        //sets the text boxes to empty
        protected void btnClear_Click(object sender, EventArgs e)
        {
            //empties customer info
            txtbxCustomerName.Text = "";
            txtbxCustomerAddress.Text = "";
            txtbxCustomerEmail.Text = "";
            txtbxCustomerPhone.Text = "";
            txtbxOtherContact.Text = "";
            txtbxHDYH.Text = "";
            txtbxServiceDeadline.Text = "";

            //empties move info
            txtbxOriginAddress.Text = "";
            txtbxDestinationAddress.Text = "";
            txtbxFuelCost.Text = "";
            txtbxFoodCost.Text = "";
            txtbxLodgingCost.Text = "";
        }

        protected void btnPopulateAuc_Click(object sender, EventArgs e)
        {
            //sets text boxes for customer info
            txtbxCustomerName.Text = "Ben Ortt";
            txtbxCustomerAddress.Text = "82 Devon Lane";
            txtbxCustomerEmail.Text = "BenOrtt@fake.com";
            txtbxCustomerPhone.Text = "(703) 502-0810";
            ddlInitialContact.SelectedValue = "Other";
            txtbxOtherContact.Text = "Messanger Pidgeon";
            txtbxHDYH.Text = "Flier";
            ddlServiceRequested.SelectedValue = "Auction";
            txtbxServiceDeadline.Text = "2021-08-12";;
            ddlEmployeeName.SelectedValue = "Scott Barth";

            //sets ddl for auction info
            ddlContactEmployee.SelectedValue = "Kelly Chan";
            

        }

        protected void btnCommit_Click(object sender, EventArgs e)
        {
            if (txtbxCustomerName.Text != "" &&
                txtbxCustomerAddress.Text != "" &&
                txtbxCustomerEmail.Text != "" &&
                txtbxCustomerPhone.Text != "" &&
                txtbxServiceDeadline.Text != "")
            {
                //saves customer specific information
                String customerName = HttpUtility.HtmlEncode(txtbxCustomerName.Text);
                String customerAddress = HttpUtility.HtmlEncode(txtbxCustomerAddress.Text);
                String customerEmail = HttpUtility.HtmlEncode(txtbxCustomerEmail.Text);
                String customerPhone = HttpUtility.HtmlEncode(txtbxCustomerPhone.Text);
                String initialContact = ddlInitialContact.SelectedItem.Text;
                String otherContact = HttpUtility.HtmlEncode(txtbxOtherContact.Text);
                String HDYH = HttpUtility.HtmlEncode(txtbxHDYH.Text);
                int serviceRequested = ddlServiceRequested.SelectedIndex + 1;
                String serviceDeadline = HttpUtility.HtmlEncode(txtbxServiceDeadline.Text);
                int initEmployee = ddlEmployeeName.SelectedIndex + 1;

                //saves move information
                String originAddress = HttpUtility.HtmlEncode(txtbxOriginAddress.Text);
                String destinationAddress = HttpUtility.HtmlEncode(txtbxDestinationAddress.Text);
                String fuelCost = HttpUtility.HtmlEncode(txtbxFuelCost.Text);
                String foodCost = HttpUtility.HtmlEncode(txtbxFoodCost.Text);
                String lodgeCost = HttpUtility.HtmlEncode(txtbxLodgingCost.Text);

                //saves auction information
                int contactEmpID = ddlContactEmployee.SelectedIndex + 1;

                String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    //queries to add a customer
                    String qry = "INSERT INTO Customer(customerName, customerAddress, customerEmail, customerPhone, customerInitialContact, customerInitialContactOther, customerHDYH) " +
                        "VALUES(@custName, @custAddress, @custEmail, @custPhone, @custInitContact, @custInitContactOther, @custHDYH)";
                    using (SqlCommand command = new SqlCommand(qry, con))
                    {
                        command.Parameters.AddWithValue("@custName", customerName);
                        command.Parameters.AddWithValue("@custAddress", customerAddress);
                        command.Parameters.AddWithValue("@custEmail", customerEmail);
                        command.Parameters.AddWithValue("@custPhone", customerPhone);
                        command.Parameters.AddWithValue("@custInitContact", initialContact);
                        command.Parameters.AddWithValue("@custInitContactOther", otherContact);
                        command.Parameters.AddWithValue("@custHDYH", HDYH);

                        command.Connection.Open();
                        int result = command.ExecuteNonQuery();

                    }
                    
                    //creates the other tables needed to store a customer, like service ticket
                    qry = "SELECT customerID from Customer where customerName = '" + customerName + "'";
                    String custIDHolder;
                    using (SqlCommand command1 = new SqlCommand(qry, con))
                    {
                        custIDHolder = command1.ExecuteScalar().ToString();
                    }

                    qry = "INSERT INTO ServiceTicket(deadlineDate, customerID, InitiatingEmployee) " +
                        "VALUES(@deadline, @custID, @initEmp)";
                    using (SqlCommand command2 = new SqlCommand(qry, con))
                    {
                        command2.Parameters.AddWithValue("@deadline", serviceDeadline);
                        command2.Parameters.AddWithValue("@custID", custIDHolder);
                        command2.Parameters.AddWithValue("@initEmp", initEmployee);

                        command2.ExecuteNonQuery();
                    }

                    //makes a new ticket history for the service ticket for it to be moved around
                    qry = "SELECT MAX (serviceTicketID) FROM ServiceTicket";
                    String serviceTicketIDHolder;
                    using (SqlCommand command3 = new SqlCommand(qry, con))
                    {
                        serviceTicketIDHolder = command3.ExecuteScalar().ToString();
                    }

                    qry = "INSERT INTO TicketHistory(serviceTicketID, employeeTicket) " +
                        "VALUES(@servID, @empID)";
                    using (SqlCommand command4 = new SqlCommand(qry, con))
                    {
                        command4.Parameters.AddWithValue("@servID", serviceTicketIDHolder);
                        command4.Parameters.AddWithValue("@empID", initEmployee);

                        command4.ExecuteNonQuery();
                    }

                    //adds to the database based on the type of service requested
                    if (ddlServiceRequested.SelectedItem.Text == "Move")
                    {
                        qry = "INSERT INTO ServiceMove(moveID, moveFrom, moveTo, fuelCost, foodCost, lodgingCost) " +
                            "VALUES(@mvID, @ori, @dest, @fuel, @food, @lodge)";
                        using (SqlCommand command5 = new SqlCommand(qry, con))
                        {
                            command5.Parameters.AddWithValue("@mvID", serviceTicketIDHolder);
                            command5.Parameters.AddWithValue("@ori", originAddress);
                            command5.Parameters.AddWithValue("@dest", destinationAddress);
                            command5.Parameters.AddWithValue("@fuel", fuelCost);
                            command5.Parameters.AddWithValue("@food", foodCost);
                            command5.Parameters.AddWithValue("@lodge", lodgeCost);

                            command5.ExecuteNonQuery();

                            lblErrorMsg.ForeColor = System.Drawing.Color.Green;
                            lblErrorMsg.Text = "Customer Added, Move Ticket Created.";
                        }
                    }

                    else
                    {
                        qry = "INSERT INTO ServiceAuction(aucID, contactID) " +
                            "VALUES(@aucid, @contID)";
                        using (SqlCommand command6 = new SqlCommand(qry, con))
                        {
                            command6.Parameters.AddWithValue("@aucid", serviceTicketIDHolder);
                            command6.Parameters.AddWithValue("@contID", contactEmpID);

                            command6.ExecuteNonQuery();

                            lblErrorMsg.ForeColor = System.Drawing.Color.Green;
                            lblErrorMsg.Text = "Customer Added, Auction Ticket Created.";
                        }
                    }
                }


            }

            else
            {
                lblErrorMsg.Text = "Empty text boxes, try again.";
            }
        }
    }
}