<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Login.aspx.cs" Inherits="Lab3.Customer_Login" %>

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
    <div class="text-center">
<img class="img-fluid logo2" src="images/gvalogo.png" alt="Green Valley Auctions and Moving Logo"/>
</div>


<div class="text-center">
	<h4> Client Log In </h4>
</div>

	
	<form id="form1" runat="server">
        <div class="form-row">
        <div class="col-md-4 mb-3 offset-md-4 mt-2">
        	<p> Username </p>
        <asp:TextBox ID="txtUserName" runat="server" placeholder="UserName" Class="form-control"></asp:TextBox>
    </div>
</div>


<div class="form-row">
        <div class="col-md-4 mb-3 offset-md-4 mt-2">
        	<p> Password </p>
        <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Password" Class="form-control"></asp:TextBox>
    </div>

</div>

<div class ="text-center login-btn">
    <asp:Button ID="btnLogin" runat="server" Text="Login" class="btn btn-primary btn-lg" OnClick="btnLogin_Click"/>
     <asp:Button ID="btnLanding" runat="server" Text="Return to Landing Page"  OnClick="btnLanding_Click"  Class="btn btn-primary btn-lg"/>
<br />
     <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    <br />
    <p><asp:Label ID="lblquestion" runat="server" Text="New Customer?"></asp:Label></p>
    <asp:HyperLink ID="hlCreateAccount" runat="server" Text="Create Account" NavigateUrl="~/Create_Customer_Account.aspx"></asp:HyperLink>
</div>
    
    </form>
    <footer>
        
        
    </footer>
    <!-- jQuery and Bootstrap links - do not delete! -->
		<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
		<!-- end of do not delete -->

</body>
</html>
