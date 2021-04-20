<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Auction_Scheduling.aspx.cs" Inherits="GreenValleyAuctions.Auction_Scheduling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="row">
                   <div class="col-md-1">
                    <a class="nav-link" href="Customer_Info.aspx">Profile</a>
                 </div>

        <div class="col-md-1 offset-md-0">
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
          <div class="col-md-1 offset-md-1">
                    <a class="nav-link" href="Service_Ticket.aspx">Notes</a>
                 </div>


         <%--<div class="sticky">
  <div class="text-left">
      <h3> Notes:</h3>
    </div>
    <form>
      <div class="form-group">
    <label class= "Additional Notes"> </label>
    <asp:TextBox ID="txtSideNotes" runat="server" class="form-control" placeholder="Notes" Wrap="true" TextMode="MultiLine" AutoPostBack="true" OnTextChanged="txtSideNotes_TextChanged"></asp:TextBox>
    
  </div>
</form>
</div>--%>

        </div>

    <%-------------------------------------------------------------------------------------------------------------------------------%>

    <div class="text-center">
            <h3> Auction Schedule Form </h3>
            </div>

    <div class="container col-md-8">

            <div class="row">
              <div class="col-md-2">
          <div class="form-check">
              
              <label class="form-check-label" for="flexCheckDefault">
                Look At: 
              </label>
            </div>
                  <br />
                  <div class="col-md-2">
          <div class="form-check">
              
              <label class="form-check-label" >Bring In:</label>
            </div>
            </div>

            </div>
            <div class="col-md-4 offset-md-4">
            <div class="form-check form-check-inline">
               <asp:CheckBox ID="cbLookAt" runat="server" AutoPostBack="true" UseSubmitBehavior="false" OnCheckedChanged="cbLookAt_CheckedChanged" CausesValidation="false"/>
      </div>

                 
      <div class="form-check form-check-inline">
                        <asp:RadioButtonList ID="rblBringInOrPickUP" runat="server" RepeatDirection="Horizontal" CausesValidation="true">
                            <asp:ListItem Text="Bring In" Value="Bring In"></asp:ListItem>
                              <asp:ListItem Text="Pick Up" Value="Pick Up"></asp:ListItem>
                        </asp:RadioButtonList>
       
       
        <asp:RequiredFieldValidator ID="rfvBorP" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblBringInOrPickUP"></asp:RequiredFieldValidator>
    </div>
        </div>
          </div>

        <br>

<div id="lookat" runat="server" visible="false">
            <div class="row">
            <div class="col-md-2">
          <p> Truck Accessibiliy: </p>
            </div>
          <br />
          <div class="col-md-2">
           <p> Distance to Door: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtDistance" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvDistance" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtDistance"></asp:RequiredFieldValidator>

            </div>
          </div>
        <br>


            <div class="row">
            <div class="col-md-2">
          <p> Driveway Conditons: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtDriveWayConditions" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvconditions" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtDriveWayConditions"></asp:RequiredFieldValidator>
            </div>
            <!-- CHECKBOXES -->
            <div class="form-check">
               <p><asp:Label ID="lblSupplies" runat="server" Text="Supplies needed: "></asp:Label></p>
               <asp:CheckBoxList ID="cblSupplies" runat="server" UseSubmitBehavior="false" RepeatDirection="Horizontal" RepeatColumns="2" DataSourceID="datasrcSupplies" DataTextField="SupplyType" DataValueField="SupplyID" OnDataBound="cblSupplies_DataBound"></asp:CheckBoxList>

              
            </div>
            
      </div>

        <br>

    

            <div class="row">
            <div class="col-md-2">
          <p> Number of Boxes: </p>
            </div>
          <div class="col-md-4">
                        <asp:TextBox ID="txtsmallBox" runat="server" placeholder="Small" Class="form-control"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvsmallbox" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtsmallBox"></asp:RequiredFieldValidator>
            </div>
        <div class="col-md-4">
                         <asp:TextBox ID="txtMedBox" runat="server" placeholder="Medium" Class="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvmedbox" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtMedBox"></asp:RequiredFieldValidator>

            </div>
                <div class="col-md-4">
                    <asp:TextBox ID="txtLrgBox" runat="server" placeholder="Large" Class="form-control"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvlrgbox" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtLrgBox"></asp:RequiredFieldValidator>

            </div>
                <div class="col-md-4">
                         <asp:TextBox ID="txtArtBox" runat="server" placeholder="Art" Class="form-control"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="rfvart" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtArtBox"></asp:RequiredFieldValidator>

            </div>
                <div class="col-md-4">
                     <asp:TextBox ID="txtsPads" runat="server" placeholder="Small Pads" Class="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvsmallPads" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtsPads"></asp:RequiredFieldValidator>
            
                </div>
                <div class="col-md-4">
                         <asp:TextBox ID="txtLPads" runat="server" placeholder="Large Pads" Class="form-control"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="rfvlargePads" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtLPads"></asp:RequiredFieldValidator>

            </div>
          </div>
  
          <div class="row">
            <div class="col-md-2">
          <p> How Many Trucks: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtQuantityTrucks" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvQuantityTrucks" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtQuantityTrucks" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
              <asp:CustomValidator ID="cvTrucks" UseSubmitBehavior="false" runat="server" ErrorMessage="CustomValidator" Text="Trucks selected and number of trucks are not equal" OnServerValidate="cvTrucks_ServerValidate"></asp:CustomValidator>
                        
            </div>
       <div class="col-md-2">
          <p> Select Which Trucks: </p>
            </div>
          
             <div class="col-md-4">
              <div class="dropdown">
                        <asp:DropDownList ID="ddlTrucks" runat="server" DataTextField="EquipmentName" UseSubmitBehavior="false" DataValueField="EquipmentID" DataSourceID="datasrcTruckList" OnDataBound="ddlTrucks_DataBound"></asp:DropDownList>
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
  </div>
