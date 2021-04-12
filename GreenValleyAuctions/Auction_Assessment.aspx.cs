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
    public partial class Auction_Assessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                foreach(ListItem x in cblSheduled.Items)
                {
                    if(x.Value.Equals("GVA") || x.Value.Equals("Customer"))
                    {
                        x.Attributes.Add("style", "display:none");
                    }
                }
            }


            //On Page load grab customer info

            string Query = "Select trim(FirstName) as Fname,trim(LastName) as Lname,CustomerAddress,CustomerPhone,IC.DateContacted ,MAX(IC.ContactID) as ID from Customer C inner join InitialContact IC on C.CustomerID = IC.CustomerID where c.customerID = @ID group by trim(FirstName),trim(LastName),CustomerAddress,CustomerPhone,DateContacted; ";

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
                lblFirstName.Text = queryResult["Fname"].ToString();
                lblLastName.Text = queryResult["Lname"].ToString();
                lblPhone.Text = queryResult["CustomerPhone"].ToString();
                lblContactDate.Text = queryResult["DateContacted"].ToString().Trim().Substring(0, queryResult["DateContacted"].ToString().IndexOf(' '));
                lblAddres.Text = queryResult["CustomerAddress"].ToString().Trim();
            }

            queryResult.Close();


            //query to check for existing form based on workflow
            //query to grab workflow
            string WFQuery = "select MAX(WF.WorkFlowID) as WFID from ServiceEvent SE inner join WorkFLow WF on SE.WorkFlowID = WF.CustomerID inner join Customer C on WF.CustomerID = C.CustomerID where C.CustomerID = @ID; ";

            //Define the connection to the Database
           

            //Create sql command 
            SqlCommand sqlCommandID = new SqlCommand();
            sqlCommandID.Connection = sqlConnect;
            sqlCommandID.CommandType = CommandType.Text;
            sqlCommandID.CommandText = WFQuery;

            sqlCommandID.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Session["Customer"].ToString()));
            //open connection to send ID query 
            
            SqlDataReader Result = sqlCommandID.ExecuteReader();

            string workFLow = "";
            while (Result.Read())
            {
                workFLow = Result["WFID"].ToString();


            }

            Result.Close();
            //query to grab scheduling from 
            string formQuery = "Select * from AuctionSchedulingForm ASF inner join ASSupplies ASP on ASF.SchedulingFormID = ASP.SchedulingFormID where WorkFlowID = @ID;";

            //Create sql command 
            SqlCommand sc = new SqlCommand();
            sc.Connection = sqlConnect;
            sc.CommandType = CommandType.Text;
            sc.CommandText = formQuery;


            sc.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

            SqlDataReader queryFeedback = sc.ExecuteReader();
            while (queryFeedback.Read())
            {
                
                //fill boxes
                txtArtBox.Text = queryFeedback["ArtBox"].ToString().Trim();
                txtLPads.Text= queryFeedback["LargePad"].ToString().Trim();
                txtLrgBox.Text= queryFeedback["LargeBox"].ToString().Trim();
                txtMedBox.Text= queryFeedback["MediumBox"].ToString().Trim();
                txtsmallBox.Text = queryFeedback["SmallBox"].ToString().Trim();
                txtsPads.Text = queryFeedback["SmallPad"].ToString().Trim();
                

            }
            queryFeedback.Close();
            //-------------------------------
            //fill trucks
            //query to grab scheduling from 
            string truckQuery = "Select EquipmentName from AuctionSchedulingForm ASF inner join ASEquipment ASE on ASF.SchedulingFormID = ASE.SchedulingFormID inner join Equipment E on ASE.EquipmentID = E.EquipmentID where WorkFlowID = @ID;";

            //Create sql command 
            SqlCommand sctruck = new SqlCommand();
            sctruck.Connection = sqlConnect;
            sctruck.CommandType = CommandType.Text;
            sctruck.CommandText = truckQuery;


            sctruck.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(workFLow));

            SqlDataReader queryTruck = sctruck.ExecuteReader();
            while (queryTruck.Read())
            {

                //fill boxes
                lbTrucks.Items.Add(queryTruck["EquipmentName"].ToString().Trim());
             


            }
            queryTruck.Close();
            sqlConnect.Close();
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
        protected void btnPopulate_Click(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            string Query = "INSERT INTO Inventory (ItemID, ItemDescription, ItemCost, InventoryDate,ItemStorage,ItemLocation) Values ((Select ISNULL(max(ItemID)+1,1) from Inventory),@Item,@ItemCost,GetDate(),@Storage,@Location) ";

            //Define the connection to the Database
            SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

            //Create sql command 
            SqlCommand sqlCommand = new SqlCommand();
            sqlCommand.Connection = sqlConnect;
            sqlCommand.CommandType = CommandType.Text;
            sqlCommand.CommandText = Query;


            sqlCommand.Parameters.AddWithValue("@Sell", HttpUtility.HtmlEncode(txtSell.Text.ToString()));
            sqlCommand.Parameters.AddWithValue("@Why", HttpUtility.HtmlEncode(ddlWHY.SelectedValue.ToString()));
            //sqlCommand.Parameters.AddWithValue("@Storage", HttpUtility.HtmlEncode(ddlBay.SelectedValue.ToString()));
            //sqlCommand.Parameters.AddWithValue("@Location", HttpUtility.HtmlEncode(ddlPlace.SelectedValue.ToString()));
            //open connection to send ID query 
            sqlConnect.Open();
            SqlDataReader queryResult = sqlCommand.ExecuteReader();


            queryResult.Close();
            sqlConnect.Close();
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customer_Info.aspx");
        }

        protected void cblSheduled_SelectedIndexChanged(object sender, EventArgs e)
        {
           foreach(ListItem x in cblSheduled.Items)
            {
                 
                if(x.Selected.Equals(true) && x.Value.Equals("Auction Walk Through"))
                {
                    foreach(ListItem y in cblSheduled.Items)
                    {
                        if (y.Value.Equals("GVA") || y.Value.Equals("Customer"))
                        {
                            y.Attributes.Remove("style");
                            
                        }
                    }
                }
                
                
                        
            }
        }
    }
}