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
    public partial class Create_Customer : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if(Session["ServiceRequest"] != null)
            {
                //set buttons to continue workflow 
                btnNextProcess.Visible = true;
                btnNext.Visible = false;

                //Parse Service request info

                string sqlQuery = "SELECT * from CustomerRequest where CustomerRequestID = @CustomerRequestID";




                //Define the connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


                //Create sql command 
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

               
                sqlCommand.Parameters.AddWithValue("@CustomerRequestID", Session["ServiceRequest"].ToString());
                //open connection to send ID query 
                sqlConnect.Open();
                SqlDataReader queryValue = sqlCommand.ExecuteReader();

                while(queryValue.Read())
                {
                    txtFirstName.Text = queryValue["FirstName"].ToString();
                    txtLastName.Text = queryValue["LastName"].ToString();
                    txtEmail.Text = queryValue["Email"].ToString();
                    txtStreet.Text = queryValue["Street"].ToString();
                    txtCIty.Text = queryValue["City"].ToString();
                    txtState.Text = queryValue["State"].ToString();
                    txtZip.Text = queryValue["Zip"].ToString();
                    txtPhone.Text = queryValue["Phone"].ToString();
                }

                // Close conecctions
                queryValue.Close();
                sqlConnect.Close();



            }
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
            string[] hereAbout = { "Radio Ad", "Email Ad", "From a Friend", "News Paper", "Commercial" };
            string[] other = { "Bat Signal", "Morse Code", "Carrier Pigeon" };

            //filling txtboxes
            txtFirstName.Text = firstName[random.Next(0, firstName.Length)];
            txtLastName.Text = lastName[random.Next(0, lastName.Length)];
            txtStreet.Text = street[random.Next(0, street.Length)];
            txtZip.Text = zip[random.Next(0, zip.Length)];
            txtCIty.Text = city[random.Next(0, city.Length)];
            txtState.Text = state[random.Next(0, state.Length)];
            txtPhone.Text = phone[random.Next(0, phone.Length)];
            txtEmail.Text = email[random.Next(0, email.Length)];
            txtHear.Text = hereAbout[random.Next(0, hereAbout.Length)];
            //select ddl
            ddlContact.SelectedIndex = random.Next(0, 4);
            rblPhoneType.SelectedIndex = random.Next(0, 3);
            if (ddlContact.SelectedValue.Equals("Other"))
            {
                lblOther.Visible = true;
                txtOther.Visible = true;
                txtOther.Text = other[random.Next(0, other.Length)].ToString();
            }
            else
            {
                lblOther.Visible = false;
                txtOther.Visible = false;
                txtOther.Text = "";
                
            }
            

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // used to confirm validation before saving to DB
            if (ddlContact.SelectedValue !="Other")
                rfvOther.IsValid = true;

            if (Page.IsValid == true)
            {

                // query to search for last customer ID
                string sqlQueryID = "SELECT MAX(CustomerID) from Customer";




                //Define the connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


                //Create sql command to receive ID
                SqlCommand sqlCommandID = new SqlCommand();
                sqlCommandID.Connection = sqlConnect;
                sqlCommandID.CommandType = CommandType.Text;
                sqlCommandID.CommandText = sqlQueryID;
                //open connection to send ID query 
                sqlConnect.Open();
                SqlDataReader queryValue = sqlCommandID.ExecuteReader();


                int customerID = 0;
                while (queryValue.Read())
                {

                    try
                    {
                        customerID = queryValue.GetInt32(0);
                    }
                    catch (Exception)
                    {
                        customerID = 0;
                    }



                }

                //increase customerID
                customerID++;

                // Close conecctions
                queryValue.Close();
                sqlConnect.Close();

                // Concatenate the gathered values for Customer info
                string phoneType = rblPhoneType.SelectedValue.ToString();
                string contacted;
                if (ddlContact.SelectedValue.Equals("Other"))
                    contacted = HttpUtility.HtmlEncode(txtOther.Text.ToString());
                else
                    contacted = ddlContact.SelectedValue.ToString();
                
                

                String sqlQuery = "Insert INTO Customer (CustomerID, FirstName, LastName, CustomerAddress, CustomerPhone,PhoneType, CustomerEmail,HereAbout,ContactThrough,DateAdded) VALUES (  @CustomerID  , @FirstName , @LastName " +
                    ", @Street +' ' + @City + ' '+ @State + ' ' + @Zip , @Phone  , @PhoneType, @Email , @Hear, @Contacted , GetDate())";

                // Create SQL Command Object to send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlCommand.Parameters.AddWithValue("@CustomerID",customerID);
                sqlCommand.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
                sqlCommand.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
                sqlCommand.Parameters.AddWithValue("@Street", HttpUtility.HtmlEncode(txtStreet.Text));
                sqlCommand.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(txtCIty.Text));
                sqlCommand.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(txtState.Text));
                sqlCommand.Parameters.AddWithValue("@Zip", HttpUtility.HtmlEncode(txtZip.Text));
                sqlCommand.Parameters.AddWithValue("@Phone", HttpUtility.HtmlEncode(txtPhone.Text));
                sqlCommand.Parameters.AddWithValue("@PhoneType", phoneType);
                sqlCommand.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(txtEmail.Text));
                sqlCommand.Parameters.AddWithValue("@Hear", HttpUtility.HtmlEncode(txtHear.Text));
                sqlCommand.Parameters.AddWithValue("@Contacted",contacted);
                //Open COnnection, send query
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();


                // Close conecctions
                queryResults.Close();
                sqlConnect.Close();

                lblStatus.ForeColor = Color.Green;
                lblStatus.Font.Bold = true;
                lblStatus.Text = "Customer Created";
            }




        }



        protected void btnClear_Click(object sender, EventArgs e)
        {
            //Clear name
            HttpUtility.HtmlEncode(txtFirstName.Text = " ");
            HttpUtility.HtmlEncode(txtLastName.Text = " ");
            //clear address
            HttpUtility.HtmlEncode(txtStreet.Text = " ");
            HttpUtility.HtmlEncode(txtCIty.Text = " ");
            HttpUtility.HtmlEncode(txtState.Text = " ");
            HttpUtility.HtmlEncode(txtZip.Text = " ");
            //clear contact info
            HttpUtility.HtmlEncode(txtPhone.Text = " ");
            HttpUtility.HtmlEncode(txtEmail.Text = " ");
            //clear Here About
            HttpUtility.HtmlEncode(txtHear.Text = " ");
            //Cleat COntacted Through
            HttpUtility.HtmlEncode(txtOther.Text = " ");
        }

        protected void cvFirstName_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // query to search for last customer ID
            string sqlQueryName = "select Trim(FirstName) + ' ' + Trim(LastName) as Name from Customer";




            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


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

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Session["ServiceRequest"] = null;
            Response.Redirect("Create_ServiceEvent.aspx");
        }

        protected void ddlContact_SelectedIndexChanged(object sender, EventArgs e)
        {
            //set visibility for textbox other
            if(ddlContact.SelectedValue.Equals("Other"))
            {
                lblOther.Visible = true;
                txtOther.Visible = true;
            }
            else
            {
                lblOther.Visible = false;
                txtOther.Visible = false;
                
            }
            
        }

        protected void btnNextProcess_Click(object sender, EventArgs e)
        {
            Response.Redirect("Create_ServiceEvent.aspx");
        }
    }

}