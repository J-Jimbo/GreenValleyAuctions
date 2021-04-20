<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Review.aspx.cs" Inherits="GreenValleyAuctions.Customer_Review" %>

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
                   <%-- <asp:ImageButton ID="btnILogOut" runat="server" AlternateText=" "  class="fas fa-sign-out-alt fa-2x" OnClick="btnILogOut_Click" />--%>
<%--                <asp:Button  ID="btnLogOut"  runat="server" class="fas fa-sign-out-alt fa-2x" OnClick="btnLogOut_Click" />--%>
			</div>



			

			</header> <!-- end row header -->
        <div>
            <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblTitle" runat="server" Text="Leave a Review "></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblRate" runat="server" Text="Rate your Experiance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlRating" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlRating_SelectedIndexChanged">
                            <asp:ListItem Text="0" Value="0"></asp:ListItem>
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Image ID="noStar" runat="server" ImageUrl="/images/zero.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="OneStart" runat="server" ImageUrl="/images/one.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="Start2" runat="server" ImageUrl="/images/two.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="Star3" runat="server" ImageUrl="/images/three.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="Star4" runat="server" ImageUrl="/images/four.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="Star5" runat="server" ImageUrl="/images/five.png" Visible="false" Height="37px" Width="228px"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:Label ID="lblComments" runat="server" Text="Comments: "></asp:Label>
                        <hr />
                        <asp:TextBox ID="txtComments" runat="server" Height="300" Width="500" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblOnline" runat="server" Text="Review Us Online!"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:HyperLink ID="hlGoogle" runat="server" NavigateUrl="https://www.google.com/search?q=Green+Valley+Auction+Virgina&rlz=1C1CHZL_enUS759US759&oq=Green+Valley+Auction+Virgina&aqs=chrome..69i57j0i13i30j0i8i13i30.18964j0j1&sourceid=chrome&ie=UTF-8" Target="_blank">Google Review</asp:HyperLink>
                    </asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:HyperLink ID="hlFacebook" runat="server" NavigateUrl="https://www.facebook.com/greenvalleyauctions/" Target="_blank">Facebook</asp:HyperLink>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:HyperLink ID="hlYelp" runat="server" NavigateUrl="https://www.yelp.com/biz/green-valley-auctions-mount-crawford" Target="_blank">yelp</asp:HyperLink>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
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
