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
    public partial class Completion_Form1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            String sqlQuerySearch = "SELECT FirstName + LastName as 'CustomerName', CustomerAddress, CustomerPhone, CustomerEmail FROM Customer WHERE FirstName + LastName LIKE '%" + txtSearch.Text + "%'";

            //sql Connection
            SqlConnection sqlConnectSearch = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);
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
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

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
            SqlConnection sqlConnectCF = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);
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


            
        }

        protected void btnHistory_Click(object sender, EventArgs e)
        {
            String sqlQueryHistory = "Select * from CompletionForm";

            //Sql Connection 

            SqlConnection sqlConnectHisotry = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);
            SqlDataAdapter sqlAdapterHistory = new SqlDataAdapter(sqlQueryHistory, sqlConnectHisotry);

            DataTable dtforHistory = new DataTable();
            sqlAdapterHistory.Fill(dtforHistory);
            grdHistory.DataSource = dtforHistory;
            grdHistory.DataBind();

        }

        protected void btnpopulate_Click(object sender, EventArgs e)
        {
            // creaing random number
            Random random = new Random();

            //creating array to draw random data from
            string[] money = { "400", "5000", "30", "200", "250", "10", "1000" };
            string[] notes = { "none", "paid with check", " paid cash" };
            //moneybased text boxes
            txtSubtotal.Text = money[random.Next(0, money.Length)];
            txtaddexpenses.Text = money[random.Next(0, money.Length)];

            //employe based 
            RBLEmployees.SelectedIndex = random.Next(0, 6);
            RBLEquipment.SelectedIndex = random.Next(0, 7);
            Rblpaymentreceived.SelectedIndex = random.Next(0, 3);

            if (Rblpaymentreceived.SelectedValue.Equals("Partial"))
            {
                txtpartial.Visible = true;
                txtpartial.Text = money[random.Next(0, money.Length)];
            }
            else
                txtpartial.Visible = false;

            //notes
            txtAdditionalNotes.Text = notes[random.Next(0, notes.Length)];
        }

        
    }
}