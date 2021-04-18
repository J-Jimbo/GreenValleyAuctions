<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Create_Customer.aspx.cs" Inherits="Lab2.Create_Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- Heading -->
     <div class="text-center">
        <h3> Initial Conversation Form </h3>
      </div>
    <!-- Heading -->
    <div class="text-center">
      <h3> Services Customer Requires: </h3>
    </div>
     <div class="form-check form-check-inline offset-md-4">
        <asp:CheckBoxList ID="CblServices" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                    <asp:ListItem Text="Appraisal" Value="Appraisal"></asp:ListItem>
                    <asp:ListItem Text="Move" Value="Move"></asp:ListItem>
                    <asp:ListItem Text="Consignment" Value="Consignment"></asp:ListItem>
        </asp:CheckBoxList>
        <asp:CustomValidator ID="CvServices" runat="server" ErrorMessage="CustomValidator" Text="Required" ForeColor="Red"  OnServerValidate="cvServices_ServerValidate"></asp:CustomValidator>

      </div>

    <br> 


<!-- Requires look at -->

      <div class="row offset-md-4">
        <p> Requires look at: </p>
      <div class="form-check form-check-inline lookat">
         <asp:RadioButtonList ID="rblLookAt" RepeatDirection="Horizontal" runat="server" class="form-check-input" >
                    <asp:ListItem Text="Yes" Value="Yes" ></asp:ListItem>
                    <asp:ListItem Text="No" Value="No" ></asp:ListItem>
         </asp:RadioButtonList>
         <asp:RequiredFieldValidator ID="rfvLookAt" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblLookAt" ForeColor="Red"></asp:RequiredFieldValidator>

      </div>
      </div>

    <!-- Questions -->
      <div class="row offset-md-4">
        <p> Questions: </p>
      </div>

      <!-- Downsizing -->
      <div class="row offset-md-4">
        <p> Downsizing: </p>
      <div class="form-check form-check-inline downsizing">
        <asp:RadioButtonList ID="rblDownsizing" RepeatDirection="Horizontal" runat="server" class="form-check-input">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
         </asp:RadioButtonList>
         <asp:RequiredFieldValidator ID="rfvDownsizing" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblDownsizing" ForeColor="Red"></asp:RequiredFieldValidator>

      </div>
      </div>

      <!-- Selling an estate -->
    <div class="row offset-md-4">
      <p> Settling an Estate: </p>
    <div class="form-check form-check-inline estate">
      <asp:RadioButtonList ID="rblEstate" RepeatDirection="Horizontal" runat="server" class="form-check-input">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
      </asp:RadioButtonList>
      <asp:RequiredFieldValidator ID="rfvEstate" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblEstate" ForeColor="Red"></asp:RequiredFieldValidator>

    </div>
    </div>

    <!-- Moving -->
      <div class="row offset-md-4">
        <p> Moving: </p>
      <div class="form-check form-check-inline moving">
       <asp:RadioButtonList ID="rblMoving" RepeatDirection="Horizontal" runat="server" class="form-check-input">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
        </asp:RadioButtonList>
        <asp:RequiredFieldValidator ID="rfvMoving" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblMoving" ForeColor="Red"></asp:RequiredFieldValidator>

      </div>
      </div>


      <!-- How much is being sold -->
      <div class="row offset-md-4">
        <p> How much is being sold: </p>
        <div class="col-md-4 howsoldbox">
            <asp:TextBox ID="txtQuanity" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvquantity" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtQuanity" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
        </div>

        <!-- What is being sold -->
        <div class="row offset-md-4">
        <p> What is being sold: </p>
        <div class="col-md-5 whatsoldbox">
                <asp:TextBox ID="txtWhatToSell" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvWhatToSell" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtWhatToSell" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
        </div>

    <!-- Conversation Notes  -->
        <div class="row offset-md-4">
        <p> Conversation Notes: </p>
      </div>

      <div class="row offset-md-3">
        <div class="col-md-9 convonotes">
            <asp:TextBox ID="txtNote" runat="server" Height="300" Width="500" TextMode="MultiLine" Wrap="true"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvNote" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtNote" ForeColor="Red"></asp:RequiredFieldValidator>

            </div> 
      </div>

    <!-- New or existing customer -->
      <div class="row offset-md-4">
        <p> New or Existing Customer? </p>
      <div class="form-check form-check-inline newexisting">
        <asp:RadioButtonList ID="rblChoice" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblChoice_SelectedIndexChanged" AutoPostBack="true" class="form-check-input">
                    <asp:ListItem Text="New Customer" Value="New Customer" ></asp:ListItem>
                    <asp:ListItem Text="Existing Customer" Value="Existing Customer"></asp:ListItem>
         </asp:RadioButtonList>
      </div>
      </div>
    <!-- existing customer -->
    <div ID="ExistingCustomer" runat="server" Visible="false">
        <p>Select Customer: </p>
        <div class="form-check form-check-inline newexisting">
            <asp:DropDownList ID="ddlCustomer" runat="server" DataTextField="customerName" DataValueField="CustomerID"  DataSourceID="datasrcCustomerList"></asp:DropDownList>
            <asp:Label ID="lblCreateStatus" runat="server" Text=""></asp:Label>
        </div>
    </div>

    <!-- New customer -->
    <div ID="NewCustomer" runat="server" Visible="false">
        <!-- First and Last Name -->
        <div class="row">
          <div class="col-md-6">
          <p> First Name: </p>
            </div>
          <div class="col-md-6">
          <p> Last Name: </p>
        </div>
          </div>

          <div class="row">
          <div class="col-md-6">
                 <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
