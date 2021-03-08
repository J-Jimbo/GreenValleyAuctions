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
    public partial class CustomerRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                //fills the service type ddl
                List<String> services = new List<String>() { "Move", "Auction" };
                foreach (String service in services)
                {
                    ddlServiceRequested.Items.Add(service);
                }
            }
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            if (txtbxDescriptionNeeds.Value != "" && txtbxServiceDeadline.Text != "")
            {
                try
                {
                    //takes the user input and stores it
                String serviceType = ddlServiceRequested.SelectedItem.Text;
                String requestDate = HttpUtility.HtmlEncode(txtbxServiceDeadline.Text);
                String requestDesc = HttpUtility.HtmlEncode(txtbxDescriptionNeeds.Value);
                String custUsername = Session["custUsername"].ToString();

                String custName = "";
                String custPhone = "";
                String custAddress = "";

                String conStr = WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conStr))
                {
                        //finds the customer information
                    String qry = "SELECT firstName + ' ' + lastName as custName, custAddress, custPhone FROM Customer where email = '" + custUsername +"'";
                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        cmd.Connection.Open();
                        SqlDataReader reader = cmd.ExecuteReader();

                        while(reader.Read())
                        {
                            custName = reader[0].ToString();
                            custAddress = reader[1].ToString();
                            custPhone = reader[2].ToString();
                        }

                        cmd.Connection.Close();
                    }
                }

                conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    //creates a new service request
                    String qry = "INSERT INTO ServiceRequest (custUsername, typeOfService, requestDate, requestDescription, customerName, customerAddress, customerPhone) " +
                        "VALUES(@custU, @tos, @date, @descr, @custName, @customerAddress, @customerPhone)";

                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        cmd.Parameters.AddWithValue("@custU", custUsername);
                        cmd.Parameters.AddWithValue("@tos", serviceType);
                        cmd.Parameters.AddWithValue("@date", requestDate);
                        cmd.Parameters.AddWithValue("@descr", requestDesc);
                        cmd.Parameters.AddWithValue("@custName", custName);
                        cmd.Parameters.AddWithValue("@customerAddress", custAddress);
                        cmd.Parameters.AddWithValue("@customerPhone", custPhone);


                        cmd.Connection.Open();
                        cmd.ExecuteNonQuery();
                        cmd.Connection.Close();
                    }
                }
                lblErrorMsg.ForeColor = System.Drawing.Color.Green;
                lblErrorMsg.Text = "Service Requested";
                }
                catch (Exception)
                {

                    lblErrorMsg.Text = "Error, Try again";
                }
            }
            else
            {
                lblErrorMsg.Text = "Please fill out all fields.";
            }
        }
    }
}