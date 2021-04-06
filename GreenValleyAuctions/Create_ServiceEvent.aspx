<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Create_ServiceEvent.aspx.cs" Inherits="Lab2.Create_ServiceEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Heading -->
     <div class="text-center">
        <h3> Create Service </h3>
      </div>

    <div class="row form-group">
    <label for="sel1">Service Type:</label>
    <div class="col-md-6">
        <asp:DropDownList ID="dplServiceType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="dplServiceType_SelectedIndexChanged" class="form-control">
            <asp:ListItem Text="Moving" Value="Moving"></asp:ListItem>
            <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
        </asp:DropDownList>
    </div>
    </div>
    <br>

    <!--Potential Date -->
    <div class="row form-group">
        <label for="sel1">Potential Dates:</label>
        <div class="col-md-4">
            <asp:Label ID="lblSuggestedDate1" runat="server" Text="Date: "></asp:Label>
            <asp:TextBox ID="txtPotentialDate1" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <asp:Label ID="lblSuggestedDate2" runat="server" Text="Date: "></asp:Label>
            <asp:TextBox ID="txtPotentialDate2" runat="server" TextMode="Date" ></asp:TextBox>

        </div>
    </div>
    <br />
    <!-- Service Deadline Date  -->
      <div class="row form-group">
         <label for="sel1"> Service Dead Line Date:</label>
        <div class="col-md-4">
            <asp:TextBox ID="txtServiceDate" runat="server" TextMode="Date"></asp:TextBox>        
        </div>
        <div class="form-check form-check-inline offset-md-1">
          <asp:CheckBox ID="cbRange" runat="server" Text="Dead Line Range?" AutoPostBack="true" OnCheckedChanged="cbRange_CheckedChanged"/>
          <%--<asp:RequiredFieldValidator ID="rfvServiceDate" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceDate" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>--%>
      </div>
    </div>

    <br>
    <!-- DateRange -->
    <div class="row form-group">
        <asp:Label ID="lblEndDate" runat="server" Text="Final Dead Line End Date" Visible="false"></asp:Label>
        <div class="col-md-4">
          <asp:TextBox ID="txtDateRange" runat="server" Visible="false" TextMode="Date"></asp:TextBox>
          <br />
          <asp:CompareValidator ID="cvDateRange" runat="server" ErrorMessage="CompareValidator" Text="End Date Must Be After Start Date" ForeColor="Red" ControlToValidate="txtDateRange" ControlToCompare="txtServiceDate" Type="Date" Operator="GreaterThan"></asp:CompareValidator>
        </div>
    </div>
    <br />
     <!-- Origin Address -->
     <div class="row">
        <h3> Origin Address: </h3>
    </div>
        <div class="row">
          <div class="col-md-6">
          <p> Street: </p>
            </div>
          <div class="col-md-6">
          <p> City: </p>
        </div>
          </div>

          <div class="row">
          <div class="col-md-6">
              <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtStreet" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
          <div class="col-md-6">
              <asp:TextBox ID="txtCIty" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCIty" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
          </div>
        <br />
          <div class="row">
          <div class="col-md-6">
          <p> State: </p>
            </div>
          <div class="col-md-6">
          <p> Zip: </p>
        </div>
          </div>

          <div class="row">
          <div class="col-md-6">
              <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtState" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
          <div class="col-md-6">
              <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZip" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
          </div>

          <br>

<!-- Destination Address -->
     <div id="lblDestAddress" runat="server" class="row" visible="false">
        <h3> Destination Address: </h3>
    </div>
        <div id="lblCity_street" runat="server" visible="false" class="row">
          <div class="col-md-6">
          <p> Street: </p>
            </div>
          <div class="col-md-6">
          <p >  City: </p>
        </div>
          </div>

          <div class="row">
          <div class="col-md-6">
              <asp:TextBox ID="txtDestStrt" runat="server" Visible="false"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvDestStrt" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDestStrt" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
          <div class="col-md-6">
              <asp:TextBox ID="txtDestCity" runat="server" Visible="false"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvDestCity" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDestCity" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
          </div>
          <br />
          <div id="lblState_Zip" runat="server" visible="false" class="row">
          <div class="col-md-6">
          <p> State: </p>
            </div>
          <div class="col-md-6">
          <p> Zip: </p>
        </div>
          </div>

          <div class="row">
          <div class="col-md-6">
              <asp:TextBox ID="txtDestState" runat="server" Visible="false"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvDestState" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDestState" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
          <div class="col-md-6">
           <asp:TextBox ID="txtDestZip" runat="server" Visible="false"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvDestZip" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDestZip" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
          </div>

<br>
<br>

    <!-- Service Cost  -->
      <div class="row form-group">
         <label for="sel1"> Service Cost:</label>
        <div class="col-md-4">
            <asp:TextBox ID="txtServiceCost" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvServiceCost" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceCost" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
       
    </div>
    <!-- Customer -->

    <div class="row form-group">
  <label for="sel1">Customer:</label>
  <div class="col-md-6">
  <asp:DropDownList ID="dplCustomer" runat="server" DataSourceID="datasrcCustomerList" DataTextField="customerName" 
        DataValueField="customerID"  AutoPostBack="true" class="form-control"></asp:DropDownList>
   <asp:CustomValidator ID="cvCustomer" runat="server" ErrorMessage="CustomValidator" ControlToValidate="dplCustomer" Text="Cannot have multiple events" ForeColor="Red" OnServerValidate="cvCustomer_ServerValidate" ></asp:CustomValidator>
                        
</div>
</div>
    <!-- Employee Contacts: -->

        <div class="row form-group">
      <label for="sel1"> Employee Contacts: </label>
      <div class="col-md-6">
         <asp:DropDownList ID="ddlEmpList" runat="server" DataSourceID="datasrcEmployeeList" AutoPostBack="true" DataValueField="employeeId" DataTextField="employeeName" class="form-control"></asp:DropDownList>

    </div>
    </div>


<br>
<br>
<br>
    <!-- Clear, Populate, Go to Notes, Return to Customer, Save buttons -->
          <div class="row col-md-12">
          <div class="row col-md-2 offset-md-1">
              <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill submit"/>
            </div>
          <div class="col-md-2 offset-md-0">
            <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill submit"/>
        </div>
        <div class="col-md-2 offset-md-0">
           <asp:Button ID="btnNotes" runat="server" Text="Go to Notes"  OnClick="btnNotes_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill submit"/>
        </div>
        <div class="col-md-3 offset-md-0">
            <asp:Button ID="btnBack" runat="server" Text="Return to Customer" OnClick="btnBack_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill submit" />
        </div>
        <div class="col-md-2 offset-md-0">
           <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CausesValidation="true" class="btn btn-primary btn-intake rounded-pill submit"/>
        </div>
          </div>
        <br />
    <div class="row form-group">
      <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
    </div>
    

          <br>
          <br>
          <br>
<%-------------------------------------------------------------------------------------------%>
 

            <%--sql Data scources --%>
            <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="SELECT trim(FirstName) + ' ' + trim(LastName) as customerName, customerID from Customer"></asp:SqlDataSource>
            <asp:SqlDataSource ID="datasrcEmployeeList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="SELECT trim(EmployeeFirstName) + ' ' + trim(ISNULL(EmployeeLastName,'')) as employeeName, EmployeeID from Employee"></asp:SqlDataSource>
     

</asp:Content>
