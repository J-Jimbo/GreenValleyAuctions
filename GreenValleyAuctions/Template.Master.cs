using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;

namespace Lab2
{
    public partial class Template : System.Web.UI.MasterPage
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


        protected void btnServiceHistory_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_History.aspx");
        }

        protected void btnServiceEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_ServiceEvent.aspx");
        }

        protected void btnServiceTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("Service_Ticket.aspx");
        }

        protected void btnViewServiceTicket_Click(object sender, EventArgs e)
        {
            Response.Redirect("view_serviceTicket.aspx");
        }

        protected void btnCreateCustomer_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_Customer.aspx");
        }

        protected void lbViewCUstomers_Click(object sender, EventArgs e)
        {

        }
    }
}