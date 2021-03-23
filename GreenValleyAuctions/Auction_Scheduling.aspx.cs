using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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
            else
                lbUploads.Items.Add("The else ran");
            
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

        protected void btnFile_Click(object sender, EventArgs e)
        {
            hfFileInv.Value = fuInventory.FileName.ToString();
            lblInvFile.Text = fuInventory.FileName.ToString();


        }
    }
}