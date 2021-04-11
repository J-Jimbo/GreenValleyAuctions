<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Auction_Pick_Up.aspx.cs" Inherits="GreenValleyAuctions.Auction_Pick_Up" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

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
        <asp:RadioButtonList ID="rblStorage" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblStorage_SelectedIndexChanged" class="form-check-input">
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
          <asp:Button ID="btnPopulate" runat="server" CausesValidation="false" Text="Populate" class="btn btn-primary btn-intake rounded-pill mediabutton"  OnClick="btnPopulate_Click"/>
      </div>

        <div class="col-md-2 offset-md-6">

       <asp:Button ID="btnSave" runat="server" Text="Save" CausesValidation="true" class="btn btn-primary btn-intake rounded-pill mediabutton"  OnClick="btnSave_Click"/>
       </div>

       <div class="col-md-1">
                            <asp:Button ID="btnClear"  runat="server" Text="Clear"  class="btn btn-primary btn-intake rounded-pill mediabutton"   OnClick="btnClear_Click" CausesValidation="false"/>
      </div>
    

      <div class="col-md-1 ">
                            <asp:Button ID="btnBack" runat="server" Text="Back" class="btn btn-primary btn-intake rounded-pill mediabutton"   OnClick="btnBack_Click" CausesValidation="false"/>
      </div>
</div>
    

<%----------------------------------------------------------------------------------%>
    
</asp:Content>
