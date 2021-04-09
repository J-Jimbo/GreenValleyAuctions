<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Move_Schedule_Screen.aspx.cs" Inherits="GreenValleyAuctions.Move_Schedule_Screen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="text-center">
        		<h3> Move Schedule Screen Form </h3>
      			</div>

      			<div class="row">
            <div class="col-md-2">
          <p> Origin Address: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtOrigin" runat="server" Enabled="false" width="300px "></asp:TextBox>
            </div>
          <div class="col-md-2">
           <p> Destination Address: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtDest" runat="server" Enabled="false" Width="300px"></asp:TextBox>
            </div>
          </div>

          <br>
    <div class="row">
            <div class="col-md-2">
          <p> Final Move Date: </p>
            </div>
          <div class="col-md-4">
               <asp:TextBox ID="txtMoveDate" runat="server" TextMode="Date" ></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvFinalDate" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtMoveDate" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
          <div class="col-md-2">
           <p> Pricing Source: </p>
        </div>
        <div class="col-md-4">
              <div class="form-check form-check-inline">
        <asp:RadioButtonList ID="rblPricingScource" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="MLS" Value="MLS"></asp:ListItem>
                    <asp:ListItem Text="Look At" Value="Look At"></asp:ListItem>
                    <asp:ListItem Text="Phone" Value="Phone"></asp:ListItem>
                    <asp:ListItem Text="Email" Value="Email"></asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="rfvPriceScource" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="rblPricingScource" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
      </div>
      </div>
  </div>

          <br>
    <div class="row">
            <div class="col-md-2">
          <p> How Many Trucks: </p>
            </div>
          <div class="col-md-4">
               <asp:TextBox ID="txtQuantityTrucks" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvQuantityTrucks" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtQuantityTrucks" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
              <asp:CompareValidator ID="cvqTrucks" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtQuantityTrucks" Text="Must be a Number" ForeColor="Red" Display="Dynamic" ></asp:CompareValidator>
          </div>
          <div class="col-md-2">
           <p> How Many Movers: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtQuantityMovers" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtQuantityMovers" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="cvMovers" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Integer" ControlToValidate="txtQuantityMovers" Text="Must be a Number" ForeColor="Red"  Display="Dynamic"></asp:CompareValidator>    
        </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-2">
          <p> Select Which Trucks: </p>
                 </div>
          
             <div class="col-md-4">
              <div class="dropdown">
              <asp:DropDownList ID="ddlTrucks" runat="server" DataTextField="EquipmentName" DataValueField="EquipmentID" DataSourceID="datasrcTruckList" OnDataBound="ddlTrucks_DataBound"></asp:DropDownList>
              <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
</div>
</div>
              <div class="col-md-2">
           <p> Select Which Movers: </p>
        </div>
        <div class="col-md-4">
              <div class="dropdown">
              <asp:DropDownList ID="ddlMovers" runat="server"  DataTextField="Worker" DataValueField="EmployeeID" DataSourceID="datasrcMovers" OnDataBound="ddlMovers_DataBound"></asp:DropDownList>
              <asp:Label ID="lblMoverError" runat="server" Text=""></asp:Label>
</div>
</div>


