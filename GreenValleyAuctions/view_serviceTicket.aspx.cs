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
    public partial class view_serviceTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Customer"] != null && IsPostBack.Equals(false))
            {
                //datasrcWorkFlow.SelectParameters["ID"].DefaultValue = Session["Customer"].ToString();
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
                        ddlHistory.SelectedValue = workID.ToString();
                   

                }

                queryResult.Close();
                sqlConnect.Close();

               
                





            }

            
        }

        protected void btnSaveSwitch_Click(object sender, EventArgs e)
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

            //loop to read query value and increment workflowID if needed
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
            int empID = int.Parse(ddlEmployeeList.SelectedValue);
            int workFlowID = int.Parse(ddlCustomer.SelectedValue);
            //query to create a workflow History

            String sqlQueryWFH = "Insert INTO WorkFlowHistory (WFHistoryID, TicketSwitchDate,EmployeeID, WorkFlowID) VALUES ('" + workFlowHistoryID + "', GETDATE() ,'" + empID + "','" + workFlowID + "')";


            //Create SQL command to send query
            SqlCommand sqlCommandWFH = new SqlCommand();
            sqlCommandWFH.Connection = sqlConnect;
            sqlCommandWFH.CommandType = CommandType.Text;
            sqlCommandWFH.CommandText = sqlQueryWFH;
            //Open connection to send query
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommandWFH.ExecuteReader();

            // close connection

            queryResult.Close();
            sqlConnect.Close();
        }

       

       

        protected void lbTitleList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //define connection to the DB
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


            // query to check workflow id
            string ticketName = lbTitleList.SelectedValue.ToString();
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

        protected void ddlHistory_SelectedIndexChanged(object sender, EventArgs e)
        {
            //define connection to the DB
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


            // query to check workflow id
            //try: dddl/listbox catch: if no service event created
            try
            {
                int workFlowID = int.Parse(ddlHistory.SelectedValue);


                string sqlQueryID = "SELECT ISNULL(TicketName, 'Employee Switch') as TicketName, WFHistoryID from WorkFlowHistory wfh inner join WorkFlow wf on wfh.WorkFlowID = wf.WorkFlowID  where wf.WorkFlowID = " + workFlowID;
                //Create sql command to receive ID
                SqlCommand sqlCommandID = new SqlCommand();
                sqlCommandID.Connection = sqlConnect;
                sqlCommandID.CommandType = CommandType.Text;
                sqlCommandID.CommandText = sqlQueryID;

                //open connection to send ID query 
                sqlConnect.Open();
                SqlDataReader queryValue = sqlCommandID.ExecuteReader();
                lbTitleList.Items.Clear();
                txtNoteBody.Text = " ";

                while (queryValue.Read())
                {

                    lbTitleList.Items.Add(queryValue["TicketName"].ToString());


                }

                // close connection

                queryValue.Close();
                sqlConnect.Close();
           

            //----------------------------------------------------------------------------------------
            // query to check employee history 

            string sqlQueryEmployee = "SELECT WFHistoryID, EmployeeFirstName + ' '+ ISNULL(EmployeeLastName,'') as employeeName from WorkFlowHistory wfh inner join WorkFlow wf on wfh.WorkFlowID = wf.WorkFlowID inner join Employee e on wfh.EmployeeID = e.EmployeeID  where wf.WorkFlowID = " + workFlowID;


            //Create sql command to receive EMps
            SqlCommand sqlCommandEmployee = new SqlCommand();
            sqlCommandEmployee.Connection = sqlConnect;
            sqlCommandEmployee.CommandType = CommandType.Text;
            sqlCommandEmployee.CommandText = sqlQueryEmployee;

            sqlConnect.Open();
            SqlDataReader queryAnswer = sqlCommandEmployee.ExecuteReader();

            lbEmployeeList.Items.Clear();
            while (queryAnswer.Read())
            {

               
               lbEmployeeList.Items.Add(queryAnswer["employeeName"].ToString());

            }

            // close connection

            queryAnswer.Close();
            sqlConnect.Close();
            }
            catch (Exception)
            {
                lbTitleList.Items.Clear();
                lbEmployeeList.Items.Clear();
                txtNoteBody.Text = "No Service Event Created For Selected Customer";
            }
        }

        protected void dvWorkFlow_DataBound(object sender, EventArgs e)
        {
            try
            {
                dvWorkFlow.Rows[0].Visible = false;
            }
            catch
            {

            }
        }

        protected void BtBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Info.aspx");
        }

        protected void dvWorkFlow_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
        {
            //datasrcWorkFlow.SelectParameters["ID"].DefaultValue = Session["Customer"].ToString();
            //On Page load grab customer info

            string Query = "SELECT MAX(WorkFlowID) as WorkFlowID, C.CustomerID, WF.CurrentStatus from WorkFlow WF inner join Customer C  on WF.CustomerID=c.CustomerID where c.customerID = @ID group by C.CustomerID, WF.CurrentStatus; ";

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
            string currentStatus = "";
            while (queryResult.Read())
            {
                workID = int.Parse(queryResult["WorkFlowID"].ToString());
                currentStatus = queryResult["CurrentStatus"].ToString().Trim();

            }

            queryResult.Close();
            sqlConnect.Close();

            if (currentStatus.Equals("Completed"))
            {
                Response.Redirect("Customer_Info.aspx");

            }
        }
    }
}