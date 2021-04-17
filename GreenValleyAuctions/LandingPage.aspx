<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="Lab3.LandingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
      <meta charset="UTF-8"/>
	<meta name="description" content="The Hub"/>
	<meta name="author" content="Lindsey McKim"/>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<title>Green Valley Auctions Employee Log In Page</title>
    
    <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen"/>
    <link href="css/custom.css" rel="stylesheet" type="text/css" media="screen"/>
    
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&family=Oswald&display=swap" rel="stylesheet"/>
    <link href="https://fonts.googleapis.com/css2?family=Quattrocento:wght@400;700&display=swap" rel="stylesheet"/>
    <script src="https://kit.fontawesome.com/92cf74d3dd.js" crossorigin="anonymous"></script>
</head>
<body>
    <div class="justify-content-start"/>
    <asp:Label ID="lblStatus" runat="server" Text="" ></asp:Label>
    
    <div class="text-center">
        <asp:Image ID="logo" runat="server" ImageUrl="~/images/gvalogo.png" alt="Green Valley Auctions and Moving Logo" class="img-fluid logo2" />
    </div>
    <form id="form1" runat="server">
        <div>
            
        <div class ="text-center employee-btn">
                <asp:Button ID="btnEmpLogin" runat="server" Text="Employee Login"  OnClick="btnEmpLogin_Click" Class="btn btn-primary btn-lg"/>
        </div>

        <div class ="text-center client-btn">
                <asp:Button ID="btnCustomerLogin" runat="server" Text="Customer Login" OnClick="btnCustomerLogin_Click" Class="btn btn-primary btn-lg" />
                <p><asp:Label ID="lblquestion" runat="server" Text="New Customer?"></asp:Label></p>
                <asp:HyperLink ID="hlCreateAccount" runat="server" Text="Create Account" NavigateUrl="~/Create_Customer_Account.aspx"></asp:HyperLink>
                    
        </div>
        </div>
    </form>
    <footer>
         <br />
        Created By: Madison Consulting 04
    </footer>
     <!-- jQuery and Bootstrap links - do not delete! -->
	<%--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>--%>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <!-- end of do not delete -->
</body>

</html>
