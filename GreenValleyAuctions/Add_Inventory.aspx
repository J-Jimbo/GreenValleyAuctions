<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Add_Inventory.aspx.cs" Inherits="GreenValleyAuctions.Add_Inventory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server">
        <asp:TableRow>
            <asp:TableCell>
               <p> <asp:Label ID="lblAddInventory" runat="server" Text="Add Inventory to Customer:"></asp:Label></p>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
               <P> <asp:Label ID="lblItem" runat="server" Text="Item: "></asp:Label></P>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItem" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <p><asp:Label ID="lblCost" runat="server" Text="Cost: "></asp:Label></p>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCost" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <p></p><asp:Label ID="lblStorage" runat="server" Text="Select Location: " ></asp:Label><p />
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlStorage" runat="server" OnSelectedIndexChanged="ddlStorage_SelectedIndexChanged" Class="form-control" AutoPostBack="true">
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
                <asp:DropDownList ID="ddlBay" runat="server" Class="form-control"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <P><asp:Label ID="lblPlace" runat="server" Text="Select Placement: "></asp:Label></P>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlPlace" runat="server" Class="form-control"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" class="btn btn-primary btn-intake rounded-pill mediabutton" CausesValidation="false" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"  class="btn btn-primary btn-intake rounded-pill mediabutton"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" class="btn btn-primary btn-intake rounded-pill mediabutton"  CausesValidation="false"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnBack" runat="server" Text="Back"  OnClick="btnBack_Click"  class="btn btn-primary btn-intake rounded-pill mediabutton" CausesValidation="false"/>
            </asp:TableCell>
            <asp:TableCell>
                <P><asp:Label ID="lblStatus" runat="server" Text=""></asp:Label></P>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
