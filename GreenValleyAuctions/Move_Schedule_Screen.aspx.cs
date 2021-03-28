using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace GreenValleyAuctions
{
    public partial class Move_Schedule_Screen : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //On Page load grab customer info

            string Query = "select trim(c.CustomerAddress) as CA,trim(M.DestinationAddress) as DA, MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID inner join Moving M on M.ServiceID = SE.ServiceID   where C.CustomerID = @ID group by c.CustomerAddress,M.DestinationAddress; ";

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


            while (queryResult.Read())
            {
                txtOrigin.Text = queryResult["CA"].ToString();
                txtDest.Text = queryResult["DA"].ToString();
               
            }

            queryResult.Close();
            sqlConnect.Close();
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lbTrucks.Items.Add(ddlTrucks.SelectedValue.ToString());
        }

        protected void btnAddMover_Click(object sender, EventArgs e)
        {
            lbMovers.Items.Add(ddlMovers.SelectedValue.ToString());
        }

        protected void btnRemoveTruck_Click(object sender, EventArgs e)
        {
            lbTrucks.Items.Remove(lbTrucks.SelectedValue);

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            lbMovers.Items.Remove(lbMovers.SelectedValue);
        }

        protected void txtOtherMilage_TextChanged(object sender, EventArgs e)
        {
            try
            {
                sumMilage.Text = (int.Parse(txtMilage.Text) + int.Parse(txtOriginMilage.Text) + int.Parse(txtOtherMilage.Text)).ToString();
            }
            catch
            {
                sumMilage.Text = "Please fill all Boxes";
            }
           
        }

        protected void btnpopulate_Click(object sender, EventArgs e)
        {
            // creaing random number
            Random random = new Random();

            //creating array to draw random data from
           
            
            string[] num = { "2", "4", "9", "1", "11", "21", "15", "3", "30" };
            string[] money = { "400", "5000", "30", "200", "250", "10", "1000" };
            string[] date = { "01/24/2021", "05/13/2021", "12/21/2021", "9/17/2021", "06/12/2021" };

            

            //number based textboxes
            txtEstimateHours.Text = num[random.Next(0,num.Length)];
            txtActualHours.Text= num[random.Next(0, num.Length)];
            txtMilage.Text = num[random.Next(0, num.Length)];
            txtOriginMilage.Text = num[random.Next(0, num.Length)];
            txtOtherMilage.Text= num[random.Next(0, num.Length)];
            txtQuantityMovers.Text= num[random.Next(0, num.Length)];
            txtQuantityTrucks.Text= num[random.Next(0, num.Length)];

            //moneybased text boxes
            txtFood.Text = money[random.Next(0, money.Length)];
            txtFuel.Text = money[random.Next(0, money.Length)];
            txtInsurance.Text = money[random.Next(0, money.Length)];
            txtWorkerCost.Text = money[random.Next(0, money.Length)];
            txtCostConsumables.Text= money[random.Next(0, money.Length)];
            txtPrice.Text= money[random.Next(0, money.Length)];

            //date based textboxes
            txtMoveDate.Text = date[random.Next(0, date.Length)];

            //sum
            try
            {
                sumMilage.Text = (int.Parse(txtMilage.Text) + int.Parse(txtOriginMilage.Text) + int.Parse(txtOtherMilage.Text)).ToString();
            }
            catch
            {
                sumMilage.Text = "Please fill all Boxes";
            }
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



            

            // query to insert
            string sqlQueryID = "Insert into MovingScreen(MovingScreenID, FinalMoveDate, PricingSource, QuantityTrucks, Trucks," +
                " QuantityMovers, Movers,Price,Consumables,EstimatedHours,ActualHours,OriginMiles,DestMiles,OtherMiles,TotalMiles,FuelCosts,InsuranceCosts,CostPerWorker,Food,WorkFlowID)" +
                "Values((Select ISNULL(max(MovingScreenID)+1,1) from MovingScreen),@FinalMoveDate,@PricingScource,@QuantityTrucks,@Trucks,@QuantityMovers,@Movers,@Price,@Consumbles" +
                ",@EstimatedHours,@ActualHours,@OriginMiles,@DestMiles,@OtherMiles,@TotalMiles,@FuelCosts,@InsuranceCosts,@CostPerWorker,@Food,@ID)";

            //Create sql command to receive ID
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQueryID;

            //Get list of trucks
            string trucklist = "";
            foreach (ListItem item in lbTrucks.Items)
            {
                
                    trucklist += item.Value.ToString().Trim() + ", ";
                
            }
            trucklist = trucklist.Remove(trucklist.Length - 2);
            //get list of workers
            string MoverList = "";
            foreach (ListItem item in lbMovers.Items)
            {

                MoverList += item.Value.ToString().Trim() + ", ";

            }
            MoverList = MoverList.Remove(MoverList.Length - 2);


            //Parameter
            sqlCommand.Parameters.AddWithValue("@FinalMoveDate", HttpUtility.HtmlEncode(txtMoveDate.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@PricingScource", HttpUtility.HtmlEncode(rblPricingScource.SelectedValue.ToString()));
            sqlCommand.Parameters.AddWithValue("@QuantityTrucks", HttpUtility.HtmlEncode(txtQuantityTrucks.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@Trucks", HttpUtility.HtmlEncode(trucklist));
            sqlCommand.Parameters.AddWithValue("@QuantityMovers", HttpUtility.HtmlEncode(txtQuantityMovers.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@Movers", HttpUtility.HtmlEncode(MoverList));
            sqlCommand.Parameters.AddWithValue("@Price", HttpUtility.HtmlEncode(txtPrice.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@Consumbles", HttpUtility.HtmlEncode(txtCostConsumables.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@EstimatedHours", HttpUtility.HtmlEncode(txtEstimateHours.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@ActualHours", HttpUtility.HtmlEncode(txtActualHours.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@OriginMiles", HttpUtility.HtmlEncode(txtOriginMilage.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@DestMiles", HttpUtility.HtmlEncode(txtMilage.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@OtherMiles", HttpUtility.HtmlEncode(txtOtherMilage.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@TotalMiles", HttpUtility.HtmlEncode(sumMilage.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@FuelCosts", HttpUtility.HtmlEncode(txtFuel.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@InsuranceCosts", HttpUtility.HtmlEncode(txtInsurance.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@CostPerWorker", HttpUtility.HtmlEncode(txtWorkerCost.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@Food", HttpUtility.HtmlEncode(txtFood.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));


            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryValue = sqlCommand.ExecuteReader();

            // Close conecctions
            queryValue.Close();
            sqlConnect.Close();

            
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            HttpUtility.HtmlEncode(txtEstimateHours.Text = "");
            HttpUtility.HtmlEncode(txtActualHours.Text = "");
            HttpUtility.HtmlEncode(txtCostConsumables.Text = "");
            HttpUtility.HtmlEncode(txtFood.Text = "");
            HttpUtility.HtmlEncode(txtFuel.Text = "");
            HttpUtility.HtmlEncode(txtInsurance.Text = "");
            HttpUtility.HtmlEncode(txtMilage.Text = "");
            HttpUtility.HtmlEncode(txtMoveDate.Text = "");
            HttpUtility.HtmlEncode(txtOriginMilage.Text = "");
            HttpUtility.HtmlEncode(txtOtherMilage.Text = "");
            HttpUtility.HtmlEncode(txtPrice.Text = "");
            HttpUtility.HtmlEncode(txtQuantityMovers.Text = "");
            HttpUtility.HtmlEncode(txtQuantityTrucks.Text = "");
            HttpUtility.HtmlEncode(txtWorkerCost.Text = "");
                
               





        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Info.aspx");
        }
    }
}