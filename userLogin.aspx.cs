using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Lab3
{
    public partial class userLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                List<String> services = new List<String>() { "Customer", "Employee" };
                foreach (String service in services)
                {
                    ddlAccType.Items.Add(service);
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {

            if(ddlAccType.SelectedItem.Text == "Employee")
            {
                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                    lblStatus.Text = "Database Connection Successful";

                    sc.Open();
                    System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                    findPass.Connection = sc;
                    findPass.CommandType = System.Data.CommandType.StoredProcedure;
                    // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                    findPass.CommandText = "dbo.sp_checkPassword";
                    findPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));

                    SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                    if (reader.HasRows) // if the username exists, it will continue
                    {
                        while (reader.Read()) // this will read the single record that matches the entered username
                        {
                            string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable

                            if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                            {
                                lblStatus.Text = "Success!";
                                Session["UserName"] = txtUsername.Text;
                                Response.Redirect("RequestList.aspx");
                                btnLogin.Enabled = false;
                                txtUsername.Enabled = false;
                                txtPassword.Enabled = false;
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

            else
            {
                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                    lblStatus.Text = "Database Connection Successful";

                    sc.Open();
                    System.Data.SqlClient.SqlCommand findPass = new System.Data.SqlClient.SqlCommand();
                    findPass.Connection = sc;
                    // SELECT PASSWORD STRING WHERE THE ENTERED USERNAME MATCHES
                    findPass.CommandText = "SELECT PasswordHash FROM CustomerPass WHERE Username = @Username";
                    findPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));

                    SqlDataReader reader = findPass.ExecuteReader(); // create a reader

                    if (reader.HasRows) // if the username exists, it will continue
                    {
                        while (reader.Read()) // this will read the single record that matches the entered username
                        {
                            string storedHash = reader["PasswordHash"].ToString(); // store the database password into this variable

                            if (PasswordHash.ValidatePassword(txtPassword.Text, storedHash)) // if the entered password matches what is stored, it will show success
                            {
                                lblStatus.Text = "Success!";
                                Session["custUserName"] = txtUsername.Text;
                                Response.Redirect("CustomerRequest.aspx");
                                btnLogin.Enabled = false;
                                txtUsername.Enabled = false;
                                txtPassword.Enabled = false;
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
            // connect to database to retrieve stored password string
            
        }

        protected void btnCreateCustomerAccount_Click(object sender, EventArgs e)
        {
            Response.Redirect("CustomerCreateAccount.aspx");
        }
    }
}