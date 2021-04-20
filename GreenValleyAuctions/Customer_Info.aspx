<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Customer_Info.aspx.cs" Inherits="GreenValleyAuctions.Customer_Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="row">
                  


         
                  
            <div id="move" runat="server" class="col-md-1 offset-md-0" visible="false">
             <div class="dropdown">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Move Forms
              </button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="Move_Schedule_Screen.aspx">Move Schedule</a>
                <a class="dropdown-item" href="#">Move Assessment</a>
                <a class="dropdown-item" href="Move_Form.aspx">Move Form</a>
                <a class="dropdown-item" href="Completion_Form.aspx">Completion Form</a>

              </div>
            </div>
            </div>

            <div id="auction" runat="server" class="col-md-1 offset-md-0" visible="false">
             <div class="dropdown">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Auction Forms
              </button>
              <div class="dropdown-menu">
                
                
                <a class="dropdown-item" href="Auction_Scheduling.aspx">Auction Scheduling</a>
                <a class="dropdown-item" href="Auction_Assessment.aspx">Auction Assessment</a>
                <a class="dropdown-item" href="Auction_Pick_Up.aspx">Auction Pick Up Form</a>
                <a class="dropdown-item" href="Add_Inventory.aspx">Auction Inventory</a>
                <a class="dropdown-item" href="Completion_Form.aspx">Completion Form</a>
              </div>
            </div>
            </div>
            

          </div>   




     <asp:Table ID="TableInception" runat="server" Align="Left" Width="30%">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table ID="CustomerInfo" runat="server" BorderColor="Black"   >
                    <asp:TableRow>
                        <asp:TableCell>
                            <h3> Contact Information </h3>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblTAddress" runat="server" Text="Address: " ForeColor="Gray"></asp:Label>
                            <asp:Label ID="lblAddress" runat="server" Text="" ForeColor="Gray"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                           <p> Email: 
                            <asp:Label ID="lblEmail" runat="server" Text="" ></asp:Label></p>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <p><asp:Label ID="lblTPhone" runat="server" Text="Phone: "   ></asp:Label>
                           <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label></P>
                        </asp:TableCell>
                    </asp:TableRow>
                    

                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow VerticalAlign="Top">
            <asp:TableCell>
                <asp:Table ID="TableForms" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnCreateServiceEvent" runat="server" Text="Create Service Event" class="btn btn-primary btn-intake rounded-pill" OnClick="btnCreateServiceEvent_Click"  width="220px" />
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnAuctionSchedule" runat="server" Text="Create Auction Schedule" class="btn btn-primary btn-intake rounded-pill" OnClick="btnAuctionSchedule_Click"  width="220px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnAuctionAssessment" runat="server" Text="Create Auction Assessment" class="btn btn-primary btn-intake rounded-pill" Width="220px" OnClick="btnAuctionAssessment_Click" />
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnAuctionPickup" runat="server" Text="Create Auction PickUp" class="btn btn-primary btn-intake rounded-pill" OnClick="btnAuctionPickup_Click"  width="220px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnAddInventory" runat="server" Text="Add Item" class="btn btn-primary btn-intake rounded-pill" OnClick="btnAddInventory_Click" Width="220px" />
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnMoveForm" runat="server" Text="Create Move Form" class="btn btn-primary btn-intake rounded-pill" OnClick="btnMoveForm_Click" width="220px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnMoveScreen" runat="server" Text="Create Move Screen" class="btn btn-primary btn-intake rounded-pill" OnClick="btnMoveScreen_Click"  width="220px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnCompletion" runat="server" Text="Create Completion Form" class="btn btn-primary btn-intake rounded-pill" OnClick="btnCompletion_Click" width="220px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                   
                    <asp:TableRow>
                        <asp:TableCell>
                            <hr />
                            <asp:Button ID="btnNote" runat="server" Text="Create Note" width="220px" class="btn btn-primary btn-intake rounded-pill"  OnClick="btnNote_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnEditServiceTicket" runat="server" Text="Edit Service Ticket" class="btn btn-primary btn-intake rounded-pill" OnClick="btnEditServiceTicket_Click" width="220px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnCustomerHistory" runat="server" Text="View Customer History" class="btn btn-primary btn-intake rounded-pill" OnClick="btnCustomerHistory_Click"  width="220px" />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <hr />
                            <asp:Button ID="btnReport" runat="server" Text="Customer Print Out" OnClick="btnReport_Click" class="btn btn-primary btn-intake rounded-pill" width="220px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
            <%--<asp:TableCell VerticalAlign="Top">
                 <asp:Table ID="tblHistory" runat="server" >
                     
                     <asp:TableRow  >
                         <asp:TableCell ColumnSpan="2" >
                             <asp:Label ID="lblTitleList" runat="server" Text="Note Title: "  Width="200"></asp:Label>
                              <asp:Label ID="lblEmplist" runat="server" Text="Employee History:" Width="200"></asp:Label>
                             <br />
                             <asp:ListBox ID="lbTitleList" runat="server"  AutoPostBack="true" DataTextField="TicketName"  DataValueField="WFHistoryID"  OnSelectedIndexChanged="lbTitleList_SelectedIndexChanged" width="200"></asp:ListBox>
                             <asp:ListBox ID="lbEmployeeList" runat="server" AutoPostBack="true"  DataTextField="employeeName" DataValueField="WFHistoryID" Width="200"></asp:ListBox>
                         </asp:TableCell>
                     </asp:TableRow>
                     <asp:TableRow>
                         <asp:TableCell>
                             <asp:Label ID="lblNoteBody" runat="server" Text="Note Body: "></asp:Label>
                             <br />
                             <asp:TextBox ID="txtNoteBody" runat="server" width="400" height="200" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                         </asp:TableCell>
                     </asp:TableRow>
                            
                </asp:Table>
            </asp:TableCell>--%>
       </asp:TableRow>  
       
       
    </asp:Table>
    <asp:Table ID="tblCInfo" runat="server" Width="70%"  Align="Right" >
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <h3><asp:Label ID="lblName" runat="server" Text="" Font-Bold="true"  ></asp:Label></h3>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="moveimages" runat="server" Visible="false">
            <asp:TableCell>
                <p><asp:Label ID="lblStatusBar" runat="server" Text="Status Bar: " Font-Bold="true" ></asp:Label></P>
            </asp:TableCell>
            <asp:TableCell>
               <%-- move images--%>
                            <asp:Image ID="MoveImage1" runat="server" ImageUrl="/images/move status 1.png" Visible="false" Height="110px" Width="594px"/>
                            <asp:Image ID="MoveImage2" runat="server" ImageUrl="/images/move status 2.png" Visible="false" Height="110px" Width="594px"/>
                            <asp:Image ID="MoveImage3" runat="server" ImageUrl="/images/move status 3.png" Visible="false" Height="110px" Width="594px"/>
                            <asp:Image ID="MoveImage4" runat="server" ImageUrl="/images/move status 4.png" Visible="false" Height="110px" Width="594px"/>
                            <asp:Image ID="MoveImage5" runat="server" ImageUrl="/images/move status 5.png" Visible="false" Height="110px" Width="594px"/>
                            <asp:Image ID="MoveImage6" runat="server" ImageUrl="/images/move status 6.png" Visible="false" Height="110px" Width="594px"/>
                            <asp:Image ID="MoveImage7" runat="server" ImageUrl="/images/move status 7.png" Visible="false" Height="110px" Width="594px"/>
                            <asp:Image ID="MoveImage8" runat="server" ImageUrl="/images/move status 8.png" Visible="false" Height="110px" Width="594px"/>
                            <asp:Image ID="MoveImage9" runat="server" ImageUrl="/images/move status 9.png" Visible="false" Height="110px" Width="594px"/>


            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="auctionImages" runat="server" Visible="false">
            <asp:TableCell>
               <p><asp:Label ID="lblAuctionBar" runat="server" Text="Status Bar: " Font-Bold="true" ></asp:Label></P>
            </asp:TableCell>
            <asp:TableCell>
                 <%-- auction images--%>
                <asp:Image ID="AuctionImage1" runat="server" ImageUrl="/images/auction status 1.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage2" runat="server" ImageUrl="/images/auction status 2.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage3" runat="server" ImageUrl="/images/auction status 3.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage4" runat="server" ImageUrl="/images/auction status 4.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage5" runat="server" ImageUrl="/images/auction status 5.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage6" runat="server" ImageUrl="/images/auction status 6.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage7" runat="server" ImageUrl="/images/auction status 7.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage8" runat="server" ImageUrl="/images/auction status 8.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage9" runat="server" ImageUrl="/images/auction status 9.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage10" runat="server" ImageUrl="/images/auction status 10.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage11" runat="server" ImageUrl="/images/auction status 11.png" Visible="false" Height="110px" Width="594px"/>
                <asp:Image ID="AuctionImage12" runat="server" ImageUrl="/images/auction status 12.png" Visible="false" Height="110px" Width="594px"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblClientInformation" runat="server" Text="Client Information" Font-Bold="true"></asp:Label></P>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
               <p> <asp:Label ID="lblTEngagement" runat="server" Text="Engagment Date: "></asp:Label>
                <asp:Label ID="lblEngagement" runat="server" Text=""></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell>
               <p> <asp:Label ID="lblTCompletion" runat="server" Text="Completion: "></asp:Label>
                <asp:Label ID="lblCompletion" runat="server" Text=""></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnEditProgress" runat="server" Text="Edit Status Bar" class="btn btn-primary btn-intake rounded-pill" OnClick="btnEditProgress_Click" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblTCurrentStatus" runat="server" Text="Current Status: "></asp:Label>
                <asp:Label ID="lblCurrentStatus" runat="server" Text=""></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell>
               <p> <asp:Label ID="lblTReview" runat="server" Text="Review: "></asp:Label>
                    <asp:Image ID="noStar" runat="server" ImageUrl="/images/zero.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="OneStart" runat="server" ImageUrl="/images/one.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="Start2" runat="server" ImageUrl="/images/two.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="Star3" runat="server" ImageUrl="/images/three.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="Star4" runat="server" ImageUrl="/images/four.png" Visible="false" Height="37px" Width="228px"/>
                        <asp:Image ID="Star5" runat="server" ImageUrl="/images/five.png" Visible="false" Height="37px" Width="228px"/></p>
            </asp:TableCell>
            <asp:TableCell ID="dropdowns" runat="server" Visible="false">
                            <asp:DropDownList ID="DDLMovingProg" runat="server" width="100px" class="form-control" Visible="false">
                                <asp:ListItem text="Initial Contact" Value="1"></asp:ListItem>
                                 <asp:ListItem text="Ready to Schedule Move Assesment" Value="2"></asp:ListItem>
                                 <asp:ListItem text="Move Assessment Scheduled" Value="3"></asp:ListItem>
                                 <asp:ListItem text="Initial Estimate Sent" Value="4"></asp:ListItem>
                                 <asp:ListItem text="Waiting for Response" Value="5"></asp:ListItem>
                                 <asp:ListItem text="Ready to Schedule Move Service" Value="6"></asp:ListItem>
                                 <asp:ListItem text="Move Service Scheduled" Value="7"></asp:ListItem>
                                <asp:ListItem text="Service Completed" Value="8"></asp:ListItem>
                            </asp:DropDownList>
                             <asp:DropDownList ID="ddlAuctionProg" runat="server" width="100px" Visible="false" class="form-control">
                                 <asp:ListItem text="Initial Contact" Value="1"></asp:ListItem>
                                 <asp:ListItem text="Ready to Schedule Auction Assesment" Value="2"></asp:ListItem>
                                 <asp:ListItem text="Auction Assessment Scheduled" Value="3"></asp:ListItem>
                                 <asp:ListItem text="Present Auction Service Proposal" Value="4"></asp:ListItem>
                                 <asp:ListItem text="Waiting for Response" Value="5"></asp:ListItem>
                                 <asp:ListItem text="Ready to Schedule Auction Service" Value="6"></asp:ListItem>
                                 <asp:ListItem text="Auction Pick Up Scheduled" Value="7"></asp:ListItem>
                                 <asp:ListItem text="Trash Removal Scheduled" Value="8"></asp:ListItem>
                                 <asp:ListItem text="Items in Storage" Value="9"></asp:ListItem>
                                 <asp:ListItem text="Auction Scheduled" Value="10"></asp:ListItem>
                                <asp:ListItem text="Service Completed" Value="11"></asp:ListItem>
                            </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <P><asp:Label ID="lblTInitialNotes" runat="server" Text="Initial Notes: " Font-Bold="true"></asp:Label>
                <asp:Label ID="lblInitialNotes" runat="server" Text="" ></asp:Label></P>
            </asp:TableCell>
            <asp:TableCell>

            </asp:TableCell>
            <asp:TableCell ID="buttons" runat="server" >
                <asp:Button ID="AuctionProgBtn" runat="server" Text="Update" class="btn btn-primary btn-intake rounded-pill" Visible="false" OnClick="AuctionProgBtn_Click" />
                <asp:Button ID="MoveProgBtn" runat="server" Text="Update" class="btn btn-primary btn-intake rounded-pill" OnClick="MoveProgBtn_Click" Visible="false" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblTRecordedNotes" runat="server" Text="Previous Recorded Notes: " Font-Bold="true" ></asp:Label>
                <asp:Label ID="lblRecordedNotes" runat="server" text="             " ></asp:Label></p>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblCustomerNotes" runat="server" Text="Add Customer Notes" Font-Bold="true"></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell>
                <p><asp:TextBox id="txtCustomerNotes" runat="server" ></asp:TextBox><P />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button  ID="btnCustomerNotes" runat="server" Text="Insert Notes" class="btn btn-primary btn-intake rounded-pill" OnClick="btnCustomerNotes_Click" />
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
                <asp:Image ID="imgtest" runat="server"  Height="100px" Width="100px" />
                <asp:Image ID="imgCustomer" runat="server" Height="100px" Width="100px" />

            </asp:TableCell>
            
        </asp:TableRow>
    </asp:Table>
</asp:Content>
