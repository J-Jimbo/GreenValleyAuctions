<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Add_Inventory.aspx.cs" Inherits="GreenValleyAuctions.Add_Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
                   <div class="col-md-1">
                    <a class="nav-link" href="Customer_info.aspx">Profile</a>
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
        		<h3> Add Inventory to Customer </h3>
      			</div>
    <div class="row">
            <div class="col-md-2">
          <p> Item: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtItem" runat="server" class="form-control" placeholder="Item Name"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvItme" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtItem" Display="Dynamic"></asp:RequiredFieldValidator>
            </div>
          <div class="col-md-2">
           <p> Cost: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtCost" runat="server" class="form-control" placeholder="0.00"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvCost" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtCost" Display="Dynamic"></asp:RequiredFieldValidator>
              <asp:CompareValidator ID="CVCost" runat="server" ErrorMessage="CompareValidator" Operator="DataTypeCheck" Type="Double" Text="Must Be A Number" ControlToValidate="txtCost" Display="Dynamic"></asp:CompareValidator>
        </div>
          </div>
    <asp:Table ID="Table1" runat="server">
       
        
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblStorage" runat="server" Text="Select Location: " ></asp:Label><p />
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlStorage" runat="server" UseSubmitBehavior="false" OnSelectedIndexChanged="ddlStorage_SelectedIndexChanged" Class="form-control" AutoPostBack="true" >
                    <asp:ListItem Text="Left" Value="L"></asp:ListItem>
                    <asp:ListItem Text="Right" Value="R"></asp:ListItem>
                    <asp:ListItem Text="Trailer" Value="T"></asp:ListItem>
                </asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
               <p> <asp:Label ID="lblBay" runat="server" Text="Select Bay: "></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlBay" runat="server" Class="form-control" ></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <P><asp:Label ID="lblPlace" runat="server" Text="Select Placement: "></asp:Label></P>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlPlace" runat="server" Class="form-control" ></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

    <br>

        <div class="row">
          <div class ="col-md-2 ">
                <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" UseSubmitBehavior="false" class="btn btn-primary btn-intake rounded-pill mediabutton" CausesValidation="false" />
      </div>

        <div class="col-md-2 offset-md-1">

                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" UseSubmitBehavior="false"  class="btn btn-primary btn-intake rounded-pill mediabutton"/>
       </div>

       <div class="col-md-2 offset-md-1">
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" UseSubmitBehavior="false" class="btn btn-primary btn-intake rounded-pill mediabutton"  CausesValidation="false"/>
      </div>

      
    <br />
                <P><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></P>


    </div>
</asp:Content>
