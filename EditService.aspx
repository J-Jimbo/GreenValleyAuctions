<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Lab1.Master" AutoEventWireup="true" CodeBehind="EditService.aspx.cs" Inherits="Lab2.EditService1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="center" style="width:60%">
        <tr>
            <td class ="bigText">Find Service Ticket</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label2" runat="server" Text="Select the Customer Name:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlCustomerName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCustomerName_SelectedIndexChanged"></asp:DropDownList></td>

            <td><asp:Label ID="Label5" runat="server" Text="Select the Ticket Opening Date:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlOpenDate" runat="server" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        <tr>
            <td><asp:Button ID="btnFind" runat="server" Text="Find Ticket" OnClick="btnFind_Click" /></td>

            <td>
                <div class="errorMsg">
                    <asp:Label ID="lblErrorMsg" runat="server" Text=" "></asp:Label>
                </div>
            </td>
        </tr>
    </table>

    <table class="center" style="width:60%">
        <tr>
            <td class ="bigText">Select a New Employee</td>
        </tr>

        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Current Employee:"></asp:Label></td>
            <td><asp:Label ID="lblCurrentEmp" runat="server" Text=""></asp:Label></td>

            <td>Select an employee to pass to:</td>
            <td><asp:DropDownList ID="ddlEmployeeName" runat="server" AutoPostBack="true"></asp:DropDownList></td>

        </tr>
        <tr>
           <td><asp:Button ID="btnCommit" runat="server" Text="Commit" OnClick="btnCommit_Click" /></td>
            <td>
                <div class="errorMsg">
                    <asp:Label ID="lblErrorMsg1" runat="server" Text=" "></asp:Label>
                </div>
            </td>
        </tr>
    </table>

</asp:Content>
