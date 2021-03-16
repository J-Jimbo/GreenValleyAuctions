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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //validate login
            if (Session["UserName"] != null)
            {
                lblCurrentUser.ForeColor = Color.Green;
                lblCurrentUser.Font.Bold = true;
                lblCurrentUser.Text = Session["UserName"].ToString() + "Logged IN";
            }
            else
            {

                Session["NoUser"] = "You must first Login to access the applications Pages";
                Response.Redirect("Login_Page.aspx");
            }
            //------------------------------------------
            if(Session["Delete"] != null)
            {
                // query to search for last customer ID
                string edit = "Update CustomerRequest Set Status = 'Completed' where CustomerRequestID = @Request";

                //Define the connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

                //Create sql command to receive ID
                SqlCommand sqlCommandID = new SqlCommand();
                sqlCommandID.Connection = sqlConnect;
                sqlCommandID.CommandType = CommandType.Text;
                sqlCommandID.CommandText = edit;
                sqlCommandID.Parameters.AddWithValue("@Request", Session["Delete"].ToString());
                //open connection to send ID query 
                sqlConnect.Open();
                SqlDataReader queryValue = sqlCommandID.ExecuteReader();

                //Close Connection
                queryValue.Close();
                sqlConnect.Close();
            }
        }
        protected void BtnHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Emp_Home.aspx");
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Login_Page.aspx?loggedOut=true");
        }
        protected void btnCreateCustomer_Click(object sender, EventArgs e)
        {
            Session["ServiceRequest"] = null;
            Response.Redirect("Create_Customer.aspx");
        }

        protected void btnCreateServiceEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_ServiceEvent.aspx");
        }

        protected void btnReport_Click(object sender, EventArgs e)
        {
            Response.Redirect("Reports.aspx");

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login_Page.aspx");
        }

        protected void btnNote_Click(object sender, EventArgs e)
        {
            Response.Redirect("Service_Ticket.aspx");
        }

        protected void btnViewWorkFlow_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_serviceTicket.aspx");
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_History.aspx");

        }

        protected void btnProcess_Click(object sender, EventArgs e)
        {
            Session["ServiceRequest"] = lbNotifications.SelectedValue.ToString();
            Response.Redirect("Create_Customer.aspx");
        }

        protected void btnCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Search.aspx");
        }
    }
       
}