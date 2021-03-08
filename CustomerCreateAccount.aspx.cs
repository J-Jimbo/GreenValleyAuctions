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
    public partial class CustomerCreateAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (txtbxFirstName.Text != "" && txtbxLastName.Text != "" && txtPassword.Text != "" && txtbxEmail.Text != "" && txtbxAddress.Text != "" && txtbxPhone.Text != "") // all fields must be filled out
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
                    createUser.CommandText = "INSERT INTO Customer ( email, firstName, lastName, custAddress, custPhone) VALUES (@email, @FName, @LName, @address, @phone)";
                    createUser.Parameters.AddWithValue("@email", txtbxEmail.Text);
                    createUser.Parameters.AddWithValue("@FName", txtbxFirstName.Text);
                    createUser.Parameters.AddWithValue("@LName", txtbxLastName.Text);
                    createUser.Parameters.AddWithValue("@address", txtbxAddress.Text);
                    createUser.Parameters.AddWithValue("@phone", txtbxPhone.Text);
                    createUser.ExecuteNonQuery();

                    System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
                    setPass.Connection = sc;
                    // INSERT PASSWORD RECORD AND CONNECT TO USER
                    setPass.CommandText = "INSERT INTO CustomerPass (custUID, Username, PasswordHash) VALUES ((select max(custUID) from Customer), @Username, @Password)";
                    setPass.Parameters.Add(new SqlParameter("@Username", txtbxEmail.Text));
                    setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(txtPassword.Text))); // hash entered password
                    setPass.ExecuteNonQuery();

                    sc.Close();

                    lblStatus.Text = "User committed!";
                    txtbxFirstName.Enabled = false;
                    txtbxLastName.Enabled = false;
                    txtbxEmail.Enabled = false;
                    txtPassword.Enabled = false;
                    txtbxAddress.Enabled = false;
                    txtbxPhone.Enabled = false;
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
            txtbxFirstName.Enabled = true;
            txtbxLastName.Enabled = true;
            txtbxEmail.Enabled = true;
            txtPassword.Enabled = true;
            txtbxAddress.Enabled = true;
            txtbxPhone.Enabled = true;
            btnSubmit.Enabled = true;
            lnkAnother.Visible = false;
            txtbxFirstName.Text = "";
            txtbxLastName.Text = "";
            txtbxEmail.Text = "";
            txtPassword.Text = "";
            txtbxPhone.Text = "";
            txtbxAddress.Text = "";
        }
    }
}
