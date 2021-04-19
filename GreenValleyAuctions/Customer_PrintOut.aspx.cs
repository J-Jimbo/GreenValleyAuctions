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
    public partial class Customer_PrintOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //grab workflow id

            string WFQuery = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


            //Create sql command 
            SqlCommand sqlCommandID = new SqlCommand();
            sqlCommandID.Connection = sqlConnect;
            sqlCommandID.CommandType = CommandType.Text;
            sqlCommandID.CommandText = WFQuery;

            sqlCommandID.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader IDResult = sqlCommandID.ExecuteReader();

            string workFLow = "";
            while (IDResult.Read())
            {
                workFLow = IDResult["WFID"].ToString();


            }

            IDResult.Close();
            sqlConnect.Close();


            string Query = "Select trim(FirstName)+' '+trim(LastName) as Name,CustomerAddress,CustomerPhone,CustomerEmail from Customer where customerID = @ID; ";

            //Define the connection to the Database
            

            //Create sql command 
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = Query;


            sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommand.ExecuteReader();
            while(queryResult.Read())
            {
                lblCustomerName.Text = queryResult["Name"].ToString();
                lblPhone.Text = queryResult["CustomerPhone"].ToString();
                lblCustomerEmail.Text = queryResult["CustomerEmail"].ToString();
                lblCustomerAddress.Text = queryResult["CustomerAddress"].ToString().Trim();
            }

            queryResult.Close();
            sqlConnect.Close();

            //--------------------------------------
            string sqlQuery = "Select * from Customer C inner join WorkFlow wf on C.CustomerID = wf.CustomerID inner join ServiceEvent se on se.WorkFlowID = wf.WorkFlowID full join InitialContact IC on C.CustomerID = IC.CustomerID where WF.WorkFlowID = @ID; ";

            //Define the connection to the Database
            

            //Create sql command 
            SqlCommand sqlCommandIC = new SqlCommand();
            sqlCommandIC.Connection = sqlConnect;
            sqlCommandIC.CommandType = CommandType.Text;
            sqlCommandIC.CommandText = sqlQuery;


            sqlCommandIC.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow.ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader Result = sqlCommandIC.ExecuteReader();
            string type = "";
            while (Result.Read())
            {
                lblService.Text = Result["ServiceType"].ToString();
                lblEngagmentDate.Text = Result["EngagmentDate"].ToString();
                lblLookYN.Text = Result["LookAt"].ToString();
                lblDSYN.Text = Result["Downsize"].ToString().Trim();
                lblEYN.Text = Result["Estate"].ToString().Trim();
                lblMYN.Text = Result["Moving"].ToString().Trim();
                type= Result["ServiceType"].ToString().Trim();


                if(Result["ServiceType"].ToString().Equals("Auction"))
                {
                    auction.Visible = true;
                    move.Visible = false;
                }
                else
                {
                    auction.Visible = false;
                    move.Visible = true;
                }
            }

            Result.Close();
            sqlConnect.Close();

            //-----------------------------------------------
            string sqlQueryDates = "Select * from Customer C inner join workflow wf on C.CustomerID = wf.CustomerID inner join serviceevent se on se.workflowID = wf.workflowID where C.customerID = @ID; ";

            //Define the connection to the Database


            //Create sql command 
            SqlCommand sqlCommandDates = new SqlCommand();
            sqlCommandDates.Connection = sqlConnect;
            sqlCommandDates.CommandType = CommandType.Text;
            sqlCommandDates.CommandText = sqlQueryDates;


            sqlCommandDates.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader answer = sqlCommandDates.ExecuteReader();
            while (answer.Read())
            {
                lblDate1.Text = answer["PotentialDate1"].ToString();
                lblDate2.Text = answer["PotentialDate2"].ToString();
                lblbDateStart.Text = answer["ServiceDate"].ToString();
                lblDateEnd.Text = answer["ServiceEndDate"].ToString().Trim();
                
            }

            answer.Close();
            sqlConnect.Close();

            //---------------------------------------------------------------------
            if(type.Equals("Auction"))
            {
                lbEmpAuction.Visible = true;
                lbEquipmentAuction.Visible = true;
                lbSupply.Visible = true;
                lbEquipmentMove.Visible = false;
                lbEmpMove.Visible = false;
            }
            else
            {
                lbEmpAuction.Visible = false;
                lbEquipmentAuction.Visible = false;
                lbSupply.Visible = false;
                lbEquipmentMove.Visible = true;
                lbEmpMove.Visible = true;
            }

            //------------------------------------------------------------
            string sqlEnd = "Select * from WorkFlow where customerID = @ID; ";

            //Define the connection to the Database


            //Create sql command 
            SqlCommand sqlCommandEnd = new SqlCommand();
            sqlCommandEnd.Connection = sqlConnect;
            sqlCommandEnd.CommandType = CommandType.Text;
            sqlCommandEnd.CommandText = sqlEnd;


            sqlCommandEnd.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryend = sqlCommandEnd.ExecuteReader();
            while (queryend.Read())
            {
                lblDate.Text = queryend["CompletionDate"].ToString();
                lblReview.Text = queryend["Review"].ToString();
               

            }

            queryend.Close();
            sqlConnect.Close();
        }

        protected void cbCustomer_CheckedChanged(object sender, EventArgs e)
        {
            if (customer.Visible == true)
                customer.Visible = false;
            else
                customer.Visible = true;
        }

        protected void cbintial_CheckedChanged(object sender, EventArgs e)
        {
            if (service.Visible == true)
                service.Visible = false;
            else
                service.Visible = true;

        }

        protected void cbdate_CheckedChanged(object sender, EventArgs e)
        {
            if (date.Visible == true)
                date.Visible = false;
            else
                date.Visible = true;
        }

        protected void cbEE_CheckedChanged(object sender, EventArgs e)
        {
            if (EmpEquip.Visible == true)
                EmpEquip.Visible = false;
            else
                EmpEquip.Visible = true;
        }

        protected void cbEnd_CheckedChanged(object sender, EventArgs e)
        {
            if (end.Visible == true)
                end.Visible = false;
            else
                end.Visible = true;
        }
    }
}