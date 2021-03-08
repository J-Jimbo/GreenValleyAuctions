<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Lab1.Master" AutoEventWireup="true" CodeBehind="ViewNotes.aspx.cs" Inherits="Lab2.EditService" %>
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
            <td class ="bigText">Ticket History</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Previous Employees:"></asp:Label></td>
            <td><asp:ListBox ID="lstbxPrevEmp" runat="server" Width="150px" Height ="100px"></asp:ListBox></td>

            <td></td>
            <td></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Service Note Titles:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlNoteTitle" runat="server" AutoPostBack="true"></asp:DropDownList></td>

            <td><asp:Label ID="Label4" runat="server" Text="Selected Note Details:"></asp:Label></td>
            <td><textarea ID="txtbxNoteContents" rows="10" cols="30" runat="server"></textarea></td>
        </tr>
        <tr>
            <td><asp:Button ID="Button1" runat="server" Text="View Note Details" OnClick="ddlNoteTitle_SelectedIndexChanged" /></td>
        </tr>
    </table>

</asp:Content>