<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/noLogin.Master" AutoEventWireup="true" CodeBehind="userLogin.aspx.cs" Inherits="Lab3.userLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="center">
        <tr>
        <td>
        <div>
            <br />
            <br />
            <strong>Login</strong><br />
            Username:
            <asp:TextBox ID="txtUsername" runat="server"></asp:TextBox>
            <br />
            Password:
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <br />
            <asp:DropDownList ID="ddlAccType" runat="server" AutoPostBack="true"></asp:DropDownList>
            <br />
            <br />
            <asp:Button ID="btnLogin" runat="server" OnClick="btnLogin_Click" Text="Login" />
            <br />
            <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            <br />
            <asp:Button ID="btnCreateCustomerAccount" runat="server" Text="New Customer? Create an Account" OnClick="btnCreateCustomerAccount_Click"/>
        </div>
        </td>
        </tr>
    </table>
</asp:Content>
