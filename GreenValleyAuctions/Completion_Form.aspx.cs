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
    public partial class Completion_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            String sqlQuerySearch = "SELECT FirstName + LastName as 'CustomerName', CustomerAddress, CustomerPhone, CustomerEmail FROM Customer WHERE FirstName + LastName LIKE '%" + txtSearch.Text + "%'";

            //sql Connection
            SqlConnection sqlConnectSearch = new SqlConnection("Server = Localhost; Database = Lab3;Trusted_Connection = Yes;");
            SqlDataAdapter sqlAdapterSearch = new SqlDataAdapter(sqlQuerySearch, sqlConnectSearch);

            DataTable dtforSearch = new DataTable();
            sqlAdapterSearch.Fill(dtforSearch);
            grdCustomerSearch.DataSource = dtforSearch;
            grdCustomerSearch.DataBind();
        }

        protected void btncalculate_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtSubtotal.Text) && !string.IsNullOrEmpty(txtaddexpenses.Text))
            {

                txtTotalCost.Text = (Convert.ToInt32(txtSubtotal.Text) + Convert.ToInt32(txtaddexpenses.Text)).ToString();
            }
            else
            {

                Response.Write("Please Enter Value");
            }
        }

        protected void Rblpaymentreceived_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (Rblpaymentreceived.SelectedItem.Value == "Partial")
            {
                ShowTextBoxes(true);
                ShowLabel(true);
            }
            else
            {
                ShowTextBoxes(false);
                ShowLabel(false);
            }
        }
        private void ShowTextBoxes(bool value)
        {
            txtpartial.Visible = value;
        }
        private void ShowLabel(bool value)
        {
            lblPartial.Visible = value;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string Query = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            //Create sql command 
            SqlCommand sqlCommandID = new SqlCommand();
            sqlCommandID.Connection = sqlConnect;
            sqlCommandID.CommandType = CommandType.Text;
            sqlCommandID.CommandText = Query;

            sqlCommandID.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommandID.ExecuteReader();

            string workFLow = "";
            while (queryResult.Read())
            {
                workFLow = queryResult["WFID"].ToString();


            }

            queryResult.Close();
            sqlConnect.Close();

            //Connecting to Database 
            SqlConnection sqlConnectCF = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            SqlCommand sqlCommandCF = new SqlCommand();
            sqlCommandCF.Connection = sqlConnectCF;
            sqlCommandCF.CommandType = CommandType.Text;
            sqlConnectCF.Open();

            //Saving Information into the Completion Form
            sqlCommandCF.Parameters.AddWithValue("@CustomerName", HttpUtility.HtmlEncode(txtSearch.Text));
            sqlCommandCF.Parameters.AddWithValue("@SubTotal", HttpUtility.HtmlEncode(txtSubtotal.Text));
            sqlCommandCF.Parameters.AddWithValue("@AddExpenses", HttpUtility.HtmlEncode(txtaddexpenses.Text));
            sqlCommandCF.Parameters.AddWithValue("@TotalCost", HttpUtility.HtmlEncode(txtTotalCost.Text));
            sqlCommandCF.Parameters.AddWithValue("@PaidAmount", HttpUtility.HtmlEncode(Rblpaymentreceived.SelectedValue));
            sqlCommandCF.Parameters.AddWithValue("@Remaining", HttpUtility.HtmlEncode(txtpartial.Text));
            sqlCommandCF.Parameters.AddWithValue("@Employees", HttpUtility.HtmlEncode(RBLEmployees.SelectedValue));
            sqlCommandCF.Parameters.AddWithValue("@Equipment", HttpUtility.HtmlEncode(RBLEquipment.SelectedValue));
            sqlCommandCF.Parameters.AddWithValue("@AdditonalNotes", HttpUtility.HtmlEncode(txtAdditionalNotes.Text));
            sqlCommandCF.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));


            //Inserting form into the DB
            String sqlQueryCF = "INSERT INTO CompletionForm(CustomerName, Subtotal, AdditonalExpenses, Total, PaidAmount, Remaining, AdditionalNotes, EmployeeID, EquipmentID,WorkFLowID) VALUES (@CustomerName,@SubTotal,@AddExpenses ,@TotalCost ,@PaidAmount ,@Remaining ,@AdditonalNotes ,@Employees , @Equipment,@ID )";
            sqlCommandCF.CommandText = sqlQueryCF;
            SqlDataReader CFresults = sqlCommandCF.ExecuteReader();
            CFresults.Close();
            sqlConnectCF.Close();


            Session["Customer"] = null;
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            String sqlQueryHistory = "Select * from CompletionForm";

            //Sql Connection 

            SqlConnection sqlConnectHisotry = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
            SqlDataAdapter sqlAdapterHistory = new SqlDataAdapter(sqlQueryHistory, sqlConnectHisotry);

            DataTable dtforHistory = new DataTable();
            sqlAdapterHistory.Fill(dtforHistory);
            grdHistory.DataSource = dtforHistory;
            grdHistory.DataBind();

        }
    }
}
