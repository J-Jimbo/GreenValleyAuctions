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
    public partial class Customer_Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            //clear old results
            

            //define connection to the DB
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

            string sqlQueryID = "SELECT distinct c.FirstName, c.LastName,trim(FirstName) + ' ' + trim(LastName) as FullName, c.CustomerID " +
                " from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID " +
                "full join Customer c on c.CustomerID = WF.CustomerID where trim(FirstName) + ' ' + trim(LastName) LIKE @CustomerName+'%' or FirstName = @CustomerName " +
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
                ListItem customerName = new ListItem(queryValue["FullName"].ToString(), queryValue["CustomerID"].ToString());
                
                lbResults.Items.Add(customerName);



            }
            queryValue.Close();
            sqlConnect.Close();
        }

        protected void btnSelect_Click(object sender, EventArgs e)
        {
            Session["Customer"] = null;
            Session["Customer"] = lbResults.SelectedValue.ToString();
            Response.Redirect("Customer_Info.aspx");
        }
    }
}