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
    public partial class WareHouse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            datasrcSearch.SelectParameters.Clear();
            Search.Visible = true;
            datasrcSearch.SelectParameters.Add("Storage",txtSearch.Text.ToString().Trim());
            if (txtSearch.Text.StartsWith("L") || txtSearch.Text.StartsWith("l"))
            {
                Left.Visible = true;
                Right.Visible = false;
                Trailer.Visible = false;

                L1.Visible = false;
                L2.Visible = false;
                L3.Visible = false;
                L4.Visible = false;
                L5.Visible = false;
            }
            else if (txtSearch.Text.StartsWith("R") || txtSearch.Text.StartsWith("r"))
            {
                Left.Visible = false;
                Right.Visible = true;
                Trailer.Visible = false;

                R1.Visible = false;
                R2.Visible = false;
                R3.Visible = false;
                R4.Visible = false;
                R5.Visible = false;
            }
            else if (txtSearch.Text.StartsWith("T") || txtSearch.Text.StartsWith("t"))
            {
                Left.Visible = false;
                Right.Visible = false;
                Trailer.Visible = true;


                T1.Visible = false;
                T2.Visible = false;
                T3.Visible = false;
                T4.Visible = false;
                T5.Visible = false;
                T6.Visible = false;
                T7.Visible = false;
                T8.Visible = false;
            }
            else
            {
                NoResults.Visible = true;
                Left.Visible = false;
                Right.Visible = false;
                Trailer.Visible = false;

                L1.Visible = false;
                L2.Visible = false;
                L3.Visible = false;
                L4.Visible = false;
                L5.Visible = false;

                R1.Visible = false;
                R2.Visible = false;
                R3.Visible = false;
                R4.Visible = false;
                R5.Visible = false;

                T1.Visible = false;
                T2.Visible = false;
                T3.Visible = false;
                T4.Visible = false;
                T5.Visible = false;
                T6.Visible = false;
                T7.Visible = false;
                T8.Visible = false;
            }

        }

        protected void btnleft_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Right.Visible = false;
            Left.Visible = true;
            Trailer.Visible = false;
            Search.Visible = false;
            L1.Visible = true;
            L2.Visible = false;
            L3.Visible = false;
            L4.Visible = false;
            L5.Visible = false;
        }

        protected void btnRight_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Right.Visible = true;
            Left.Visible = false;
            Trailer.Visible = false;
            Search.Visible = false;
            R1.Visible = true;
            R2.Visible = false;
            R3.Visible = false;
            R4.Visible = false;
            R5.Visible = false;
        }

        protected void btnTrailer_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Right.Visible = false;
            Left.Visible = false;
            Trailer.Visible = true;
            Search.Visible = false;
            T1.Visible = true;
            T2.Visible = false;
            T3.Visible = false;
            T4.Visible = false;
            T5.Visible = false;
            T6.Visible = false;
            T7.Visible = false;
            T8.Visible = false;
        }

        protected void btnL1_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            L1.Visible = true;
            L2.Visible = false;
            L3.Visible = false;
            L4.Visible = false;
            L5.Visible = false;
        }

        protected void btnL2_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            L1.Visible = false;
            L2.Visible = true;
            L3.Visible = false;
            L4.Visible = false;
            L5.Visible = false;
        }

        protected void btnL3_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            L1.Visible = false;
            L2.Visible = false;
            L3.Visible = true;
            L4.Visible = false;
            L5.Visible = false;
        }

        protected void btnL4_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            L1.Visible = false;
            L2.Visible = false;
            L3.Visible = false;
            L4.Visible = true;
            L5.Visible = false;
        }

        protected void btnL5_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            L1.Visible = false;
            L2.Visible = false;
            L3.Visible = false;
            L4.Visible = false;
            L5.Visible = true;
        }

        protected void btnR1_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            R1.Visible = true;
            R2.Visible = false;
            R3.Visible = false;
            R4.Visible = false;
            R5.Visible = false;
        }

        protected void btnR2_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            R1.Visible = false;
            R2.Visible = true;
            R3.Visible = false;
            R4.Visible = false;
            R5.Visible = false;
        }

        protected void btnR3_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            R1.Visible = false;
            R2.Visible = false;
            R3.Visible = true;
            R4.Visible = false;
            R5.Visible = false;
        }

        protected void btnR4_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            R1.Visible = false;
            R2.Visible = false;
            R3.Visible = false;
            R4.Visible = true;
            R5.Visible = false;
        }

        protected void btnR5_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            R1.Visible = false;
            R2.Visible = false;
            R3.Visible = false;
            R4.Visible = false;
            R5.Visible = true;
        }

        protected void btnT1_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            T1.Visible = true;
            T2.Visible = false;
            T3.Visible = false;
            T4.Visible = false;
            T5.Visible = false;
            T6.Visible = false;
            T7.Visible = false;
            T8.Visible = false;
        }

        protected void btnT2_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            T1.Visible = false;
            T2.Visible = true;
            T3.Visible = false;
            T4.Visible = false;
            T5.Visible = false;
            T6.Visible = false;
            T7.Visible = false;
            T8.Visible = false;
        }

        protected void btnT3_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            T1.Visible = false;
            T2.Visible = false;
            T3.Visible = true;
            T4.Visible = false;
            T5.Visible = false;
            T6.Visible = false;
            T7.Visible = false;
            T8.Visible = false;
        }

        protected void btnT4_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            T1.Visible = false;
            T2.Visible = false;
            T3.Visible = false;
            T4.Visible = true;
            T5.Visible = false;
            T6.Visible = false;
            T7.Visible = false;
            T8.Visible = false;
        }

        protected void btnT5_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            T1.Visible = false;
            T2.Visible = false;
            T3.Visible = false;
            T4.Visible = false;
            T5.Visible = true;
            T6.Visible = false;
            T7.Visible = false;
            T8.Visible = false;
        }

        protected void btnT6_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            T1.Visible = false;
            T2.Visible = false;
            T3.Visible = false;
            T4.Visible = false;
            T5.Visible = false;
            T6.Visible = true;
            T7.Visible = false;
            T8.Visible = false;
        }

        protected void btnT7_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            T1.Visible = false;
            T2.Visible = false;
            T3.Visible = false;
            T4.Visible = false;
            T5.Visible = false;
            T6.Visible = false;
            T7.Visible = true;
            T8.Visible = false;
        }

        protected void btnT8_Click(object sender, EventArgs e)
        {
            NoResults.Visible = false;
            Search.Visible = false;
            T1.Visible = false;
            T2.Visible = false;
            T3.Visible = false;
            T4.Visible = false;
            T5.Visible = false;
            T6.Visible = false;
            T7.Visible = false;
            T8.Visible = true;
        }

        protected void dlL1_ItemCommand(object source, DataListCommandEventArgs e)
        {
            // grab customer name from data list
            Label lbl = (Label)e.Item.FindControl("lblName");
            string CustomerID = "";


            //define connection to the DB
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            string sqlQueryID = "SELECT distinct c.FirstName, c.LastName,trim(FirstName) + ' ' + trim(LastName) as FullName, c.CustomerID " +
                " from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID " +
                "full join Customer c on c.CustomerID = WF.CustomerID where trim(FirstName) + ' ' + trim(LastName) LIKE @CustomerName+'%' or FirstName = @CustomerName " +
                "or  LastName = @CustomerName or trim(FirstName) + ' ' + trim(LastName) = @CustomerName ";
            //Create sql command to receive ID
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQueryID;

            sqlCommand.Parameters.AddWithValue("@CustomerName", HttpUtility.HtmlEncode(lbl.Text.ToString().Trim()));

            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryValue = sqlCommand.ExecuteReader();
            


            while (queryValue.Read())
            {
               


                CustomerID = queryValue["CustomerID"].ToString();


            }
            queryValue.Close();
            sqlConnect.Close();

            Session["Customer"] = null;
            Session["Customer"] = CustomerID;
            Response.Redirect("Customer_Info.aspx");
        }
    }
}