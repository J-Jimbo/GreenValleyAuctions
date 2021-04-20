<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Completion_Form.aspx.cs" Inherits="GreenValleyAuctions.Completion_Form1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-1">
                    <a class="nav-link" href="Customer_Info.aspx">Profile</a>
     </div>

     

 <div class="col-md-12">
<div class="heading">
      <h3> Contact Information </h3>
    </div>


		
        <div class="form-row">
        <div class="col-md-4 mb-3 mt-2">
            <asp:Label ID="lblFirstName" runat="server" Text="" Class="form-control"></asp:Label>
    </div>

        <div class="col-md-4 mb-3 mt-2">
        <asp:Label ID="lblLastName" runat="server" Text="" Class="form-control"></asp:Label>
    </div>
    </div>
  

        <div class="form-row">
        <div class="col-md-4 mb-3">
        <asp:Label ID="lblCPhoneNumber" runat="server" Text="" Class="form-control"></asp:Label>
    </div>

    <div class="col-md-4 mb-3">
      <asp:Label ID="lblCEmail" runat="server" Text="" Class="form-control"></asp:Label>
    </div>

    <div class="col-md-8 mb-3">
    <asp:Label ID="lblCAddress" runat="server" Text="" Class="form-control"></asp:Label>
  </div>

      </div>
  </>
</div>
    <br>

    <!-- Type of Service -->
        <div class="row col-md-12">
            <div class="col-md-2">
          <p> Type of Service: </p>
            </div>
          <div class="col-md-6">
              <asp:Label ID="lblTService" runat="server" Text="" Class="form-control"></asp:Label>
            </div>
         </div>

          <br>


    <!-- Date of Service -->
        <div class="row col-md-12">
            <div class="col-md-2">
          <p> Date of Service: </p>
            </div>
          <div class="col-md-6">
              <asp:Label ID="lblDService" runat="server" Text="" Class="form-control" ></asp:Label>
            </div>
         </div>
    <br>
          <br>


           <!-- Employees Associated -->
    <div class="row col-md-12">
        <div class="col-md-2">
        <p> Employees Associated </p>
            </div>
     <div class="col-md-6">
              <asp:Label ID="lblEmployeesAssociated" runat="server" Text="" Class="form-control" ></asp:Label>
            </div>
        </div>

    <br>


  <!-- Comments -->
            <div class="row col-md-12">
            <div class="col-md-2 mt-4">      
              <p> Additional Comments: </p>
            </div>
             <div class="col-md-6">
            
              <div class="form-group">
            <label class= "Additional Notes"> </label>
                  <asp:TextBox ID="txtAdditionalNotes" runat="server" CssClass="form-control" ></asp:TextBox>
         </div>
        
        </div>
      </div>

        <br>
        <br>
    <!-- Service Experience -->
          <div class="row col-md-12">
            <div class="col-md-6">
          <h3> Service Experience </h3>
            </div>
          </div>


 <!-- POSITIVE EMAIL STARTS HERE -->
          <br />
          <br />
          <div class="form-row col-md-8">
        <div class="col-md-2">
        <asp:Label ID="lblExperienceQuality" runat="server" Text="Experience Quality?" CssClass="col-form-label" ></asp:Label> 
    </div>
    	<div class="col-md-6">
            <asp:TextBox ID="txtPositiveOrNegative" runat="server" CssClass="form-control" placeholder="Positive or Negative?" ></asp:TextBox>
      </div>
  </div>
          <div class="form-row col-md-8">
        <div class="col-md-2">
        <asp:Label ID="lblTo" runat="server" Text="To:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-6">
            <asp:TextBox ID="txtCustomerEmail" runat="server" CssClass="form-control" placeholder="EMAIL" ></asp:TextBox>
      </div>
  </div>
          <div class="form-row col-md-8">
        <div class="col-md-2">
        <asp:Label ID="lblSubject" runat="server" Text="Subject:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-6">
        <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="SUBJECT" ></asp:TextBox>
      </div>
  </div>
    <div class="form-row col-md-8">
        <div class="col-md-2">
        <asp:Label ID="lblMsg" runat="server" Text="Message:" CssClass="col-form-label"></asp:Label> 
    </div>
    	<div class="col-md-6">
        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" placeholder="MESSAGE FOR EMAIL" TextMode="MultiLine" ></asp:TextBox>
      </div>
  </div>
          <div class="row">
            <div class="col-md-6">
                <asp:Button ID="btnSend" runat="server" class="btn btn-primary btn-intake rounded-pill" Text="Send Email" OnClick="btnSend_Click"  />
            </div>
        </div>
        <div>     

      </div>

  <!-- NEGATIVE EMAIL MODAL ENDS HERE -->
     <br>
          <br>
  
    
 <!-- Save button -->  
        <div class="row">
          <div class ="col-md-3 offset-md-7">
              <asp:Button ID="SaveCompletion" runat="server" Text="Save" class="btn btn-primary btn-intake rounded-pill"  OnClick="btnSave_Click"   />
          </div>
            </div>
  <br>
  <br>  

</asp:Content>
