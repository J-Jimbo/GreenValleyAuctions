<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Move_Form.aspx.cs" Inherits="GreenValleyAuctions.Move_Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="row">
                   <div class="col-md-1">
                    <a class="nav-link" href="Customer_Info.aspx">Profile</a>
                 </div>

          <div class="col-md-1 offset-md-0">
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

           <div class="col-md-1 offset-md-1">
                    <a class="nav-link" href="Service_Ticket.aspx">Notes</a>
                 </div>
    </div>
    <div class="container-left col-md-8">

    <div class="row">
      <h3> Contact Information </h3>
    </div>


     <div class="row">
            <div class="col-md-2">
          <p> Name: </p>
            </div>
          <div class="col-md-4">
              <asp:Label ID="lblName" runat="server" Text="" class="form-control"></asp:Label>
            </div>
          <div class="col-md-2">
           <p> Contact Date: </p>
        </div>
        <div class="col-md-4">
              <asp:Label ID="lblContactDate" runat="server" Text="" class="form-control"></asp:Label>
            </div>
          </div>

          <br>

           <div class="row">
            <div class="col-md-2">
          <p> Address: </p>
            </div>
          <div class="col-md-4">
              <asp:Label ID="lblAddress" runat="server" Text="" class="form-control" Height="75"></asp:Label>
            </div>
          <div class="col-md-2">
           <p> Moving Date: </p>
        </div>
        <div class="col-md-4">
              <asp:Label ID="lblMovingDate" runat="server" Text="" class="form-control"></asp:Label>
            </div>
          </div>

          <br>

           <div class="row">
            <div class="col-md-2">
          <p> Phone: </p>
            </div>
          <div class="col-md-4">
              <asp:Label ID="lblPhone" runat="server" Text="" class="form-control"></asp:Label>
            </div>
          <div class="col-md-2">
           <p> Number of Men: </p>
        </div>
        <div class="col-md-4">
              <div class="dropdown">
                <asp:DropDownList ID="ddlNumberofMens" runat="server" CssClass="dropdown-header">
                      <asp:ListItem Text="1" Value="1"></asp:ListItem>
                      <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      <asp:ListItem Text="3" Value="3"></asp:ListItem>
                      <asp:ListItem Text="4" Value="4"></asp:ListItem>
                  </asp:DropDownList>
  </div>
</div>
</div>

          <br>

          <div class="row">
            <div class="col-md-2">
          <p> From Address: </p>
            </div>
          <div class="col-md-4">
              <asp:Label ID="lblFromAddy" runat="server" Text="" class="form-control" Height="75"></asp:Label>
            </div>
          <div class="col-md-2">
           <p> To Address: </p>
        </div>
        <div class="col-md-4">
              <asp:Label ID="lblToAddy" runat="server" Text="" class="form-control" Height="75"></asp:Label>
            </div>
          </div>

          <br>



    <div class="row" >
            <asp:HyperLink ID="hypl" runat="server"  ForeColor="Red" Font-Bold="True" Target="_blank" NavigateUrl="https://www.google.com/maps">Get Directions</asp:HyperLink>

    </div>

<div class="row">
  <div class="col-md-3">
    <p> Items to Cosign? </p>
  </div>
    <div class="col-md-3">
            <div class="form-check form-check-inline">
        <asp:RadioButtonList ID="rblCosign" runat="server" class="form-check-input">
                    <asp:ListItem Text="Yes" Value="Yes" ></asp:ListItem>
                    <asp:ListItem Text="No" Value="No" ></asp:ListItem>
            </asp:RadioButtonList>
        </div>
        </div>
        <div class="col-md-3">
    <p> Smalls for Us to Pack? </p>
  </div>
    <div class="col-md-3">
            <div class="form-check form-check-inline">
        <div class="form-check form-check-inline">
        <asp:RadioButtonList ID="rblSmalls" runat="server" class="form-check-input">
                    <asp:ListItem Text="Yes" Value="Yes" ></asp:ListItem>
                    <asp:ListItem Text="No" Value="No" ></asp:ListItem>
            </asp:RadioButtonList>
        </div>
    </div>
        </div>
          </div>
    


      <div class="row">
      <h3> House Layout </h3>
    </div>

    <div class="row">
      <div class="col-md-3">
    <p> Stories </p>
  </div>
    <div class="col-md-1">
              <div class="dropdown">
                  <asp:DropDownList ID="ddlStories" runat="server" CssClass="dropdown-header">
                      <asp:ListItem Text="1" Value="1"></asp:ListItem>
                      <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      <asp:ListItem Text="3" Value="3"></asp:ListItem>
                      <asp:ListItem Text="4" Value="4"></asp:ListItem>
                  </asp:DropDownList>

    
  </div>
