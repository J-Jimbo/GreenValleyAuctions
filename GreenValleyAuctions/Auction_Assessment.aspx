<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Auction_Assessment.aspx.cs" Inherits="GreenValleyAuctions.Auction_Assessment" %>
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
        </div>
     <div class="col-md-1 offset-md-1">
                    <a class="nav-link" href="Service_Ticket.aspx">Notes</a>
                 </div>
    <!-- Note Body -->

<div class="sticky">
  <div class="text-left">
      <h3> Notes:</h3>
    </div>
    <form>
      <div class="form-group">
    <label class= "Additional Notes"> </label>
    <textarea class="form-control" id="exampleFormControlTextarea1" rows="20" placeholder="Notes"></textarea>
  </div>
</form>
</div>

<br>



<div class="col-md-12">
<div class="heading">
      <h3> Contact Information </h3>
    </div>


		<form>
        <div class="form-row">
        <div class="col-md-4 mb-3 mt-2">
        <asp:Label ID="lblFirstName" runat="server" Text="" class="form-control"></asp:Label>
    </div>

        <div class="col-md-4 mb-3 mt-2">
        <asp:Label ID="lblLastName" runat="server" Text="" class="form-control"></asp:Label>
    </div>
    </div>
  

        <div class="form-row">
        <div class="col-md-4 mb-3">
        <asp:Label ID="lblPhone" runat="server" Text="" class="form-control"></asp:Label>
    </div>

    <div class="col-md-2 mb-3">
        <asp:Label ID="lblContactDate" runat="server" Text="" class="form-control"></asp:Label>
    </div>
    <div class="col-md-2 mb-3">
        <asp:Label ID="lblAddon" runat="server" Text="" class="form-control" placeholder="Add ons"></asp:Label>
  </div>


    <div class="col-md-8 mb-3">
            <asp:Label ID="lblAddres" runat="server" Text="" class="form-control"></asp:Label>

  </div>

      </div>
  </form>
</div>

<br>

