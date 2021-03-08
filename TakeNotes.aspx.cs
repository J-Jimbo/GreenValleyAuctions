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
    public partial class TakeNotes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //loads contents for page on load that is not postback
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
            //finds the service ticket to take notes for
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
        
        protected void btnPopNT_Click(object sender, EventArgs e)
        {
            ddlEmployeeName.SelectedValue = "Scott Barth";
            ddlCustomerName.SelectedValue = "Rahim Howe";
            txtbxNoteTitleNT.Text = "Fake Note Title";
            txtbxNoteContentsNT.Value = "Fake note contents";
        }

        protected void btnClearNT_Click(object sender, EventArgs e)
        {
            txtbxNoteTitleNT.Text = "";
            txtbxNoteContentsNT.Value = "";
        }

        protected void btnCommitNT_Click(object sender, EventArgs e)
        {
            //takes the text box contents and creates a new instance of ServiceNotes for the ticket.

            int custNameHold = ddlCustomerName.SelectedIndex + 1;
            int employeeIDHold = ddlEmployeeName.SelectedIndex + 1;
            String dateHold = ddlOpenDate.SelectedValue;
            String noteTitleHold = HttpUtility.HtmlEncode(txtbxNoteTitleNT.Text);
            String noteContentHold = HttpUtility.HtmlEncode(txtbxNoteContentsNT.Value);

            String serviceTicketIDHold;

            String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT serviceTicketID FROM serviceTicket WHERE customerID = '" + custNameHold + "' AND ticketOpenDate = '" + dateHold + "'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    serviceTicketIDHold = cmd.ExecuteScalar().ToString();
                }

                using(SqlCommand cmd1 = new SqlCommand("INSERT INTO ServiceNotes(noteTitle, noteContents, serviceTicketID, employeeID) " +
                    "VALUES(@title, @content, @ticketID, @empID)"))
                {

                    cmd1.CommandType = CommandType.Text;
                    cmd1.Connection = con;

                    cmd1.Parameters.AddWithValue("@title", noteTitleHold);
                    cmd1.Parameters.AddWithValue("@content", noteContentHold);
                    cmd1.Parameters.AddWithValue("@ticketID", serviceTicketIDHold);
                    cmd1.Parameters.AddWithValue("@empID", employeeIDHold);

                    cmd1.ExecuteNonQuery();
                    con.Close();

                    lblErrorMsg.ForeColor = System.Drawing.Color.Green;
                    lblErrorMsg.Text = "Note Added";
                }
            }
        }
    }
}