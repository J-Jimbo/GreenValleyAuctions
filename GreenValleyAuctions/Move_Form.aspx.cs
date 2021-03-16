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
    public partial class Move_Form : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //On Page load grab customer info

            string Query = "select trim(c.CustomerAddress) as CA,trim(M.DestinationAddress) as DA,trim(c.firstname)+' '+trim(c.lastname) as CustomerName,c.CustomerPhone,IC.DateContacted,C.HereAbout ,MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID inner join Moving M on M.ServiceID = SE.ServiceID inner join InitialContact IC on IC.CustomerID = C.CustomerID where C.CustomerID = @ID group by c.CustomerAddress,M.DestinationAddress,trim(c.firstname)+' '+trim(c.lastname),c.CustomerPhone,IC.DateContacted,C.HereAbout; ";

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
                txtTAddress.Text = queryResult["CA"].ToString();
                txtFAddress.Text = queryResult["DA"].ToString();
                txtFName.Text = queryResult["CustomerName"].ToString();
                txtFPhone.Text = queryResult["CustomerPhone"].ToString();
                txtTName.Text = queryResult["CustomerName"].ToString();
                txtTPhone.Text = queryResult["CustomerPhone"].ToString();
                txtHear.Text = queryResult["HereAbout"].ToString();
                txtCDate.Text = queryResult["DateContacted"].ToString();
            }

            queryResult.Close();
            sqlConnect.Close();
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

            //Connecting to Database 
            SqlConnection sqlConnectMF = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);
            SqlCommand sqlCommandMF = new SqlCommand();
            sqlCommandMF.Connection = sqlConnectMF;
            sqlCommandMF.CommandType = CommandType.Text;
            sqlConnectMF.Open();

            //Creating String to insert into move from
            sqlCommandMF.Parameters.AddWithValue("@ContactDate", HttpUtility.HtmlEncode(txtCDate.Text));
            sqlCommandMF.Parameters.AddWithValue("@Consign", HttpUtility.HtmlEncode(RBLConsign.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@Smalls", HttpUtility.HtmlEncode(RBLSmalls.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@BedRooms", HttpUtility.HtmlEncode(txtBedrooms.Text));
            sqlCommandMF.Parameters.AddWithValue("@LivingRoom", HttpUtility.HtmlEncode(txtLivingRoom.Text));
            sqlCommandMF.Parameters.AddWithValue("@DiningRoom", HttpUtility.HtmlEncode(txtDining.Text));
            sqlCommandMF.Parameters.AddWithValue("@Stories", HttpUtility.HtmlEncode(txtStairs.Text));
            sqlCommandMF.Parameters.AddWithValue("@SQF", HttpUtility.HtmlEncode(txtSQF.Text));
            sqlCommandMF.Parameters.AddWithValue("@Attic", HttpUtility.HtmlEncode(txtAttic.Text));
            sqlCommandMF.Parameters.AddWithValue("@Basement", HttpUtility.HtmlEncode(txtBasement.Text));
            sqlCommandMF.Parameters.AddWithValue("@OutBuildings", HttpUtility.HtmlEncode(txtOut.Text));
            sqlCommandMF.Parameters.AddWithValue("@Garage", HttpUtility.HtmlEncode(txtGarage.Text));
            sqlCommandMF.Parameters.AddWithValue("@Awkward", HttpUtility.HtmlEncode(txtLarge.Text));
            sqlCommandMF.Parameters.AddWithValue("@Collectibles", HttpUtility.HtmlEncode(txtCollectibles.Text));
            sqlCommandMF.Parameters.AddWithValue("@Appliances", HttpUtility.HtmlEncode(txtAppliance.Text));
            sqlCommandMF.Parameters.AddWithValue("@Piano", HttpUtility.HtmlEncode(RBLPiano.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@Mower", HttpUtility.HtmlEncode(RBLMower.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@Distance", HttpUtility.HtmlEncode(txtDistance.Text));
            sqlCommandMF.Parameters.AddWithValue("@Obstructions", HttpUtility.HtmlEncode(txtObstacles.Text));
            sqlCommandMF.Parameters.AddWithValue("@AdditionalNotes", HttpUtility.HtmlEncode(txtNote.Text));
            sqlCommandMF.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

            //Inserting form into the DB
            String sqlQueryMF = "INSERT INTO MoveForm(ContactDate, Consign, Smalls, Bedrooms, LivingRoom, DiningRoom, Stories, SQF, Attic, Basement, OutBuilding, Garage, AwkwardItems, Collectibles , Appliances, Piano, LawnMower, DistanceDoor, Obstructions, AddNotes, WorkFlowID ) VALUES ( @ContactDate , @Consign , @Smalls , @Bedrooms,@LivingRoom ,@DiningRoom ,@Stories,@SQF ,@Attic , @Basement ,  @OutBuildings , @Garage , @Awkward,@Collectibles , @Appliances , @Piano , @Mower , @Distance ,@Obstructions,@AdditionalNotes,@ID )";
            sqlCommandMF.CommandText = sqlQueryMF;
            SqlDataReader MFresults = sqlCommandMF.ExecuteReader();
            MFresults.Close();
            sqlConnectMF.Close();


            
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Info.aspx");
        }

        protected void bnClear_Click(object sender, EventArgs e)
        {
           HttpUtility.HtmlEncode(txtCDate.Text= "");
           RBLConsign.ClearSelection();
           RBLSmalls.ClearSelection();
           HttpUtility.HtmlEncode(txtBedrooms.Text = "");
           HttpUtility.HtmlEncode(txtLivingRoom.Text="");
           HttpUtility.HtmlEncode(txtDining.Text="");
           HttpUtility.HtmlEncode(txtStairs.Text="");
           HttpUtility.HtmlEncode(txtSQF.Text="");
           HttpUtility.HtmlEncode(txtAttic.Text="");
           HttpUtility.HtmlEncode(txtBasement.Text="");
           HttpUtility.HtmlEncode(txtOut.Text="");
           HttpUtility.HtmlEncode(txtGarage.Text="");
           HttpUtility.HtmlEncode(txtLarge.Text="");
           HttpUtility.HtmlEncode(txtCollectibles.Text="");
           HttpUtility.HtmlEncode(txtAppliance.Text="");
           RBLPiano.ClearSelection();
           RBLMower.ClearSelection();
           HttpUtility.HtmlEncode(txtDistance.Text="");
           HttpUtility.HtmlEncode(txtObstacles.Text="");
           HttpUtility.HtmlEncode(txtNote.Text="");
            
        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {

            // random number 
            Random random = new Random();
            //create arrays to draw random data from
            string[] num = { "2", "4", "9", "1", "11", "21", "15", "3", "30" };
            string[] items = { "fridge", "sofa", "tv", "desk", "dining table" };
            string[] exists = { "yes", "no" };
            string[] obstacles = { "Rockey Path", "Tight Hallway", "tree" };
            string[] notes = { "lot of stairs", "hard to get to house" };

            HttpUtility.HtmlEncode(txtDate.Text = num[random.Next(0, num.Length)]);
            RBLConsign.SelectedIndex = random.Next(0, 2);
            RBLSmalls.SelectedIndex = random.Next(0, 2);
            HttpUtility.HtmlEncode(txtBedrooms.Text = num[random.Next(0, num.Length)]); 
            HttpUtility.HtmlEncode(txtLivingRoom.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtDining.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtStairs.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtSQF.Text = num[random.Next(0, num.Length)]);
            HttpUtility.HtmlEncode(txtAttic.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtBasement.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtOut.Text = num[random.Next(0, num.Length)]);
            HttpUtility.HtmlEncode(txtGarage.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtLarge.Text = items[random.Next(0, items.Length)]);
            HttpUtility.HtmlEncode(txtCollectibles.Text = items[random.Next(0, items.Length)]);
            HttpUtility.HtmlEncode(txtAppliance.Text = items[random.Next(0, items.Length)]);
            RBLPiano.SelectedIndex = random.Next(0, 2);
            RBLMower.SelectedIndex = random.Next(0, 2);
            HttpUtility.HtmlEncode(txtDistance.Text = num[random.Next(0, num.Length)]);
            HttpUtility.HtmlEncode(txtObstacles.Text = obstacles[random.Next(0, obstacles.Length)]); 
            HttpUtility.HtmlEncode(txtNote.Text = notes[random.Next(0, notes.Length)]);

        }
    }
}