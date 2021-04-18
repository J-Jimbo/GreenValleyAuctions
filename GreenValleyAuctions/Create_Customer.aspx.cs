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
                //btnNextProcess.Visible = true;
                //btnNext.Visible = false;


                txtFirstName.Enabled = false;
                txtLastName.Enabled = false;
                txtEmail.Enabled = false;
                txtStreet.Enabled = false;
                txtCIty.Enabled = false;
                txtState.Enabled = false;
                txtZip.Enabled = false;
                txtPhone.Enabled = false;
                ddlContact.SelectedValue = "Customer Portal";
                ddlContact.Enabled = false;
                //Parse Service request info

                string sqlQuery = "SELECT * from CustomerRequest where CustomerRequestID = @CustomerRequestID";




                //Define the connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


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

            if (Session["ServiceRequest"] != null)
            {
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
            else
            {



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
                //create arrays to draw random data from
                string[] quantity = { "2  ", "1 ", "1 ", "14 " };
                string[] sell = { "chair", "sofa", "guitar", "bed" };
                string[] note = { "fragile", "want it sold quick", "want a reserve price" };


                //filling txtboxes
                txtNote.Text = note[random.Next(0, note.Length)];
                txtQuanity.Text = quantity[random.Next(0, quantity.Length)];
                txtWhatToSell.Text = sell[random.Next(0, sell.Length)];
                //select ddl
                CblServices.SelectedIndex = random.Next(0, 4);
                rblLookAt.SelectedIndex = random.Next(0, 2);
                rblEstate.SelectedIndex = random.Next(0, 2);
                rblDownsizing.SelectedIndex = random.Next(0, 2);
                rblMoving.SelectedIndex = random.Next(0, 2);
            

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // used to confirm validation before saving to DB
            if (ddlContact.SelectedValue !="Other")
                rfvOther.IsValid = true;

            if (Page.IsValid == true)
            {
                
                    //Define the connection to the Database
                    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);
                    sqlConnect.Open();
                int customerID = 0;
                if (rblChoice.SelectedValue.Equals("New Customer"))
                {
                    // query to search for last customer ID
                    string sqlQueryID = "SELECT MAX(CustomerID) from Customer";



                    //Create sql command to receive ID
                    SqlCommand sqlCommandID = new SqlCommand();
                    sqlCommandID.Connection = sqlConnect;
                    sqlCommandID.CommandType = CommandType.Text;
                    sqlCommandID.CommandText = sqlQueryID;
                    //open connection to send ID query 
                    
                    SqlDataReader queryValue = sqlCommandID.ExecuteReader();


                    
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
                    SqlCommand sqlCommandCreate = new SqlCommand();
                    sqlCommandCreate.Connection = sqlConnect;
                    sqlCommandCreate.CommandType = CommandType.Text;
                    sqlCommandCreate.CommandText = sqlQuery;

                    sqlCommandCreate.Parameters.AddWithValue("@CustomerID", customerID);
                    sqlCommandCreate.Parameters.AddWithValue("@FirstName", HttpUtility.HtmlEncode(txtFirstName.Text));
                    sqlCommandCreate.Parameters.AddWithValue("@LastName", HttpUtility.HtmlEncode(txtLastName.Text));
                    sqlCommandCreate.Parameters.AddWithValue("@Street", HttpUtility.HtmlEncode(txtStreet.Text).Trim());
                    sqlCommandCreate.Parameters.AddWithValue("@City", HttpUtility.HtmlEncode(txtCIty.Text).Trim());
                    sqlCommandCreate.Parameters.AddWithValue("@State", HttpUtility.HtmlEncode(txtState.Text).Trim());
                    sqlCommandCreate.Parameters.AddWithValue("@Zip", HttpUtility.HtmlEncode(txtZip.Text).Trim());
                    sqlCommandCreate.Parameters.AddWithValue("@Phone", HttpUtility.HtmlEncode(txtPhone.Text));
                    sqlCommandCreate.Parameters.AddWithValue("@PhoneType", phoneType);
                    sqlCommandCreate.Parameters.AddWithValue("@Email", HttpUtility.HtmlEncode(txtEmail.Text));
                    sqlCommandCreate.Parameters.AddWithValue("@Hear", HttpUtility.HtmlEncode(txtHear.Text));
                    sqlCommandCreate.Parameters.AddWithValue("@Contacted", contacted);
                    //Open COnnection, send query

                    SqlDataReader queryAnswer = sqlCommandCreate.ExecuteReader();


                    // Close conecctions
                    queryAnswer.Close();
                }
                //--------------------------------------------


                String sqlInsert = "Insert INTO InitialContact (ContactID, ReqServices, LookAt, DownSize, Estate, Moving, QSold, WhatSold,ConversationNotes,DateContacted,CustomerID) VALUES ( (Select ISNULL(max(ContactID)+1,1) from InitialContact) , @ReqServices , @LookAt " +
                    ", @DownSize  , @Estate, @Moving , @QSold, @WhatSold , @ConversationNotes, GetDate(), @CustomerID )";


                // loop to get all checked values
                string serviceList = "";
                foreach (ListItem item in CblServices.Items)
                {
                    if (item.Selected)
                    {
                        serviceList += item.Value.ToString() + ", ";
                    }
                }
                //get customer id 
                
                if(rblChoice.SelectedValue.Equals("Existing Customer"))
                {
                     customerID = int.Parse(ddlCustomer.SelectedValue);
                }
                serviceList = serviceList.Remove(serviceList.Length - 2);
                // Create SQL Command Object to send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlInsert;


                sqlCommand.Parameters.AddWithValue("@ReqServices", HttpUtility.HtmlEncode(serviceList));
                sqlCommand.Parameters.AddWithValue("@LookAt", rblLookAt.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@DownSize", rblDownsizing.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@Estate", rblEstate.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@Moving", rblMoving.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@QSold", HttpUtility.HtmlEncode(txtQuanity.Text));
                sqlCommand.Parameters.AddWithValue("@WhatSold", HttpUtility.HtmlEncode(txtWhatToSell.Text));
                sqlCommand.Parameters.AddWithValue("@ConversationNotes", HttpUtility.HtmlEncode(txtNote.Text));
                sqlCommand.Parameters.AddWithValue("@CustomerID", customerID);
                //Open COnnection, send query
                
                SqlDataReader queryResults = sqlCommand.ExecuteReader();


                // Close conecctions
                queryResults.Close();
                sqlConnect.Close();

                lblStatus.ForeColor = Color.Green;
                lblStatus.Font.Bold = true;
                lblStatus.Text = "Customer Created";

                lblCreateStatus.ForeColor = Color.Green;
                lblCreateStatus.Font.Bold = true;
                lblCreateStatus.Text = "Customer Created";


                //if based on a request remove from employee home
                if(Session["ServiceRequest"] != null)
                {
                    // query to search for last customer ID
                    string edit = "Delete from ServiceRequest where CustomerRequestID = @ID;" +
                        " Delete from  CustomerRequest  where CustomerRequestID = @ID;";

                    

                    //Create sql command to receive ID
                    SqlCommand sqlCommandID = new SqlCommand();
                    sqlCommandID.Connection = sqlConnect;
                    sqlCommandID.CommandType = CommandType.Text;
                    sqlCommandID.CommandText = edit;
                    sqlCommandID.Parameters.AddWithValue("@ID", Session["ServiceRequest"].ToString());
                    //open connection to send ID query 
                    sqlConnect.Open();
                    SqlDataReader queryValue = sqlCommandID.ExecuteReader();

                    //Close Connection
                    queryValue.Close();
                    sqlConnect.Close();
                }
            }


        }



        protected void btnClear_Click(object sender, EventArgs e)
        {

            //----------------------
            //clear checkboxes
            CblServices.ClearSelection();
            //clear radio button lists
            rblLookAt.ClearSelection();
            rblEstate.ClearSelection();
            rblDownsizing.ClearSelection();
            rblMoving.ClearSelection();
            //clear text boxes
            txtNote.Text = "";
            txtQuanity.Text = "";
            txtWhatToSell.Text = "";
            //-----------------------
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
            //clear phone type
            rblPhoneType.ClearSelection();

        }

        //protected void cvFirstName_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    // query to search for last customer ID
        //    string sqlQueryName = "select Trim(FirstName) + ' ' + Trim(LastName) as Name from Customer";




        //    //Define the connection to the Database
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


        //    //Create sql command to receive ID
        //    SqlCommand sqlCommandName = new SqlCommand();
        //    sqlCommandName.Connection = sqlConnect;
        //    sqlCommandName.CommandType = CommandType.Text;
        //    sqlCommandName.CommandText = sqlQueryName;
        //    //open connection to send ID query 
        //    sqlConnect.Open();
        //    SqlDataReader queryAnswer = sqlCommandName.ExecuteReader();

        //    // compare database to new customer, checking for repeats 

        //    while (queryAnswer.Read() == true)
        //    {
        //        if (queryAnswer.GetString(0).Equals(HttpUtility.HtmlEncode(txtFirstName.Text.Trim()) + ' ' + HttpUtility.HtmlEncode(txtLastName.Text.Trim())))
        //        {
        //            args.IsValid = false;
        //            break;
        //        }
        //        else
        //            args.IsValid = true;
        //    }
        //    // Close conecctions
        //    queryAnswer.Close();
        //    sqlConnect.Close();


        //}

       

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

        

        protected void cvServices_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // see if item is checked
            int counter = 0;
            foreach (ListItem item in CblServices.Items)
            {
                if (item.Selected)
                {
                    counter++;
                }
            }
            //  validate based off counter
            if (counter == 0)
            {
                args.IsValid = false;
            }
            else
                args.IsValid = true;
        }

        protected void rblChoice_SelectedIndexChanged(object sender, EventArgs e)
        {
            // new or existing customer
            if(rblChoice.SelectedValue.Equals("New Customer"))
            {
                NewCustomer.Visible = true;
                ExistingCustomer.Visible = false;
                
            }
            else
            {
                //show table
                ExistingCustomer.Visible = true;
                //hide table
                NewCustomer.Visible = false;
                //temp remove validation
                txtFirstName.CausesValidation = false;
                txtLastName.CausesValidation = false;
                txtCIty.CausesValidation = false;
                txtState.CausesValidation = false;
                txtStreet.CausesValidation = false;
                txtZip.CausesValidation = false;
                txtPhone.CausesValidation = false;
                txtEmail.CausesValidation = false;
                rblPhoneType.CausesValidation = false;

            }
        }

        protected void CVemail_ServerValidate(object source, ServerValidateEventArgs args)
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
                if (queryAnswer.GetString(0).Equals(HttpUtility.HtmlEncode(txtEmail.Text.Trim())))
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