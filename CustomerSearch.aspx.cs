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

namespace Lab3
{
    public partial class CustomerSearch : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            nameSearch = "asdf";
        }


        protected void btnCustSearch_Click(object sender, EventArgs e)
        {
            //empties the list box before running to find a customer name containing the input
            lstCustomerList.Items.Clear();
            String nameSearch = txtbxCustomerSearch.Text;

            String sqlQuery = "SELECT customerName FROM Customer WHERE customerName LIKE '%" + nameSearch + "%'";

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

        protected void lstCustomerList_SelectedIndexChanged(object sender, EventArgs e)
        {
            //stores what customer is selected to pass to the ticket creation
            int custIDHold;
            String custNameHold = HttpUtility.HtmlEncode(lstCustomerList.SelectedItem.Text);

            String conStr = WebConfigurationManager.ConnectionStrings["lab3Sql"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conStr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT customerID FROM Customer WHERE customerName = '" + custNameHold + "'"))
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    con.Open();
                    custIDHold = Int32.Parse(cmd.ExecuteScalar().ToString());
                    con.Close();
                }

                using (SqlCommand cmd1 = new SqlCommand("SELECT ticketStatus, ticketOpenDate, deadlineDate FROM ServiceTicket WHERE customerID = " + custIDHold))
                {
                    using(SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd1.Connection = con;
                        sda.SelectCommand = cmd1;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grdPastTickets.DataSource = dt;
                            grdPastTickets.DataBind();
                        }
                    }
                }
            }
        }
    }
}