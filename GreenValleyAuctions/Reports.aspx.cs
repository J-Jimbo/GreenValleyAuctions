using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace Lab2
{
    public partial class Reports : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //updateGrid();
            //updateServiceGrid();

        }

        protected void btnCustomerInteraction_Click(object sender, EventArgs e)
        {
            Tableau.Visible = true;
        }

        //protected void ddlCustomer_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //Clear grid view
        //    CustomerGrid.DataSource = null;
        //    CustomerGrid.DataBind();
        //    //define connection to the DB
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

        //    int customerID = int.Parse(ddlCustomer.SelectedValue);

        //    // query to grab customer data
        //    string sqlQueryID = "SELECT ServiceDate, ItemDescription, ServiceType from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID full join Customer c on c.CustomerID = WF.CustomerID where c.CustomerID = " + customerID + " ORDER BY ServiceDate";



        //    SqlDataAdapter sqlAdaptor = new SqlDataAdapter(sqlQueryID, sqlConnect);

        //    DataTable dtCustomerGrid = new DataTable();
        //    sqlAdaptor.Fill(dtCustomerGrid);
        //    CustomerGrid.DataSource = dtCustomerGrid;
        //    CustomerGrid.DataBind();




        //}

        //protected void updateGrid()
        //{

        //    //Clear grid view
        //    CustomerGrid.DataSource = null;
        //    CustomerGrid.DataBind();



        //    // query to grab customer data
        //    string sqlQueryID = "SELECT ServiceDate, ItemDescription, ServiceType from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID full join Customer c on c.CustomerID = WF.CustomerID where c.CustomerID = c.CustomerID ORDER BY ServiceDate";
        //    //define connection to the DB
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);


        //    SqlDataAdapter sqlAdaptor = new SqlDataAdapter(sqlQueryID, sqlConnect);

        //    DataTable dtCustomerGrid = new DataTable();
        //    sqlAdaptor.Fill(dtCustomerGrid);
        //    CustomerGrid.DataSource = dtCustomerGrid;
        //    CustomerGrid.DataBind();

        //}

        //protected void ddlService_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    //Clear grid view
        //    ServiceGrid.DataSource = null;
        //    ServiceGrid.DataBind();
        //    //define connection to the DB
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

        //    //Service Type
        //    string serviceType = ddlService.SelectedValue;
        //    string sqlQuery = " ";

        //    // Using if block to decide query for moving or auction attributes 
        //    if (serviceType == "Moving")
        //    {
        //        sqlQuery = "SELECT FirstName, LastName, ServiceDate, OriginAddress, DestinationAddress, EmployeeFirstName, EmployeeLastName, EquipmentName from Customer c full join WorkFlow wf on c.CustomerID=wf.CustomerID full join Employee e on wf.EmployeeID=e.EmployeeID full join ServiceEvent se on wf.WorkFlowID=se.WorkFlowID full join Moving m on se.ServiceID= m.ServiceID full join Equipment eq on se.EquipmentID=eq.EquipmentID where se.ServiceType = 'Moving' ORDER by ServiceDate";
        //    }
        //    else
        //    {
        //        sqlQuery = "SELECT FirstName, LastName, ServiceDate, Status, SalePrice, EmployeeFirstName, EmployeeLastName, EquipmentName from Customer c full join WorkFlow wf on c.CustomerID=wf.CustomerID full join Employee e on wf.EmployeeID=e.EmployeeID full join ServiceEvent se on wf.WorkFlowID=se.WorkFlowID full join Auction a on se.ServiceID= a.ServiceID full join Equipment eq on se.EquipmentID=eq.EquipmentID where se.ServiceType = 'Auction' ORDER by ServiceDate";
        //    }


        //    SqlDataAdapter sqlAdaptor = new SqlDataAdapter(sqlQuery, sqlConnect);

        //    DataTable dtServiceGrid = new DataTable();
        //    sqlAdaptor.Fill(dtServiceGrid);
        //    ServiceGrid.DataSource = dtServiceGrid;
        //    ServiceGrid.DataBind();

        //}
        //protected void updateServiceGrid()
        //{
        //    //Clear grid view
        //    ServiceGrid.DataSource = null;
        //    ServiceGrid.DataBind();
        //    //define connection to the DB
        //    SqlConnection sqlConnect = new SqlConnection(WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString);

        //    //Service Type
        //    string serviceType = ddlService.SelectedValue;
        //    string sqlQuery = " ";
        //    if (serviceType == "Moving")
        //    {
        //        sqlQuery = "SELECT FirstName, LastName, ServiceDate, OriginAddress, DestinationAddress, EmployeeFirstName, EmployeeLastName, EquipmentName from Customer c full join WorkFlow wf on c.CustomerID=wf.CustomerID full join Employee e on wf.EmployeeID=e.EmployeeID full join ServiceEvent se on wf.WorkFlowID=se.WorkFlowID full join Moving m on se.ServiceID= m.ServiceID full join Equipment eq on se.EquipmentID=eq.EquipmentID where se.ServiceType = 'Moving' ORDER by ServiceDate";
        //    }
        //    else
        //    {
        //        sqlQuery = "SELECT FirstName, LastName, ServiceDate, Status, SalePrice, EmployeeFirstName, EmployeeLastName, EquipmentName from Customer c full join WorkFlow wf on c.CustomerID=wf.CustomerID full join Employee e on wf.EmployeeID=e.EmployeeID full join ServiceEvent se on wf.WorkFlowID=se.WorkFlowID full join Auction a on se.ServiceID= a.ServiceID full join Equipment eq on se.EquipmentID=eq.EquipmentID where se.ServiceType = 'Auction' ORDER by ServiceDate";
        //    }
        //    SqlDataAdapter sqlAdaptor = new SqlDataAdapter(sqlQuery, sqlConnect);

        //    DataTable dtServiceGrid = new DataTable();

        //    sqlAdaptor.Fill(dtServiceGrid);
        //    ServiceGrid.DataSource = dtServiceGrid;
        //    ServiceGrid.DataBind();


        //}
    }
}