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

namespace Lab1
{
    public partial class AddService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if(!this.IsPostBack)
            {
                //populates the service requested ddl
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

                    using (SqlCommand cmd2 = new SqlCommand("SELECT customerName FROM Customer"))
                    {
                        cmd2.CommandType = CommandType.Text;
                        cmd2.Connection = con;
                        con.Open();
                        ddlCustomer.DataSource = cmd2.ExecuteReader();
                        ddlCustomer.DataTextField = "customerName";
                        ddlCustomer.DataBind();
                        con.Close();
                    }
                }
            }          
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            //clears text boxes
            txtbxServiceDeadline.Text = "";
            txtbxOriginAddress.Text = "";
            txtbxDestinationAddress.Text = "";
            txtbxFuelCost.Text = "";
            txtbxFoodCost.Text = "";
            txtbxLodgingCost.Text = "";
        }

        protected void btnPopulateAuc_Click(object sender, EventArgs e)
        {
            //fills text boxes for auc
            ddlCustomer.SelectedValue = "Rahim Howe";
            ddlServiceRequested.SelectedValue = "Auction";
            txtbxServiceDeadline.Text = "2021-11-09";
            ddlEmployeeName.SelectedValue = "Isabel Yarh";
            ddlContactEmployee.SelectedValue = "Isabel Yarh";
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            //fills text boxes for a move
            ddlCustomer.SelectedValue = "Daphne Horton";
            ddlServiceRequested.SelectedValue = "Move";
            txtbxServiceDeadline.Text = "2021-09-11";
            ddlEmployeeName.SelectedValue = "Sana Asay";
            txtbxOriginAddress.Text = "912 Garfield Ave.";
            txtbxDestinationAddress.Text = "138 Princess St.";
            txtbxFuelCost.Text = "$182.32";
            txtbxFoodCost.Text = "42.86";
            txtbxLodgingCost.Text = "89.99";
        }

        protected void btnCommit_Click(object sender, EventArgs e)
        {
            //takes all the variables selected
            int customer = ddlCustomer.SelectedIndex + 1;
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
                //adds a new service ticket with a ticket history already made

                String qry = "INSERT INTO ServiceTicket(deadlineDate, customerID, InitiatingEmployee) " +
                    "VALUES(@deadline, @custID, @initEmp)";
                using (SqlCommand command2 = new SqlCommand(qry, con))
                {
                    command2.Parameters.AddWithValue("@deadline", serviceDeadline);
                    command2.Parameters.AddWithValue("@custID", customer);
                    command2.Parameters.AddWithValue("@initEmp", initEmployee);

                    command2.Connection.Open();
                    command2.ExecuteNonQuery();
                }

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

                //adds the service based on type requested using paramaters for security
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
                        lblErrorMsg.Text = "Move Ticket Created.";
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
                        lblErrorMsg.Text = "Auction Ticket Created.";
                    }
                }
            }
        }
    }
}