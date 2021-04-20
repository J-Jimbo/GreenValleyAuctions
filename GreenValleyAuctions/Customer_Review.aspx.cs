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
    public partial class Customer_Review : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            //find workflow history id
            string Query = "Select WorkFlowID from  WorkFlow WF inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = (Select CustomerID from Customer where CustomerEmail = @ID) ";

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

            int WFID = 0;
            while(queryResult.Read())
            {
                WFID = int.Parse(queryResult["WorkFlowID"].ToString());
            }

            queryResult.Close();
            //-------------------------------------------------------------
            //update service event based on customer

            string updateQuery = "Insert into WorkFlowHistory(WFHistoryID,TicketName,TicketNote,WorkFlowID)Values((Select ISNULL(max(WFHistoryID)+1,1) from WorkFlowHistory),'Client Review',@Comment,@WFID);" +
                "UPDATE WorkFlow Set Review = @Review where WorkFlowID = @WFID;";
            //Create sql command 
            SqlCommand sqlCommandUpdate = new SqlCommand();
            sqlCommandUpdate.Connection = sqlConnect;
            sqlCommandUpdate.CommandType = CommandType.Text;
            sqlCommandUpdate.CommandText = updateQuery;

            sqlCommandUpdate.Parameters.AddWithValue("@WFID", HttpUtility.HtmlEncode(WFID.ToString()));
            sqlCommandUpdate.Parameters.AddWithValue("@Review", HttpUtility.HtmlEncode(ddlRating.SelectedValue.ToString()));
            sqlCommandUpdate.Parameters.AddWithValue("@Comment", HttpUtility.HtmlEncode(txtComments.Text.ToString()));
            //open connection to send ID query 
            SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();



            queryAnswer.Close();
            sqlConnect.Close();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            txtComments.Text = "";
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Home.aspx");
        }

        protected void ddlRating_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(ddlRating.SelectedValue.Equals("0"))
            {
                noStar.Visible = true;
                OneStart.Visible = false;
                Start2.Visible = false;
                Star3.Visible = false;
                Star4.Visible = false;
                Star5.Visible = false;
                    


            }
            if (ddlRating.SelectedValue.Equals("1"))
            {
                noStar.Visible = false;
                OneStart.Visible = true;
                Start2.Visible = false;
                Star3.Visible = false;
                Star4.Visible = false;
                Star5.Visible = false;
            }
            if (ddlRating.SelectedValue.Equals("2"))
            {
                noStar.Visible = false;
                OneStart.Visible = false;
                Start2.Visible = true;
                Star3.Visible = false;
                Star4.Visible = false;
                Star5.Visible = false;
            }
            if (ddlRating.SelectedValue.Equals("3"))
            {
                noStar.Visible = false;
                OneStart.Visible = false;
                Start2.Visible = false;
                Star3.Visible = true;
                Star4.Visible = false;
                Star5.Visible = false;
            }
            if (ddlRating.SelectedValue.Equals("4"))
            {
                noStar.Visible = false;
                OneStart.Visible = false;
                Start2.Visible = false;
                Star3.Visible = false;
                Star4.Visible = true;
                Star5.Visible = false;
            }
            if (ddlRating.SelectedValue.Equals("5"))
            {
                noStar.Visible = false;
                OneStart.Visible = false;
                Start2.Visible = false;
                Star3.Visible = false;
                Star4.Visible = false;
                Star5.Visible = true;
            }
        }
    }
}