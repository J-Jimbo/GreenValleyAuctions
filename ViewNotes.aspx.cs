//creatd by Ben Ortt


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
    public partial class EditService : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            
            if (!this.IsPostBack)
            {
                //loads the contents for the ddl
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
                }
            }
        }

        protected void ddlCustomerName_SelectedIndexChanged(object sender, EventArgs e)
        {
            //finds all open dates possible for a customer
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
            //finds the service ticket ID and information for a customer and a specific open date

            lstbxPrevEmp.Items.Clear();

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

                qry = "SELECT employeeName FROM Employee INNER JOIN TicketHistory on TicketHistory.employeeTicket = Employee.employeeID where ServiceTicketID = " + serviceTicketIDHold;
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    SqlDataReader queryResults = cmd.ExecuteReader();

                    while (queryResults.Read())
                    {
                        lstbxPrevEmp.Items.Add(queryResults["employeeName"].ToString());
                    }
                    queryResults.Close();
                }

                qry = "SELECT noteTitle, serviceNoteID FROM ServiceNotes where serviceTicketID = " + serviceTicketIDHold;
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    ddlNoteTitle.DataSource = cmd.ExecuteReader();
                    ddlNoteTitle.DataTextField = "noteTitle";
                    ddlNoteTitle.DataValueField = "serviceNoteID";
                    ddlNoteTitle.DataBind();
                    con.Close();
                }
            }
        }

        protected void ddlNoteTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            //loads the contents of the notes when a note title is clicked on
            String noteTitleHolder = HttpUtility.HtmlEncode(ddlNoteTitle.SelectedItem.Text);

            String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                String qry = "SELECT noteContents FROM ServiceNotes where noteTitle = '" + noteTitleHolder + "'";
                using (SqlCommand cmd = new SqlCommand(qry, con))
                {
                    con.Open();
                    txtbxNoteContents.Value = cmd.ExecuteScalar().ToString();
                    con.Close();
                }
            }
        }
    }
}
