<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Customer_PrintOut.aspx.cs" Inherits="GreenValleyAuctions.Customer_PrintOut" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div class="row">
                  
        <div class="col-md-1">
                    <a class="nav-link" href="Customer_Info.aspx">Profile</a>
     </div>

         
                  
            <div id="move" runat="server" class="col-md-1 offset-md-0" visible="false">
             <div class="dropdown">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Move Forms
              </button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="Move_Schedule_Screen.html">Move Schedule</a>
                <a class="dropdown-item" href="#">Move Assessment</a>
                <a class="dropdown-item" href="Move_Form.html">Move Form</a>
                <a class="dropdown-item" href="Completion_Form.aspx">Completion Form</a>

              </div>
            </div>
            </div>

            <div id="auction" runat="server" class="col-md-1 offset-md-0">
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

    <asp:Label ID="lblInfo" runat="server" Text="Customer Information"></asp:Label>
    <asp:Table ID="CustomerInfo" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomerName" runat="server" Text=""></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblCustomerEmail" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomerAddress" runat="server" Text=""></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <hr />
    <asp:Label ID="lblServiceInfo" runat="server" Text="Service Information"></asp:Label>
    <asp:Table ID="tableservice" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblService" runat="server" Text=""></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblEngagmentDate" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblLookAt" runat="server" Text="Lookat: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblLookYN" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDownSize" runat="server" Text="DownSize: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblDSYN" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEstate" runat="server" Text="Estate: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblEYN" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMove" runat="server" Text="Moving: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblMYN" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <hr />
        <asp:Table runat="server">
            <asp:TableRow>
                <asp:TableCell>
                      <asp:Label ID="lblPotentialDates" runat="server" Text="Potential Dates: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblDate1" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblDate2" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblRange" runat="server" Text="Date Range: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                   <asp:Label ID="lblbDateStart" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblDateEnd" runat="server" Text="Label"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    <hr />
    <asp:Table ID="E&E" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEmp" runat="server" Text="Employees: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:ListBox ID="lbEmp" runat="server"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEquipment" runat="server" Text="Equipment: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:ListBox ID="lbEquipment" runat="server"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblSupplies" runat="server" Text="Supplies: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:ListBox ID="lbSupply" runat="server"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <hr />
    <asp:Table ID="tblComplete" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCompDate" runat="server" Text="Completion Date: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblDate" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblReview" runat="server" Text="Review: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblCustomerReview" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    
</asp:Content>
