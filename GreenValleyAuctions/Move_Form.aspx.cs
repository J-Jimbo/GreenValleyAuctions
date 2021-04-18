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


            string sqlQuery = "Select trim(FirstName)+' '+trim(LastName) as Name,CustomerPhone,CustomerEmail,CustomerAddress from Customer where customerID = @ID;";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //Create sql command 
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = sqlQuery;

            sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommand.ExecuteReader();


            while (queryResult.Read())
            {
                lblName.Text = queryResult["Name"].ToString();
                lblAddress.Text = queryResult["CustomerAddress"].ToString();
                lblPhone.Text = queryResult["CustomerPhone"].ToString();

            }

            queryResult.Close();
            sqlConnect.Close();

            //SOME REASON THIS DOESNT WORK BUT I FEEL LIKE IT SHOULD!!!!!!!!!!!!!!!!
            //Pulling Contact Date 
            String sqlContactDate = "Select DateContacted, CustomerID from InitialContact where CustomerID = @ID";

            //sql command
            SqlCommand sqlCommand1 = new SqlCommand();
            sqlCommand1.Connection = sqlConnect;
            sqlCommand1.CommandType = CommandType.Text;
            sqlCommand1.CommandText = sqlContactDate;

            sqlCommand1.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryContact = sqlCommand1.ExecuteReader();

            while (queryContact.Read())
            {
                lblContactDate.Text = queryContact["DateContacted"].ToString();
            }

            queryContact.Close();
            sqlConnect.Close();

            //Putting The From Address into textbox
            String sqlFromAddress = "Select CustomerAddress, CustomerID from Customer where CustomerID = @ID";

            //SAME WITH THIS ONE>?????
            //sql command
            SqlCommand sqlCommand2 = new SqlCommand();
            sqlCommand2.Connection = sqlConnect;
            sqlCommand2.CommandType = CommandType.Text;
            sqlCommand2.CommandText = sqlFromAddress;

            sqlCommand2.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            sqlConnect.Open();
            SqlDataReader queryFromAddressResult = sqlCommand2.ExecuteReader();

            while (queryFromAddressResult.Read())
            {
                txtFromAddress.Text = queryFromAddressResult["CustomerAddress"].ToString();
            }

            queryFromAddressResult.Close();
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
            sqlCommandMF.Parameters.AddWithValue("@Consign", HttpUtility.HtmlEncode(RBLConsign.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@Smalls", HttpUtility.HtmlEncode(RBLSmalls.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@QTYBedrooms", HttpUtility.HtmlEncode(ddlBedrooms.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@BedRooms", HttpUtility.HtmlEncode(txtBedrooms.Text));
            sqlCommandMF.Parameters.AddWithValue("@QTYLivingRoom", HttpUtility.HtmlEncode(ddllivingroom.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@LivingRoom", HttpUtility.HtmlEncode(txtLivingRoom.Text));
            sqlCommandMF.Parameters.AddWithValue("@QTYDiningRoom", HttpUtility.HtmlEncode(ddlDining.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@DiningRoom", HttpUtility.HtmlEncode(txtDining.Text));
            sqlCommandMF.Parameters.AddWithValue("@Stories", HttpUtility.HtmlEncode(ddlStories.Text));
            sqlCommandMF.Parameters.AddWithValue("@SQF", HttpUtility.HtmlEncode(txtSQF.Text));
            sqlCommandMF.Parameters.AddWithValue("@OAttic", HttpUtility.HtmlEncode(ddlAttic.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@Attic", HttpUtility.HtmlEncode(txtAttic.Text));
            sqlCommandMF.Parameters.AddWithValue("@OBasement", HttpUtility.HtmlEncode(ddlBasement.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@Basement", HttpUtility.HtmlEncode(txtBasement.Text));
            sqlCommandMF.Parameters.AddWithValue("@OutBuildings", HttpUtility.HtmlEncode(txtOutBuildings.Text));
            sqlCommandMF.Parameters.AddWithValue("@OGarage", HttpUtility.HtmlEncode(ddlGarage.SelectedValue));
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
            String sqlQueryMF = "INSERT INTO MoveForm(Consign, Smalls, Stories, SQF, BedroomQTY, Bedrooms, LivingRoomQTY, LivingRoom, DiningRoomQTY, DiningRoom, OAttic, Attic, OBasement, Basement, OutBuilding, OGarage, Garage, AwkwardItems, Collectibles , Appliances, Piano, LawnMower, DistanceDoor, Obstructions, AddNotes, WorkFlowID ) VALUES (@Consign , @Smalls, @Stories, @SQF, @QTYBedrooms, @Bedrooms, @QTYLivingRoom, @LivingRoom , @QTYDiningRoom, @DiningRoom, @OAttic, @Attic , @OBasement, @Basement ,  @OutBuildings , @OGarage, @Garage , @Awkward, @Collectibles , @Appliances , @Piano , @Mower , @Distance ,@Obstructions,@AdditionalNotes,@ID )";
            sqlCommandMF.CommandText = sqlQueryMF;
            SqlDataReader MFresults = sqlCommandMF.ExecuteReader();
            MFresults.Close();
            sqlConnectMF.Close();



        }

        

        protected void bnClear_Click(object sender, EventArgs e)
        {
            RBLConsign.ClearSelection();
            RBLSmalls.ClearSelection();
            HttpUtility.HtmlEncode(txtBedrooms.Text = "");
            HttpUtility.HtmlEncode(txtLivingRoom.Text = "");
            HttpUtility.HtmlEncode(txtDining.Text = "");
            HttpUtility.HtmlEncode(txtSQF.Text = "");
            HttpUtility.HtmlEncode(txtAttic.Text = "");
            HttpUtility.HtmlEncode(txtBasement.Text = "");
            HttpUtility.HtmlEncode(txtOutBuildings.Text = "");
            HttpUtility.HtmlEncode(txtGarage.Text = "");
            HttpUtility.HtmlEncode(txtLarge.Text = "");
            HttpUtility.HtmlEncode(txtCollectibles.Text = "");
            HttpUtility.HtmlEncode(txtAppliance.Text = "");
            RBLPiano.ClearSelection();
            RBLMower.ClearSelection();
            HttpUtility.HtmlEncode(txtDistance.Text = "");
            HttpUtility.HtmlEncode(txtObstacles.Text = "");
            HttpUtility.HtmlEncode(txtNote.Text = "");

        }

        protected void btnPopulate_Click(object sender, EventArgs e)
        {

            // random number 
            Random random = new Random();
            //create arrays to draw random data from
            string[] num = { "2", "4", "9", "1", "11", "21", "15", "3", "30" };
            string[] sqrFt = { "200", "8000", "4000", "12000" };
            string[] items = { "fridge", "sofa", "tv", "desk", "dining table" };
            string[] exists = { "bean bag chair", "sofa", "tv", "big lamp", "rocking chair" };
            string[] obstacles = { "Rockey Path", "Tight Hallway", "tree" };
            string[] notes = { "lot of stairs", "hard to get to house" };
            string[] date = { "03/02/2022" };
            string[] address = { "123 Funland Drive" };

            RBLConsign.SelectedIndex = random.Next(0, 2);
            RBLSmalls.SelectedIndex = random.Next(0, 2);
            HttpUtility.HtmlEncode(txtBedrooms.Text = items[random.Next(0, items.Length)]);
            HttpUtility.HtmlEncode(txtLivingRoom.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtDining.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtToAddress.Text = address[random.Next(0, address.Length)]);
            HttpUtility.HtmlEncode(txtDenFam.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtMoveDate.Text = date[random.Next(0, date.Length)]);
            HttpUtility.HtmlEncode(txtSQF.Text = sqrFt[random.Next(0, sqrFt.Length)]);
            HttpUtility.HtmlEncode(txtAttic.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtBasement.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtOutBuildings.Text = num[random.Next(0, num.Length)]);
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