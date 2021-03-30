<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Customer_Info.aspx.cs" Inherits="GreenValleyAuctions.Customer_Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
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
            </asp:TableCell>
        </asp:TableRow>
        
        <asp:TableRow VerticalAlign="Top">
            <asp:TableCell>
                <asp:Table ID="TableForms" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnCreateServiceEvent" runat="server" Text="Create Service Event" class="btn btn-primary btn-intake rounded-pill" OnClick="btnCreateServiceEvent_Click"  width="200px" />
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnAuctionSchedule" runat="server" Text="Create Auction Schedule" class="btn btn-primary btn-intake rounded-pill" OnClick="btnAuctionSchedule_Click"  width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnAuctionPickup" runat="server" Text="Create Auction PickUp" class="btn btn-primary btn-intake rounded-pill" OnClick="btnAuctionPickup_Click"  width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnAddInventory" runat="server" Text="Add Item" class="btn btn-primary btn-intake rounded-pill" OnClick="btnAddInventory_Click" Width="200px" />
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnMoveForm" runat="server" Text="Create Move Form" class="btn btn-primary btn-intake rounded-pill" OnClick="btnMoveForm_Click" width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnMoveScreen" runat="server" Text="Create Move Screen" class="btn btn-primary btn-intake rounded-pill" OnClick="btnMoveScreen_Click"  width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnCompletion" runat="server" Text="Create Completion Form" class="btn btn-primary btn-intake rounded-pill" OnClick="btnCompletion_Click" width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <hr />
                            <asp:Button ID="btnNote" runat="server" Text="Create Note" width="200px" class="btn btn-primary btn-intake rounded-pill"  OnClick="btnNote_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnEditServiceTicket" runat="server" Text="Edit Service Ticket" class="btn btn-primary btn-intake rounded-pill" OnClick="btnEditServiceTicket_Click" width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnCustomerHistory" runat="server" Text="View Customer History" class="btn btn-primary btn-intake rounded-pill" OnClick="btnCustomerHistory_Click"  width="200px" />
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
               <p> <asp:Label ID="lblTEngagement" runat="server" Text="Pick Up Date: "></asp:Label>
                <asp:Label ID="lblEngagement" runat="server" Text=""></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell>
               <p> <asp:Label ID="lblTCompletion" runat="server" Text="Completion: "></asp:Label>
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
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblMedia" runat="server" Text="Media: " Font-Bold="true" ></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell ID="photoCell" Visible="false">
                <p><asp:Image ID="imgtest" runat="server"  Height="100px" Width="100px" /></p>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