<%--                <asp:CustomValidator ID="cvFirstName" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txtFirstName" Text="Customer Exists" Forecolor="Red" OnServerValidate="cvFirstName_ServerValidate" ></asp:CustomValidator>--%>
          </div>
          <div class="col-md-6">
           <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
          </div>
        <!-- Address -->
          <div class="row">
          <div class="col-md-6">
          <p> Street </p>
            </div>
          <div class="col-md-6">
          <p> City </p>
        </div>
          </div>

          <div class="row">
          <div class="col-md-6">
               <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
               <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtStreet" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
          <div class="col-md-6">
           <asp:TextBox ID="txtCIty" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RfvCIty" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtCIty" ForeColor="Red"></asp:RequiredFieldValidator>
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
           <asp:RequiredFieldValidator ID="rfvSTate" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtState"  ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
          <div class="col-md-6">
           <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtZip" ForeColor="Red"></asp:RequiredFieldValidator>
          </div>
          </div>

        <!-- Phone -->
        <div class="row">
          <div class="col-md-6">
          <p> Phone: </p>
            </div>
          <div class="col-md-6">
          <p> Phone Type: </p>
        </div>
          </div>

          <div class="row">
            <div class="col-md-6">
              <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtPhone" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
            <div class="col-md-6">
          <div class="form-check form-check-inline">
          <asp:RequiredFieldValidator ID="rfvPhoneType" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="rblPhoneType" text="Required" ForeColor="Red" ></asp:RequiredFieldValidator>
                        <asp:RadioButtonList ID="rblPhoneType" runat="server"  RepeatDirection="Horizontal">
                            <asp:ListItem Text="Business" Value="Business"></asp:ListItem>
                            <asp:ListItem Text="Cell" Value="Cell"></asp:ListItem>
                            <asp:ListItem Text="Home" Value="Home"></asp:ListItem>
           </asp:RadioButtonList>
        </div>
        </div>
          </div>
          <!-- Email and Service Event -->
        <div class="row">
          <div class="col-md-6">
          <p> Email: </p>
            </div>
        
          </div>


        <div class="row">
          <div class="col-md-6">
              <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="RequiredFieldValidator" Text ="Required" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
              <asp:CustomValidator ID="CVemail" Text="Email already exists" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txtEmail" ForeColor="Red" OnServerValidate="CVemail_ServerValidate"></asp:CustomValidator>
              </div>
          </div>
         <!-- How did you hear about us -->
          <div class="row">
          <div class="col-md-6">
          <p> How did you hear about us? </p>
            </div>
          </div>

          <div class="row">
          <div class="col-md-6">
                 <asp:TextBox ID="txtHear" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvHear" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtHear" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                 <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
              </div>
          </div>
        <!-- How did customer contact us -->
          <div class="row">
          <div class="col-md-6">
          <p> How did customer contact us? </p>
            </div>
          </div>

          <div class="row">
          <div class="col-md-6">
                <asp:RequiredFieldValidator ID="rfvContact" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlContact" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:DropDownList ID="ddlContact" runat="server" autopostback="true" OnSelectedIndexChanged="ddlContact_SelectedIndexChanged">
                    <asp:ListItem Text="In Person" Value="In Person"></asp:ListItem>
                    <asp:ListItem Text="By Phone" Value="By Phone"></asp:ListItem>
                    <asp:ListItem Text="By Email" Value="By Email"></asp:ListItem>
                    <asp:ListItem Text="Customer Portal" Value="Customer Portal"></asp:ListItem>
                    <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                </asp:DropDownList>
                <asp:Label ID="lblOther" runat="server" Text="Other: " Visible="false"></asp:Label>
                <asp:TextBox ID="txtOther" runat="server" Visible="false"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvOther" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtOther" ForeColor="Red"></asp:RequiredFieldValidator>
                    
            </div>
          </div>
    </div>

    <%----------------------------------------------------------------%>
    
   
    
     <%--Table for all customer inputs--%> 
            
            <br />
           <%-- table for buttons to navigate --%>
            <asp:Table ID="tblButtons" runat="server" Width="1284px">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell Width="250">
                        <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill submit"/>
                    </asp:TableCell>
                    <asp:TableCell Width="250">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CausesValidation="true" class="btn btn-primary btn-intake rounded-pill submit"/>
                    </asp:TableCell>
                     <asp:TableCell Width="250">
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" class="btn btn-primary btn-intake rounded-pill submit"/>
                    </asp:TableCell>
                </asp:TableRow>
             </asp:Table>
    <%--Data Sources--%>
    <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="SELECT distinct trim(FirstName) + ' ' + trim(LastName) as customerName, c.CustomerID from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID full join Customer c on c.CustomerID = WF.CustomerID where NOT Wf.CurrentStatus = 'In Progress' order by customerName"></asp:SqlDataSource>
</asp:Content>