<!-- Purpose of Appraisal !-->
  <div class="heading">
      <h3> Preliminary Auction Assessment </h3>
    </div>


            <div class="col-md-6">
          <p> What do you have to sell? </p>
            </div>
          <div class="col-md-8">
          <form>
          <label class= "Additional Notes"> </label>
          <asp:TextBox ID="txtSell" placeholder="Notes" runat="server" class="form-control"></asp:TextBox>
          
      
      </form>
      </div>
            <br>
          <div class="col-md-6">
           <p> Why are you considering auction services? </p>
        </div>
        <div class="col-md-8">
            <asp:DropDownList ID="ddlWHY" runat="server">
                <asp:ListItem Text="Settling an estate" Value="estate"></asp:ListItem>
                <asp:ListItem Text="Moving and need to downsize" Value="downsize"></asp:ListItem>
                <asp:ListItem Text="Just getting rid of some stuff" Value="Just getting rid of some stuff"></asp:ListItem>
            </asp:DropDownList>
    </div>

          <br>
          <br>

        <div class="row col-md-12">
            <div class="col-md-2">
          <p> Deadline: </p>
            </div>
          <div class="col-md-6">
              <asp:TextBox ID="txtDeadLine" runat="server" TextMode="Date" Enabled="false"></asp:TextBox>
              <%--autofill--%>
            </div>
         </div>

          <br>

        <!--What Needs to be Scheduled !-->

          <div class="row col-md-12">
            <div class="col-md-6">
          <p> What Needs to be scheduled? </p>
            </div>
          </div>
  
           <!-- Bring In !-->
            <div class="col-md-6">
            <div class="form-check form-check-inline">
                <asp:CheckBoxList ID="cblSheduled" runat="server" class="form-check-input" AutoPostBack="true" OnSelectedIndexChanged="cblSheduled_SelectedIndexChanged" >
                    <asp:ListItem Text="Bring In" Value="Bring In"></asp:ListItem>
                    <asp:ListItem Text="Auction Walk Through" Value="Auction Walk Through" ></asp:ListItem>
                    <asp:ListItem Text="Customer requests an Auction Look At" Value="Customer" ></asp:ListItem>
                    <asp:ListItem Text="Green Valley requires an Auction Look At" Value="GVA" ></asp:ListItem>
                    <asp:ListItem Text="Pick Up" Value="Pick Up"></asp:ListItem>
                    <asp:ListItem Text="Trash Removal & Donation Hauling" Value="Trash"></asp:ListItem>
                </asp:CheckBoxList >
                <div id="lbltrash" runat="server" visible="false" class="col-md-2 mt-4 offset-md-0">
		      	<p> Trash Description: </p></div>
                <asp:TextBox ID="txtTrash" runat="server" Visible="false"></asp:TextBox>
            </div>
          </div>

          <br>
          <br>


	<!--Have we asked for !-->
          <div class="row col-md-12">
            <div class="col-md-6">
          <p> Asked For </p>
            </div>
          </div>
  
           <!-- Photos & Items!-->
            <div class="col-md-6">
            <div class="form-check form-check-inline">
                <asp:CheckBoxList ID="cblAskedFor" runat="server" class="form-check-input">
                    <asp:ListItem Text="Photos" Value="Photos"></asp:ListItem>
                    <asp:ListItem Text="List of Items" Value="Items"></asp:ListItem>
                </asp:CheckBoxList>
             
            </div>
          </div>


         
  <br>
  <br>



  <!-- Additional Services !-->
          <div class="row col-md-12">
            <div class="col-md-6">
          <p> Additional Services </p>
            </div>
          </div>
  
           <!-- Move !-->
            <div class="col-md-6">
            <div class="form-check form-check-inline">
                <asp:CheckBoxList ID="cblAdditionalServices" runat="server">
                    <asp:ListItem Text="Move" Value="Move"></asp:ListItem>
                    <asp:ListItem Text="Appraisal" Value="Appraisal"></asp:ListItem>
                    <asp:ListItem Text="Trash Removal & Donation Hauling" Value="Trash"></asp:ListItem>
                </asp:CheckBoxList>
                <div id="Div1" runat="server" visible="false" class="col-md-2 mt-4 offset-md-0">
		      	<p> Trash Description: </p></div>
                <asp:TextBox ID="txtgarbage" runat="server" Visible="false"></asp:TextBox>
            </div>
          </div>

         

          <br>
          <br>


		<!-- Auction Assessment !-->
		  <div class="row col-md-12">
		  	<div class="col-md-5">
		      <h3> Auction Assessment </h3></div>
	        <div class="row col-md-6 mt-2">
        <div class="col-md-6">
            <asp:Button ID="btnInventoryForm" runat="server" Text="Open Inventory Form" class="btn btn-primary btn-intake rounded-pill" />
	         </div>    
	    	</div>
	    	</div>

	   <br>



	   <!-- Type of Home !-->
          <div class="row col-md-12">
            <div class="col-md-6">
          <p> Type of Home </p>
            </div>
          </div>

           <!-- Apartment !-->
           <div class="col-md-6">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" name="group3" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" id="inlineCheckbox23" value="option4">
                  
                <div class="panel-group">
                <div class="panel panel-default">
                <div class="panel-heading">
                  <label class="form-check-label" for="inlineCheckbox23">Apartment</label>
                </div>
              </div>
            </div>
          </div>
      </div>

              <div id="collapseFour" class="panel-collapse collapse in">
                <div class="panel-body">
            <div class="row col-md-12">
            <div class="col-md-2 offset-md-1">
          	<p> What Floor: </p>
            </div>
          	<div class="col-md-4">
             <input type="text" class="form-control" placeholder="">
            </div>  
          	</div>
         
         <br>

                <div class="row col-md-12 offset-md-1">
                <p> Is there an elevator? </p>
              <div class="form-check form-check-inline lookat">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                <label class="form-check-label">Yes</label>
              </div>
              <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                <label class="form-check-label">No</label>
              </div>
              
              </div>
            </div>

            <br>

            <div class="row col-md-12 offset-md-1">
            <p> How Far is the walk from the elevator to the apartment? </p></div>
          
            <div class="col-md-6 offset-md-1">
             <input type="text" class="form-control" placeholder="">
            </div>  
    
          </div>
        
                   
      



          <!-- House !-->
            <div class="col-md-6">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" id="inlineCheckbox24" value="option1">
              <label class="form-check-label" for="inlineCheckbox24">House</label>
            </div>
          </div>




          <!-- Storage Unit !-->
           <div class="col-md-6">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" name="group3" data-toggle="collapse" data-parent="#accordion" href="#collapseFive" id="inlineCheckbox25" value="option4">
                  
                <div class="panel-group">
                <div class="panel panel-default">
                <div class="panel-heading">
                  <label class="form-check-label" for="inlineCheckbox25">Storage Unit</label>
                </div>
              </div>
            </div>
          </div>
      </div>

              <div id="collapseFive" class="panel-collapse collapse in">
                <div class="panel-body">
                    <div class="form-check form-check-inline offset-md-1">
                        <input class="form-check-input" type="checkbox" id="inlineCheckbox26" value="option1">
                        <label class="form-check-label" for="inlineCheckbox26">Indoor/Climate Controlled</label>
                    </div>
                        <div class="form-check form-check-inline offset-md-1">
                       <input class="form-check-input" type="checkbox" id="inlineCheckbox27" value="option2">
                        <label class="form-check-label" for="inlineCheckbox27">Outdoor Self Storage</label>
                    </div>
                   </div>
                  </div>
              


