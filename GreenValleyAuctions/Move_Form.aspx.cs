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

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string Query = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);

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
            SqlConnection sqlConnectMF = new SqlConnection(WebConfigurationManager.ConnectionStrings["Lab3"].ConnectionString);
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


            Session["Customer"] = null;
        }
    }
}