</div>
</div>
          

          <div class="row">
          <div class ="col-md-3 offset-md-6">
        <asp:Button ID="btnAdd" runat="server" UseSubmitBehavior="false" Text="Add Truck" OnClick="btnAdd_Click" CausesValidation="false" class="btn btn-primary btn-intake" />
        </div>
        <div class ="col-md-3 ">
               <asp:Button ID="btnRemoveTruck" UseSubmitBehavior="false" runat="server" Text="Remove Truck" OnClick="btnRemoveTruck_Click" CausesValidation="false" class="btn btn-primary btn-intake" />
        </div>
      </div>

          <br>
    <div class="col-md-2">
    <asp:ListBox ID="lbTrucks" runat="server"></asp:ListBox>
        </div>

    <br />
    <div class="row">
            <div class="col-md-2">
          <p> How Many Crew Members: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtQuantityMovers" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtQuantityMovers" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvnumMovers" UseSubmitBehavior="false" runat="server" ErrorMessage="CustomValidator" Text="Movers selected and number of movers not equal" OnServerValidate="cvnumMovers_ServerValidate"></asp:CustomValidator>
                   
            </div>
       <div class="col-md-2">
          <p> Select Which Employee: </p>
            </div>
          
             <div class="col-md-4">
              <div class="dropdown">
  <asp:DropDownList ID="ddlMovers" runat="server" UseSubmitBehavior="false"  DataTextField="Worker" DataValueField="EmployeeID" DataSourceID="datasrcMovers" OnDataBound="ddlMovers_DataBound"></asp:DropDownList>
                        <asp:Label ID="lblMoverError" runat="server" Text=""></asp:Label>
</div>
</div>
          </div>

          <div class="row">
          <div class ="col-md-3 offset-md-6">
                        <asp:Button ID="btnAddMover" UseSubmitBehavior="false" runat="server" Text="Add Movers" OnClick="btnAddMover_Click" CausesValidation="false" class="btn btn-primary btn-intake" />
        </div>
        <div class ="col-md-3 ">
                        <asp:Button ID="btnRemove" UseSubmitBehavior="false" runat="server" Text="Remove Movers" OnClick="btnRemove_Click" CausesValidation="false" class="btn btn-primary btn-intake" />
        </div>
      </div>

          <br>
    <div class="col-md-2">
    <asp:ListBox ID="lbMovers" runat="server" ></asp:ListBox>
        </div>

    
          <br>

           <div class="row">
            <div class="col-md-4">
          <p> Select Auction Dates </p>
            </div>
            <div class="col-md-4">
          <asp:TextBox ID="txtDate" runat="server" TextMode="Date" ></asp:TextBox>
            </div>
               
          <div class ="col-md-3 offset-md-2">
                <asp:Button ID="btnAddDate" runat="server" UseSubmitBehavior="false" Text="Add Date" OnClick="btnAddDate_Click" CausesValidation="false" class="btn btn-primary btn-intake" />
        </div>
        <div class ="col-md-3 ">
        <asp:Button ID="btnRemoveDate" runat="server" UseSubmitBehavior="false" Text="Remove Date" OnClick="btnRemoveDate_Click" CausesValidation="false" class="btn btn-primary btn-intake" />
                <asp:Label ID="lblDateError" runat="server" Text=""></asp:Label>
        </div>
      </div>
    <div class="col-md-4">
     <asp:ListBox ID="lbDate" runat="server"></asp:ListBox>
