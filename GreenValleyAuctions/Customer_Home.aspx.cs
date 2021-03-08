using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab3
{
    public partial class Customer_Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["Customer"] != null)
            {

            }
            else
            {
                Session["NoCustomer"] = "You Must first Login or create an Account";
                Response.Redirect("Customer_Login.aspx");
            }
            
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            //Save Service request info
          
            string sqlQuery = "INSERT INTO ServiceRequest(ServiceRequestID, ServiceType,DateCreated,Description,CustomerRequestID)VALUES ((Select ISNULL(max(ServiceRequestID)+1,1) from ServiceRequest),@ServiceType,GetDate(),@Description,(Select CustomerRequestID from CustomerRequest where Email = @User ))";


            

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);


            //Create sql command 
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlCommand.Parameters.AddWithValue("@ServiceType", dplServiceType.SelectedValue.ToString());
            sqlCommand.Parameters.AddWithValue("@Description", HttpUtility.HtmlEncode(txtDescription.Text));
            sqlCommand.Parameters.AddWithValue("@User", Session["Customer"].ToString());
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryValue = sqlCommand.ExecuteReader();

            // Close conecctions
            queryValue.Close();
            sqlConnect.Close();
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("LandingPage.aspx?loggedOut=true");
        }

        protected void BtnLanding_Click(object sender, EventArgs e)
        {
            Response.Redirect("LandingPage.aspx");
        }
    }
}