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
namespace Lab3
{
    public partial class Customer_Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["NoCustomer"] != null)
            {
                lblStatus.Text = Session["NoCustomer"].ToString();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // connect to database to retrieve stored password string
            try
            {
                SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                lblStatus.Text = "Database Connection Successful";

                sc.Open();
                SqlCommand findPass = new SqlCommand();
                findPass.Connection = sc;
                findPass.CommandType = CommandType.StoredProcedure;
                // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                findPass.CommandText = "JeremyEzellLab3";
                findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtUserName.Text)));

                SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                if (reader.HasRows) // if the username exists, it will continue
                {
                    while (reader.Read()) // this will read the single record that matches the entered username
                    {
                        string storedHash = reader["PassWordHash"].ToString(); // store the database password into this variable

                        if (PasswordHash.ValidatePassword(txtPass.Text, storedHash)) // if the entered password matches what is stored, it will show success
                        {
                            lblStatus.Text = "Success!";
                            btnLogin.Enabled = false;
                            txtUserName.Enabled = false;
                            txtPass.Enabled = false;

                            Session["Customer"] = HttpUtility.HtmlEncode(txtUserName.Text);
                            Response.Redirect("Customer_Home.aspx");
                        }
                        else
                            lblStatus.Text = "Password is wrong.";
                    }
                }
                else // if the username doesn't exist, it will show failure
                    lblStatus.Text = "Login failed.";

                sc.Close();
            }
            catch
            {
                lblStatus.Text = "Database Error.";
            }
        }

        
        protected void btnLanding_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }
    }
}