<!-- Trash Removal & Donation Hauling !-->
            <div class="col-md-6">
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="checkbox" name="group2" data-toggle="collapse" data-parent="#accordion" href="#collapseSix" id="inlineCheckbox28" value="option3">
                  
                <div class="panel panel-default">
            <div class="panel-heading">
                  <label class="form-check-label" for="inlineCheckbox28">Place of Business</label>
              </div>
              </div>
            </div>
        </div>
             <div id="collapseSix" class="panel-collapse collapse in">
                <div class="panel-body">
         <div class="col-md-6 offset-md-1">
          <form>
            <div class="form-group">
          <label class= "Additional Notes"> </label>
          <textarea class="form-control" id="exampleFormControlTextarea30" rows="6" placeholder=""></textarea>
              </div>
          </form>
        </div>
      </div>  
      </div>

          
          
         
         <br>
         <br>



           <!-- Truck Accessibility -->
            <div class="row col-md-12">
                    
              <p> Truck Accessibility: </p>
            </div>
             <div class="col-md-6">
            <form>
              <div class="form-group">
            <label class= "Additional Notes"> </label>
             <asp:TextBox ID="txtTruckAccessibilty" runat="server"></asp:TextBox>
          </div>
        </form>
        </div>
        

        <br>
        <br>


    <!-- How far is walk to loading door? -->
            <div class="row col-md-12">
                    
              <p> How far is the walk to the loading door? </p>
            </div>
             <div class="col-md-6">
            <form>
              <div class="form-group">
            <label class= "Additional Notes"> </label>
            <asp:TextBox ID="txtLoadingDoor" runat="server"></asp:TextBox>
          </div>
        </form>
        </div>
        


        <br>
        <br>



  <!-- How many steps -->
              <div class="row col-md-12">
                      
                <p> How many steps are there leading up to the house? </p>
              </div>
               <div class="col-md-6">
              <form>
                <div class="form-group">
              <label class= "Additional Notes"> </label>
            <asp:TextBox ID="txtSteps" runat="server"></asp:TextBox>
            </div>
          </form>
          </div>
          

          <br>
          <br>



        <!-- Special Equipment -->
    <div class="row col-md-12">
        <p> Special Equipment </p> </div>
      <div class="row col-md-10">
            <asp:CheckBoxList ID="cblSupplies" runat="server" RepeatDirection="Vertical"  DataSourceID="datasrcSupplies" DataTextField="SupplyType" DataValueField="SupplyID" OnDataBound="cblSupplies_DataBound" ></asp:CheckBoxList>

      </div>

      <br>


      <!-- Trucks -->
    <div class="row col-md-12">
        <p> Trucks </p> </div>
      <div class="row col-md-10">
            <asp:ListBox ID="lbTrucks" runat="server"></asp:ListBox>
      </div>

      <br>
      <br>


         <!-- Boxes & Packing Materials -->
      <div class="row col-md-12">
        <p> Boxes &amp; Packing Materials </p> </div>
      <div class="row col-md-12">
          <div class="col-md-2 offset-md-1">
          <asp:TextBox ID="txtsmallBox" runat="server" placeholder="Small" Enabled="false"></asp:TextBox>
        <br />
            <asp:TextBox ID="txtMedBox" runat="server" placeholder="Medium" Enabled="false"></asp:TextBox>
        <br />
            <asp:TextBox ID="txtLrgBox" runat="server" placeholder="Large" Enabled="false"></asp:TextBox>
        <br />
            <asp:TextBox ID="txtArtBox" runat="server" placeholder="Art" Enabled="false"></asp:TextBox>
        <br />
            <asp:TextBox ID="txtsPads" runat="server" placeholder="Small Pads" Enabled="false"></asp:TextBox>
        <br />
            <asp:TextBox ID="txtLPads" runat="server" placeholder="Large Pads" Enabled="false"></asp:TextBox>
          </div>
          </div>
             <br>
            <br>


