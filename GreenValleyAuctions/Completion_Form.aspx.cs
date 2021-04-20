using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;
namespace GreenValleyAuctions
{
    public partial class Completion_Form1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            //Putting Basic Customer Infromation into Completion Form 
            String sqlCustomerInformation = " SELECT Customer.CustomerID, Customer.FirstName, Customer.LastName, Customer.CustomerPhone, Customer.CustomerEmail, Customer.CustomerAddress, WorkFlow.CompletionDate, WorkFlow.WorkFlowID, ServiceEvent.ServiceType FROM Customer INNER JOIN WorkFlow ON Customer.CustomerID = WorkFlow.CustomerID INNER JOIN ServiceEvent ON WorkFlow.WorkFlowID = ServiceEvent.WorkFlowID where Customer.CustomerID = @ID";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //sql command
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlCustomerInformation;

            sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            sqlConnect.Open();
            SqlDataReader queryCustomerInformation = sqlCommand.ExecuteReader();

            while (queryCustomerInformation.Read())
            {
                lblFirstName.Text = queryCustomerInformation["FirstName"].ToString();
                lblLastName.Text = queryCustomerInformation["LastName"].ToString();
                lblCPhoneNumber.Text = queryCustomerInformation["CustomerPhone"].ToString();
                lblCAddress.Text = queryCustomerInformation["CustomerAddress"].ToString();
                lblCEmail.Text = queryCustomerInformation["CustomerEmail"].ToString();
                lblTService.Text = queryCustomerInformation["ServiceType"].ToString();
                lblDService.Text = queryCustomerInformation["CompletionDate"].ToString();
            }

            queryCustomerInformation.Close();
            sqlConnect.Close();


            ////Employees Associated 
            //String sqlEmployee = " SELECT trim(Employee.EmployeeFirstName) + ' ' + trim(Employee.EmployeeLastName) AS EmployeeName, Customer.CustomerID, WorkFlow.WorkFlowID FROM WorkFlow INNER JOIN Customer ON WorkFlow.CustomerID = Customer.CustomerID INNER JOIN Employee ON WorkFlow.EmployeeID = Employee.EmployeeID where Customer.CustomerID = @ID";


            ////sql command
            //SqlCommand sqlCommand2 = new SqlCommand();
            //sqlCommand2.Connection = sqlConnect;
            //sqlCommand2.CommandType = CommandType.Text;
            //sqlCommand2.CommandText = sqlEmployee;

            //sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //sqlConnect.Open();
            //SqlDataReader queryEmployee = sqlCommand2.ExecuteReader();

            //while (queryEmployee.Read())
            //{
            //    lblEmployeesAssociated.Text = queryEmployee["EmployeeName"].ToString();
            //}

            //queryEmployee.Close();
            //sqlConnect.Close();

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
            sqlCommandCF.Parameters.AddWithValue("@AdditonalNotes", HttpUtility.HtmlEncode(txtAdditionalNotes.Text));
            sqlCommandCF.Parameters.AddWithValue("@Experience", HttpUtility.HtmlEncode(txtPositiveOrNegative.Text));
            sqlCommandCF.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));



            //Inserting form into the DB
            String sqlQueryCF = "INSERT INTO CompletionForm(AdditionalNotes, Experience, WorkFLowID) VALUES ( @AdditonalNotes, @Experience, @ID )";
            sqlCommandCF.CommandText = sqlQueryCF;
            SqlDataReader CFresults = sqlCommandCF.ExecuteReader();
            CFresults.Close();
            sqlConnectCF.Close();



        }



        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Info.aspx");
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            try
            {
                MailMessage mail = new MailMessage();
                mail.To.Add(txtCustomerEmail.Text);
                mail.From = new MailAddress("GreenValleyTest1@gmail.com");
                mail.Subject = txtSubject.Text;
                mail.Body = Request.Form["txtMessage"];
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new System.Net.NetworkCredential("GreenValleyTest1@gmail.com", "GreenValley1!");
                smtp.EnableSsl = true;
                lblMsg.Text = "Mail Sent !";
                smtp.Send(mail);
            }
            catch
            {

            }
        }
    }
}