</div>
    <div class="row">
          <div class ="col-md-2 offset-md-2">
          <asp:Button ID="btnAdd" runat="server" Text="Add Truck" OnClick="btnAdd_Click" CausesValidation="false" class="btn btn-primary btn-intake"/>
        </div>
        <div class ="col-md-2 ">
         <asp:Button ID="btnRemoveTruck" runat="server" Text="Remove Truck" OnClick="btnRemoveTruck_Click" CausesValidation="false" class="btn btn-primary btn-intake"/>
        </div>

         <div class ="col-md-2 offset-md-2">
         <asp:Button ID="btnAddMover" runat="server" Text="Add Movers" OnClick="btnAddMover_Click" CausesValidation="false" class="btn btn-primary btn-intake"/>
        </div>
        <div class ="col-md-2 ">
          <asp:Button ID="btnRemove" runat="server" Text="Remove Movers" OnClick="btnRemove_Click" CausesValidation="false" class="btn btn-primary btn-intake"/>
        </div>

    </div>
          <br />
    <div class="row">
        <div class ="col-md-2 offset-md-2">
            <asp:ListBox ID="lbTrucks" runat="server"></asp:ListBox>
        </div>
        <div class ="col-md-2 ">
          <asp:CustomValidator ID="cvTrucks" runat="server" ErrorMessage="CustomValidator" Text="Trucks selected and number of trucks are not equal" OnServerValidate="cvTrucks_ServerValidate" ForeColor="Red" Display="Dynamic"></asp:CustomValidator>
        </div>
        <div class ="col-md-2 offset-md-2">
            <asp:ListBox ID="lbMovers" runat="server"></asp:ListBox>
        </div>
        <div class ="col-md-2 ">
           <asp:CustomValidator ID="cvnumMovers" runat="server" ErrorMessage="CustomValidator" Text="Movers selected and number of movers not equal" OnServerValidate="cvnumMovers_ServerValidate" ForeColor="Red"  Display="Dynamic"></asp:CustomValidator>
        </div>
    </div>

          <br>
    <div class="row">
            <div class="col-md-2">
          <p> Estimate/ Contract Price: </p>
            </div>
          <div class="col-md-4">
               <asp:TextBox ID="txtPrice" runat="server" ></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPrice" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPrice" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtPrice" Text="Must be a Number" ForeColor="Red" Display="Dynamic" ></asp:CompareValidator>    
  
          </div>
          <div class="col-md-2">
           <p> Cost of Consumables: </p>
        </div>
        <div class="col-md-4">
               <asp:TextBox ID="txtCostConsumables" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConsumables" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCostConsumables" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                                <asp:CompareValidator ID="cvConsumables" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtCostConsumables" Text="Must be a Number" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>    
    
        </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-2">
          <p> Estimated Hours: </p>
            </div>
          <div class="col-md-4">
                <asp:TextBox ID="txtEstimateHours" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEstimateHours" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEstimateHours" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvEstimatedHours" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtEstimateHours" Text="Must be a Number" ForeColor="Red" Display="Dynamic" ></asp:CompareValidator>    

            </div>
          <div class="col-md-2">
           <p> Actual Hours: </p>
        </div>
        <div class="col-md-4">
             <asp:TextBox ID="txtActualHours" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvActualHours" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtActualHours" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="cvActual" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtActualHours" Text="Must be a Number" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>    

            </div>

          </div>


          <br>

           <div class="row">
            <div class="col-md-2">
          <p> Origin Mileage: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtOriginMilage" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvOrigin" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtOriginMilage" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvOGMiles" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtOriginMilage" Text="Must be a Number" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>    
  
          </div>
          <div class="col-md-2">
           <p> Fuel Costs: </p>
        </div>
        <div class="col-md-4">
            <asp:TextBox ID="txtFuel" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvFuel" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFuel" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvFuels" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtFuel" Text="Must be a Number" ForeColor="Red" Display="Dynamic"></asp:CompareValidator> 
            </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-2">
          <p> Destination Mileage: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtMilage" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMilage" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtMilage" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvMiles" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtMilage" Text="Must be a Number" ForeColor="Red" Display="Dynamic"></asp:CompareValidator> 

          </div>
          <div class="col-md-2">
           <p> Costs Per Worker: </p>
        </div>
        <div class="col-md-4">
                <asp:TextBox ID="txtWorkerCost" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvWorkerCost" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtWorkerCost" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                           <asp:CompareValidator ID="cvWorkerCost" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtWorkerCost" Text="Must be a Number" ForeColor="Red" Display="Dynamic"></asp:CompareValidator> 

            </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-2">
          <p> Other Mileage: </p>
            </div>
          <div class="col-md-4">
               <asp:TextBox ID="txtOtherMilage" runat="server" OnTextChanged="txtOtherMilage_TextChanged" AutoPostBack="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvOther" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtOtherMilage" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvOther" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtOtherMilage" Text="Must be a Number" ForeColor="Red" Display="Dynamic"></asp:CompareValidator> 

               
             
            </div>
          <div class="col-md-2">
           <p> Insurance Costs: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtInsurance" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvInsurance" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtInsurance" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
              <asp:CompareValidator ID="cvInsurance" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtInsurance" Text="Must be a Number" ForeColor="Red" Display="Dynamic"></asp:CompareValidator> 
    
        </div>
          </div>

          <br>

           <div class="row">
            <div class="col-md-2">
          <p> Total Estimated Miles: </p>
            </div>
          <div class="col-md-4">
              <hr />
              <asp:Label ID="sumMilage" runat="server" Text=""></asp:Label>
             </div>
          <div class="col-md-2">
           <p> Food & Hotel Costs: </p>
        </div>
        <div class="col-md-4">
             <asp:TextBox ID="txtFood" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFood" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFood" Text="Required" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="cvFood" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" ControlToValidate="txtFood" Text="Must be a Number" ForeColor="Red" Display="Dynamic"></asp:CompareValidator> 
    
        </div>
          </div>

          <br>

    <div class="row">
          <div class ="col-md-2 ">
                <asp:Button ID="btnpopulate" runat="server" Text="Populate" OnClick="btnpopulate_Click"  CausesValidation="false"  class="btn btn-primary btn-intake rounded-pill"/>
      </div>

        <div class="col-md-2 offset-md-6">

                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"  class="btn btn-primary btn-intake rounded-pill" />
       </div>

       <div class="col-md-1">
                <asp:Button ID="btnClear" runat="server" Text="Clear"  OnClick="btnClear_Click" CausesValidation="false"  class="btn btn-primary btn-intake rounded-pill"/>
      </div>
    

      <div class="col-md-1 ">
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CausesValidation="false"  class="btn btn-primary btn-intake rounded-pill"/>
      </div>
</div>
<%--    ------------------------------------------------------------------------------------------------%>
    
    <%--sql Data Sources--%>
    <asp:SqlDataSource ID="datasrcTruckList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select EquipmentName, EquipmentID from Equipment; "></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcMovers" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select trim(EmployeeFirstName)+ ' '+ trim(ISNULL(EmployeeLastName,'')) as Worker, EmployeeID from Employee; "></asp:SqlDataSource>
</asp:Content>
