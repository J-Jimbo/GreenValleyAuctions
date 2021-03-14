<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Customer_Info.aspx.cs" Inherits="GreenValleyAuctions.Customer_Info" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="TableInception" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table ID="CustomerInfo" runat="server">
                      <asp:TableRow>
                            <asp:TableCell>
                                <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                            </asp:TableCell>
                        </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
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
                            <asp:Button ID="btnCreateServiceEvent" runat="server" Text="Create Service Event" OnClick="btnCreateServiceEvent_Click"  width="200px" />
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnAuctionSchedule" runat="server" Text="Create Auction Schedule" OnClick="btnAuctionSchedule_Click"  width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnAuctionPickup" runat="server" Text="Create Auction PickUp" OnClick="btnAuctionPickup_Click"  width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnMoveForm" runat="server" Text="Create Move Form" OnClick="btnMoveForm_Click" width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnMoveScreen" runat="server" Text="Create Move Screen" OnClick="btnMoveScreen_Click"  width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnCompletion" runat="server" Text="Create Completion Form" OnClick="btnCompletion_Click" width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <hr />
                            <asp:Button ID="btnNote" runat="server" Text="Create Note" width="200px"  OnClick="btnNote_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnEditServiceTicket" runat="server" Text="Edit Service Ticket" OnClick="btnEditServiceTicket_Click" width="200px"/>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnCustomerHistory" runat="server" Text="View Customer History" OnClick="btnCustomerHistory_Click"  width="200px" />
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
</asp:Content>