</div>
</div>
<br>

 <div class="row">
      <div class="col-md-3">
    <p> Bedrooms: </p>
  </div>
    <div class="col-md-2">
              <div class="dropdown">
  <asp:DropDownList ID="ddlBedrooms" runat="server" CssClass="dropdown-header">
                      <asp:ListItem Text="1" Value="1"></asp:ListItem>
                      <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      <asp:ListItem Text="3" Value="3"></asp:ListItem>
                      <asp:ListItem Text="4" Value="4"></asp:ListItem>
                      <asp:ListItem Text="5" Value="5"></asp:ListItem>
                      <asp:ListItem Text="6" Value="6"></asp:ListItem>
                      <asp:ListItem Text="7" Value="7"></asp:ListItem>
                      <asp:ListItem Text="8" Value="8"></asp:ListItem>
                  </asp:DropDownList>
</div>
</div>
<div class="col-md-3">
    <asp:TextBox ID="txtBedrooms" runat="server" class="form-control"></asp:TextBox>
            </div>
  <div class="col-md-2">
     <asp:TextBox ID="txtBedroomssqr" runat="server" class="form-control" text="0" ></asp:TextBox>
     </div>

      
</div>


<br>


<div class="row">
      <div class="col-md-3">
    <p> Living Room: </p>
  </div>
    <div class="col-md-2">
              <div class="dropdown">
  <asp:DropDownList ID="ddlLivingRoom" runat="server" CssClass="dropdown-header">
                      <asp:ListItem Text="1" Value="1"></asp:ListItem>
                      <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      <asp:ListItem Text="3" Value="3"></asp:ListItem>
                      <asp:ListItem Text="4" Value="4"></asp:ListItem>
                  </asp:DropDownList>
  </div>
</div>
<div class="col-md-3">
              <asp:TextBox ID="txtLivingRoom" runat="server" class="form-control"></asp:TextBox>
            </div>
  <div class="col-md-2">
    <asp:TextBox ID="txtLivRoomsqr" runat="server" class="form-control" text="0" ></asp:TextBox>
     </div>

</div>

<br>


<div class="row">
      <div class="col-md-3">
    <p> Dining Room: </p>
  </div>
    <div class="col-md-2">
              <div class="dropdown">
  <asp:DropDownList ID="ddlDining" runat="server" CssClass="dropdown-header">
                      <asp:ListItem Text="1" Value="1"></asp:ListItem>
                      <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      <asp:ListItem Text="3" Value="3"></asp:ListItem>
                      <asp:ListItem Text="4" Value="4"></asp:ListItem>
                  </asp:DropDownList>
  </div>
</div>
<div class="col-md-3">
              <asp:TextBox ID="txtDining" runat="server" class="form-control"></asp:TextBox>
            </div>
  <div class="col-md-2">
     <asp:TextBox ID="txtDinRoomsqr" runat="server" class="form-control" text="0" ></asp:TextBox>
     </div>

</div>

<br>


<div class="row">
      <div class="col-md-3">
    <p> Den/ Family Room: </p>
  </div>
    <div class="col-md-2">
              <div class="dropdown">
  <asp:DropDownList ID="ddlDenFamRooms" runat="server" CssClass="dropdown-header">
                      <asp:ListItem Text="1" Value="1"></asp:ListItem>
                      <asp:ListItem Text="2" Value="2"></asp:ListItem>
                      <asp:ListItem Text="3" Value="3"></asp:ListItem>
                      <asp:ListItem Text="4" Value="4"></asp:ListItem>
                  </asp:DropDownList>
  </div>
