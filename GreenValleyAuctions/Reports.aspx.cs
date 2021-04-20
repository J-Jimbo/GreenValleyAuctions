using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab2
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                String conStr = WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT trim(FirstName) + ' ' + trim(LastName) as custName FROM Customer"))
                    {
                        cmd.CommandType = CommandType.Text;
                        cmd.Connection = con;
                        con.Open();
                        ddlTest.DataSource = cmd.ExecuteReader();
                        ddlTest.DataTextField = "custName";
                        ddlTest.DataBind();
                        con.Close();
                    }
                }
            }

        }

        protected void btnCustomerInteraction_Click(object sender, EventArgs e)
        {
            if (Tableau.Visible == true)
            {
                Tableau.Visible = false;
                initalContact.Visible = false;
                Customer.Visible = false;
            }
            else
            {
                Tableau.Visible = true;
                initalContact.Visible = false;
                Customer.Visible = false;
            }

        }
        protected void btnUpcomingJobs_Click1(object sender, EventArgs e)
        {
            string sqlQuery = "SELECT trim(Customer.FirstName) + ' ' + trim(Customer.LastName) as Name, Customer.CustomerAddress, ServiceEvent.ServiceType, ServiceEvent.ServiceEndDate FROM Customer INNER JOIN WorkFlow ON Customer.CustomerID = WorkFlow.CustomerID INNER JOIN ServiceEvent ON WorkFlow.WorkFlowID = ServiceEvent.WorkFlowID where WorkFlow.CurrentStatus='In Progress';";


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdResults.DataSource = dtForGridView;
            grdResults.DataBind();
        }

        protected void btnInitialContact_Click1(object sender, EventArgs e)
        {
            string sqlQuery = "SELECT trim(FirstName) + ' ' + LastName AS 'Name', HereAbout AS 'How Customers Heard about us', ContactThrough as 'Contacted us Via' FROM Customer";


            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(sqlQuery, sqlConnect);

            DataTable dtForGridView = new DataTable();
            sqlAdapter.Fill(dtForGridView);

            grdResults.DataSource = dtForGridView;
            grdResults.DataBind();
        }

        protected void btnCustomerContact_Click(object sender, EventArgs e)
        {
            if (initalContact.Visible == true)
            {
                Tableau.Visible = false;
                initalContact.Visible = false;
                Customer.Visible = false;
            }
            else
            {
                Tableau.Visible = false;
                initalContact.Visible = true;
                Customer.Visible = false;
            }
        }

        protected void btnShowHistory_Click(object sender, EventArgs e)
        {
            String custID = (ddlTest.SelectedIndex + 1).ToString();

            lstBxTicketHistory.Items.Clear();
            String conStr = WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("select W.WorkFlowID as WrkID, CAST(W.EngagmentDate AS DATE) as EngDate, SE.ServiceType as ServType from Workflow W join ServiceEvent SE on W.WorkflowID = SE.WorkflowID WHERE W.CustomerID = " + custID))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    SqlDataReader queryResults = cmd.ExecuteReader();

                    String dateHolder;
                    String spaceSplitter;

                    while (queryResults.Read())
                    {
                        dateHolder = queryResults["EngDate"].ToString();
                        spaceSplitter = dateHolder.Substring(0, 9);

                        lstBxTicketHistory.Items.Add(queryResults["WrkID"].ToString() + ": " + spaceSplitter + ' ' + queryResults["ServType"].ToString());
                    }
                    queryResults.Close();
                    con.Close();
                }
            }
        }

        protected void btnTicketSelect_Click(object sender, EventArgs e)
        {
            try
            {
                ClearScreen();
                String custID = (ddlTest.SelectedIndex + 1).ToString();
                String wrkID = lstBxTicketHistory.SelectedValue.Substring(0, 1);

                String conStr = WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString;
                using (SqlConnection con = new SqlConnection(conStr))
                {
                    String qry = "SELECT trim(FirstName) + ' ' + trim(LastName) as custName, CustomerPhone, CustomerEmail FROM Customer WHERE CustomerID = " + custID;
                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        con.Open();

                        SqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            txtBxFirstName.Text = reader[0].ToString();
                            txtBxPhone.Text = reader[1].ToString();
                            txtBxEmail.Text = reader[2].ToString();
                        }
                        reader.Close();
                    }

                    qry = "SELECT Total, AdditionalNotes FROM CompletionForm WHERE WorkflowID= " + wrkID;
                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        SqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            txtBxFinalCost.Text = reader[0].ToString();
                            txtbxNotes.InnerHtml = reader[1].ToString();
                        }
                        reader.Close();
                    }

                    qry = "SELECT OriginAddress as OAd, DestinationAddress as DAd FROM Moving WHERE ServiceID = (SELECT ServiceID FROM ServiceEvent WHERE WorkFlowID = " + wrkID + ")";
                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        SqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            txtBxMoveFrom.Text = reader[0].ToString();
                            txtBxMoveTo.Text = reader[1].ToString();
                        }
                        reader.Close();
                    }

                    qry = "SELECT Review FROM Workflow WHERE WorkflowID = " + wrkID; ;
                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        SqlDataReader reader = cmd.ExecuteReader();

                        while (reader.Read())
                        {
                            txtBxReview.Text = reader[0].ToString();
                        }
                        reader.Close();
                    }

                    qry = "SELECT ServiceDate FROM ServiceEvent WHERE ServiceID = (SELECT ServiceID FROM ServiceEvent WHERE WorkFlowID = " + wrkID + ")";
                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        SqlDataReader reader = cmd.ExecuteReader();

                        String dateHolder;
                        String spaceSplitter;

                        while (reader.Read())
                        {
                            dateHolder = reader[0].ToString();
                            spaceSplitter = dateHolder.Substring(0, 9);
                            txtBxMoveDate.Text = spaceSplitter;
                        }
                        reader.Close();
                    }

                    qry = "SELECT trim(ISNULL(EN.EmployeeFirstName, '')) + ' ' + trim(ISNULL(EN.EmployeeLastName, '')) as EmployeeName from Employee EN right join MSEmployee MSE on EN.EmployeeID = MSE.Employeeid join MovingScreen MS on MSE.MovingScreenID = MS.MovingScreenID WHERE MS.WorkflowID = " + wrkID;
                    using (SqlCommand cmd = new SqlCommand(qry, con))
                    {
                        cmd.CommandType = CommandType.Text;
                        SqlDataReader results = cmd.ExecuteReader();

                        while (results.Read())
                        {
                            lstBxMovers.Items.Add(results["EmployeeName"].ToString());
                        }
                        results.Close();
                    }
                }
            }
            catch (Exception)
            {

            }


        }

        protected void ClearScreen()
        {
            txtBxPackDate.Text = "";
            txtBxMoveDate.Text = "";
            txtBxFirstName.Text = "";
            txtBxMoveFrom.Text = "";
            txtBxMoveTo.Text = "";
            txtBxPhone.Text = "";
            txtBxEmail.Text = "";
            txtBxAddOnServices.Text = "";
            txtBxFinalCost.Text = "";
            txtBxReview.Text = "";
            txtBxReference.Text = "";
            txtbxNotes.InnerHtml = "";
            lstBxMovers.Items.Clear();
        }

        protected void btnCustomerReport_Click(object sender, EventArgs e)
        {
            if (Customer.Visible == true)
            {
                Tableau.Visible = false;
                initalContact.Visible = false;
                Customer.Visible = false;
            }
            else
            {
                Tableau.Visible = false;
                initalContact.Visible = false;
                Customer.Visible = true;
            }
        }
    }
}