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
namespace GreenValleyAuctions
{
    public partial class Initial_Conversation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid == true)
            {

               




                //Define the connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


              

                String sqlQuery = "Insert INTO InitialContact (ContactID, ReqServices, LookAt, DownSize, Estate, Moving, QSold, WhatSold,ConversationNotes,DateContacted) VALUES ( (Select ISNULL(max(ContactID)+1,1) from InitialContact) , @ReqServices , @LookAt " +
                    ", @DownSize  , @Estate, @Moving , @QSold, @WhatSold , GetDate())";

                // Create SQL Command Object to send the query
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

             
                sqlCommand.Parameters.AddWithValue("@ReqServices", CblServices.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@LookAt", rblLookAt.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@DownSize", rblDownsizing.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@Estate", rblEstate.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@Moving", rblMoving.SelectedValue);
                sqlCommand.Parameters.AddWithValue("@QSold", HttpUtility.HtmlEncode(txtQuanity.Text));
                sqlCommand.Parameters.AddWithValue("@WhatSold", HttpUtility.HtmlEncode(txtWhatToSell.Text));
                sqlCommand.Parameters.AddWithValue("@ConversationNotes", HttpUtility.HtmlEncode(txtNote));
               
                //Open COnnection, send query
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();


                // Close conecctions
                queryResults.Close();
                sqlConnect.Close();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            CblServices.ClearSelection();
            rblLookAt.ClearSelection();
            rblEstate.ClearSelection();
            rblDownsizing.ClearSelection();
            rblMoving.ClearSelection();
            txtNote.Text ="";
            txtQuanity.Text = "";
            txtWhatToSell.Text = "";
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {
            // random number 
            Random random = new Random();
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
    }
}