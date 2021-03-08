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
namespace Lab3
{
    public partial class Customer_History : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //clear old results
            lbNoteTitle.Items.Clear();
            lbEmployeeList.Items.Clear();
            txtNoteBody.Text = "";

            //define connection to the DB
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            string sqlQueryID = "SELECT distinct c.FirstName, c.LastName,trim(FirstName) + ' ' + trim(LastName) as FullName " +
                " from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID " +
                "full join Customer c on c.CustomerID = WF.CustomerID where FirstName = @CustomerName " +
                "or  LastName = @CustomerName or trim(FirstName) + ' ' + trim(LastName) = @CustomerName ";
            //Create sql command to receive ID
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQueryID;

            sqlCommand.Parameters.AddWithValue("@CustomerName", HttpUtility.HtmlEncode(txtSearch.Text));

            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryValue = sqlCommand.ExecuteReader();
            lbResults.Items.Clear();


            while (queryValue.Read())
            {
                ListItem customerName = new ListItem(queryValue["FullName"].ToString(), queryValue["FullName"].ToString());
                lbResults.Items.Add(customerName);



            }
            queryValue.Close();
            sqlConnect.Close();
        }



        protected void dtvTicketHistory_PageIndexChanged(object sender, EventArgs e)
        {
            //define connection to the DB
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            string sqlQuery = "Select  WFHistoryID, ISNUll(TicketName,'No Note') as TicketName from WorkFlow wf full join customer c on c.CustomerID = wf.CustomerID full join WorkFlowHistory wfh on wf.WorkFlowID = wfh.WorkFlowID where trim(FirstName) +' ' + trim(LastName) = @CustomerName and wf.EngagmentDate = @CustomerDate";

            //Create sql command to receive ID
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;
            //parameters
            sqlCommand.Parameters.AddWithValue("@CustomerName", lbResults.SelectedValue.ToString());
            sqlCommand.Parameters.AddWithValue("@CustomerDate", DateTime.Parse(dtvTicketHistory.Rows[1].Cells[1].Text).ToString("yyyy'-'MM'-'dd HH':'mm':'ss'.'fff"));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResponse = sqlCommand.ExecuteReader();
            lbNoteTitle.Items.Clear();
            while (queryResponse.Read() == true)
            {
                ListItem noteTitle = new ListItem(queryResponse["TicketName"].ToString(), queryResponse["TicketName"].ToString());
                lbNoteTitle.Items.Add(noteTitle);


            }

            queryResponse.Close();
            sqlConnect.Close();

            //---------------------------------------------------------------------------
            //define connection to the DB
            SqlConnection sc = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

                //----------------------------------------------------------------------------------------
                // query to check employee history 

                string sqlQueryEmployee = "SELECT WFHistoryID, trim(EmployeeFirstName) + ' '+ trim(EmployeeLastName) as employeeName from WorkFlowHistory wfh inner join WorkFlow wf on wfh.WorkFlowID = wf.WorkFlowID inner join Employee e on wfh.EmployeeID = e.EmployeeID inner join customer c on c.CustomerID= wf.CustomerID  where trim(FirstName) +' ' + trim(LastName) = @CustomerName and wf.EngagmentDate = @CustomerDate";


                //Create sql command to receive EMps
                SqlCommand sqlCommandEmployee = new SqlCommand();
                sqlCommandEmployee.Connection = sc;
                sqlCommandEmployee.CommandType = CommandType.Text;
                sqlCommandEmployee.CommandText = sqlQueryEmployee;

                sqlCommandEmployee.Parameters.AddWithValue("@CustomerName", lbResults.SelectedValue.ToString());
                sqlCommandEmployee.Parameters.AddWithValue("@CustomerDate", DateTime.Parse(dtvTicketHistory.Rows[1].Cells[1].Text).ToString("yyyy'-'MM'-'dd HH':'mm':'ss'.'fff"));

                sc.Open();
                SqlDataReader queryAnswer = sqlCommandEmployee.ExecuteReader();

                lbEmployeeList.Items.Clear();
                while (queryAnswer.Read())
                {


                    lbEmployeeList.Items.Add(queryAnswer["employeeName"].ToString());

                }

                // close connection

                queryAnswer.Close();
                sc.Close();
            
        }



        protected void lbNoteTitle_SelectedIndexChanged(object sender, EventArgs e)
        {
            //define connection to the DB
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


            // query to check workflow id
            string ticketName = lbNoteTitle.SelectedValue.ToString();
            string sqlQueryID = "SELECT TicketNote from WorkFlowHistory where TicketName = '" + ticketName + "'";

            //Create sql command to receive ID
            SqlCommand sqlCommandID = new SqlCommand();
            sqlCommandID.Connection = sqlConnect;
            sqlCommandID.CommandType = CommandType.Text;
            sqlCommandID.CommandText = sqlQueryID;

            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryValue = sqlCommandID.ExecuteReader();
            txtNoteBody.Text = "";
            while (queryValue.Read())
            {

                txtNoteBody.Text = queryValue["TicketNote"].ToString();

            }

            // close connection

            queryValue.Close();
            sqlConnect.Close();
        }
    }
}