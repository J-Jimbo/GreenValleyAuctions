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
        }

        protected void btnAddMover_Click(object sender, EventArgs e)
        {
            ListItem mover = new ListItem(ddlMovers.SelectedItem.Text.ToString(), ddlMovers.SelectedValue.ToString());
            lbMovers.Items.Add(mover);
            ddlMovers.Items.Remove(ddlMovers.Items.FindByValue(mover.Value));
        }

        protected void btnRemoveTruck_Click(object sender, EventArgs e)
        {
            ListItem truck = new ListItem(lbTrucks.SelectedItem.Text.ToString(), lbTrucks.SelectedValue.ToString());
            lbTrucks.Items.Remove(lbTrucks.SelectedItem);
            ddlTrucks.Items.Add(truck);
        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            ListItem mover = new ListItem(lbMovers.SelectedItem.Text.ToString(), lbMovers.SelectedValue.ToString());
            lbMovers.Items.Remove(lbMovers.SelectedItem);
            ddlMovers.Items.Add(mover);
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


            string Query = "INSERT into AuctionSchedulingForm(SchedulingFormID, LookAt, Source, Distance, DrieWay,SmallBox,MediumBox,LargeBox,ArtBox,SmallPad,LargePad,InventoryFile)Values((Select ISNULL(max(SchedulingFormID)+1,1) from AuctionSchedulingForm),@LookAt,@Source,@Distance,@DrieWay,@smallBox,@medBox,@LrgBox,@ArtBox,@sPadBox,@LPadBox,@InventoryFile);";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

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
            
            if (cbLookAt.Checked.Equals(true))
            {
                //string path
                strPath = Request.PhysicalApplicationPath + "Auction_Photos\\" + fuInventory.FileName;
                fuInventory.SaveAs(strPath);
                sqlCommand.Parameters.AddWithValue("@InventoryFile", HttpUtility.HtmlEncode(fuInventory.FileName.ToString())); ;
            }
            else
                sqlCommand.Parameters.AddWithValue("@InventoryFile", HttpUtility.HtmlEncode(""));

            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommand.ExecuteReader();


            queryResult.Close();
            //-------------------------------------------------------------
            //update service event based on customer
            //loop through list of trucks
            foreach (ListItem TRUCK in lbTrucks.Items)
            {

                
                string SecondQuery = "Insert into ASEquipment(SchedulingFormID, EquipmentID)Values((Select max(SchedulingFormID) from AuctionSchedulingForm),(Select EquipmentID from Equipment where EquipmentID  = @EquipmentID))";
                //Create sql command 
                SqlCommand sqlCommandUpdate = new SqlCommand();
                sqlCommandUpdate.Connection = sqlConnect;
                sqlCommandUpdate.CommandType = CommandType.Text;
                sqlCommandUpdate.CommandText = SecondQuery;

                
                
               
                sqlCommandUpdate.Parameters.AddWithValue("@EquipmentID", HttpUtility.HtmlEncode(TRUCK.Value));
                //open connection to send ID query 
                
                SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                queryAnswer.Close();
            }

            //loop through list of employeee
            foreach (ListItem Employee in lbMovers.Items)
            {

                
                string ThirdQuery = "Insert into ASEmployee(SchedulingFormID, EmployeeID  )Values((Select max(SchedulingFormID) from AuctionSchedulingForm),(Select EmployeeID from Employee where EmployeeID  = @EmployeeID))";
                //Create sql command 
                SqlCommand sqlCommandUpdate = new SqlCommand();
                sqlCommandUpdate.Connection = sqlConnect;
                sqlCommandUpdate.CommandType = CommandType.Text;
                sqlCommandUpdate.CommandText = ThirdQuery;

               
                sqlCommandUpdate.Parameters.AddWithValue("@EmployeeID  ", HttpUtility.HtmlEncode(Employee.Value));
                //open connection to send ID query 

                SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                queryAnswer.Close();
            }
            //loop through list of photos

            
            foreach(HttpPostedFile file in fuPhotos.PostedFiles) 
            {

                string FinalQuery = "Insert into AuctionPhotos(PhotoID, PhotoPath,SchedulingFormID  )Values((Select ISNULL(max(PhotoID)+1,1) from AuctionPhotos), @PhotoPath,(Select max(SchedulingFormID) from AuctionSchedulingForm)); ";
                //Create sql command 
                SqlCommand sqlCommandUpdate = new SqlCommand();
                sqlCommandUpdate.Connection = sqlConnect;
                sqlCommandUpdate.CommandType = CommandType.Text;
                sqlCommandUpdate.CommandText = FinalQuery;

                // get string path
                strPath = Request.PhysicalApplicationPath + "Auction_Photos\\" + file.FileName.ToString();
                // save photo to directory
                fuPhotos.SaveAs(strPath);
                //put path into database
                sqlCommandUpdate.Parameters.AddWithValue("@PhotoPath", HttpUtility.HtmlEncode(file.FileName.ToString()));
                //open connection to send  query 

                SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                queryAnswer.Close();
            }

            foreach(ListItem date in lbDate.Items)
            {
                string ThirdQuery = "Insert into AuctionDates(AuctionDateID, AuctionDate)Values((Select ISNULL(max(AuctionDateID)+1,1) from AuctionDates),@Date);" +
                    "Insert into ASDate(SchedulingFormID,AuctionDateID)Values((Select max(SchedulingFormID) from AuctionSchedulingForm),(Select max(AuctionDateID) from AuctionDates));";
                //Create sql command 
                SqlCommand sqlCommandUpdate = new SqlCommand();
                sqlCommandUpdate.Connection = sqlConnect;
                sqlCommandUpdate.CommandType = CommandType.Text;
                sqlCommandUpdate.CommandText = ThirdQuery;


                sqlCommandUpdate.Parameters.AddWithValue("@Date", HttpUtility.HtmlEncode(date.Value.ToString()));
                //open connection to send ID query 

                SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                queryAnswer.Close();
            }


            foreach (ListItem supply in cblSupplies.Items)
            {
                if (supply.Selected)
                {
                    string SecondQuery = "Insert into ASSupplies(SchedulingFormID, SupplyID)Values((Select max(SchedulingFormID) from AuctionSchedulingForm),(Select SupplyID from Supplies where SupplyID  = @SupplyID))";
                    //Create sql command 
                    SqlCommand sqlCommandUpdate = new SqlCommand();
                    sqlCommandUpdate.Connection = sqlConnect;
                    sqlCommandUpdate.CommandType = CommandType.Text;
                    sqlCommandUpdate.CommandText = SecondQuery;


                    sqlCommandUpdate.Parameters.AddWithValue("@SupplyID", HttpUtility.HtmlEncode(supply.Value));
                    //open connection to send ID query 

                    SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                    queryAnswer.Close();
                }
            }
            sqlConnect.Close();
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
            
        }

        protected void btnRemoveDate_Click(object sender, EventArgs e)
        {
           
            lbDate.Items.Remove(lbDate.SelectedItem);
            
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
    }
}