//Created by Ben Ortt

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
    public partial class CustomerRequests : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!this.IsPostBack)
            {
                //fills the list box with the active requests under customer names
                String sqlQuery = "Select customerName from ServiceRequest";
                lstRequestList.Items.Clear();

                String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
                SqlConnection sqlConnect = new SqlConnection(conStr);

                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                //while the query has more results, concats first and last name and adds them to the list
                while (queryResults.Read())
                {
                    lstRequestList.Items.Add(queryResults["customerName"].ToString());
                }
                //closes the query out
                queryResults.Close();
                sqlConnect.Close();
            }
        }

        protected void gridActiveRequests_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnMakeTicket_Click(object sender, EventArgs e)
        {
            //binds the customer name to a session to be looked at in the add customer page, and sends a redirect to kick it off
            Session["NewCustomer"] = lstRequestList.SelectedItem.Text;
            Response.Redirect("AddCustomer.aspx");
        }

        protected void lstRequestList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}