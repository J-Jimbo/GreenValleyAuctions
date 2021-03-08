//created by Ben Ortt

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Lab3
{
    public partial class EditServiceTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //fills text boxes on load that is not postback
                List<String> services = new List<String>() { "Move", "Auction" };
                foreach (String service in services)
                {
                    ddlTicketType.Items.Add(service);
                }

                String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd1 = new SqlCommand("SELECT customerName FROM Customer"))
                    {
                        cmd1.CommandType = CommandType.Text;
                        cmd1.Connection = con;
                        con.Open();
                        ddlCustomerName.DataSource = cmd1.ExecuteReader();
                        ddlCustomerName.DataTextField = "customerName";
                        ddlCustomerName.DataBind();
                        con.Close();
                    }

                    using (SqlCommand cmd = new SqlCommand("SELECT employeeName, employeeID FROM Employee"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlEmployeeName.DataSource = cmd.ExecuteReader();
                        ddlEmployeeName.DataTextField = "employeeName";
                        ddlEmployeeName.DataValueField = "employeeID";
                        ddlEmployeeName.DataBind();
                        con.Close();
                    }

                    using (SqlCommand cmd = new SqlCommand("SELECT employeeName, employeeID FROM Employee"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlContact.DataSource = cmd.ExecuteReader();
                        ddlContact.DataTextField = "employeeName";
                        ddlContact.DataValueField = "employeeID";
                        ddlContact.DataBind();
                        con.Close();
                    }

                    using (SqlCommand cmd = new SqlCommand("SELECT auctionDate, auctionEventID FROM AuctionEvent"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlAucEvent.DataSource = cmd.ExecuteReader();
                        ddlAucEvent.DataTextField = "auctionDate";
                        ddlAucEvent.DataValueField = "auctionEventID";
                        ddlAucEvent.DataBind();
                        con.Close();
                    }
                }
                ddlAucEvent.Items.Add(new ListItem("No Event"));
            }
        }

        protected void ddlCustomerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            //finds all ticket open dates for a selected customer
            String custIDHold = (ddlCustomerName.SelectedIndex + 1).ToString();

            String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT ticketOpenDate FROM ServiceTicket where customerID = " + custIDHold))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    ddlOpenDate.DataSource = cmd.ExecuteReader();
                    ddlOpenDate.DataTextField = "ticketOpenDate";
                    ddlOpenDate.DataBind();
                    con.Close();
                }
            }
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            //finds the ticket with a certain customer and open date
            btnClear_Click(sender, e);

            int custNameHold = ddlCustomerName.SelectedIndex + 1;
            String dateHold = ddlOpenDate.SelectedValue;

            String serviceTicketIDHold;

            String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String qry = "SELECT serviceTicketID FROM serviceTicket WHERE customerID = '" + custNameHold + "' AND ticketOpenDate = '" + dateHold + "'";
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    con.Open();
                    serviceTicketIDHold = cmd.ExecuteScalar().ToString();

                    lblErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblErrorMsg.Text = "Ticket Found!";
                }

                qry = "Select ticketStatus, ticketOpenDate, deadlineDate, initiatingEmployee FROM ServiceTicket WHERE serviceTicketID = " + serviceTicketIDHold;
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    SqlDataReader reader = cmd.ExecuteReader();

                    while(reader.Read())
                    {
                        txtbxTicketStatus.Text = reader[0].ToString();
                        txtbxOpenDate.Text = reader[1].ToString();
                        txtbxDeadline.Text = reader[2].ToString();
                        ddlEmployeeName.SelectedIndex = Int32.Parse(reader[3].ToString()) - 1;
                    }
                    reader.Close();
                }

                qry = "SELECT moveFrom, moveTo, fuelCost, foodCost, lodgingCost FROM ServiceMove WHERE moveID = " + serviceTicketIDHold;
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        txtbxOriginAddress.Text = reader[0].ToString();
                        txtbxDestAddress.Text = reader[1].ToString();
                        txtbxFuelCost.Text = reader[2].ToString();
                        txtbxFoodCost.Text = reader[3].ToString();
                        txtbxLodgeCost.Text = reader[4].ToString();

                    }
                    reader.Close();
                }

                qry = "SELECT contactID, eventID FROM ServiceAuction WHERE aucID = " + serviceTicketIDHold;
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    SqlDataReader reader = cmd.ExecuteReader();

                    while (reader.Read())
                    {
                        ddlContact.SelectedIndex = Int32.Parse(reader[0].ToString());

                        if(reader[1].ToString() == "")
                        {
                            ddlAucEvent.SelectedValue = "No Event";
                        }
                        else
                        {
                            ddlAucEvent.SelectedIndex = Int32.Parse(reader[1].ToString());
                        }
                    }
                    reader.Close();
                }
            }
        }

        protected void btnCommit_Click(object sender, EventArgs e)
        {
            //takes the text box and ddl contents and updates the appropriate service ticket
            //also has http validators
            int custNameHold = ddlCustomerName.SelectedIndex + 1;
            String dateHold = ddlOpenDate.SelectedItem.Text;

            int empIDHold = ddlEmployeeName.SelectedIndex + 1;
            String statusHold = HttpUtility.HtmlEncode(txtbxTicketStatus.Text);
            String openDateHold = HttpUtility.HtmlEncode(txtbxOpenDate.Text);
            String deadlineHold = HttpUtility.HtmlEncode(txtbxDeadline.Text);

            String originHold = HttpUtility.HtmlEncode(txtbxOriginAddress.Text);
            String destinationHold = HttpUtility.HtmlEncode(txtbxDestAddress.Text);
            String fuelHold = HttpUtility.HtmlEncode(txtbxFuelCost.Text);
            String foodHold = HttpUtility.HtmlEncode(txtbxFoodCost.Text);
            String lodgeHold = HttpUtility.HtmlEncode(txtbxLodgeCost.Text);

            int contactHold = ddlContact.SelectedIndex + 1;
            int eventHold = ddlAucEvent.SelectedIndex + 1;

            String serviceTicketIDHold;

            String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String qry = "SELECT serviceTicketID FROM serviceTicket WHERE customerID = '" + custNameHold + "' AND ticketOpenDate = '" + dateHold + "'";
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    con.Open();
                    serviceTicketIDHold = cmd.ExecuteScalar().ToString();
                }

                qry = "UPDATE serviceTicket " +
                    "SET ticketStatus = @tickStat, ticketOpenDate = @tickOpen, deadlineDate = @deadline, InitiatingEmployee = @initEmp " +
                    "WHERE serviceTicketID = " + serviceTicketIDHold;
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    cmd.Parameters.AddWithValue("@tickStat", statusHold);
                    cmd.Parameters.AddWithValue("@tickOpen", openDateHold);
                    cmd.Parameters.AddWithValue("@deadline", deadlineHold);
                    cmd.Parameters.AddWithValue("@initEmp", empIDHold);

                    cmd.ExecuteNonQuery();

                }

                if (ddlTicketType.SelectedItem.Text == "Move")
                {
                    qry = "UPDATE ServiceMove " +
                        "SET moveFrom = @from, moveTo = @to, fuelCost = @fuel, foodCost = @food, lodgingCost = @lodge " +
                        "WHERE moveID = " + serviceTicketIDHold;
                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        cmd.Parameters.AddWithValue("@from", originHold);
                        cmd.Parameters.AddWithValue("@to", destinationHold);
                        cmd.Parameters.AddWithValue("@fuel", fuelHold);
                        cmd.Parameters.AddWithValue("@food", foodHold);
                        cmd.Parameters.AddWithValue("lodge", lodgeHold);


                        cmd.ExecuteNonQuery();

                        lblErrorMsg1.ForeColor = System.Drawing.Color.Green;
                        lblErrorMsg1.Text = "Move Ticket Updated!";
                    }
                }

                else
                {
                    qry = "UPDATE ServiceAuction " +
                        "SET contactID = @cont, eventID = @event " +
                        "WHERE aucID = " + serviceTicketIDHold;
                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        cmd.Parameters.AddWithValue("@cont", contactHold);
                        cmd.Parameters.AddWithValue("@event", eventHold);

                        cmd.ExecuteNonQuery();
                        con.Close();

                        lblErrorMsg1.ForeColor = System.Drawing.Color.Green;
                        lblErrorMsg1.Text = "Auction Ticket Updated!";
                    }
                }
            }
            btnClear_Click(sender, e);
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtbxTicketStatus.Text = "";
            txtbxOpenDate.Text = "";
            txtbxDeadline.Text = "";
            txtbxOriginAddress.Text = "";
            txtbxDestAddress.Text = "";
            txtbxFuelCost.Text = "";
            txtbxFoodCost.Text = "";
            txtbxLodgeCost.Text = "";
            lblErrorMsg.Text = "";
        }
    }
} 
