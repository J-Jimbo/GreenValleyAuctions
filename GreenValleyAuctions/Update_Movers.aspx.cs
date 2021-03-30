using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Drawing;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
namespace GreenValleyAuctions
{
    public partial class Update_Movers : System.Web.UI.Page
    {
     


    

            public static class Globals
            {
                public static String empIDHolder;
                public static int custIDHolder;
            }

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!this.IsPostBack)
                {
                    //calls both fills to populate the drop down list and list of employees
                    fillListbx();
                    
                }
            }

            protected void fillListbx()
            {
                //fills the list box with the current employees
                String sqlQuery = "Select EmployeeID, ISNULL(TRIM(EmployeeFirstName),'') +' '+ISNUll(TRIM(EmployeeLastName),'') as EmpName FROM EMployee";
                lstBxEmpNames.Items.Clear();

                String conStr = WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString;
                SqlConnection sqlConnect = new SqlConnection(conStr);

                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                //while the query has more results, concats first and last name and adds them to the list
                while (queryResults.Read())
                {
                    lstBxEmpNames.Items.Add(queryResults["EmpName"].ToString());
                }
                //closes the query out
                queryResults.Close();
                sqlConnect.Close();
            }

           
            protected void btnEditEmp_Click(object sender, EventArgs e)
            {
                //pulls an employee from the list box and fills in the text boxs and information
                String empNameHold = lstBxEmpNames.SelectedValue;

                String sqlQuery = "Select ISNULL(trim(EmployeeFirstName),'') as EmployeeFirstName, ISNULL(trim(EmployeeLastName),'') as EmployeeLastName, ISNULL(EmployeePhone,'') as EmployeePhone, EmployeeID FROM Employee WHERE  ISNULL(trim(EmployeeFirstName), '') +' '+ISNULL(trim(EmployeeLastName), '') LIKE '%" + empNameHold + "%'"
;

            String conStr = WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString;
                SqlConnection sqlConnect = new SqlConnection(conStr);

                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;
                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                 System.Diagnostics.Debug.WriteLine(empNameHold);
                while (queryResults.Read())
                {
                    txtBxEmpFirstName.Text = queryResults["EmployeeFirstName"].ToString();
                    txtxBxEmpLastName.Text = queryResults["EmployeeLastName"].ToString();
                    txtBxEmpPhone.Text = queryResults["EmployeePhone"].ToString();
                    Globals.empIDHolder = queryResults["EmployeeID"].ToString();
                    System.Diagnostics.Debug.WriteLine(empNameHold);
                }
                lblResult.Text = "Employee Information Found.";
                //closes the query out
                queryResults.Close();


                //Finds what customer's assingment they are on and selects the correct drop down menu item

                sqlConnect.Close();
            }

            protected void btnDeleteEmp_Click(object sender, EventArgs e)
            {
                //does not work right now, need to figure out how to get key checks disabled or something
                String empNameHold = lstBxEmpNames.SelectedValue;

                String sqlQuery = "DELETE FROM Employee WHERE ";
                lstBxEmpNames.Items.Clear();

                String conStr = WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString;
                SqlConnection sqlConnect = new SqlConnection(conStr);

                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;

                sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                while (queryResults.Read())
                {
                    lstBxEmpNames.Items.Add(queryResults["EmpName"].ToString());
                }
                //closes the query out
                queryResults.Close();
                sqlConnect.Close();
            }

            protected void btnSearchEmp_Click(object sender, EventArgs e)
            {
                //code to run the search of all employees
                String empNameHold = txtBxEmpSearchName.Text;

            //fills the list box with the current emps containing whatever is in the search
            String sqlQuery = "Select ISNULL(trim(EmployeeFirstName), '') +' '+ISNULL(trim(EmployeeLastName), '') as EmpName, ISNULL(EmployeePhone, '') as EmployeePhone, EmployeeID FROM Employee WHERE  ISNULL(trim(EmployeeFirstName), '') +' '+ISNULL(trim(EmployeeLastName), '') LIKE @Name;";
;
            lstBxEmpNames.Items.Clear();

                String conStr = WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString;
                SqlConnection sqlConnect = new SqlConnection(conStr);

                SqlCommand sqlCommand = new SqlCommand();
                sqlCommand.Connection = sqlConnect;
                sqlCommand.CommandType = CommandType.Text;
                sqlCommand.CommandText = sqlQuery;
                sqlCommand.Parameters.AddWithValue("@Name", "%" + empNameHold + "%");

            sqlConnect.Open();
                SqlDataReader queryResults = sqlCommand.ExecuteReader();
                //while the query has more results, concats first and last name and adds them to the list
                while (queryResults.Read())
                {
                    lstBxEmpNames.Items.Add(queryResults["EmpName"].ToString());
                }
                //closes the query out
                queryResults.Close();
                sqlConnect.Close();
            }

            protected void btnPopulate_Click(object sender, EventArgs e)
            {
                //populates with generic info
                txtBxEmpFirstName.Text = "Madison";
                txtxBxEmpLastName.Text = "James";
                txtBxEmpPhone.Text = "758-054-0700";
            }

            protected void btnCreateEmp_Click(object sender, EventArgs e)
            {
                //adds a new employee entry 
                String empFirst = txtBxEmpFirstName.Text;
                String empLast = txtxBxEmpLastName.Text;
                String empPhone = txtBxEmpPhone.Text;

                if (!empFirst.Equals("") && !empLast.Equals("") && !empPhone.Equals(""))
                {
                    try
                    {
                    String sqlQuery = "INSERT INTO Employee(EmployeeID, EmployeeFirstName, EmployeeLastName, EmployeePhone) VALUES((Select(MAX(EmployeeID) + 1) FROM Employee),@empFirst, @empLast, @empPhone);";
;

                    String conStr = WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString;
                        SqlConnection sqlConnect = new SqlConnection(conStr);

                        SqlCommand sqlCommand = new SqlCommand();
                        sqlCommand.Connection = sqlConnect;
                        sqlCommand.CommandType = CommandType.Text;
                        sqlCommand.CommandText = sqlQuery;
                        sqlCommand.Parameters.AddWithValue("@empFirst", HttpUtility.HtmlEncode(txtBxEmpFirstName.Text));
                        sqlCommand.Parameters.AddWithValue("@empLast", HttpUtility.HtmlEncode(txtxBxEmpLastName.Text));
                        sqlCommand.Parameters.AddWithValue("@empPhone", HttpUtility.HtmlEncode(txtBxEmpPhone.Text));
                       
                    sqlConnect.Open();
                        sqlCommand.ExecuteScalar();
                        sqlConnect.Close();
                        fillListbx();
                    }
                    catch (Exception)
                    {
                        lblResult.Text = "Update Failed, Database Error.";
                    }

                }
                else
                {
                    lblResult.Text = "Please make sure all fields are filled.";
                }
            }

            protected void btnUpdateEmp_Click(object sender, EventArgs e)
            {
                //updates existing employee's record and what contract they are on
                String empFirst = txtBxEmpFirstName.Text;
                String empLast = txtxBxEmpLastName.Text;
                String empPhone = txtBxEmpPhone.Text;

                if (!empFirst.Equals("") && !empLast.Equals("") && !empPhone.Equals(""))
                {
                    try
                    {
                        String sqlQuery = "UPDATE Employee SET EmployeeFirstName = @empFirst, EmployeeLastName = @empLast, EmployeePhone = @empPhone WHERE EmployeeID = @ID" ;

                        String conStr = WebConfigurationManager.ConnectionStrings["GVA"].ConnectionString;
                        SqlConnection sqlConnect = new SqlConnection(conStr);

                        SqlCommand sqlCommand = new SqlCommand();
                        sqlCommand.Connection = sqlConnect;
                        sqlCommand.CommandType = CommandType.Text;
                        sqlCommand.CommandText = sqlQuery;
                        sqlCommand.Parameters.AddWithValue("@empFirst", HttpUtility.HtmlEncode(txtBxEmpFirstName.Text));
                        sqlCommand.Parameters.AddWithValue("@empLast", HttpUtility.HtmlEncode(txtxBxEmpLastName.Text));
                        sqlCommand.Parameters.AddWithValue("@empPhone", HttpUtility.HtmlEncode(txtBxEmpPhone.Text));
                        sqlCommand.Parameters.AddWithValue("@ID", HttpUtility.HtmlEncode(Globals.empIDHolder));

                    sqlConnect.Open();
                        sqlCommand.ExecuteScalar();
                        sqlConnect.Close();
                        lblResult.Text = "Employee Updated.";
                        fillListbx();
                        txtBxEmpFirstName.Text = "";
                        txtxBxEmpLastName.Text = "";
                        txtBxEmpPhone.Text = "";
                    }
                    catch (Exception)
                    {
                        lblResult.Text = "Database Error.";
                    }

                   

                }
                else
                {
                    lblResult.Text = "Please make sure all fields are filled.";
                }
            }
        
    }
}