</div>
<div class="col-md-3">
              <asp:TextBox ID="txtDenFam" runat="server" class="form-control"></asp:TextBox>
            </div>
  <div class="col-md-2">
              <asp:TextBox ID="txtDenFRoomsqr" runat="server" class="form-control" text="0" ></asp:TextBox>
     </div>

</div>

<br>



<div class="row">
<div class="col-md-3">
    <p> Attic: </p>
  </div>
    <div class="col-md-2">
              <div class="dropdown">
  <asp:DropDownList ID="ddlAttics" runat="server" CssClass="dropdown-header" OnSelectedIndexChanged="ddlAttics_SelectedIndexChanged" AutoPostBack="true">
                      <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                      <asp:ListItem Text="No" Value="No"></asp:ListItem>
                  </asp:DropDownList>
    
  </div>
</div>
<div class="col-md-3">
              <asp:TextBox ID="txtAttic" runat="server" class="form-control"></asp:TextBox>
            </div>
  <div class="col-md-2">
     <asp:TextBox ID="txtAttsqr" runat="server" class="form-control" text="0"></asp:TextBox>
     </div>
</div>

<br>

<div class="row">
<div class="col-md-3">
    <p> Basement: </p>
  </div>
    <div class="col-md-2">
              <div class="dropdown">
  <asp:DropDownList ID="ddlBasement" runat="server" CssClass="dropdown-header" OnSelectedIndexChanged="ddlBasement_SelectedIndexChanged1" AutoPostBack="true">
                      <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                      <asp:ListItem Text="No" Value="No"></asp:ListItem>
                     
                  </asp:DropDownList>
    
  </div>
</div>
<div class="col-md-3">
              <asp:TextBox ID="txtBasement" runat="server" class="form-control"></asp:TextBox>
            </div>
  <div class="col-md-2">
     <asp:TextBox ID="txtBasemsqr" runat="server" class="form-control" text="0"></asp:TextBox>
     </div>
</div>

<br>

<div class="row">
<div class="col-md-3">
    <p> Garage: </p>
  </div>
    <div class="col-md-2">
              <div class="dropdown">
  <asp:DropDownList ID="ddlGarage" runat="server" CssClass="dropdown-header" OnSelectedIndexChanged="ddlGarage_SelectedIndexChanged1">
                      <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                      <asp:ListItem Text="No" Value="No"></asp:ListItem>
                  </asp:DropDownList>
    
  </div>
</div>
<div class="col-md-3">
              <asp:TextBox ID="txtGarage" runat="server" class="form-control"></asp:TextBox>
            </div>
  <div class="col-md-2">
     <asp:TextBox ID="txtGarsqr" runat="server" class="form-control" text="0" ></asp:TextBox>
     </div>
</div>

<br>

