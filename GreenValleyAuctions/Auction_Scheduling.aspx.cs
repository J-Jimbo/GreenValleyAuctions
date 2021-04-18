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
    public partial class Auction_Scheduling : System.Web.UI.Page
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
                    //query to grab scheduling from 
                    string formQuery = "Select * from AuctionSchedulingForm where WorkFlowID = @ID;";

                    //Create sql command 
                    SqlCommand sqlCommand = new SqlCommand();
                    sqlCommand.Connection = sqlConnect;
                    sqlCommand.CommandType = CommandType.Text;
                    sqlCommand.CommandText = formQuery;


                    sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

                    SqlDataReader queryResult = sqlCommand.ExecuteReader();
                    while (queryResult.Read())
                    {
                        if (queryResult["LookAt"].ToString().Trim().Equals("Yes"))
                        {
                            cbLookAt.Checked = true;
                            cbLookAt_CheckedChanged(sender, e);
                        }
                        //fill info
                        rblBringInOrPickUP.SelectedValue = queryResult["Source"].ToString().Trim();

                        txtDistance.Text = queryResult["Distance"].ToString().Trim();
                        txtDriveWayConditions.Text = queryResult["DrieWay"].ToString().Trim();
                        txtsmallBox.Text = queryResult["SmallBox"].ToString().Trim();
                        txtMedBox.Text = queryResult["MediumBox"].ToString().Trim();
                        txtLrgBox.Text = queryResult["LargeBox"].ToString().Trim();
                        txtArtBox.Text = queryResult["ArtBox"].ToString().Trim();
                        txtsPads.Text = queryResult["SmallPad"].ToString().Trim();
                        txtLPads.Text = queryResult["LargePad"].ToString().Trim();
                        txtQuantityTrucks.Text = queryResult["NumberTrucks"].ToString().Trim();
                        txtQuantityMovers.Text = queryResult["NumberMovers"].ToString().Trim();
                            


                    }

                    queryResult.Close();

                    //query to grab scheduling dates 
                    string dateQuery = "Select AuctionDate from AuctionSchedulingForm ASF inner join ASDate ASD on ASF.SchedulingFormID = ASD.SchedulingFormID inner join AuctionDates AD on ASD.AuctionDateID = AD.AuctionDateID   where workflowID = @ID;";

                    //Create sql command 
                    SqlCommand sqlCommandDate = new SqlCommand();
                    sqlCommandDate.Connection = sqlConnect;
                    sqlCommandDate.CommandType = CommandType.Text;
                    sqlCommandDate.CommandText = dateQuery;


                    sqlCommandDate.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

                    SqlDataReader queryResponse = sqlCommandDate.ExecuteReader();
                    while (queryResponse.Read())
                    {
                        lbDate.Items.Add(queryResponse["AuctionDate"].ToString().Trim().Substring(0, queryResponse["AuctionDate"].ToString().IndexOf(' ')).Replace('/','-'));
                      
                    }
                    
                    queryResponse.Close();
                    sqlConnect.Close();
                }
                catch (NullReferenceException)
                {

                }
            }
        }

       

       

        protected void cbLookAt_CheckedChanged(object sender, EventArgs e)
        {
            if(cbLookAt.Checked.Equals(true))
            {
                invForm.Visible = true;
                RowLookAt.Visible = true;
                truck.Visible = true;
                accesbility.Visible = true;
                driveway.Visible = true;
                supplies.Visible = true;
                Boxes.Visible = true;
                Qtruck.Visible = true;
                whichtrucks.Visible = true;
                listTrucks.Visible = true;
                Qmovers.Visible = true;
                whichCrew.Visible = true;
                listCrew.Visible = true;
                AuctionDate.Visible = true;
                noPostback.Visible = true;
            }
            else
            {
                
                invForm.Visible = false;
                RowLookAt.Visible = false;
                truck.Visible = false;
                accesbility.Visible = false;
                driveway.Visible = false;
                supplies.Visible = false;
                Boxes.Visible = false;
                Qtruck.Visible = false;
                whichtrucks.Visible = false;
                listTrucks.Visible = false;
                Qmovers.Visible = false;
                whichCrew.Visible = false;
                listCrew.Visible = false;
                AuctionDate.Visible = false;
                noPostback.Visible = false;
            }
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

        

        protected void btnPopulate_Click(object sender, EventArgs e)
        {

            // random number 
            Random random = new Random();
            //create arrays to draw random data from
            string[] numBoxes = { "1", "10", "5", "20", "30" };
            string[] boxType = { "Folding Carton", "Rigid", "Corrugated" };
            string[] supplies = {"tape","dolley","Packing foam" };
            string[] conditions = { "Stone", "Paved", "Dirt", "Snow", "Hill" };
            string[] distance = { "10 ft", "20 ft", "30 ft" };
            string[] date = { "1/15/2021", "4/25/2021", "10/01/2021", "9/06/2021", "5/05/2021", "2/12/2021" };
            Boolean[] check = { true, false };

            cbLookAt.Checked = check[random.Next(0,check.Length)];
          //  txtBoxType.Text = boxType[random.Next(0,boxType.Length)];
            txtDate.Text = date[random.Next(0,date.Length)];
            txtDistance.Text = distance[random.Next(0,distance.Length)];
            txtDriveWayConditions.Text = conditions[random.Next(0,conditions.Length)];
          //  txtNumBoxes.Text = numBoxes[random.Next(0,numBoxes.Length)];
            txtQuantityMovers.Text = random.Next(0,ddlMovers.Items.Count).ToString();
            txtQuantityTrucks.Text = random.Next(0, ddlTrucks.Items.Count).ToString();
          //  txtSupplies.Text = supplies[random.Next(0,supplies.Length)];
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
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
                SqlDataReader Result = sqlCommandID.ExecuteReader();

                string workFLow = "";
                while (Result.Read())
                {
                    workFLow = Result["WFID"].ToString();


                }

                Result.Close();

                //----------------------------------------------------

                //check for existing form

                string SchedulingFormID = "None";



                string existsQuery = "Select SchedulingFormID from AuctionSchedulingForm where WorkFlowID = @ID; ";


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
                        SchedulingFormID = answer["SchedulingFormID"].ToString().Trim();
                    else
                        SchedulingFormID = "None";

                }

                answer.Close();

                //--------------------------------------------------------------------------------------------------------------------------




                // save to scheduling form
                //save to trucks
                //save to employees
                //save to photos (loop through lists to save file paths )
                string strPath = "";
                string LookAt = "";
                if (cbLookAt.Checked.Equals(true))
                {
                    LookAt = "Yes";
                }
                else
                    LookAt = "No";


                String Query = "";
                if (SchedulingFormID.Equals("None"))
                    Query = "INSERT into AuctionSchedulingForm(SchedulingFormID, LookAt, Source, Distance, DrieWay,SmallBox,MediumBox,LargeBox,ArtBox,SmallPad,LargePad,NumberTrucks,NumberMovers,InventoryFile,WorkFlowID)Values((Select ISNULL(max(SchedulingFormID)+1,1) from AuctionSchedulingForm),@LookAt,@Source,@Distance,@DrieWay,@smallBox,@medBox,@LrgBox,@ArtBox,@sPadBox,@LPadBox,@NumberTrucks,@NumberMovers,@InventoryFile,@ID);";
                else
                    Query = "UPDATE AuctionSchedulingForm SET LookAt = @LookAt, Source=@Source, Distance = @Distance, DrieWay = @DrieWay,SmallBox =@smallBox ,MediumBox = @medBox,LargeBox= @LrgBox,ArtBox = @ArtBox,SmallPad = @sPadBox,LargePad = @LPadBox,NumberTrucks = @NumberTrucks,NumberMovers = @NumberMovers WHERE WorkFlowID = @ID";


                //Does not UPDATE photos for now


                //Create sql command 
                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = Query;


                sqlCommand.Parameters.AddWithValue("@LookAt", HttpUtility.HtmlEncode(LookAt));
                sqlCommand.Parameters.AddWithValue("@Source", HttpUtility.HtmlEncode(rblBringInOrPickUP.SelectedValue.ToString()));
                sqlCommand.Parameters.AddWithValue("@Distance", HttpUtility.HtmlEncode(txtDistance.Text.ToString()));
                sqlCommand.Parameters.AddWithValue("@DrieWay", HttpUtility.HtmlEncode(txtDriveWayConditions.Text.ToString()));
                sqlCommand.Parameters.AddWithValue("@smallBox", HttpUtility.HtmlEncode(int.Parse(txtsmallBox.Text)));
                sqlCommand.Parameters.AddWithValue("@medBox", HttpUtility.HtmlEncode(int.Parse(txtMedBox.Text.ToString())));
                sqlCommand.Parameters.AddWithValue("@LrgBox", HttpUtility.HtmlEncode(int.Parse(txtLrgBox.Text.ToString())));
                sqlCommand.Parameters.AddWithValue("@ArtBox", HttpUtility.HtmlEncode(int.Parse(txtArtBox.Text.ToString())));
                sqlCommand.Parameters.AddWithValue("@sPadBox", HttpUtility.HtmlEncode(int.Parse(txtLPads.Text.ToString())));
                sqlCommand.Parameters.AddWithValue("@LPadBox", HttpUtility.HtmlEncode(int.Parse(txtsPads.Text.ToString())));
                sqlCommand.Parameters.AddWithValue("@NumberTrucks", HttpUtility.HtmlEncode(int.Parse(txtQuantityTrucks.Text.ToString())));
                sqlCommand.Parameters.AddWithValue("@NumberMovers", HttpUtility.HtmlEncode(int.Parse(txtQuantityMovers.Text.ToString())));
                sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

                if (cbLookAt.Checked.Equals(true))
                {
                    try
                    {


                        //string path
                        strPath = Request.PhysicalApplicationPath + "Auction_Photos\\" + fuInventory.FileName;
                        fuInventory.SaveAs(strPath);
                        sqlCommand.Parameters.AddWithValue("@InventoryFile", HttpUtility.HtmlEncode(fuInventory.FileName.ToString()));
                    }
                    catch
                    {
                        sqlCommand.Parameters.AddWithValue("@InventoryFile", HttpUtility.HtmlEncode("None"));
                    }
                }
                else
                    sqlCommand.Parameters.AddWithValue("@InventoryFile", HttpUtility.HtmlEncode(""));

                //open connection to send ID query 

                SqlDataReader queryResult = sqlCommand.ExecuteReader();


                queryResult.Close();
                //-------------------------------------------------------------
                if (!SchedulingFormID.Equals("None"))
                {
                    // delete associative tables 
                    string tables = "Delete From ASEquipment where SchedulingFormID = @SchedulingFormID;" +
                        "Delete From ASEmployee where SchedulingFormID = @SchedulingFormID; " +
                        "Delete from ASDate where SchedulingFormID = @SchedulingFormID; " +
                        "Delete AuctionDates from AuctionDates AD inner join ASDate ASD on AD.AuctionDateID=ASD.AuctionDateID where SchedulingFormID = @SchedulingFormID;" +
                             "Delete From ASSupplies where SchedulingFormID = @SchedulingFormID;";

                    //Create sql command 
                    SqlCommand sqlCommandUpdate = new SqlCommand();
                    sqlCommandUpdate.Connection = sqlConnect;
                    sqlCommandUpdate.CommandType = CommandType.Text;
                    sqlCommandUpdate.CommandText = tables;


                    sqlCommandUpdate.Parameters.AddWithValue("@SchedulingFormID", HttpUtility.HtmlEncode(SchedulingFormID));

                    //open connection to send ID query 

                    SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                    queryAnswer.Close();

                }


                //update service event based on customer
                //loop through list of trucks
                foreach (ListItem TRUCK in lbTrucks.Items)
                {
                    string SecondQuery = "";
                    if (SchedulingFormID.Equals("None"))
                    {
                        SecondQuery = "Insert into ASEquipment(SchedulingFormID, EquipmentID)Values((Select max(SchedulingFormID) from AuctionSchedulingForm),(Select EquipmentID from Equipment where EquipmentID  = @EquipmentID))";

                    }
                    else
                    {
                        SecondQuery = "Insert into ASEquipment(SchedulingFormID, EquipmentID)Values((Select SchedulingFormID from AuctionSchedulingForm where SchedulingFormID = @SchedulingFormID ),(Select EquipmentID from Equipment where EquipmentID  = @EquipmentID))";
                    }

                    //Create sql command 
                    SqlCommand sqlCommandUpdate = new SqlCommand();
                    sqlCommandUpdate.Connection = sqlConnect;
                    sqlCommandUpdate.CommandType = CommandType.Text;
                    sqlCommandUpdate.CommandText = SecondQuery;


                    sqlCommandUpdate.Parameters.AddWithValue("@SchedulingFormID", HttpUtility.HtmlEncode(SchedulingFormID));
                    sqlCommandUpdate.Parameters.AddWithValue("@EquipmentID", HttpUtility.HtmlEncode(TRUCK.Value));
                    //open connection to send ID query 

                    SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                    queryAnswer.Close();
                }

                //loop through list of employeee
                foreach (ListItem Employee in lbMovers.Items)
                {
                    string ThirdQuery = "";
                    if (SchedulingFormID.Equals("None"))
                    {
                        ThirdQuery = " Insert into ASEmployee(SchedulingFormID, EmployeeID  )Values((Select max(SchedulingFormID) from AuctionSchedulingForm),(Select EmployeeID from Employee where EmployeeID  = @EmployeeID))";

                    }
                    else
                    {
                        ThirdQuery = " Insert into ASEmployee(SchedulingFormID, EmployeeID  )Values((Select SchedulingFormID from AuctionSchedulingForm where SchedulingFormID = @SchedulingFormID ),(Select EmployeeID from Employee where EmployeeID  = @EmployeeID))";

                    }

                    //Create sql command 
                    SqlCommand sqlCommandUpdate = new SqlCommand();
                    sqlCommandUpdate.Connection = sqlConnect;
                    sqlCommandUpdate.CommandType = CommandType.Text;
                    sqlCommandUpdate.CommandText = ThirdQuery;

                    sqlCommandUpdate.Parameters.AddWithValue("@SchedulingFormID", HttpUtility.HtmlEncode(SchedulingFormID));
                    sqlCommandUpdate.Parameters.AddWithValue("@EmployeeID  ", HttpUtility.HtmlEncode(Employee.Value));
                    //open connection to send ID query 

                    SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                    queryAnswer.Close();
                }
                //loop through list of photos


                foreach (HttpPostedFile file in fuPhotos.PostedFiles)
                {

                    string FinalQuery = "Insert into AuctionPhotos(PhotoID, PhotoPath,SchedulingFormID  )Values((Select ISNULL(max(PhotoID)+1,1) from AuctionPhotos), @PhotoPath,(Select max(SchedulingFormID) from AuctionSchedulingForm)); ";
                    //Create sql command 
                    SqlCommand sqlCommandUpdate = new SqlCommand();
                    sqlCommandUpdate.Connection = sqlConnect;
                    sqlCommandUpdate.CommandType = CommandType.Text;
                    sqlCommandUpdate.CommandText = FinalQuery;

                    // get string path

                    strPath = Request.PhysicalApplicationPath + "Auction_Photos\\" + file.FileName.ToString();

                    try
                    {
                        // save photo to directory
                        fuPhotos.SaveAs(strPath);
                        //put path into database
                        sqlCommandUpdate.Parameters.AddWithValue("@PhotoPath", HttpUtility.HtmlEncode(file.FileName.ToString()));
                        //open connection to send  query 
                    }
                    catch
                    {
                        sqlCommandUpdate.Parameters.AddWithValue("@PhotoPath", HttpUtility.HtmlEncode("None"));
                    }
                    SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                    queryAnswer.Close();
                }

                foreach (ListItem date in lbDate.Items)
                {
                    string ThirdQuery = "";
                    if (SchedulingFormID.Equals("None"))
                    {
                        ThirdQuery = "Insert into AuctionDates(AuctionDateID, AuctionDate)Values((Select ISNULL(max(AuctionDateID)+1,1) from AuctionDates),@Date);" +
                     "Insert into ASDate(SchedulingFormID,AuctionDateID)Values((Select max(SchedulingFormID) from AuctionSchedulingForm),(Select max(AuctionDateID) from AuctionDates));";
                    }
                    else
                    {
                        ThirdQuery = "Insert into AuctionDates(AuctionDateID, AuctionDate)Values((Select ISNULL(max(AuctionDateID)+1,1) from AuctionDates),@Date);" +
                           "Insert into ASDate(SchedulingFormID,AuctionDateID)Values((Select SchedulingFormID from AuctionSchedulingForm where SchedulingFormID = @SchedulingFormID ),(Select max(AuctionDateID) from AuctionDates));";
                    }
                    //Create sql command 
                    SqlCommand sqlCommandUpdate = new SqlCommand();
                    sqlCommandUpdate.Connection = sqlConnect;
                    sqlCommandUpdate.CommandType = CommandType.Text;
                    sqlCommandUpdate.CommandText = ThirdQuery;

                    sqlCommandUpdate.Parameters.AddWithValue("@SchedulingFormID", HttpUtility.HtmlEncode(SchedulingFormID));
                    sqlCommandUpdate.Parameters.AddWithValue("@Date", HttpUtility.HtmlEncode(date.Value.ToString()));
                    //open connection to send ID query 

                    SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                    queryAnswer.Close();
                }


                foreach (ListItem supply in cblSupplies.Items)
                {
                    if (supply.Selected)
                    {
                        string SecondQuery = "";
                        if (SchedulingFormID.Equals("None"))
                        {
                            SecondQuery = " Insert into ASSupplies(SchedulingFormID, SupplyID)Values((Select max(SchedulingFormID) from AuctionSchedulingForm),(Select SupplyID from Supplies where SupplyID  = @SupplyID))";

                        }
                        else
                        {
                            SecondQuery = " Insert into ASSupplies(SchedulingFormID, SupplyID)Values((Select SchedulingFormID from AuctionSchedulingForm where SchedulingFormID = @SchedulingFormID ),(Select SupplyID from Supplies where SupplyID  = @SupplyID))";
                        }
                        //Create sql command 
                        SqlCommand sqlCommandUpdate = new SqlCommand();
                        sqlCommandUpdate.Connection = sqlConnect;
                        sqlCommandUpdate.CommandType = CommandType.Text;
                        sqlCommandUpdate.CommandText = SecondQuery;

                        sqlCommandUpdate.Parameters.AddWithValue("@SchedulingFormID", HttpUtility.HtmlEncode(SchedulingFormID));
                        sqlCommandUpdate.Parameters.AddWithValue("@SupplyID", HttpUtility.HtmlEncode(supply.Value));
                        //open connection to send ID query 

                        SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                        queryAnswer.Close();
                    }
                }
                sqlConnect.Close();
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            cbLookAt.Checked = false;
           // txtBoxType.Text = "";
            txtDate.Text = "";
            txtDistance.Text = "";
            txtDriveWayConditions.Text ="";
           // txtNumBoxes.Text = "";
            txtQuantityMovers.Text = "";
            txtQuantityTrucks.Text = "";
           // txtSupplies.Text = "";
            
            foreach(ListItem truck in lbTrucks.Items)
            {
                ListItem equipment = new ListItem(truck.Text.ToString(), truck.Value.ToString());
                ddlTrucks.Items.Add(equipment);
            }
            lbTrucks.Items.Clear();
            foreach(ListItem mover in lbMovers.Items)
            {
                ListItem person = new ListItem(mover.Text.ToString(), mover.Value.ToString());
                ddlMovers.Items.Add(person);
            }
            lbMovers.Items.Clear();
            //for now postback is clearing the file upload 
        }

        protected void btnAddDate_Click(object sender, EventArgs e)
        {
            
            lbDate.Items.Add(txtDate.Text.ToString());
            lblDateError.Text = "";

        }

        protected void btnRemoveDate_Click(object sender, EventArgs e)
        {
            if (lbDate.SelectedIndex > -1)
            {
                lbDate.Items.Remove(lbDate.SelectedItem);
                lblDateError.Text = "";
            }
            else
                lblDateError.Text = "No Date Selected";
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

        protected void cblSupplies_DataBound(object sender, EventArgs e)
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

                string suppliesQuery = "Select SupplyType from AuctionSchedulingForm ASF inner join ASSupplies ASS on ASF.SchedulingFormID = ASS.SchedulingFormID inner join Supplies S on ASS.SupplyID= S.SupplyID   where workflowID = @ID;";

                //Create sql command 
                SqlCommand sqlCommandSupplies = new SqlCommand();
                sqlCommandSupplies.Connection = sqlConnect;
                sqlCommandSupplies.CommandType = CommandType.Text;
                sqlCommandSupplies.CommandText = suppliesQuery;


                sqlCommandSupplies.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

                SqlDataReader queryAnswer = sqlCommandSupplies.ExecuteReader();
                while (queryAnswer.Read())
                {
                    foreach (ListItem Supply in cblSupplies.Items)
                    {
                        if (queryAnswer["SupplyType"].ToString().Trim().Equals(Supply.Text.ToString().Trim()))
                        {
                            Supply.Selected = true;


                        }
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

                string suppliesQuery = "Select EquipmentName from AuctionSchedulingForm ASF inner join ASEquipment ASE on ASF.SchedulingFormID = ASE.SchedulingFormID inner join Equipment E on ASE.EquipmentID = E.EquipmentID   where workflowID = @ID;" ;

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
                            ListItem truck = new ListItem(Truck.Text.ToString(),Truck.Value.ToString());
                            lbTrucks.Items.Add(truck);
                            

                        }
                    }
                    foreach(ListItem equipment in lbTrucks.Items)
                    {
                        ddlTrucks.Items.Remove(ddlTrucks.Items.FindByValue(equipment.Value));
                    }
                    


                }
                queryAnswer.Close();
                sqlConnect.Close();
            }
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

                string suppliesQuery = "Select ISNull(trim(EmployeeFirstName), '') + ' ' + ISNUll(EmployeeLastName, '') as EmployeeName from AuctionSchedulingForm ASF inner join ASEmployee ASE on ASF.SchedulingFormID = ASE.SchedulingFormID inner join Employee E on ASE.EmployeeID = E.EmployeeID   where workflowID = @ID; ";

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

        protected void cvRemoveTruck_ServerValidate(object source, ServerValidateEventArgs args)
        {
            int counter = 0;
            foreach(ListItem truck in lbTrucks.Items)
            {
                if(truck.Selected != true)
                {
                    counter++;
                }
                
            }
            if (counter == lbTrucks.Items.Count)
                args.IsValid = false;
            else
                args.IsValid = true;

        }

        
    }
}