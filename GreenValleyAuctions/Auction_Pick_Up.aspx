<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Auction_Pick_Up.aspx.cs" Inherits="GreenValleyAuctions.Auction_Pick_Up" %>
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
    <div class="sticky">
  <div class="text-left">
      <h3> Notes:</h3>
    </div>
    <form>
      <div class="form-group">
    <label class= "Additional Notes"> </label>
    <asp:TextBox ID="txtSideNotes" runat="server" class="form-control" placeholder="Notes" Wrap="true" TextMode="MultiLine" AutoPostBack="true" OnTextChanged="txtSideNotes_TextChanged"></asp:TextBox>
<%--    <textarea class="form-control" id="exampleFormControlTextarea1" rows="20" placeholder="Notes"></textarea>--%>
  </div>
</form>
</div>

     <div class="text-center">
        		<h3> Auction Pick Up Form </h3>
     </div>
     <div class="row">
            <h3> Contact Information</h3>
            </div>

      			<div class="row">
            <div class="col-md-2">
          <p> Name: </p>
            </div>
          <div class="col-md-4">
               <p><asp:Label ID="lblShowName" runat="server" Text=""></asp:Label></p>
            </div>
          <div class="col-md-2">
           <p> Phone: </p>
      </div>
      <div class="col-md-4">
              <p><asp:Label ID="lblShowPhone" runat="server" Text=""></asp:Label></p>
            </div>
      </div>

          <br>
    <div class="row">
            <div class="col-md-2">
          <p> Email: </p>
            </div>
     <div class="col-md-4">
             <p><asp:Label ID="lblSHowEmai" runat="server" Text=""></asp:Label></p>
            </div>
          <div class="col-md-2">
           <p> Contact Date: </p>
        </div>
        <div class="col-md-4">
             <p> <asp:Label ID="lblShowDate" runat="server" Text=""></asp:Label></P>
            </div>
          </div>

          <br>
    <div class="row">
            <div class="col-md-6">
              <p> Possible Action Dates</p>

            </div>

            <div class="col-md-6">
              <p> Confirmed Action Dates</p>

            </div>

          </div>

          <div class="row">
            <div class="col-md-2">
          <p> Bring In Date: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtBringIn" runat="server" TextMode="Date"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvBringIn" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtBringIn"></asp:RequiredFieldValidator>
                       
            </div>
          <div class="col-md-2">
           <p> Bring In Date: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtBringInConfirmed" runat="server" TextMode="Date"></asp:TextBox>

            </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-2">
          <p> Pick Up Date: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtPickUp" runat="server" TextMode="Date"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvPickUp" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtPickUp"></asp:RequiredFieldValidator>
            </div>
          <div class="col-md-2">
           <p> Pick Up Date: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtPickUpConfirmed" runat="server" TextMode="Date"></asp:TextBox>

            </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-2">
          <p> Look At Date: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtLookAt" runat="server" TextMode="Date"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvLookAt" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtLookAt"></asp:RequiredFieldValidator>
           </div>
          <div class="col-md-2">
           <p> Look At Date: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtLookAtConfirmed" runat="server" TextMode="Date"></asp:TextBox>

            </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-2">
          <p> Appraisal Date: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtAppraisal" runat="server" TextMode="Date"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvAppraisal" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtAppraisal"></asp:RequiredFieldValidator>

            </div>
          <div class="col-md-2">
           <p> Appraisal Date: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtAppraisalConfirmed" runat="server" TextMode="Date"></asp:TextBox>

            </div>
          </div>

          <br>

          <div class="row">
            <div class="col-md-2 offset-md-6">
          <p> Sale Date: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtSaleDateConfirmed" runat="server" TextMode="Date"></asp:TextBox>

            </div>
          </div>

          <br>
    <div class="row">
            <div class="col-md-2">
           <p> Storage Required: </p>
        </div>
        <div class="col-md-4">
              <div class="form-check form-check-inline">
        <asp:RadioButtonList ID="rblStorage" runat="server" RepeatDirection="Horizontal" UseSubmitBehavior="false" AutoPostBack="true" OnSelectedIndexChanged="rblStorage_SelectedIndexChanged" class="form-check-input">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
        </asp:RadioButtonList>
      </div>
          </div>
        </div>
    
        <div class="col-md-2">
         <p><asp:Label ID="lblLocation" runat="server" Text="Storage Location: " Visible="false"></asp:Label></P>
            </div>
          <div class="col-md-4">
                <asp:TextBox ID="txtLocation" runat="server" Visible="false"></asp:TextBox>
            </div>
    

          <br>
    <div class="row">
          <div class ="col-md-2 ">
          <asp:Button ID="btnPopulate" runat="server" UseSubmitBehavior="false" CausesValidation="false" Text="Populate" class="btn btn-primary btn-intake rounded-pill mediabutton"  OnClick="btnPopulate_Click"/>
      </div>

        <div class="col-md-2 offset-md-6">

       <asp:Button ID="btnSave" runat="server" UseSubmitBehavior="false" Text="Save" CausesValidation="true" class="btn btn-primary btn-intake rounded-pill mediabutton"  OnClick="btnSave_Click"/>
       </div>

       <div class="col-md-1">
                            <asp:Button ID="btnClear" UseSubmitBehavior="false"  runat="server" Text="Clear"  class="btn btn-primary btn-intake rounded-pill mediabutton"   OnClick="btnClear_Click" CausesValidation="false"/>
      </div>
    

      
</div>
    

<%----------------------------------------------------------------------------------%>
    
</asp:Content>
