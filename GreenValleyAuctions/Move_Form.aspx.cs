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

            //Contact Date
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
            String sqlAddress = "Select Customer.CustomerID, Moving.OriginAddress, Moving.DestinationAddress from Customer INNER JOIN WorkFlow ON Customer.CustomerID = WorkFlow.CustomerID INNER JOIN ServiceEvent ON WorkFlow.WorkFlowID = ServiceEvent.WorkFlowID INNER JOIN Moving ON ServiceEvent.ServiceID = Moving.ServiceID where Customer.CustomerID = @ID";

            //sql command
            SqlCommand sqlCommand2 = new SqlCommand();
            sqlCommand2.Connection = sqlConnect;
            sqlCommand2.CommandType = CommandType.Text;
            sqlCommand2.CommandText = sqlAddress;

            sqlCommand2.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            sqlConnect.Open();
            SqlDataReader queryAddressResult = sqlCommand2.ExecuteReader();

            while (queryAddressResult.Read())
            {
                lblFromAddy.Text = queryAddressResult["OriginAddress"].ToString();
                lblToAddy.Text = queryAddressResult["DestinationAddress"].ToString();
            }

            queryAddressResult.Close();
            sqlConnect.Close();

            //Move Date automatically filled in
            String sqlMoveDate = "SELECT Customer.CustomerID, WorkFlow.WorkFlowID, ServiceEvent.ServiceDate FROM Customer INNER JOIN WorkFlow ON Customer.CustomerID = WorkFlow.CustomerID INNER JOIN ServiceEvent ON WorkFlow.WorkFlowID = ServiceEvent.WorkFlowID where Customer.CustomerID = @ID;";


            //Create sql command 
            SqlCommand sqlCommandMoveDate = new SqlCommand();
            sqlCommandMoveDate.Connection = sqlConnect;
            sqlCommandMoveDate.CommandType = CommandType.Text;
            sqlCommandMoveDate.CommandText = sqlMoveDate;

            sqlCommandMoveDate.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryMoveDateResult = sqlCommandMoveDate.ExecuteReader();

            while (queryMoveDateResult.Read())
            {
                lblMovingDate.Text = queryMoveDateResult["ServiceDate"].ToString();
            }

            queryAddressResult.Close();
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
            sqlCommandMF.Parameters.AddWithValue("@Consign", HttpUtility.HtmlEncode(rblCosign.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@Smalls", HttpUtility.HtmlEncode(rblSmalls.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@QTYBedrooms", HttpUtility.HtmlEncode(ddlBedrooms.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@BedRooms", HttpUtility.HtmlEncode(txtBedrooms.Text));
            sqlCommandMF.Parameters.AddWithValue("@QTYLivingRoom", HttpUtility.HtmlEncode(ddlLivingRoom.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@LivingRoom", HttpUtility.HtmlEncode(txtLivingRoom.Text));
            sqlCommandMF.Parameters.AddWithValue("@DenFamRoom", HttpUtility.HtmlEncode(txtDenFam.Text));
            sqlCommandMF.Parameters.AddWithValue("@QTYDenFamRoom", HttpUtility.HtmlEncode(ddlDenFamRooms.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@QTYDiningRoom", HttpUtility.HtmlEncode(ddlDining.SelectedValue));
            sqlCommandMF.Parameters.AddWithValue("@DiningRoom", HttpUtility.HtmlEncode(txtDining.Text));
            sqlCommandMF.Parameters.AddWithValue("@Stories", HttpUtility.HtmlEncode(ddlStories.Text));
            sqlCommandMF.Parameters.AddWithValue("@SQF", HttpUtility.HtmlEncode(txtTotalSQF.Text));
            sqlCommandMF.Parameters.AddWithValue("@OAttic", HttpUtility.HtmlEncode(ddlAttics.SelectedValue));
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

            //Packing insert into DB


        }

       

        protected void bnClear_Click(object sender, EventArgs e)
        {
            rblCosign.ClearSelection();
            rblSmalls.ClearSelection();
            ddlBedrooms.ClearSelection();
            ddlDenFamRooms.ClearSelection();
            ddlDining.ClearSelection();
            ddlGarage.ClearSelection();
            ddlAttics.ClearSelection();
            ddlGarage.ClearSelection();
            HttpUtility.HtmlEncode(txtBedrooms.Text = "");
            HttpUtility.HtmlEncode(txtLivingRoom.Text = "");
            HttpUtility.HtmlEncode(txtDining.Text = "");
            HttpUtility.HtmlEncode(txtTotalSQF.Text = "");
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
            string[] items = { "fridge", "sofa", "tv", "desk", "dining table" };
            string[] exists = { "bean bag chair", "sofa", "tv", "big lamp", "rocking chair", "bed", "Queen Bed", "King Bed" };
            string[] obstacles = { "Rockey Path", "Tight Hallway", "tree" };
            string[] notes = { "lot of stairs", "hard to get to house" };
            string[] date = { "03/02/2022" };
            string[] address = { "123 Funland Drive" };

            rblCosign.SelectedIndex = random.Next(0, 2);
            rblSmalls.SelectedIndex = random.Next(0, 2);
            ddlBedrooms.SelectedIndex = random.Next(0, 9);
            ddlDenFamRooms.SelectedIndex = random.Next(0, 2);
            ddlDining.SelectedIndex = random.Next(0, 2);
            HttpUtility.HtmlEncode(txtBedrooms.Text = items[random.Next(0, items.Length)]);
            HttpUtility.HtmlEncode(txtLivingRoom.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtDining.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtDenFam.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtAttic.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtBasement.Text = exists[random.Next(0, exists.Length)]);
            HttpUtility.HtmlEncode(txtOutBuildings.Text = items[random.Next(0, items.Length)]);
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


        //protected void ddlPacking_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    if (ddlPacking.SelectedItem.Text == "Yes")
        //    {
        //        lblPacking.Visible = true;
        //        lblBoxes.Visible = true;
        //        lblQuantity.Visible = true;
        //        lblSmallBox.Visible = true;
        //        txtSmallBox.Visible = true;
        //        lblMediumBox.Visible = true;
        //        txtMediumBox.Visible = true;
        //        lblLargeBox.Visible = true;
        //        txtLargeBox.Visible = true;
        //        lblMArt.Visible = true;
        //        txtMArt.Visible = true;
        //        lblLArt.Visible = true;
        //        txtLArt.Visible = true;
        //        lblWardrobe.Visible = true;
        //        txtWardrobe.Visible = true;
        //        lblSelecetMovers.Visible = true;
        //        ddlMovers.Visible = true;
        //        btnAddMover.Visible = true;
        //        btnRemove.Visible = true;
        //        lbMovers.Visible = true;
        //    }
        //    else
        //    {
        //        lblSelecetMovers.Visible = false;
        //        ddlMovers.Visible = false;
        //        btnAddMover.Visible = false;
        //        btnRemove.Visible = false;
        //        lblBoxes.Visible = false;
        //        lblQuantity.Visible = false;
        //        lblSmallBox.Visible = false;
        //        txtSmallBox.Visible = false;
        //        lblMediumBox.Visible = false;
        //        txtMediumBox.Visible = false;
        //        lblLargeBox.Visible = false;
        //        txtLargeBox.Visible = false;
        //        lblMArt.Visible = false;
        //        txtMArt.Visible = false;
        //        lblLArt.Visible = false;
        //        txtLArt.Visible = false;
        //        lblWardrobe.Visible = false;
        //        txtWardrobe.Visible = false;
        //        lbMovers.Visible = false;
        //    }
        //}

        protected void ddlTrash_SelectedIndexChanged(object sender, EventArgs e)
        {


        }

        protected void ddlAttics_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlAttics.SelectedItem.Text == "No")
            {
                txtAttic.Visible = false;
                txtAttsqr.Visible = false;
            }
            else
            {
                txtAttic.Visible = true;
                txtAttsqr.Visible = true;

            }
        }

        protected void ddlBasement_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (ddlBasement.SelectedItem.Text == "No")
            {
                txtBasement.Visible = false;
                txtBasemsqr.Visible = false;

            }
            else
            {
                txtBasement.Visible = true;
                txtBasemsqr.Visible = true;
            }
        }

        protected void ddlGarage_SelectedIndexChanged1(object sender, EventArgs e)
        {
            if (ddlGarage.SelectedItem.Text == "No")
            {
                txtGarage.Visible = false;
                txtGarsqr.Visible = false;


            }
            else
            {
                txtGarage.Visible = true;
                txtGarsqr.Visible = true;
            }
        }

        //Calculates Square feet from each sqr text box and dsiplays in total sqr feet txt 

        protected void btnCalculateSQR_Click1(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtBedroomssqr.Text) && !string.IsNullOrEmpty(txtLivRoomsqr.Text) && !string.IsNullOrEmpty(txtAttsqr.Text)
                && !string.IsNullOrEmpty(txtDinRoomsqr.Text) && !string.IsNullOrEmpty(txtBasemsqr.Text) && !string.IsNullOrEmpty(txtDenFRoomsqr.Text)
                && !string.IsNullOrEmpty(txtGarsqr.Text))
            {
                txtTotalSQF.Text = (Convert.ToInt32(txtBedroomssqr.Text) + Convert.ToInt32(txtLivRoomsqr.Text) + Convert.ToInt32(txtAttsqr.Text) + Convert.ToInt32(txtDinRoomsqr.Text) + Convert.ToInt32(txtBasemsqr.Text) + Convert.ToInt32(txtDenFRoomsqr.Text) + Convert.ToInt32(txtGarsqr.Text)).ToString();
            }
            else
            {
                Response.Write("Please Enter Value");
            }
        }

        protected void ddlPackingYesNo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlPackingYesNo.SelectedItem.Text == "Yes")
            {
                lblLargeBoxes.Visible = true;
                txtLargeBoxes.Visible = true;
                lblSmallBoxes.Visible = true;
                txtSmallBoxes.Visible = true;
                lblMediumBoxes.Visible = true;
                txtMediumBoxes.Visible = true;
                lblMediumArtBoxes.Visible = true;
                txtMediumArtBoxes.Visible = true;
                lblLargeArtBoxes.Visible = true;
                txtLargeArtBoxes.Visible = true;
                lblWardrobeBoxes.Visible = true;
                txtWardrobeboxes.Visible = true;
                lblSelectWhichMovers.Visible = true;
                ddlSelectWhichMovers.Visible = true;
                lblSelectedMovers.Visible = true;
                lbSelectedMovers.Visible = true;
                btnAddMovers.Visible = true;
                btnRemoveMovers.Visible = true;

            }
            else
            {
                lblLargeBoxes.Visible = false;
                txtLargeBoxes.Visible = false;
                lblSmallBoxes.Visible = false;
                txtSmallBoxes.Visible = false;
                lblMediumBoxes.Visible = false;
                txtMediumBoxes.Visible = false;
                lblMediumArtBoxes.Visible = false;
                txtMediumArtBoxes.Visible = false;
                lblLargeArtBoxes.Visible = false;
                txtLargeArtBoxes.Visible = false;
                lblWardrobeBoxes.Visible = false;
                txtWardrobeboxes.Visible = false;
                lblSelectWhichMovers.Visible = false;
                ddlSelectWhichMovers.Visible = false;
                lblSelectedMovers.Visible = false;
                lbSelectedMovers.Visible = false;
                btnAddMovers.Visible = false;
                btnRemoveMovers.Visible = false;
            }
        }

        protected void ddlYesNoTrash_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlYesNoTrash.SelectedItem.Text == "Yes")
            {
                lblTrashDesc.Visible = true;
                txtTrashDesc.Visible = true;
                lblHowManyMen.Visible = true;
                txtHowManyMen.Visible = true;
                lblTotalCharge.Visible = true;
                txtTotalCharges.Visible = true;
                lblDumpsterR.Visible = true;
                rblDumpster.Visible = true;

            }
            else
            {
                lblTrashDesc.Visible = false;
                txtTrashDesc.Visible = false;
                lblHowManyMen.Visible = false;
                txtHowManyMen.Visible = false;
                lblTotalCharge.Visible = false;
                txtTotalCharges.Visible = false;
                lblDumpsterR.Visible = false;
                rblDumpster.Visible = false;
            }
        }

        protected void btnSaveTrash_Click(object sender, EventArgs e)
        {

            string QueryTrash = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //Create sql command 
            SqlCommand sqlCommandTrash = new SqlCommand();
            sqlCommandTrash.Connection = sqlConnect;
            sqlCommandTrash.CommandType = CommandType.Text;
            sqlCommandTrash.CommandText = QueryTrash;

            sqlCommandTrash.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryTrashResult = sqlCommandTrash.ExecuteReader();

            string workFLow = "";
            while (queryTrashResult.Read())
            {
                workFLow = queryTrashResult["WFID"].ToString();


            }

            queryTrashResult.Close();
            sqlConnect.Close();


            //Connecting to Database 
            SqlConnection sqlConnect1 = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            SqlCommand sqlConnectSaveTrash = new SqlCommand();
            sqlConnectSaveTrash.Connection = sqlConnect1;
            sqlConnectSaveTrash.CommandType = CommandType.Text;
            sqlConnect1.Open();

            sqlConnectSaveTrash.Parameters.AddWithValue("@Dumpster", HttpUtility.HtmlEncode(rblDumpster.SelectedValue));
            sqlConnectSaveTrash.Parameters.AddWithValue("@Desc", HttpUtility.HtmlEncode(txtTrashDesc.Text));
            sqlConnectSaveTrash.Parameters.AddWithValue("@Men", HttpUtility.HtmlEncode(txtHowManyMen.Text));
            sqlConnectSaveTrash.Parameters.AddWithValue("@Charge", HttpUtility.HtmlEncode(txtTotalCharges.Text));
            sqlConnectSaveTrash.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

            //Inserting form into the DB
            String sqlQueryTrash = "INSERT INTO Trash(Dumpster, Description, MenQTY, TotalCharge, WorkFlowID) VALUES (@Dumpster , @Desc, @Men, @Charge , @ID )";
            sqlConnectSaveTrash.CommandText = sqlQueryTrash;
            SqlDataReader SaveTrashResult = sqlConnectSaveTrash.ExecuteReader();
            SaveTrashResult.Close();
            sqlConnect1.Close();

        }

        protected void btnSavePacking_Click(object sender, EventArgs e)
        {
            string QueryPacking = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //Create sql command 
            SqlCommand sqlCommandPacking = new SqlCommand();
            sqlCommandPacking.Connection = sqlConnect;
            sqlCommandPacking.CommandType = CommandType.Text;
            sqlCommandPacking.CommandText = QueryPacking;

            sqlCommandPacking.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryPackingResult = sqlCommandPacking.ExecuteReader();

            string workFLow = "";
            while (queryPackingResult.Read())
            {
                workFLow = queryPackingResult["WFID"].ToString();


            }

            queryPackingResult.Close();
            sqlConnect.Close();

            foreach (ListItem item in lbSelectedMovers.Items)
            {
                String sqlQuery = "";


                sqlQuery = "INSERT into MFEmployee(MoveFormID,EmployeeID)VALUES((Select Max(MoveFormID) from MoveForm),(Select EmployeeID from Employee where EmployeeID = @EmployeeID))  ";

                //Define the connection to the Database
                SqlConnection sqlConnect5 = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

                SqlCommand cmd = new SqlCommand();
                cmd.Connection = sqlConnect5;
                cmd.CommandType = CommandType.Text;
                cmd.CommandText = sqlQuery;

                cmd.Parameters.AddWithValue("@EmployeeID  ", HttpUtility.HtmlEncode(item.Value.ToString()));
                //open connection to send ID query 
                sqlConnect5.Open();
                SqlDataReader Result = cmd.ExecuteReader();

                Result.Close();
                sqlConnect5.Close();

            }
            //Connecting to Database 
            SqlConnection sqlConnect2 = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            SqlCommand sqlConnectSavePacking = new SqlCommand();
            sqlConnectSavePacking.Connection = sqlConnect2;
            sqlConnectSavePacking.CommandType = CommandType.Text;
            sqlConnect2.Open();

            sqlConnectSavePacking.Parameters.AddWithValue("@Smallboxes", HttpUtility.HtmlEncode(txtSmallBoxes.Text));
            sqlConnectSavePacking.Parameters.AddWithValue("@Mediumboxes", HttpUtility.HtmlEncode(txtMediumBoxes.Text));
            sqlConnectSavePacking.Parameters.AddWithValue("@Largeboxes", HttpUtility.HtmlEncode(txtLargeBoxes.Text));
            sqlConnectSavePacking.Parameters.AddWithValue("@MartBoxes", HttpUtility.HtmlEncode(txtMediumArtBoxes.Text));
            sqlConnectSavePacking.Parameters.AddWithValue("@LartBoxes", HttpUtility.HtmlEncode(txtLargeArtBoxes.Text));
            sqlConnectSavePacking.Parameters.AddWithValue("@Wardrobe", HttpUtility.HtmlEncode(txtWardrobeboxes.Text));

            sqlConnectSavePacking.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

            //Inserting form into the DB
            String sqlQueryPacking = "INSERT INTO Packing(SmallBoxes, MediumBoxes, LargeBoxes, MartBoxes, LartBoxes, Wardrobe, WorkFlowID ) VALUES (@Smallboxes , @Mediumboxes, @Largeboxes, @MartBoxes, @LartBoxes, @Wardrobe, @ID )";
            sqlConnectSavePacking.CommandText = sqlQueryPacking;
            SqlDataReader SaveTrashResult = sqlConnectSavePacking.ExecuteReader();
            SaveTrashResult.Close();
            sqlConnect2.Close();
        }

        protected void btnAddMovers_Click(object sender, EventArgs e)
        {
            ListItem mover = new ListItem(ddlSelectWhichMovers.SelectedItem.Text.ToString(), ddlSelectWhichMovers.SelectedValue.ToString());
            lbSelectedMovers.Items.Add(mover);
            ddlSelectWhichMovers.Items.Remove(ddlSelectWhichMovers.Items.FindByValue(mover.Value));
            lblSelectedMovers.Text = "";
        }

        protected void btnRemoveMovers_Click(object sender, EventArgs e)
        {
            if (lbSelectedMovers.SelectedIndex > -1)
            {

                ListItem mover = new ListItem(lbSelectedMovers.SelectedItem.Text.ToString(), lbSelectedMovers.SelectedValue.ToString());
                lbSelectedMovers.Items.Remove(lbSelectedMovers.SelectedItem);
                ddlSelectWhichMovers.Items.Add(mover);
                lblSelectedMovers.Text = "";
            }

        }
    

}

}