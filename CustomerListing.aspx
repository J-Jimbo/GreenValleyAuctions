<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Lab1.Master" AutoEventWireup="true" CodeBehind="CustomerListing.aspx.cs" Inherits="Lab1.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>

<%--A button and a table, when clicked button will populate table with current list of customers--%>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="center" style="width:60%">
        <tr>
            <td><asp:Button ID="Button1" runat="server" Text="List Customers" OnClick="btnFillListBox_Click"/></td>
            <td><asp:ListBox ID="lstCustomerList" runat="server" Width="150px" Height ="200px"></asp:ListBox></td>
        </tr>
    </table>
</asp:Content>
