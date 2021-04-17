<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Home.aspx.cs" Inherits="GreenValleyAuctions.Customer_Home" %>

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
        <header class="row headernav"> <!-- Logo Starts Here -->
				

				<nav class="col-md-4"> <!-- header starts here - nav pills -->
					 <ul class="nav nav-pills justify-content-start">
		              <li class="nav-item">
		                <a class="nav-link" href="clients.html">Profile</a>
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
                    <asp:ImageButton ID="btnILogOut" runat="server" AlternateText=" "  class="fas fa-sign-out-alt fa-2x" OnClick="btnILogOut_Click" />
<%--                <asp:Button  ID="btnLogOut"  runat="server" class="fas fa-sign-out-alt fa-2x" OnClick="btnLogOut_Click" />--%>
			</div>



			

			</header> <!-- end row header -->

			<div class="row profile1">
			<div class ="col-md-3">
<%--				<img src="images/profileicon2.png" alt="Profile Icon" class="w-100" data-target="carouselExample" data-slide-to="1" style="width:80%"/>--%>
				<asp:Table ID="CustomerInfo" runat="server" BorderColor="Black"   >
                    <asp:TableRow>
                        <asp:TableCell>
                            <h3> Contact Information </h3>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblTAddress" runat="server" Text="Address: " ></asp:Label>
                            <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                           <p> Email: 
                            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></p>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <p><asp:Label ID="lblTPhone" runat="server" Text="Phone: "   ></asp:Label>
                           <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></P>
                        </asp:TableCell>
                    </asp:TableRow>
                    

                </asp:Table>
                <asp:Button ID="btnRequest" runat="server" Text="Submit Request" OnClick="btnRequest_Click" class="btn btn-primary btn-intake rounded-pill" />
				<br/>
				<br/>
                <asp:Button ID="btnMedia" runat="server" Text="Upload Media" OnClick="btnMedia_Click" class="btn btn-primary btn-intake rounded-pill" Visible="false"/>
				<asp:FileUpload ID="fuPhotos" runat="server" AllowMultiple="true" Visible="false" />
                <asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="btnUpload_Click" Visible="false" class="btn btn-primary btn-intake rounded-pill" />
                <br/>
				<br/>
                <asp:Button ID="btnReview" runat="server" Text="Leave a Review" class="btn btn-primary btn-intake rounded-pill" OnClick="btnReview_Click" Visible="false" Enabled="false" />
			</div>


			<div class="jumbotron jumbotron-fluid col-md-9">
  			<div class="container">
    			 <asp:Table ID="tblCInfo" runat="server" Width="70%"  Align="Right" >
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <h3><asp:Label ID="lblName" runat="server" Text="" Font-Bold="true"  ></asp:Label></h3>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblStatusBar" runat="server" Text="Status Bar: " Font-Bold="true" ></asp:Label></P>
            </asp:TableCell>
            <asp:TableCell>
                            <asp:Image ID="InitialContact" runat="server" ImageUrl="images/progressbar2.png" Visible="false" Height="78px" Width="592px"/>
                            <asp:Image ID="ServicePage" runat="server" ImageUrl="images/progressbar3.png" Visible="false"  Height="78px" Width="592px" />
                            <asp:Image ID="DateFinal" runat="server" ImageUrl="images/progressbar4.png" Visible="false"  Height="78px" Width="592px"/>
                            <asp:Image ID="ServiceComplete" runat="server" ImageUrl="images/progressbar5.png" Visible="false"  Height="78px" Width="592px" />
                            <asp:Image ID="FollowUp" runat="server" ImageUrl="images/progressbar6.png" Visible="false"  Height="78px" Width="592px" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblClientInformation" runat="server" Text="Client Information" Font-Bold="true"></asp:Label></P>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
               <p> <asp:Label ID="lblTEngagement" runat="server" Text="Creation Date: "></asp:Label>
                <asp:Label ID="lblEngagement" runat="server" Text=""></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell>
               <p> <asp:Label ID="lblTCompletion" runat="server" Text="Completion Date: "></asp:Label>
                <asp:Label ID="lblCompletion" runat="server" Text=""></asp:Label></p>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblTCurrentStatus" runat="server" Text="Current Status: "></asp:Label>
                <asp:Label ID="lblCurrentStatus" runat="server" Text=""></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell>
               <p> <asp:Label ID="lblTReview" runat="server" Text="Review: "></asp:Label>
                <asp:Label ID="lblReview" runat="server" Text=""></asp:Label></p>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <P><asp:Label ID="lblTInitialNotes" runat="server" Text="Initial Notes: " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblInitialNotes" runat="server" Text="" ></asp:Label></P>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
               <p><asp:Label ID="lblItems" runat="server" Text="Items" Font-Bold="true"></asp:Label></p>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="photoCell" Visible="false">
            <asp:TableCell>
                <p><asp:Label ID="lblMedia" runat="server" Text="Media: " Font-Bold="true" ></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell >
                <asp:Image ID="imgtest" runat="server"  Height="100px" Width="100px"  />
                <asp:Image ID="imgCustomer" runat="server" Height="100px" Width="100px" />
            </asp:TableCell>
           
        </asp:TableRow>
    </asp:Table>

    		</div>
  			</div>
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
