<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Customer_Search.aspx.cs" Inherits="GreenValleyAuctions.Customer_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblPage" runat="server" HorizontalAlign="Center" >
                    <asp:TableRow HorizontalAlign="Center">
                        <asp:TableCell>
                             <asp:Label ID="lblSearch" runat="server" Text="Search for Customer:"></asp:Label>
                             <asp:TextBox ID="txtSearch" runat="server" ></asp:TextBox>
                             <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:ListBox ID="lbResults" runat="server" Height="500px" Width="500px" AutoPostBack="true" DataTextField="customerName" DataValueField="FullName"></asp:ListBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnSelect" runat="server" Text="View Customer" OnClick="btnSelect_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
     </asp:Table>
</asp:Content>