<!-- Estimated Rates & Fees -->
      <div class="row col-md-12">
        <p> Estimated Rates &amp; Fees </p> </div>
      <div class="row col-md-12">
            <div class="col-md-2 offset-md-1">
          <p> Pick Up Fee: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtPickUpFee" runat="server"></asp:TextBox>
            </div>
          </div>

          <br>
          
          <div class="row col-md-12">
            <div class="col-md-2 offset-md-1">
          <p> Consignment Rate: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtConsignmentRate" runat="server"></asp:TextBox>
            </div>
          </div>

             <br>

          <div class="row col-md-12">
            <div class="col-md-2 offset-md-1">
          <p> Trash Removal: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtTrashRate" runat="server"></asp:TextBox>
            </div>
          </div>

             <br>

          <div class="row col-md-12">
            <div class="col-md-2 offset-md-1">
          <p> Additional Fees: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtAddFee" runat="server"></asp:TextBox>
            </div>
          </div>



	    	<br>
	    	<br>
	    	<br>
	    	<br>

        <!-- Save button -->  
        
       <div class="row">
          <div class ="col-md-1">
          <asp:Button ID="btnPopulate" runat="server" CausesValidation="false" Text="Populate" class="btn btn-primary btn-intake rounded-pill mediabutton" OnClick="btnPopulate_Click"/>
      </div>

        <div class="col-md-2">

       <asp:Button ID="btnSave" runat="server" Text="Save" CausesValidation="true" class="btn btn-primary btn-intake rounded-pill mediabutton" OnClick="btnSave_Click"/>
       </div>

       <div class="col-md-3">
                            <asp:Button ID="btnClear"  runat="server" Text="Clear"  class="btn btn-primary btn-intake rounded-pill mediabutton"   OnClick="btnClear_Click" CausesValidation="false"/>
      </div>
    

      
</div>
  
  <br>
  <br>  

     <%--sql Data Sources--%>
    <asp:SqlDataSource ID="datasrcTruckList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select EquipmentName, EquipmentID from Equipment; "></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcMovers" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select trim(EmployeeFirstName)+ ' '+ trim(ISNULL(EmployeeLastName,'')) as Worker, EmployeeID from Employee; "></asp:SqlDataSource>
     <asp:SqlDataSource ID="datasrcSupplies" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select SupplyID, SupplyType from Supplies; "></asp:SqlDataSource>
</asp:Content>
