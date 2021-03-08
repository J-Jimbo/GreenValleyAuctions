using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
namespace Lab3
{
    public partial class LandingPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //validate login
            if (Session["UserName"] != null)
            {
                lblStatus.ForeColor = Color.Green;
                lblStatus.Font.Bold = true;
                lblStatus.Text = Session["UserName"].ToString() + " Succesfully Logged IN";
            }
            else if  (Session["Customer"] != null)
            {
                lblStatus.ForeColor = Color.Green;
                lblStatus.Font.Bold = true;
                lblStatus.Text = Session["Customer"].ToString() + " Succesfully Logged IN";
            }
            else if (Request.QueryString.Get("loggedOut") == "true")
            {
                lblStatus.ForeColor = Color.Green;
                lblStatus.Font.Bold = true;
                lblStatus.Text ="Successfully Logged Out";

            }
            else
            {
                lblStatus.ForeColor = Color.Red;
                lblStatus.Font.Bold = true;
                lblStatus.Text = "No User Logged In";
            }

        }

        protected void btnEmpLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login_Page.aspx");
        }

        protected void btnCustomerLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Login.aspx");
        }

        protected void btnRequest_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Home.aspx");
        }
    }
}