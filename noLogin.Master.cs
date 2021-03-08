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
    public partial class noLogin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //makes sure that the is not logged in and cannot go anywhere else without logging in
            if (Session["UserName"] == null)
            {
                txtbxUser.Text = "Please Login to use the website.";
            }

            System.Data.SqlClient.SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
            sc.Open();
            //creates the standard profile with admin and password, not sure how to encrypt it in SQL code, that is why it is here instead.
            System.Data.SqlClient.SqlCommand createUser = new System.Data.SqlClient.SqlCommand();
            createUser.Connection = sc;
            // INSERT USER RECORD
            createUser.CommandText = "INSERT INTO Person (FirstName, LastName, Username) VALUES (@FName, @LName, @Username)";
            createUser.Parameters.Add(new SqlParameter("@FName", "Professor"));
            createUser.Parameters.Add(new SqlParameter("@LName", "Ezell"));
            createUser.Parameters.Add(new SqlParameter("@Username", "admin"));
            createUser.ExecuteNonQuery();

            System.Data.SqlClient.SqlCommand setPass = new System.Data.SqlClient.SqlCommand();
            setPass.Connection = sc;
            // INSERT PASSWORD RECORD AND CONNECT TO USER
            setPass.CommandText = "INSERT INTO Pass (UserID, Username, PasswordHash) VALUES ((select max(userid) from person), @Username, @Password)";
            setPass.Parameters.Add(new SqlParameter("@Username", "admin"));
            setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword("password"))); // hash entered password
            setPass.ExecuteNonQuery();

            sc.Close();
        }
    }
}