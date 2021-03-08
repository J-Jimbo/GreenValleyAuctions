//created by Ben Ortt

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Lab1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnFillListBox_Click(object sender, EventArgs e)
        {
            //fills the list box with the current customers
            String sqlQuery = "Select customerName from Customer";
            lstCustomerList.Items.Clear();

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
                lstCustomerList.Items.Add(queryResults["customerName"].ToString());
            }
            //closes the query out
            queryResults.Close();
            sqlConnect.Close();
        }
    }
}