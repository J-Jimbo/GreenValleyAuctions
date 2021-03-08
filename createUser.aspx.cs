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
    public partial class createUser : System.Web.UI.Page
    {
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtFirstName.Text != "" && txtLastName.Text != "" && txtPassword.Text != "" && txtUsername.Text != "") // all fields must be filled out
            {
                // COMMIT VALUES
                try
                {
                    System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                    lblStatus.Text = "Database Connection Successful";

                    sc.Open();

                    System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
                    createUser.Connection = sc;
                    // INSERT USER RECORD
                    createUser.CommandText = "INSERT INTO Person (FirstName, LastName, Username) VALUES (@FName, @LName, @Username)";
                    createUser.Parameters.Add(new SqlParameter("@FName", txtFirstName.Text));
                    createUser.Parameters.Add(new SqlParameter("@LName", txtLastName.Text));
                    createUser.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));
                    createUser.ExecuteNonQuery();

                    System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                    setPass.Connection = sc;
                    // INSERT PASSWORD RECORD AND CONNECT TO USER
                    setPass.CommandText = "INSERT INTO Pass (UserID, Username, PasswordHash) VALUES ((select max(userid) from person), @Username, @Password)";
                    setPass.Parameters.Add(new SqlParameter("@Username", txtUsername.Text));
                    setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(txtPassword.Text))); // hash entered password
                    setPass.ExecuteNonQuery();

                    sc.Close();

                    lblStatus.Text = "User committed!";
                    txtFirstName.Enabled = false;
                    txtLastName.Enabled = false;
                    txtUsername.Enabled = false;
                    txtPassword.Enabled = false;
                    btnSubmit.Enabled = false;
                    lnkAnother.Visible = true;
                }
                catch
                {
                    lblStatus.Text = "Database Error - User not committed.";
                }
            }
            else
                lblStatus.Text = "Fill all fields.";
        }

        protected void lnkLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("userLogin.aspx", false);
        }

        protected void lnkAnother_Click(object sender, EventArgs e)
        {
            txtFirstName.Enabled = true;
            txtLastName.Enabled = true;
            txtUsername.Enabled = true;
            txtPassword.Enabled = true;
            btnSubmit.Enabled = true;
            lnkAnother.Visible = false;
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
        }
    }
}