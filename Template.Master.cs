﻿using System;
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
                lblCurrentUser.Text = Session["UserName"].ToString() + " Succesfully Logged IN";
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
    }
}