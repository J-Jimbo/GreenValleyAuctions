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
            if (IsPostBack != true)
            {
                try
                {
                    //query to check for existing form based on workflow
                    //query to grab workflow
                    string WFQuery = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

                    //Define the connection to the Database
                    SqlConnection sqlConnection = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

                    //Create sql command 
                    SqlCommand sqlCommandID = new SqlCommand();
                    sqlCommandID.Connection = sqlConnection;
                    sqlCommandID.CommandType = CommandType.Text;
                    sqlCommandID.CommandText = WFQuery;

                    sqlCommandID.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
                    //open connection to send ID query 
                    sqlConnection.Open();
                    SqlDataReader Result = sqlCommandID.ExecuteReader();

                    string workFLow = "";
                    while (Result.Read())
                    {
                        workFLow = Result["WFID"].ToString();


                    }

                    Result.Close();
                    
                    //query to grab move screww form 
                    string formQuery = "Select * from MovingScreen where WorkFlowID = @ID;";

                    //Create sql command 
                    SqlCommand sqlCommandScreen = new SqlCommand();
                    sqlCommandScreen.Connection = sqlConnection;
                    sqlCommandScreen.CommandType = CommandType.Text;
                    sqlCommandScreen.CommandText = formQuery;


                    sqlCommandScreen.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

                    SqlDataReader answer = sqlCommandScreen.ExecuteReader();
                    while (answer.Read())
                    {
                        
                        //fill info
                        txtMoveDate.Text = DateTime.Parse(answer["FinalMoveDate"].ToString()).ToString("yyyy-MM-dd").Trim();
                        rblPricingScource.SelectedValue = answer["PricingSource"].ToString().Trim();
                        txtQuantityMovers.Text = answer["QuantityMovers"].ToString().Trim();
                        txtQuantityTrucks.Text = answer["QuantityTrucks"].ToString().Trim();
                        txtPrice.Text = answer["Price"].ToString().Trim();
                        txtCostConsumables.Text = answer["Consumables"].ToString().Trim();
                        txtEstimateHours.Text = answer["EstimatedHours"].ToString().Trim();
                        txtActualHours.Text = answer["ActualHours"].ToString().Trim();
                        txtOriginMilage.Text = answer["OriginMiles"].ToString().Trim();
                        txtMilage.Text = answer["DestMiles"].ToString().Trim();
                        txtOtherMilage.Text = answer["OtherMiles"].ToString().Trim();
                        sumMilage.Text = answer["TotalMiles"].ToString().Trim();
                        txtFuel.Text = answer["FuelCosts"].ToString().Trim();
                        txtInsurance.Text = answer["InsuranceCosts"].ToString().Trim();
                        txtWorkerCost.Text = answer["CostPerWorker"].ToString().Trim();
                        txtFood.Text = answer["Food"].ToString().Trim();

                    }

                    answer.Close();
                }
                catch
                {

                }
            }
            else
            {

            }



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
            ListItem truck = new ListItem(ddlTrucks.SelectedItem.Text.ToString(), ddlTrucks.SelectedValue.ToString());
            lbTrucks.Items.Add(truck);
            ddlTrucks.Items.Remove(ddlTrucks.Items.FindByValue(truck.Value));
            lblError.Text = "";
        }

        protected void btnAddMover_Click(object sender, EventArgs e)
        {
            ListItem mover = new ListItem(ddlMovers.SelectedItem.Text.ToString(), ddlMovers.SelectedValue.ToString());
            lbMovers.Items.Add(mover);
            ddlMovers.Items.Remove(ddlMovers.Items.FindByValue(mover.Value));
            lblMoverError.Text = "";

        }

        protected void btnRemoveTruck_Click(object sender, EventArgs e)
        {
            

            if (lbTrucks.SelectedIndex > -1)
            {
                ListItem truck = new ListItem(lbTrucks.SelectedItem.Text.ToString(), lbTrucks.SelectedValue.ToString());
                lbTrucks.Items.Remove(lbTrucks.SelectedItem);
                ddlTrucks.Items.Add(truck);
                lblError.Text = "";
            }
            else
                lblError.Text = "No Truck Selected";

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            if(lbMovers.SelectedIndex > -1)
            {

                ListItem mover = new ListItem(lbMovers.SelectedItem.Text.ToString(), lbMovers.SelectedValue.ToString());
                lbMovers.Items.Remove(lbMovers.SelectedItem);
                ddlMovers.Items.Add(mover);
                lblMoverError.Text = "";
            }
            else
                lblMoverError.Text = "No Mover Selected";
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
            SqlDataReader response = sqlCommandID.ExecuteReader();

            string workFLow = "";
            while (response.Read())
            {
                workFLow = response["WFID"].ToString();


            }

            response.Close();

            //----------------------------------------------------

            //check for existing form

            string MoveScreenID = "None";



            string existsQuery = "Select MovingScreenID from MovingScreen where WorkFlowID = @ID; ";


            //Create sql command 
            SqlCommand sqlCommandExists = new SqlCommand();
            sqlCommandExists.Connection = sqlConnect;
            sqlCommandExists.CommandType = CommandType.Text;
            sqlCommandExists.CommandText = existsQuery;

            sqlCommandExists.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow.ToString()));
            //open connection to send ID query 

            SqlDataReader answer = sqlCommandExists.ExecuteReader();


            while (answer.Read())
            {
                if (answer.HasRows)
                    MoveScreenID = answer["MovingScreenID"].ToString().Trim();
                else
                    MoveScreenID = "None";

            }

            answer.Close();

            //--------------------------------------------------------------------------------------------------------------------------







            // query to insert
            string sqlQueryID = "";
            if (MoveScreenID.Equals("None"))
            {
                 sqlQueryID = "Insert into MovingScreen(MovingScreenID, FinalMoveDate, PricingSource, QuantityTrucks," +
                   " QuantityMovers,Price,Consumables,EstimatedHours,ActualHours,OriginMiles,DestMiles,OtherMiles,TotalMiles,FuelCosts,InsuranceCosts,CostPerWorker,Food,WorkFlowID)" +
                   "Values((Select ISNULL(max(MovingScreenID)+1,1) from MovingScreen),@FinalMoveDate,@PricingScource,@QuantityTrucks,@QuantityMovers,@Price,@Consumbles" +
                   ",@EstimatedHours,@ActualHours,@OriginMiles,@DestMiles,@OtherMiles,@TotalMiles,@FuelCosts,@InsuranceCosts,@CostPerWorker,@Food,@ID)";
            }
            else
            {
                sqlQueryID = "UPDATE MovingScreen Set FinalMoveDate = @FinalMoveDate , PricingSource = @PricingScource, QuantityTrucks = @QuantityTrucks,QuantityMovers = @QuantityMovers," +
                    "Price = @Price,Consumables = @Consumbles,EstimatedHours = @EstimatedHours,ActualHours = @ActualHours,OriginMiles = @OriginMiles,DestMiles =@DestMiles,OtherMiles = @OtherMiles," +
                    "TotalMiles = @TotalMiles,FuelCosts = @FuelCosts,InsuranceCosts = @InsuranceCosts,CostPerWorker = @CostPerWorker,Food = @Food WHERE WorkFlowID = @ID ";
            }
            //Create sql command to receive ID
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQueryID;

            
            


            //Parameter
            sqlCommand.Parameters.AddWithValue("@FinalMoveDate", HttpUtility.HtmlEncode(txtMoveDate.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@PricingScource", HttpUtility.HtmlEncode(rblPricingScource.SelectedValue.ToString()));
            sqlCommand.Parameters.AddWithValue("@QuantityTrucks", HttpUtility.HtmlEncode(txtQuantityTrucks.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@QuantityMovers", HttpUtility.HtmlEncode(txtQuantityMovers.Text.ToString()));
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
           
            SqlDataReader queryValue = sqlCommand.ExecuteReader();

            // Close conecctions
            queryValue.Close();

            //--------------------------------------

            //-------------------------------------------------------------
            if (!MoveScreenID.Equals("None"))
            {
                // delete associative tables 
                string tables = "Delete From MSEquipment where MovingScreenID = @MoveScreenID;" +
                    "Delete From MSEmployee where MovingScreenID = @MoveScreenID; ";
                    

                //Create sql command 
                SqlCommand sqlCommandUpdate = new SqlCommand();
                sqlCommandUpdate.Connection = sqlConnect;
                sqlCommandUpdate.CommandType = CommandType.Text;
                sqlCommandUpdate.CommandText = tables;


                sqlCommandUpdate.Parameters.AddWithValue("@MoveScreenID", HttpUtility.HtmlEncode(MoveScreenID));

                //open connection to send ID query 

                SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                queryAnswer.Close();

            }
            //--------------------------------------
            //update movers


            //get list of workers


            foreach (ListItem item in lbMovers.Items)
            {
                String sqlQuery = "";
                if (MoveScreenID.Equals("None"))
                {
                     sqlQuery = "INSERT into MSEmployee(MovingScreenID,EmployeeID)VALUES((Select Max(MovingScreenID) from MovingScreen),(Select EmployeeID from EMployee where EmployeeID = @EmployeeID))  ";
                }
                else
                    sqlQuery = "INSERT into MSEmployee(MovingScreenID,EmployeeID)VALUES((Select MovingScreenID from MovingScreen),(Select EmployeeID from EMployee where EmployeeID = @EmployeeID))  ";

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sqlConnect;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sqlQuery;
                
                cmd.Parameters.AddWithValue("@EmployeeID  ", HttpUtility.HtmlEncode(item.Value.ToString()));
                //open connection to send ID query 
                SqlDataReader Result = cmd.ExecuteReader();
                Result.Close();

            }
            foreach (ListItem item in lbTrucks.Items)
            {
                String sqlQuery = "";
                if (MoveScreenID.Equals("None"))
                     sqlQuery = "INSERT into MSEquipment(MovingScreenID,EquipmentID)VALUES((Select Max(MovingScreenID) from MovingScreen),(Select EquipmentID from Equipment where EquipmentID = @ID))  ";
                else
                    sqlQuery = "INSERT into MSEquipment(MovingScreenID,EquipmentID)VALUES((Select MovingScreenID from MovingScreen),(Select EquipmentID from Equipment where EquipmentID = @ID))  ";


                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sqlConnect;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sqlQuery;

                cmd.Parameters.AddWithValue("@ID  ", HttpUtility.HtmlEncode(item.Value.ToString()));
                //open connection to send ID query 
                SqlDataReader Result = cmd.ExecuteReader();
                Result.Close();

            }






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
        protected void cvnumMovers_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (int.Parse(txtQuantityMovers.Text) == lbMovers.Items.Count)
            {
                args.IsValid = true;
            }
            else
                args.IsValid = false;
        }

        protected void cvTrucks_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (int.Parse(txtQuantityTrucks.Text) == lbTrucks.Items.Count)
            {
                args.IsValid = true;
            }
            else
                args.IsValid = false;
        }
        protected void ddlMovers_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack.Equals(true))
            {
                //query to check for existing form based on workflow
                //query to grab workflow
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
                SqlDataReader Result = sqlCommandID.ExecuteReader();

                string workFLow = "";
                while (Result.Read())
                {
                    workFLow = Result["WFID"].ToString();


                }

                Result.Close();

                string suppliesQuery = "Select ISNull(trim(EmployeeFirstName), '') + ' ' + ISNUll(EmployeeLastName, '') as EmployeeName from MovingScreen MS inner join MSEmployee MSE on MS.MovingScreenID = MSE.MovingScreenID inner join Employee E on MSE.EmployeeID = E.EmployeeID   where workflowID = @ID; ";

                //Create sql command 
                SqlCommand sqlCommandSupplies = new SqlCommand();
                sqlCommandSupplies.Connection = sqlConnect;
                sqlCommandSupplies.CommandType = CommandType.Text;
                sqlCommandSupplies.CommandText = suppliesQuery;


                sqlCommandSupplies.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

                SqlDataReader queryAnswer = sqlCommandSupplies.ExecuteReader();
                while (queryAnswer.Read())
                {
                    foreach (ListItem Mover in ddlMovers.Items)
                    {
                        if (queryAnswer["EmployeeName"].ToString().Trim().Equals(Mover.Text.ToString().Trim()))
                        {
                            ListItem mover = new ListItem(Mover.Text.ToString(), Mover.Value.ToString());
                            lbMovers.Items.Add(mover);


                        }
                    }
                    foreach (ListItem person in lbMovers.Items)
                    {
                        ddlMovers.Items.Remove(ddlMovers.Items.FindByValue(person.Value));
                    }



                }
                queryAnswer.Close();
                sqlConnect.Close();
            }
        }
        protected void ddlTrucks_DataBound(object sender, EventArgs e)
        {
            if (!IsPostBack.Equals(true))
            {
                //query to check for existing form based on workflow
                //query to grab workflow
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
                SqlDataReader Result = sqlCommandID.ExecuteReader();

                string workFLow = "";
                while (Result.Read())
                {
                    workFLow = Result["WFID"].ToString();


                }

                Result.Close();

                string suppliesQuery = "Select EquipmentName from MovingScreen MS inner join MSEquipment MSE on MS.MovingScreenID = MSE.MovingScreenID inner join Equipment E on MSE.EquipmentID = E.EquipmentID   where workflowID = @ID;";

                //Create sql command 
                SqlCommand sqlCommandSupplies = new SqlCommand();
                sqlCommandSupplies.Connection = sqlConnect;
                sqlCommandSupplies.CommandType = CommandType.Text;
                sqlCommandSupplies.CommandText = suppliesQuery;


                sqlCommandSupplies.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

                SqlDataReader queryAnswer = sqlCommandSupplies.ExecuteReader();
                while (queryAnswer.Read())
                {

                    foreach (ListItem Truck in ddlTrucks.Items)
                    {
                        if (queryAnswer["EquipmentName"].ToString().Trim().Equals(Truck.Text.ToString().Trim()))
                        {
                            ListItem truck = new ListItem(Truck.Text.ToString(), Truck.Value.ToString());
                            lbTrucks.Items.Add(truck);


                        }
                    }
                    foreach (ListItem equipment in lbTrucks.Items)
                    {
                        ddlTrucks.Items.Remove(ddlTrucks.Items.FindByValue(equipment.Value));
                    }



                }
                queryAnswer.Close();
                sqlConnect.Close();
            }
        }
    }
}