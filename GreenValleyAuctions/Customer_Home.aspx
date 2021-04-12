﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Home.aspx.cs" Inherits="GreenValleyAuctions.Customer_Home" %>

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
				<a href="index.html"><i class="fas fa-sign-out-alt fa-2x"></i></a>
			</div>



			

			</header> <!-- end row header -->

			<div class="row profile1">
			<div class ="col-md-3">
				<img src="images/profileicon2.png" alt="Profile Icon" class="w-100" data-target="carouselExample" data-slide-to="1" style="width:80%"/>
				<h3> Contact Information </h3>
				<p> Email: stephaniejames@gmail.com </p>
				<p> Phone: 540-123-4567 </p>
                <asp:Button ID="btnRequest" runat="server" Text="Submit Request" OnClick="btnRequest_Click" class="btn btn-primary btn-intake rounded-pill" />
				<br/>
				<br/>
                <asp:Button ID="btnMedia" runat="server" Text="Upload Media" OnClick="btnMedia_Click" class="btn btn-primary btn-intake rounded-pill" />
				<br/>
				<br/>
                <asp:Button ID="btnReview" runat="server" Text="Leave a Review" class="btn btn-primary btn-intake rounded-pill" OnClick="btnReview_Click" />
			</div>


			<div class="jumbotron jumbotron-fluid col-md-9">
  			<div class="container">
    			<h1 class="display-4">Stephanie James</h1>
    			
    			<img src="images/progressbar.png" alt="Progress Bar" class="w-100" data-target="carouselExample" data-slide-to="1" style="width:80%">
    			<div class="row clientinfo">
    		<div class="col-md-4">
    			<h3>Client Information</h3>
    			<p> Pick Up Date: 3/9/21 </p>
    			<p> Bring In Date: 3/9/21 </p>
    			<p> Look At Date: 3/10/21 </p>
    			<p> Closing Date: 3/15/21 </p>
    		</div>
    			<div class="col-md-7 comments">
    				<h3>Comments <i class="far fa-edit"></i></h3>
    				<p> Contact made on 3/2/2021, 4:00PM; intake form complete. </p>
    				<p> Tried contacting on 3/2/2021, 8:31AM to finish completing intake form. -Sierra </p>
    				<p> Initial contact was made on 3/1/2021. -Laura </p>
    			</div>
    			</div>
    			<div class="row media">
    				<div class="col-md-6">
    					<h3>Media </h3>
    				<img src="images/woodenchair1.png" alt="Wooden Chair" class="w-100 chair" data-target="carouselExample" data-slide-to="1"/>
    				<img src="images/antiquechair.png" alt="Antique Chair" class="w-100 chair" data-target="carouselExample" data-slide-to="1"/>
    			</div>
    			<div class ="col-md-3 offset-md-3">
    				
    				<br/> <br/> <br/> <br/> <br/> <br/> <br/>
    				<button type="button" class="btn btn-primary rounded-pill">Save Changes</button>
    			</div>

    		</div>

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
