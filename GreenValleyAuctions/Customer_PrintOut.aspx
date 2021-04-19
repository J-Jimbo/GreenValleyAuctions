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
                <a class="dropdown-item" href="Move_Schedule_Screen.aspx">Move Schedule</a>
                <a class="dropdown-item" href="#">Move Assessment</a>
                <a class="dropdown-item" href="Move_Form.aspx">Move Form</a>
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

    <asp:Label ID="lblInfo" runat="server" Text="Customer Information" Font-Bold="true"></asp:Label>
    <br />
    <asp:Label ID="lblFilter" runat="server" Text="Filters:"></asp:Label>
    <br />
    <asp:CheckBox ID="cbCustomer" Text="Customer Info" AutoPostBack="true" OnCheckedChanged="cbCustomer_CheckedChanged" runat="server" />
    <asp:CheckBox ID="cbintial" Text="Service Info" AutoPostBack="true" OnCheckedChanged="cbintial_CheckedChanged" runat="server" />
    <asp:CheckBox ID="cbdate" Text="Service Dates" AutoPostBack="true" OnCheckedChanged="cbdate_CheckedChanged" runat="server" />
    <asp:CheckBox ID="cbEE" Text="Equipment & Employees" AutoPostBack="true" OnCheckedChanged="cbEE_CheckedChanged" runat="server" />
    <asp:CheckBox ID="cbEnd" Text="Customer Review" AutoPostBack="true" OnCheckedChanged="cbEnd_CheckedChanged" runat="server" />

    <div id="customer" runat="server" visible="true">
    <asp:Table ID="CustomerInfo" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lnlName" runat="server" Text="Name: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblCustomerName" runat="server" Text=""></asp:Label>
            </asp:TableCell>
             <asp:TableCell>
                <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblCustomerEmail" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblAddress" runat="server" Text="Address: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblCustomerAddress" runat="server" Text=""></asp:Label>
            </asp:TableCell>
              <asp:TableCell>
            <asp:Label ID="lblnum" runat="server" Text="Phone: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <hr />
        </div>
    <div id="service" runat="server" visible="true">
    <asp:Label ID="lblServiceInfo" runat="server" Text="Service Information"></asp:Label>
    <asp:Table ID="tableservice" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblType" runat="server" Text="Service Type: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblService" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEngage" runat="server" Text="EngagmentDate: "></asp:Label>
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
        </div>
    <div id="date" runat="server" visible="true">
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
        </div>
    <div id="EmpEquip" runat="server" visible="true">
    <asp:Table ID="EE" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEmp" runat="server" Text="Employees: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:ListBox ID="lbEmpAuction" runat="server" DataTextField="Worker" DataSourceID="datasrcMovers" Visible="false"></asp:ListBox>
                <asp:ListBox ID="lbEmpMove" runat="server" DataTextField="Worker" DataSourceID="sqldatasrcEmpMove" Visible="false"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEquipment" runat="server" Text="Equipment: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:ListBox ID="lbEquipmentAuction" runat="server" DataTextField="EquipmentName" DataSourceID="datasrcTruckList" Visible="false"></asp:ListBox>
                 <asp:ListBox ID="lbEquipmentMove" runat="server" DataTextField="EquipmentName" DataSourceID="sqldatasrcTruckMove" Visible="false"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblSupplies" runat="server" Text="Supplies: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:ListBox ID="lbSupply" runat="server" DataTextField="SupplyType" DataSourceID="datasrcSupplies" Visible="false"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <hr />
        </div>
    <div id="end" runat="server" visible="true">

   
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
        </div>
    <%--data sources--%>
    <asp:SqlDataSource ID="datasrcTruckList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select EquipmentName from Equipment E inner join ASEquipment ASE on E.EquipmentID = ASE.EquipmentID inner join 
        AuctionSchedulingForm ASF on ASE.SchedulingFormID  = ASF.SchedulingFormID inner join WorkFlow wf on ASF.WorkFlowID = wf.WorkFlowID 
        inner join Customer C on C.CustomerID = wf.CustomerID where C.CustomerID = @ID ; ">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="Customer" Type="Int32"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcMovers" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select trim(EmployeeFirstName)+ ' '+ trim(ISNULL(EmployeeLastName,'')) as Worker from Employee E inner join ASEmployee ASE on ASE.EmployeeID = E.EmployeeID inner join 
        AuctionSchedulingForm ASF on ASE.SchedulingFormID  = ASF.SchedulingFormID inner join WorkFlow wf on ASF.WorkFlowID = wf.WorkFlowID 
        inner join Customer C on C.CustomerID = wf.CustomerID where C.CustomerID = @ID ; ">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="Customer" Type="Int32"/>
        </SelectParameters>
    </asp:SqlDataSource>
     <asp:SqlDataSource ID="datasrcSupplies" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select SupplyType from Supplies S inner join ASSupplies ASS on ASS.SupplyID = S.SupplyID inner join 
        AuctionSchedulingForm ASF on ASS.SchedulingFormID  = ASF.SchedulingFormID inner join WorkFlow wf on ASF.WorkFlowID = wf.WorkFlowID 
        inner join Customer C on C.CustomerID = wf.CustomerID where C.CustomerID = @ID ; ">
         <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="Customer" Type="Int32"/>
        </SelectParameters>
     </asp:SqlDataSource>


    <asp:SqlDataSource ID="sqldatasrcTruckMove" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select EquipmentName from Equipment E inner join MSEquipment MSE on E.EquipmentID = MSE.EquipmentID inner join 
        MovingScreen MS on MSE.MovingScreenID  = MS.MovingScreenID inner join WorkFlow wf on MS.WorkFlowID = wf.WorkFlowID 
        inner join Customer C on C.CustomerID = wf.CustomerID where C.CustomerID = @ID ; ">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="Customer" Type="Int32"/>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource ID="sqldatasrcEmpMove" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select trim(EmployeeFirstName)+ ' '+ trim(ISNULL(EmployeeLastName,'')) as Worker from Employee E inner join MSEmployee MSE on MSE.EmployeeID = E.EmployeeID inner join 
         MovingScreen MS on MSE.MovingScreenID  = MS.MovingScreenID inner join WorkFlow wf on MS.WorkFlowID = wf.WorkFlowID 
        inner join Customer C on C.CustomerID = wf.CustomerID where C.CustomerID = @ID ; ">
        <SelectParameters>
            <asp:SessionParameter Name="ID" SessionField="Customer" Type="Int32"/>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
