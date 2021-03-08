<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Lab1.Master" AutoEventWireup="true" CodeBehind="CustomerSearch.aspx.cs" Inherits="Lab3.CustomerSearch" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="center">
        <tr>
            <td class ="bigText">Search for A Customer</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Search for a Customer:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxCustomerSearch" runat="server" AutoPostBack="true"></asp:TextBox></td>
            <td><asp:Button ID="btnCustSearch" runat="server" Text="Search" OnClick="btnCustSearch_Click" /></td>

            <td><asp:Label ID="Label2" runat="server" Text="Results(Select for Details):"></asp:Label></td>
            <td><asp:ListBox ID="lstCustomerList" runat="server" Width="150px" Height ="100px" OnSelectedIndexChanged="lstCustomerList_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox></td>
        </tr>
    </table>
    <table class="center">
        <tr>
            <td class ="bigText">Customer Details</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Past Tickets:"></asp:Label></td>
            <td><asp:GridView ID="grdPastTickets" runat="server" AutoGenerateColumns="false">
                <Columns>
                    <asp:BoundField DataField="ticketStatus" HeaderText="Status" />
                    <asp:BoundField DataField="ticketOpenDate" HeaderText="Open Date" />
                    <asp:BoundField DataField="deadlineDate" HeaderText="Deadline" />
                </Columns>
                </asp:GridView>
            </td>
        </tr>
    </table>
</asp:Content>
