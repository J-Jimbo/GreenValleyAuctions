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

namespace Lab2
{
    public partial class EditService1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!this.IsPostBack)
            {
                //fills the menus on load that is not postback
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
                }
            }
        }

        protected void ddlCustomerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            //listens for when the customer name selector changes and finds ticket info
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
            //takes the selected information and finds the service with the selected information
            int custNameHold = ddlCustomerName.SelectedIndex + 1;
            String dateHold = ddlOpenDate.SelectedValue;

            String serviceTicketIDHold;

            String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String qry = "SELECT serviceTicketID FROM serviceTicket WHERE customerID = '" + custNameHold + "' AND ticketOpenDate = '" + dateHold + "'";
                using (SqlCommand cmd = new SqlCommand(qry,con))
                {
                    con.Open();
                    serviceTicketIDHold = cmd.ExecuteScalar().ToString();

                    lblErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblErrorMsg.Text = "Ticket Found!";
                }

                qry = "SELECT MAX(ticketHistoryID) from TicketHistory where serviceTicketID = " + serviceTicketIDHold;
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    ddlEmployeeName.SelectedIndex = Int32.Parse(cmd.ExecuteScalar().ToString());
                    lblCurrentEmp.Text = ddlEmployeeName.SelectedItem.Text;
                }
            }
        }

        protected void btnCommit_Click(object sender, EventArgs e)
        {
            //takes whatever info is in the text boxes and updates the ticket found previously
            String empIDHold = (ddlEmployeeName.SelectedIndex + 1).ToString();
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

                    
                }

                qry = "INSERT INTO TicketHistory(serviceTicketID, employeeTicket) " +
                    "VALUES(@servID, @empID)";
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    cmd.Parameters.AddWithValue("@servID", serviceTicketIDHold);
                    cmd.Parameters.AddWithValue("@empID", empIDHold);

                    cmd.ExecuteNonQuery();
                    con.Close();

                    lblErrorMsg1.ForeColor = System.Drawing.Color.Green;
                    lblErrorMsg1.Text = "Ticket Moved!";
                }
            }
        }
    }
}

