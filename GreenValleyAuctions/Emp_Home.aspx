<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Emp_Home.aspx.cs" Inherits="Lab2.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <meta charset="UTF-8"/>
		<meta name="description" content="The Hub"/>
	  	<meta name="author" content="Lindsey McKim"/>
		<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
		<title>Green Valley</title>

		<!-- Bootstrap v4.4.1 -->
		<link href="css/bootstrap.min.css" rel="stylesheet" type="text/css" media="screen"/>
		<link href="css/custom.css" rel="stylesheet" type="text/css" media="screen"/>
		<link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,600;0,700;0,800;1,300;1,400;1,600;1,700;1,800&family=Oswald&display=swap" rel="stylesheet"/>
		<link href="https://fonts.googleapis.com/css2?family=Quattrocento:wght@400;700&display=swap" rel="stylesheet"/>
		<script src="https://kit.fontawesome.com/92cf74d3dd.js" crossorigin="anonymous"></script>
    
</head>
<body>

   <header class="row headernav"> <!-- Logo Starts Here -->
				

				<nav class="col-md-4"> <!-- header starts here - nav pills -->
					 <ul class="nav nav-pills justify-content-start">
		              <li class="nav-item">
		                <a class="nav-link" href="Customer_Search.aspx">Clients</a>
		              </li>
		              
		              <li class="nav-item">
		                <a class="nav-link" href="WareHouse.aspx">Warehouse</a>
		              </li>

		              
		            </ul>
		            </nav>
				

					<div class ="col-md-2 offset-md-1">
					<div class="logo3">
					<a href="Emp_Home.aspx"><img class="img-fluid logo" src="images/gvalogo.png" alt="Green Valley Auctions and Moving Logo"></a>
					</div>
				</div><!-- end logo -->

				<div class ="col-md-2 offset-md-1">
				<a class="btn btn-primary btn-intake rounded-pill" href="Create_Customer.aspx" role="button">New Client</a>
			</div>

				<div class ="col-md-2">
				<i class="fas fa-search fa-2x"></i>
				<i class="fas fa-calendar-alt fa-2x"></i>
				<a href="Confirm_Logout.aspx"><i class="fas fa-sign-out-alt fa-2x"></i></a>
		
				 <br />
				<asp:Label ID="lblCurrentUser" runat="server" Text=""></asp:Label>	
			</div>



			

			</header> <!-- end row header -->
    <div class="text-center">
			<h2>Welcome!</h2>
		</div>

		<div class="row">
		<div class="heading col-md-9">
			<h3>Pinned Notifications</h3>
		</div>


		<!--<div class="heading col-md-3 newnotification">
			<h3>New Notification</h3>
		</div>
	</div> -->

	<!-- Button trigger modal -->
	<div class=" heading col-md-3 newnotification">
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModalCenter">
  New Notification
</button>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title text-center" id="exampleModalLongTitle">Create New Notification</h3>


        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      	<div class="col-md-3">
        <p> Send to... </p>
    </div>
        <div class="dropdown col-md-9">
  <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
    View All Contacts
  </button>
  <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
    <a class="dropdown-item" href="#">Greg</a>
    <a class="dropdown-item" href="#">Self</a>
    <a class="dropdown-item" href="#">All Contacts</a>
  </div>
</div>
</div>
<div class="form-group">
    <label for="exampleFormControlTextarea1">Message</label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
  </div>
  <div class="row">
  <div class="col-md-3">
        <p> Priority </p>
    </div>

    <div class="col-md-9">
    <button type="button" class="btn btn-secondary rounded-pill lowbutton" data-dismiss="modal">Low</button>

    <button type="button" class="btn btn-secondary rounded-pill mediumbutton" data-dismiss="modal">Medium</button>

    <button type="button" class="btn btn-secondary rounded-pill highbutton" data-dismiss="modal">High</button>
</div>
</div>

	<div class="row">
    <div class="col-md-3">
        <p> Date</p>
    </div>

    <div class="col-md-9">
    <label class="switch">
  <input type="checkbox"/>
  <span class="slider round"></span>
