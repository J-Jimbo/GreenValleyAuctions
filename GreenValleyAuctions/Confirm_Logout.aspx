<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Confirm_Logout.aspx.cs" Inherits="GreenValleyAuctions.Confirm_Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server"  HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblQuestion" runat="server" Text="Are you sure you want to Logout?" Font-Bold="true"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnYes" runat="server" Text="Confirm Logout" OnClick="btnYes_Click" Class="btn btn-primary btn-lg"/>
                <asp:Button ID="btnNo" runat="server" Text="Return to Home" OnClick="btnNo_Click" Class="btn btn-primary btn-lg"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
