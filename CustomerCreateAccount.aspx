<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/noLogin.Master" AutoEventWireup="true" CodeBehind="CustomerCreateAccount.aspx.cs" Inherits="Lab3.CustomerCreateAccount" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="center">
        <tr>
            <td>
        <div>
            <br />
            <br />
            <strong>Create User</strong><br />

            Email (Username):
            <asp:TextBox ID="txtbxEmail" runat="server"></asp:TextBox>
            <br />

            First Name:&nbsp;
            <asp:TextBox ID="txtbxFirstName" runat="server"></asp:TextBox>
            <br />

            Last Name:
            <asp:TextBox ID="txtbxLastName" runat="server"></asp:TextBox>
            <br />

            Address:
            <asp:TextBox ID="txtbxAddress" runat="server"></asp:TextBox>
            <br />

            Phone:
            <asp:TextBox ID="txtbxPhone" runat="server"></asp:TextBox>
            <br />

            Password:
            <asp:TextBox ID="txtPassword" runat="server"></asp:TextBox>
            <br />

            <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
            <br />
            <asp:Label ID="lblStatus" runat="server"></asp:Label>
            <br />
            <asp:LinkButton ID="lnkAnother" runat="server" OnClick="lnkAnother_Click" Visible="False">Create Another</asp:LinkButton>
        </div>
            </td>
        </tr>
    </table>
</asp:Content>
