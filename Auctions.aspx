<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Auctions.aspx.cs" Inherits="Lab_3.WebForm1" MasterPageFile="~/Master.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server" BorderColor="SkyBlue" BorderWidth="2px" HorizontalAlign="Center" Width="400px">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblSchedule" runat="server" Text="Auction Schedule"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblTitle" runat="server" Text="Auction Name:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtAuctionName" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDate" runat="server" Text="Auction Date:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCustomerName" runat="server" Text="Customer Inventory:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:DropDownList ID="ddlCustomerName" runat="server"></asp:DropDownList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblItems" runat="server" Text="Items:"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtItems" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" BorderColor="SkyBlue" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" BorderColor="SkyBlue"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="tblView" runat="server" BorderColor="SkyBlue" BorderWidth="2px" HorizontalAlign="Center" Width="400px">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblViewing" runat="server" Text="View Auction:"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:DropDownList ID="ddlView" runat="server"></asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnViewAuction" runat="server" Text="View" OnClick="btnViewAuction_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

</asp:Content>
