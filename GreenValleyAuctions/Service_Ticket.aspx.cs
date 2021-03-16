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
    public partial class Service_Ticket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] != null)
            {
                //On Page load grab customer info

                string Query = "SELECT MAX(WorkFlowID) as WorkFlowID, C.CustomerID from WorkFlow WF inner join Customer C  on WF.CustomerID=c.CustomerID where c.customerID = @ID group by C.CustomerID; ";

                //Define the connection to the Database
                SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

                //Create sql command 
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = Query;

                sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
                //open connection to send ID query 
                sqlConnect.Open();
                SqlDataReader queryResult = sqlCommand.ExecuteReader();

                int workID;
                while (queryResult.Read())
                {
                    workID = int.Parse(queryResult["WorkFlowID"].ToString());
                    ddlCustomer.SelectedValue = workID.ToString();

                }

                queryResult.Close();
                sqlConnect.Close();
            }
        }


        protected void btnSaveNote_Click(object sender, EventArgs e)
        {
            //define connection to the DB
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


            // query to check workflow id
            string sqlQueryID = "SELECT MAX(WFHistoryID) from WorkFlowHistory";

            //Create sql command to receive ID
            SqlCommand sqlCommandID = new SqlCommand();
            sqlCommandID.Connection = sqlConnect;
            sqlCommandID.CommandType = CommandType.Text;
            sqlCommandID.CommandText = sqlQueryID;

            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryValue = sqlCommandID.ExecuteReader();

            //loop to read query value and increment workflowHistoryID if needed
            int workFlowHistoryID = 0;
            while (queryValue.Read())
            {
                try
                {
                    workFlowHistoryID = queryValue.GetInt32(0);
                }
                catch (Exception)
                {
                    workFlowHistoryID = 0;
                }

            }

            workFlowHistoryID++;

            // Close conecctions
            queryValue.Close();
            sqlConnect.Close();
            //-----------------------------------------------------------------
            string ticketName = HttpUtility.HtmlEncode(txtTitle.Text.ToString());
            string note = HttpUtility.HtmlEncode(txtNote.Text.ToString());
            int workFlowID = int.Parse(ddlCustomer.SelectedValue);
            //query to create a workflow History

            String sqlQueryWFH = "Insert INTO WorkFLowHistory (WFHistoryID, TicketName,TicketNote, WorkFLowID) VALUES (@WorkFlowHistoryID, @TicketName  , @Note , @WorkFlowID )";


            //Create SQL command to send query
            SqlCommand sqlCommandWFH = new SqlCommand();
            sqlCommandWFH.Connection = sqlConnect;
            sqlCommandWFH.CommandType = CommandType.Text;
            sqlCommandWFH.CommandText = sqlQueryWFH;

            sqlCommandWFH.Parameters.AddWithValue("@WorkFlowHistoryID",workFlowHistoryID);
            sqlCommandWFH.Parameters.AddWithValue("@TicketName", ticketName);
            sqlCommandWFH.Parameters.AddWithValue("@Note", note);
            sqlCommandWFH.Parameters.AddWithValue("@WorkFlowID", workFlowID);
            //Open connection to send query
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommandWFH.ExecuteReader();

            // close connection

            queryResult.Close();
            sqlConnect.Close();

            lblStatus.ForeColor = Color.Green;
            lblStatus.Font.Bold = true;
            lblStatus.Text = "Note Succesfully Created";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Info.aspx");
        }
    }
}