<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Lab1.Master" AutoEventWireup="true" CodeBehind="RequestList.aspx.cs" Inherits="Lab3.CustomerRequests" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="center">
        <tr>
            <td class ="bigText">Select a Request</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Select a Customer to open a ticket for:"></asp:Label></td>
            <td><asp:ListBox ID="lstRequestList" runat="server" Width="150px" Height ="200px" OnSelectedIndexChanged="lstRequestList_SelectedIndexChanged" AutoPostBack="true"></asp:ListBox></td>
        </tr>
        <tr>
            <td><asp:Button ID="btnMakeTicket" runat="server" Text="Create Ticket" OnClick="btnMakeTicket_Click"/></td>
        </tr>
    </table>
</asp:Content>