</div>
      <br>

          <div class="row">
            <div class="col-md-6">
      <div class="custom-file">
        <asp:FileUpload ID="fuInventory" UseSubmitBehavior="false" runat="server"/>
        <label class="custom-file-label" for="customFile">Upload Inventory Form</label>
    </div>
    </div>
         <div class="col-md-6">
      <div class="custom-file">
        <asp:FileUpload ID="fuPhotos" UseSubmitBehavior="false" runat="server" AllowMultiple="true" />
        <label class="custom-file-label" for="customFile">Upload Images</label>
    </div>
    </div>
  </div>

     <div class="row">
          <div class ="col-md-2 ">
                <asp:Button ID="btnPopulate" UseSubmitBehavior="false" runat="server" Text="Populate" OnClick="btnPopulate_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill" />
      </div>

        <div class="col-md-2 offset-md-6">

         <asp:Button ID="btnSave" runat="server" UseSubmitBehavior="false" Text="Save" OnClick="btnSave_Click" class="btn btn-primary btn-intake rounded-pill" />
       </div>

       <div class="col-md-1">
        <asp:Button ID="btnClear" runat="server" UseSubmitBehavior="false" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill"/>
      </div>
    

      
</div>

 </div>
</div>

       

<%--    ----------------------------------------------------------------------------------------------------------------------------------------%>
           <%-- <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAuction_scheduling" runat="server" Text="Auction Scheduling Form"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLookAt" runat="server" Text="Look At: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblBringInOrPickUP" runat="server" Text="Bring In or Pick Up : "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                       
                    </asp:TableCell>
                     <asp:TableCell>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="truck" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblTruck" runat="server" Text="Tuck Accesibility"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="accesbility" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblDistance" runat="server" Text="Distance to door: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="driveway" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblDriveWay" runat="server" Text="Driveway Conditions: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="supplies" Visible="false">
                    <asp:TableCell VerticalAlign="Top">
                    </asp:TableCell>
                    <asp:TableCell>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Boxes" Visible="false">
                    <asp:TableCell VerticalAlign="Top">
                        <asp:Label ID="lblNumBoxes" runat="server" Text="Number of Boxes: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                         
                    </asp:TableCell>
                     <asp:TableCell>
                       
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Qtruck" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblQTruck" runat="server" Text="How Many Trucks: "></asp:Label>
                        </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="whichtrucks" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblTrucks" runat="server" Text="Select which Trucks: "></asp:Label>
                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="listTrucks" Visible="false">
                    <asp:TableCell>
                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Qmovers" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblQMovers" runat="server" Text="How Many Crew Members: "></asp:Label>
                         </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="whichCrew" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblSelecetMovers" runat="server" Text="Select which Employee: "></asp:Label>
                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="listCrew" Visible="false">
                    <asp:TableCell>
                        
                    </asp:TableCell>
                </asp:TableRow>
                
        
            </asp:Table>
     
    <br />
    <asp:Table ID="AuctionDate" runat="server" Visible="false" HorizontalAlign="Center" >
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDate" runat="server" Text="Select Auction Dates "></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                
            </asp:TableCell>
            <asp:TableCell>
            </asp:TableCell>
            <asp:TableCell>
                
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
               
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Table ID="noPostback" runat="server" HorizontalAlign="Center" Visible="false">
            <asp:TableRow ID="invForm" Visible="false">
                <asp:TableCell>
                    <asp:Label ID="lblInventoryForm" runat="server" Text="Upload Inventory Form: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow ID="RowLookAt" Visible="false">
                <asp:TableCell>
                    <asp:Label ID="lblImages" runat="server" Text="Upload Images: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
    <br />
    <asp:Table ID="tblButtons" runat="server" HorizontalAlign="Center" Width="500px" >
        <asp:TableRow>
            <asp:TableCell>
            </asp:TableCell>
            <asp:TableCell>
                
            </asp:TableCell>
            <asp:TableCell>
                
            </asp:TableCell>
            
        </asp:TableRow>
    </asp:Table>--%>
     <%--sql Data Sources--%>
    <asp:SqlDataSource ID="datasrcTruckList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select EquipmentName, EquipmentID from Equipment; "></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcMovers" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select trim(EmployeeFirstName)+ ' '+ trim(ISNULL(EmployeeLastName,'')) as Worker, EmployeeID from Employee; "></asp:SqlDataSource>
     <asp:SqlDataSource ID="datasrcSupplies" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select SupplyID, SupplyType from Supplies; "></asp:SqlDataSource>
    
</asp:Content>
