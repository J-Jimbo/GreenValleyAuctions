<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Add_Inventory.aspx.cs" Inherits="GreenValleyAuctions.Add_Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="text-center">
        		<h3> Add Inventory to Customer </h3>
      			</div>
    <div class="row">
            <div class="col-md-2">
          <p> Item: </p>
            </div>
          <div class="col-md-4">
              <asp:TextBox ID="txtItem" runat="server" class="form-control"></asp:TextBox>
            </div>
          <div class="col-md-2">
           <p> Cost: </p>
        </div>
        <div class="col-md-4">
              <asp:TextBox ID="txtCost" runat="server" class="form-control"></asp:TextBox>
            </div>
          </div>
    <asp:Table ID="Table1" runat="server">
       
        
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblStorage" runat="server" Text="Select Location: " ></asp:Label><p />
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlStorage" runat="server" OnSelectedIndexChanged="ddlStorage_SelectedIndexChanged" Class="form-control" AutoPostBack="true" >
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
                <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" class="btn btn-primary btn-intake rounded-pill mediabutton" CausesValidation="false" />
      </div>

        <div class="col-md-2 offset-md-1">

                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"  class="btn btn-primary btn-intake rounded-pill mediabutton"/>
       </div>

       <div class="col-md-2 offset-md-1">
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="btn btn-primary btn-intake rounded-pill mediabutton"  CausesValidation="false"/>
      </div>

      <div class="col-md-2 offset-md-1">
                <asp:Button ID="btnBack" runat="server" Text="Back"  OnClick="btnBack_Click"  class="btn btn-primary btn-intake rounded-pill mediabutton" CausesValidation="false"/>
      
      </div>
    <br />
                <P><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></P>


    </div>
</asp:Content>
