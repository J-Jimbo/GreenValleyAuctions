using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace GreenValleyAuctions
{
    public partial class Create_Employee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnCreate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {
                if (txtFirstName.Text != "" && txtLastName.Text != "" && txtPass.Text != "" && txtUserName.Text != "") // all fields must be filled out
                {
                    // COMMIT VALUES
                    try
                    {
                        SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["AUTH"].ConnectionString.ToString());
                        lblStatus.Text = "Database Connection Successful";

                        sc.Open();

                        SqlCommand createUser = new SqlCommand();
                        createUser.Connection = sc;


                        // INSERT USER RECORD
                        createUser.CommandText = "INSERT INTO EmployeeUser (AccountID,UserName,FirstName, LastName) VALUES ((Select ISNULL(max(AccountID)+1,1) from CustomerUser), @Username,@FName, @LName)";
                        createUser.Parameters.Add(new SqlParameter("@FName", HttpUtility.HtmlEncode(txtFirstName.Text)));
                        createUser.Parameters.Add(new SqlParameter("@LName", HttpUtility.HtmlEncode(txtLastName.Text)));
                        createUser.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtUserName.Text)));

                        createUser.ExecuteNonQuery();

                        SqlCommand setPass = new SqlCommand();
                        setPass.Connection = sc;
                        // INSERT PASSWORD RECORD AND CONNECT TO USER
                        setPass.CommandText = "INSERT INTO EmployeeVerfication (AccountID,PassWordHash) VALUES ((select max(AccountID) from CustomerUser), @Password)";
                        //setPass.Parameters.Add(new SqlParameter("@Username", txtUserName.Text));
                        setPass.Parameters.Add(new SqlParameter("@Password", PasswordHash.HashPassword(HttpUtility.HtmlEncode(txtPass.Text)))); // hash entered password
                        setPass.ExecuteNonQuery();

                        sc.Close();

                        lblStatus.Text = "User committed!";
                        txtFirstName.Enabled = false;
                        txtLastName.Enabled = false;
                        txtUserName.Enabled = false;
                        txtPass.Enabled = false;
                        btnCreate.Enabled = false;

                    }
                    catch
                    {
                        lblStatus.Text = "Database Error - User not committed.";
                    }
                }
                else
                    lblStatus.Text = "Fill all fields.";

                
                
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Login.aspx");
        }

        protected void cvFirstName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // query to search for last customer ID
            string sqlQueryName = "select Trim(FirstName) + ' ' + Trim(LastName) as Name from Customer";




            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


            //Create sql command to receive ID
            SqlCommand sqlCommandName = new SqlCommand();
            sqlCommandName.Connection = sqlConnect;
            sqlCommandName.CommandType = CommandType.Text;
            sqlCommandName.CommandText = sqlQueryName;
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryAnswer = sqlCommandName.ExecuteReader();

            // compare database to new customer, checking for repeats 

            while (queryAnswer.Read() == true)
            {
                if (queryAnswer.GetString(0).Equals(HttpUtility.HtmlEncode(txtFirstName.Text.Trim()) + ' ' + HttpUtility.HtmlEncode(txtLastName.Text.Trim())))
                {
                    args.IsValid = false;
                    break;
                }
                else
                    args.IsValid = true;
            }
            // Close conecctions
            queryAnswer.Close();
            sqlConnect.Close();

        }

        protected void BtnCLear_Click(object sender, EventArgs e)
        {
            txtUserName.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPass.Text = "";
            txtPassCheck.Text = "";
          

        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            // random number 
            Random random = new Random();
            //create arrays to draw random data from
            string[] firstName = { "Bob", "Joe", "Sarah", "Mary", "James" };
            string[] lastName = { "Jones", "Cool", "Berry", "Wright", "Madison" };
          



            //filling txtboxes
            txtFirstName.Text = firstName[random.Next(0, firstName.Length)];
            txtLastName.Text = lastName[random.Next(0, lastName.Length)];
          


        }

        protected void cvUserName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // query to search for last customer ID
            string sqlQueryName = "select Trim(CustomerEmail) as Email from Customer";




            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


            //Create sql command to receive ID
            SqlCommand sqlCommandName = new SqlCommand();
            sqlCommandName.Connection = sqlConnect;
            sqlCommandName.CommandType = CommandType.Text;
            sqlCommandName.CommandText = sqlQueryName;
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryAnswer = sqlCommandName.ExecuteReader();

            // compare database to new customer, checking for repeats 

            while (queryAnswer.Read() == true)
            {
                if (queryAnswer.GetString(0).Equals(HttpUtility.HtmlEncode(txtUserName.Text.Trim())))
                {
                    args.IsValid = false;
                    break;
                }
                else
                    args.IsValid = true;
            }
            // Close conecctions
            queryAnswer.Close();
            sqlConnect.Close();
        }
    }
}
    
