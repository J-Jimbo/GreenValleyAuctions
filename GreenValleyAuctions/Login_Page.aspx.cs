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
    public partial class Login_Page : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //check log out or no user
            if (Request.QueryString.Get("loggedOut") == "true")
            {
                lblLoginStatus.ForeColor = Color.Green;
                lblLoginStatus.Font.Bold = false;
                lblLoginStatus.Text = "Employee has successfully Logged Out";
            }
            if (Session["NoUser"] != null)
            {
                lblLoginStatus.ForeColor = Color.Red;
                lblLoginStatus.Font.Bold = true;
                lblLoginStatus.Text = Session["NoUser"].ToString();
            }
            //if (Session["NoCustomer"] != null)
            //{
            //    lblLoginStatus.ForeColor = Color.Red;
            //    lblLoginStatus.Font.Bold = true;
            //    lblLoginStatus.Text = Session["NoCustomer"].ToString();
            //}
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            //if (ddlSelectLoginType.SelectedItem.Text.Equals("Employee"))
            //{
                // connect to database to retrieve stored password string
                try
                {
                    SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                    //lblStatus.Text = "Database Connection Successful";

                    sc.Open();
                    SqlCommand findPass = new SqlCommand();
                    findPass.Connection = sc;
                    findPass.CommandType = CommandType.StoredProcedure;
                    // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                    findPass.CommandText = "EmployeeLogin";
                    findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtUserName.Text)));

                    SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                    if (reader.HasRows) // if the username exists, it will continue
                    {
                        while (reader.Read()) // this will read the single record that matches the entered username
                        {
                            string storedHash = reader["PassWordHash"].ToString(); // store the database password into this variable

                            if (PasswordHash.ValidatePassword(txtPassWord.Text, storedHash)) // if the entered password matches what is stored, it will show success
                            {
                                //lblStatus.Text = "Success!";
                                btnLogin.Enabled = false;
                                txtUserName.Enabled = false;
                                txtPassWord.Enabled = false;

                                Session["UserName"] = HttpUtility.HtmlEncode(txtUserName.Text);
                                Response.Redirect("Emp_Home.aspx");
                            }
                            else
                            {
                                lblLoginStatus.ForeColor = Color.Red;
                                lblLoginStatus.Font.Bold = true;
                                lblLoginStatus.Text = "Either the UserName and or PassWord are inccorect";
                            }
                        }
                    }
                    else // if the username doesn't exist, it will show failure
                    {
                        lblLoginStatus.ForeColor = Color.Red;
                        lblLoginStatus.Font.Bold = true;
                        lblLoginStatus.Text = "Either the UserName and or PassWord are inccorect";
                    }

                    sc.Close();
                }
                catch
                {
                    lblLoginStatus.Text = "Database Error.";
                }
           // }
            //else
            //{
            //    // connect to database to retrieve stored password string
            //    try
            //    {
            //        SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
            //        lblLoginStatus.Text = "Database Connection Successful";

            //        sc.Open();
            //        SqlCommand findPass = new SqlCommand();
            //        findPass.Connection = sc;
            //        findPass.CommandType = CommandType.StoredProcedure;
            //        // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
            //        findPass.CommandText = "JeremyEzellLab3";
            //        findPass.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtUserName.Text)));

            //        SqlDataReader reader = findPass.ExecuteReader(); // create a reader

            //        if (reader.HasRows) // if the username exists, it will continue
            //        {
            //            while (reader.Read()) // this will read the single record that matches the entered username
            //            {
            //                string storedHash = reader["PassWordHash"].ToString(); // store the database password into this variable

            //                if (PasswordHash.ValidatePassword(txtPassWord.Text, storedHash)) // if the entered password matches what is stored, it will show success
            //                {
            //                    lblLoginStatus.Text = "Success!";
            //                    btnLogin.Enabled = false;
            //                    txtUserName.Enabled = false;
            //                    txtPassWord.Enabled = false;

            //                    Session["Customer"] = HttpUtility.HtmlEncode(txtUserName.Text);
            //                    Response.Redirect("Customer_Home.aspx");
            //                }
            //                else
            //                    lblLoginStatus.Text = "Password is wrong.";
            //            }
            //        }
            //        else // if the username doesn't exist, it will show failure
            //            lblLoginStatus.Text = "Login failed.";

            //        sc.Close();
            //    }
            //    catch
            //    {
            //        lblLoginStatus.Text = "Database Error.";
            //    }
           // }

            
        }

        protected void btnLanding_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }

        
    }
}