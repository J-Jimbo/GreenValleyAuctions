using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;

namespace Lab1
{
    public partial class Lab1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] != null)
            {
                txtbxUser.Text = "Welcom Back " + Session["UserName"].ToString();
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
            Session["UserName"] = null;
            Response.Redirect("userLogin.aspx");
        }
    }
}


/*
 * TODO
 * DOUBLE CHECK
 * 
 * DONE
 * Fix edit service to show auction events
 * Implement auction event screen
 * Employee search for customers (L3)
 * Employee notification section (L3)
 * Customer Portal to create account (L3)
 * Add validator controls to text boxes (L2)
 * Maintained Login Status (L2)
 * Login
 * Encription (L3)
 * WHOLE new database for account info and pwds (L3)
 * Add editing active service and passing it to new employee (L2)
 * encode text boxes to prevent cross site scrips (L3)
 */