</label>
</div>
</div>

	<div class="row">
    <div class="col-md-3">
        <p> Time</p>
    </div>

    <div class="col-md-9">
    <label class="switch">
  <input type="checkbox"/>
  <span class="slider round"></span>
</label>
      </div>
  </div>
</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

		
		

		<div class="modal fade" id="remindermodal" tabindex="-1" role="dialog"  aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h3 class="modal-title text-center" id="exampleModalLongTitle1">Set Reminder</h3>


         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      	<div class="row">
      		<div class="col-md-3">
        <p> Date  </p>
    </div>
</div>
        
        <div class="row">
  <div class="col-md-4">
        <p> Time</p>
    </div>

    
</div>



	
</div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>



		<div class="buttons">
		<button type="button" class="btn btn-primary btn-lg btn-block notification text-left">URGENT: Message From Greg <i class="fas fa-bell"></i> Set Reminder</button>

		<button type="button" class="btn btn-primary btn-lg btn-block notification2 text-left">Message from Elizabeth<i class="fas fa-bell bell2"></i> Set Reminder</button>
		</div>
        
			<form id="form1" runat="server">
        <div>
          
            <asp:Table ID="tblTasks" runat="server">
                <asp:TableRow>
                 <asp:TableCell>
                         <%--  <asp:Table ID="tblHome" runat="server" Height="200px" Width="800px" style="margin-top: 9px" HorizontalAlign="left">
                             Create Buttons for Navigation
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <asp:Label ID="lblWelcome" runat="server" Text="Welcome Employee"></asp:Label>
                                    <br />
                                     <asp:Label ID="Label1" runat="server" Text="Created by: Madison Consulting 04" ></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>--%>
                        
                    </asp:TableCell>
                </asp:TableRow>
				<asp:TableRow>
					<asp:TableCell>
						<asp:Table ID="tblNotifications" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                   <h3> <asp:Label ID="lblNotifications" runat="server" Text="Pending Requests: "></asp:Label></h3>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:ListBox ID="lbNotifications" runat="server" DataSourceID="datasrcNotifications" AutoPostBack="true" DataTextField="CustomerName" DataValueField="CustomerRequestID" Width="1200" ForeColor="#266141"></asp:ListBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Button ID="btnProcess" runat="server" Text="Process Request" OnClick="btnProcess_Click" Class="btn btn-primary btn-lg"/>
                                </asp:TableCell>
                            </asp:TableRow>
                          </asp:Table>
        
					</asp:TableCell>
				</asp:TableRow>
            </asp:Table>
			<br />
              <%--sql Data scources --%>
            <asp:SqlDataSource ID="datasrcNotifications" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="SELECT trim(FirstName) + ' ' + trim(LastName)+'--'+CAST(DateCreated as VARCHAR)+'-->'+ Status as CustomerName, cr.CustomerRequestID, DateCreated from ServiceRequest sr inner join CustomerRequest cr  on sr.CustomerRequestID = cr.CustomerRequestID order by DateCreated DESC"></asp:SqlDataSource>
         
        </div>
    </form>



	<div class="card-columns">
  <div class="card bg-primary">
    <div class="card-body" style="height: 18rem;">
    	
      <a class="card-text">TO DO: <br> <ul><li> <li> <li></ul></a>

    </div>
  </div>
  <div class="card bg-warning">
    <div class="card-body" style="height: 18rem;">
      <a class="card-text">STICKY NOTE <br> <br> Type note...</a>
    </div>
  </div>
  <div class="card bg-success">
    <div class="card-body text-center" style="height: 18rem;">
      <a class="card-text"> + <br> STICKY NOTE</a>
    </div>
  </div>
</div>











    
   
       <!-- jQuery and Bootstrap links - do not delete! -->
	<%--<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>--%>
    <script src="Scripts/jquery-3.5.1.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.bundle.min.js"></script>
    <!-- end of do not delete -->
</body>
</html>
