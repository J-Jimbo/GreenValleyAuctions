<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Request.aspx.cs" Inherits="Lab3.Customer_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8">
		<meta name="description" content="The Hub">
	  	<meta name="author" content="Lindsey McKim">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Green Valley</title>

		<!-- Bootstrap v4.4.1 -->
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen">
		<link href="css/custom.css" rel="stylesheet" type="text/css" media="screen">
		<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&family=Oswald&display=swap" rel="stylesheet">
		<link href="https://fonts.googleapis.com/css2?family=Quattrocento:wght@400;700&display=swap" rel="stylesheet">
		<script src="https://kit.fontawesome.com/92cf74d3dd.js" crossorigin="anonymous"></script>



</head>
    
<body>
    <form id="form1" runat="server">

         <header class="row headernav"> <!-- Logo Starts Here -->
				

				<nav class="col-md-4"> <!-- header starts here - nav pills -->
					 <ul class="nav nav-pills justify-content-start">
		              <li class="nav-item">
		                <a class="nav-link" href="Customer_Home.aspx">Profile</a>
		              </li>
		              
		              
		              
		            </ul>
		            </nav>
				

					<div class ="col-md-2 offset-md-1">
					<div class="logo3">
					<img class="img-fluid logo" src="images/gvalogo.png" alt="Green Valley Auctions and Moving Logo"/>
					</div>
				</div><!-- end logo -->

				

				<div class ="col-md-2 offset-md-3">
				<i class="fas fa-search fa-2x"></i>
				<i class="fas fa-calendar-alt fa-2x"></i>
				<%--<a href="index.html"><i class="fas fa-sign-out-alt fa-2x"></i></a>--%>
<%--                    <asp:ImageButton ID="btnILogOut" runat="server" AlternateText=" "  class="fas fa-sign-out-alt fa-2x" OnClick="btnILogOut_Click" />--%>
<%--                <asp:Button  ID="btnLogOut"  runat="server" class="fas fa-sign-out-alt fa-2x" OnClick="btnLogOut_Click" />--%>
			</div>



			

			</header> <!-- end row header -->



        <div>
            <asp:Button ID="BtnLogout" runat="server" Text="LogOut" class="btn btn-primary btn-intake rounded-pill" OnClick="BtnLogout_Click"/>
            <asp:Button ID="BtnLanding" runat="server" Text="Home" class="btn btn-primary btn-intake rounded-pill" OnClick="BtnLanding_Click" />
            <hr />
            <asp:Label ID="lblRequest" runat="server" Text="Request a Service"></asp:Label>
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblService" runat="server" Text="Select Service Type: "></asp:Label>
                        <hr />
                        <asp:DropDownList ID="dplServiceType" AutoPostBack="true" runat="server">
                            <asp:ListItem Text="Moving" Value="Moving"></asp:ListItem>
                            <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDescription" runat="server" Text="Type Description: "></asp:Label>
                        <hr />
                        <asp:TextBox ID="txtDescription" runat="server" Height="300" Width="500" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnSend" runat="server" Text="Send Request" class="btn btn-primary btn-intake rounded-pill" OnClick="btnSend_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
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