<div class="row">
            <div class="col-md-3">
          <p> Total Square Footage: </p>
            </div>
          <div class="col-md-3">
              <asp:TextBox ID="txtTotalSQF" runat="server" class="form-control"></asp:TextBox>
            </div>
    <div class="col-md-2">
         <asp:Button ID="btnCalculateSQR" runat="server" Text="->" CssClass="btn btn-primary" OnClick="btnCalculateSQR_Click1" />
     </div>
     </div>
          
          </div>

          <br>

    <div class="row">
      <h3> Additional </h3>
    </div>

     <div class="row">
            <div class="col-md-3">
          <p> Large/Awkward/ Unusual Items: </p>
            </div>
          <div class="col-md-3">
              <asp:TextBox ID="txtLarge" runat="server" class="form-control"></asp:TextBox>
            </div>
          <div class="col-md-3">
           <p> Collectibles and High Value Items:</p>
        </div>
        <div class="col-md-3">
              <asp:TextBox ID="txtCollectibles" runat="server" class="form-control"></asp:TextBox>
            </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-3">
          <p> Appliances: </p>
            </div>
          <div class="col-md-3">
              <asp:TextBox ID="txtAppliance" runat="server" class="form-control"></asp:TextBox>
            </div>
          <div class="col-md-3">
           <p> Out Buildings:</p>
        </div>
        <div class="col-md-3">
              <asp:TextBox ID="txtOutBuildings" runat="server" class="form-control"></asp:TextBox>
            </div>
          </div>

          <br>

          <div class="row">
  <div class="col-md-3">
    <p> Piano: </p>
  </div>
    <div class="col-md-3">
            <div class="form-check form-check-inline">
        <asp:RadioButtonList ID="RBLPiano" runat="server" class="form-check-input">
                    <asp:ListItem Text="Yes" Value="Yes" ></asp:ListItem>
                    <asp:ListItem Text="No" Value="No" ></asp:ListItem>
            </asp:RadioButtonList>
    </div>
        </div>
        <div class="col-md-3">
    <p> Lawn Mower: </p>
  </div>
    <div class="col-md-3">
            <div class="form-check form-check-inline">
        <asp:RadioButtonList ID="RBLMower" runat="server" class="form-check-input">
                    <asp:ListItem Text="Yes" Value="Yes" ></asp:ListItem>
                    <asp:ListItem Text="No" Value="No" ></asp:ListItem>
            </asp:RadioButtonList>
    </div>
        </div>
          </div>

          <br>


    <div class="row">
      <h3> Accessibility</h3>
    </div>

         <div class="row">
            <div class="col-md-2">
          <p> Distance from Truck to Door? </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtDistance" runat="server" class="form-control"></asp:TextBox>
            </div>
          <div class="col-md-2">
           <p> Obstacles? </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtObstacles" runat="server" class="form-control"></asp:TextBox>
            </div>
          </div>

          <br>


<div class="row">
      <h3> Reminder </h3>
    </div>

    <div class="row">
        <p> Remind client to supply the following: (1) truck of appropriate size to hold all property, (2) enough furniture pads to keep all furniture safe from damage, (3) bands, straps, bungee cords for securing property during transit. GVA&M can rent pads and straps (local moves) for a fee of #30.00. </p>
    </div>

    <br>

    <div class="row">
      <h3> Additional Notes </h3>
    </div>


    <div class="row">

      <div class="col-md-12">
              <asp:TextBox ID="txtNote" runat="server" class="form-control"></asp:TextBox>
            </div>
        </div>

    <br />


     <div class="row">
          <div class ="col-md-1">
              <asp:Button ID="btnSaveMove" runat="server" Text="Save" CssClass="btn btn-primary btn-intake rounded-pill" OnClick="btnSave_Click" />
      </div>

       <div class="col-md-2 ">
           <asp:Button ID="btnPopuateMove" runat="server" Text="Populate" CssClass="btn btn-primary btn-intake rounded-pill" OnClick="btnPopulate_Click" />
      </div>

       <div class="col-md-1 ">
           <asp:Button ID="btnClearMove" runat="server" Text="Clear" CssClass="btn btn-primary btn-intake rounded-pill" OnClick="bnClear_Click" />
      </div>
</div>
    

