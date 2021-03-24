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

        protected void btnAddFile_Click(object sender, EventArgs e)
        {

            if (fuPhotos.HasFile == true)
            {
                string filename = fuPhotos.FileName;
                lbUploads.Items.Add(filename.ToString());


            }
            
            
        }

        protected void btnRemoveFile_Click(object sender, EventArgs e)
        {
            lbUploads.Items.Remove(lbUploads.SelectedValue);
        }

        protected void cbLookAt_CheckedChanged(object sender, EventArgs e)
        {
            if(cbLookAt.Checked.Equals(true))
            {
                invForm.Visible = true;
                RowLookAt.Visible = true;
                UploadList.Visible = true;
                truck.Visible = true;
                accesbility.Visible = true;
                driveway.Visible = true;
                supplies.Visible = true;
                Boxes.Visible = true;
                Boxestyle.Visible = true;
                Qtruck.Visible = true;
                whichtrucks.Visible = true;
                listTrucks.Visible = true;
                Qmovers.Visible = true;
                whichCrew.Visible = true;
                listCrew.Visible = true;
                    
            }
            else
            {
                invForm.Visible = false;
                RowLookAt.Visible = false;
                UploadList.Visible = false;
                truck.Visible = false;
                accesbility.Visible = false;
                driveway.Visible = false;
                supplies.Visible = false;
                Boxes.Visible = false;
                Boxestyle.Visible = false;
                Qtruck.Visible = false;
                whichtrucks.Visible = false;
                listTrucks.Visible = false;
                Qmovers.Visible = false;
                whichCrew.Visible = false;
                listCrew.Visible = false;
            }
        }
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            lbTrucks.Items.Add(ddlTrucks.SelectedItem.Text.ToString());
        }

        protected void btnAddMover_Click(object sender, EventArgs e)
        {
            lbMovers.Items.Add(ddlMovers.SelectedItem.Text.ToString());
        }

        protected void btnRemoveTruck_Click(object sender, EventArgs e)
        {
            lbTrucks.Items.Remove(lbTrucks.SelectedValue);

        }

        protected void btnRemove_Click(object sender, EventArgs e)
        {
            lbMovers.Items.Remove(lbMovers.SelectedValue);
        }

        protected void btnFile_Click(object sender, EventArgs e)
        {
            hfFileInv.Value = fuInventory.FileName.ToString();
            lblInvFile.Text = fuInventory.FileName.ToString();


        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            // save to scheduling form
            //save to trucks
            //save to employees
            //save to photos (loop through lists to save file paths )
            string LookAt = "";
            if (cbLookAt.Checked.Equals(true))
            {
                LookAt = "Yes";
            }
            else
                LookAt = "No";


            string Query = "INSERT into AuctionSchedulingForm(SchedulingFormID, LookAt, Source, Distance, DrieWay, Supplies, NumBoxes,BoxType,InventoryFile)Values((Select ISNULL(max(SchedulingFormID)+1,1) from AuctionSchedulingForm),@LookAt,@Source,@Distance,@DrieWay,@Supplies,@NumBoxes,@BoxType,@InventoryFile);";

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
            sqlCommand.Parameters.AddWithValue("@Supplies", HttpUtility.HtmlEncode(txtSupplies.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@NumBoxes", HttpUtility.HtmlEncode(txtNumBoxes.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@BoxType", HttpUtility.HtmlEncode(txtBoxType.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@InventoryFile", HttpUtility.HtmlEncode(Request.PhysicalApplicationPath + "Auction_Photos\\" + hfFileInv.Value.ToString()));

            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommand.ExecuteReader();


            queryResult.Close();
            //-------------------------------------------------------------
            //update service event based on customer
            //loop through list of trucks
            foreach (ListItem TRUCK in lbTrucks.Items)
            {
                
                string SecondQuery = "Insert into ASEquipment(SchedulingFormID, EquipmentID,)Values((Select max(SchedulingFormID) from AuctionSchedulingForm),Cast( @EquipmentID as int)); ";
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

                string ThirdQuery = "Insert into ASEmployee(SchedulingFormID, EmployeeID  )Values((Select max(SchedulingFormID) from AuctionSchedulingForm), cast(@EmployeeID as int)); ";
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
            foreach (ListItem Photo in lbUploads.Items)
            {

                string FinalQuery = "Insert into AuctionPhotos(PhotoID, PhotoPath  )Values((Select max(PhotoID) from AuctionPhotos), @PhotoPath  ); ";
                //Create sql command 
                SqlCommand sqlCommandUpdate = new SqlCommand();
                sqlCommandUpdate.Connection = sqlConnect;
                sqlCommandUpdate.CommandType = CommandType.Text;
                sqlCommandUpdate.CommandText = FinalQuery;


                sqlCommandUpdate.Parameters.AddWithValue("@PhotoPath", HttpUtility.HtmlEncode(Request.PhysicalApplicationPath + "Auction_Photos\\" + Photo.Value.ToString()));
                //open connection to send ID query 

                SqlDataReader queryAnswer = sqlCommandUpdate.ExecuteReader();

                queryAnswer.Close();
            }

            sqlConnect.Close();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

        }
    }
}