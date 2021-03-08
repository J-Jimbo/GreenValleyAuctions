using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab3
{
    public partial class CustomerFacing : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //checks if user is logged in, and if not sends them back to the login page.
            if (Session["custUserName"] != null)
            {
                txtbxUser.Text = "Welcom Back " + Session["custUserName"].ToString();
                txtbxUser.ForeColor = Color.Green;
                btnLoginLogout.Text = "Logout";
            }
            else
            {
                txtbxUser.Text = "Please Login.";
                Response.Redirect("userLogin.aspx");
            }
        }

        protected void btnLoginLogout_Click(object sender, EventArgs e)
        {
            Session["custUserName"] = null;
            Response.Redirect("userLogin.aspx");
        }
    }
}