<br>
<div class="row">
      <h3> Packing </h3>
    </div>
    <div class="form-row col-md-12">
        <div class="col-md-4">
        <p> Packing Required? </p> 
    </div>
    	<div class="col-md-8">
            <asp:DropDownList ID="ddlPackingYesNo" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlPackingYesNo_SelectedIndexChanged" autopostback="true">
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:DropDownList>
      </div>
        </div>


    <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblSmallBoxes" runat="server" Text="Small Boxes:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:TextBox ID="txtSmallBoxes" runat="server" Class="form-control"></asp:TextBox>
      </div>
  </div>
      <br>
           <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblMediumBoxes" runat="server" Text="Medium Boxes:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:TextBox ID="txtMediumBoxes" runat="server" Class="form-control"></asp:TextBox>
      </div>
  </div>
           <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblLargeBoxes" runat="server" Text="Large Boxes:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:TextBox ID="txtLargeBoxes" runat="server" Class="form-control"></asp:TextBox>
      </div>
  </div>
           <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblMediumArtBoxes" runat="server" Text="Medium Art Boxes:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:TextBox ID="txtMediumArtBoxes" runat="server" Class="form-control"></asp:TextBox>
      </div>
  </div>
           <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblLargeArtBoxes" runat="server" Text="Large Art Boxes:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:TextBox ID="txtLargeArtBoxes" runat="server" Class="form-control"></asp:TextBox>
      </div>
  </div>
           <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblWardrobeBoxes" runat="server" Text="Wardrobe Boxes:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:TextBox ID="txtWardrobeboxes" runat="server" Class="form-control"></asp:TextBox>
      </div>
  </div>
    <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblSelectWhichMovers" runat="server" Text="Select Which Movers:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:DropDownList ID="ddlSelectWhichMovers" runat="server"  DataTextField="Worker" DataValueField="EmployeeID"  Class="form-control" DataSourceID="datasrcMovers"></asp:DropDownList>
                <asp:Button ID="btnAddMovers" runat="server" Text="Add Movers"  CausesValidation="false" Class="form-control" OnClick="btnAddMovers_Click"/>
                <asp:Button ID="btnRemoveMovers" runat="server" Text="Remove Movers"  CausesValidation="false" Class="form-control" OnClick="btnRemoveMovers_Click"/>
      </div>
  </div>
          <div class="form-row col-md-12">
              <div class="col-md-4">
        <asp:Label ID="lblSelectedMovers" runat="server" Text="Selected Movers:" CssClass="col-form-label"></asp:Label> 
    </div>
        <div class="col-md-8">
         <asp:ListBox ID="lbSelectedMovers" runat="server" Class="form-control"></asp:ListBox>
    </div>


               <div class ="col-md-5">
              <asp:Button ID="btnSavePacking" runat="server" Text="Save Packing" CssClass="btn btn-primary" OnClick="btnSavePacking_Click" />
      </div>
    	
  </div>
<br>
     <div class="row">
        </div>
    <div class="row">
      <h3> Trash Removal </h3>
    </div>
    <div class="form-row col-md-12">
        <div class="col-md-4">
        <p> Trash Removal Required? </p> 
    </div>
    	<div class="col-md-8">
            <asp:DropDownList ID="ddlYesNoTrash" runat="server" CssClass="form-control" OnSelectedIndexChanged="ddlYesNoTrash_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                <asp:ListItem Text="No" Value="No"></asp:ListItem>
            </asp:DropDownList>
      </div>
        </div>
    <div class="form-row col-md-12">
        <div class="col-md-4">
            <asp:Label ID="lblDumpsterR" runat="server" Text="Dumpster Required?" CssClass="col-form-label"></asp:Label>
        
    </div>
    	<div class="col-md-8">
         <asp:RadioButtonList ID="rblDumpster" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" Class="form-control"  >
                    <asp:ListItem Text="Yes" Value="Yes" ></asp:ListItem>
                    <asp:ListItem Text="No" Value="No" ></asp:ListItem>
                </asp:RadioButtonList>
      </div>
        </div>
      <br>

      <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblTrashDesc" runat="server" Text="Trash Description?" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:TextBox ID="txtTrashDesc" runat="server" Class="form-control"></asp:TextBox>
      </div>
  </div>
          <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblHowManyMen" runat="server" Text="How Many Men?" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:TextBox ID="txtHowManyMen" runat="server" Class="form-control"></asp:TextBox>
      </div>
  </div>
          <div class="form-row col-md-12">
        <div class="col-md-4">
        <asp:Label ID="lblTotalCharge" runat="server" Text="Total Charge?" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-8">
            <asp:TextBox ID="txtTotalCharges" runat="server" Class="form-control"></asp:TextBox>
      </div>
  </div>
    <div class ="col-md-5">
              <asp:Button ID="btnSaveTrash" runat="server" Text="Save Trash Removal" CssClass="btn btn-primary" OnClick="btnSaveTrash_Click" />
      </div>
    <br />
    <br />



  <%-- Data Source --%>
             <asp:SqlDataSource ID="datasrcMovers" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select trim(EmployeeFirstName)+ ' '+ trim(ISNULL(EmployeeLastName,'')) as Worker, EmployeeID from Employee; "></asp:SqlDataSource>

</asp:Content>
