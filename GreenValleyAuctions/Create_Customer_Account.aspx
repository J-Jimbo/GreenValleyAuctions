<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Customer_Account.aspx.cs" Inherits="Lab3.Create_Customer_Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
		<meta name="description" content="The Hub"/>
	  	<meta name="author" content="Lindsey McKim"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title>Green Valley Client Log In Page</title>

		<!-- Bootstrap v4.4.1 -->
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen"/>
		<link href="css/custom.css" rel="stylesheet" type="text/css" media="screen"/>
		<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&family=Oswald&display=swap" rel="stylesheet"/>
		<link href="https://fonts.googleapis.com/css2?family=Quattrocento:wght@400;700&display=swap" rel="stylesheet"/>
		<script src="https://kit.fontawesome.com/92cf74d3dd.js" crossorigin="anonymous"></script>
</head>
<body>
    <form id="form1" runat="server">
				 <div class="text-center">
        		<h3> Create an Account </h3>
      			</div>

           

      			 <div class="row">
            <div class="col-md-2">
          <p> Login Information: </p>
            </div>
         </div>
        <div class="row">
          <div class="col-md-2">
           <p>Email/Username:</p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtUserName" runat="server" class="form-control" ></asp:TextBox>
              <asp:CustomValidator ID="cvUserName" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txtUserName" Text="UserName Exists" Forecolor="Red" Display="Dynamic" OnServerValidate="cvUserName_ServerValidate"></asp:CustomValidator>
              <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtUserName" Display="Dynamic"></asp:RequiredFieldValidator>
                        
            </div>
          </div>

          <br />

          <div class="row">
            <div class="col-md-2">
          <p>Password:</p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtPass" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                      
            </div>
         </div>
        <div class="row">
          <div class="col-md-2">
           <p> Retype Password: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtPassCheck" runat="server" TextMode="Password" class="form-control"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvCheck" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtPassCheck"></asp:RequiredFieldValidator>
              <asp:CompareValidator ID="cvPass" runat="server" ErrorMessage="CompareValidator" Text="Passwords Do not Match" ControlToValidate="txtPassCheck" ControlToCompare="txtPass"></asp:CompareValidator>
                   
            </div>
          </div>

          <br/>
    <div class="row">
            <div class="col-md-2">
          <p> First Name: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
              <asp:CustomValidator ID="cvFirstName" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txtFirstName" Text="Customer Exists" Forecolor="Red" Display="Dynamic" OnServerValidate="cvFirstName_ServerValidate"></asp:CustomValidator>
              <asp:RequiredFieldValidator ID="rfvFName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtFirstName" Display="Dynamic" ></asp:RequiredFieldValidator>
                    
            </div>
          <div class="col-md-2">
           <p> Last Name: </p>
        </div>
        <div class="col-md-4">
               <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtLastName" ></asp:RequiredFieldValidator>
            </div>
          </div>

          <br/>
    <div class="row">
            <div class="col-md-12">
            <p> Address </p>
          </div>
          </div>

          <div class="row">
            <div class="col-md-2">
          <p> Street: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtStreet" ></asp:RequiredFieldValidator>
                        
            </div>
         

          

          
            <div class="col-md-2">
          <p> City: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtCity" ></asp:RequiredFieldValidator>
                        
            </div>
        </div>
        <br />
        <div class="row">
          <div class="col-md-2">
           <p> State: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtState" ></asp:RequiredFieldValidator>
                        
            </div>
            <div class="col-md-2">
           <p> Zip: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtZip" ></asp:RequiredFieldValidator>
            </div>
          </div>

          <br/>
    
          <div class="row">
            <div class="col-md-12">
            <p> Contact Information </p>
          </div>
          </div>

        

          <div class="row">
            <div class="col-md-2">
          <p> Phone: </p>
            </div>
          <div class="col-md-10">
               <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtPhone" ></asp:RequiredFieldValidator>
                    
            </div>
          </div>

          <br/>
    <div class="row">
          <div class ="col-md-2 ">
                        <asp:Button ID="btnCreate" runat="server" Text="Create Account" OnClick="btnCreate_Click" class="btn btn-primary btn-intake rounded-pill" />
      </div>

        <div class="col-md-1 offset-md-1">

                        <asp:Button ID="btnLogin" runat="server" Text="Go to Login" OnClick="btnLogin_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill"/>
       </div>

       <div class="col-md-1 offset-md-1">
                        <asp:Button ID="BtnCLear" runat="server" Text="Clear" onclick="BtnCLear_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill"/>
      </div>
    

      <div class="col-md-1 offset-md-1">
                        <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill"/>
      </div>

       <div class="col-md-1 offset-md-1">
                        <asp:Button ID="BtnHome" runat="server" Text="Return to Landing Page" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill" OnClick="BtnHome_Click"/>
      </div>
        <div class="col-md-1 offset-md-1">
                        <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Green" ></asp:Label>
      </div>
</div>
    <%-------------------------------------------------------------------------------------%>
    
        
    </form>
    <footer>
         <br />
        
    </footer>
    <!-- jQuery and Bootstrap links - do not delete! -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- end of do not delete -->
</body>
</html>
