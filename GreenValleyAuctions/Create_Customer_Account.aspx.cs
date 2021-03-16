using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab3
{
    public partial class Create_Customer_Account : System.Web.UI.Page
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
                        createUser.CommandText = "INSERT INTO CustomerUser (AccountID,UserName,FirstName, LastName) VALUES ((Select ISNULL(max(AccountID)+1,1) from CustomerUser), @Username,@FName, @LName)";
                        createUser.Parameters.Add(new SqlParameter("@FName", HttpUtility.HtmlEncode(txtFirstName.Text)));
                        createUser.Parameters.Add(new SqlParameter("@LName", HttpUtility.HtmlEncode(txtLastName.Text)));
                        createUser.Parameters.Add(new SqlParameter("@Username", HttpUtility.HtmlEncode(txtUserName.Text)));

                        createUser.ExecuteNonQuery();

                        SqlCommand setPass = new SqlCommand();
                        setPass.Connection = sc;
                        // INSERT PASSWORD RECORD AND CONNECT TO USER
                        setPass.CommandText = "INSERT INTO CustomerVerfication (AccountID,PassWordHash) VALUES ((select max(AccountID) from CustomerUser), @Password)";
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

                //----------------------------------------------
                //Save customer request info

                string sqlQuery = "INSERT INTO CustomerRequest(CustomerRequestID, FirstName,LastName,Email,Street,City,State,Zip,Phone,Status)VALUES ((Select ISNULL(max(CustomerRequestID)+1,1) from CustomerRequest),@FirstName,@LastName,@Email,@Street,@City,@State,@Zip,@Phone,'In Progress')";



                //Define the connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


                //Create sql command
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlCommand.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
                sqlCommand.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
                sqlCommand.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(txtUserName.Text));
                sqlCommand.Parameters.AddWithValue("@Phone", HttpUtility.HtmlEncode(txtPhone.Text));
                sqlCommand.Parameters.AddWithValue("@Street", HttpUtility.HtmlEncode(txtStreet.Text));
                sqlCommand.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(txtCity.Text));
                sqlCommand.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(txtState.Text));
                sqlCommand.Parameters.AddWithValue("@Zip", HttpUtility.HtmlEncode(txtZip.Text));
                //open connection to send ID query 
                sqlConnect.Open();
                SqlDataReader queryValue = sqlCommand.ExecuteReader();

                // Close conecctions
                queryValue.Close();
                sqlConnect.Close();
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login_Page.aspx");
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
            txtStreet.Text = "";
            txtCity.Text = "";
            txtState.Text = "";
            txtZip.Text = "";
            txtPhone.Text = "";
            
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            // random number 
            Random random = new Random();
            //create arrays to draw random data from
            string[] firstName = { "Bob", "Joe", "Sarah", "Mary", "James" };
            string[] lastName = { "Jones", "Cool", "Berry", "Wright", "Madison" };
            string[] street = { "1787 Go Dukes Rd", "10 Maple Way", "20 Main St" };
            string[] zip = { "38469", "08740", "27548", "01129", "05380", "02340" };
            string[] city = { "New York", "HarrisonBurg", "Chicago", "Trenton", "Boston", "D.C." };
            string[] state = { "New York", "Virginia", "Massachusetts", "Washington", "New Jersey", "Illinois" };
            string[] phone = { "123 894 3628", "390 876 3467", "209 321 8710", "309 987 5437", "201 2303 2234", "675 873 2323" };
            string[] email = { "Dukes@mail.com", "purpleandgold@mail.com", "dukedog@mail.com", "JamesMadison@mail.com" };
           
           

            //filling txtboxes
            txtFirstName.Text = firstName[random.Next(0, firstName.Length)];
            txtLastName.Text = lastName[random.Next(0, lastName.Length)];
            txtStreet.Text = street[random.Next(0, street.Length)];
            txtZip.Text = zip[random.Next(0, zip.Length)];
            txtCity.Text = city[random.Next(0, city.Length)];
            txtState.Text = state[random.Next(0, state.Length)];
            txtPhone.Text = phone[random.Next(0, phone.Length)];
            txtUserName.Text = email[random.Next(0, email.Length)];
            
            
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