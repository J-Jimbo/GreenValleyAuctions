<%--Created by Ben Ortt--%>


<%@ Page Title="" Language="C#" MasterPageFile="~/Lab1.Master" AutoEventWireup="true" CodeBehind="TakeNotes.aspx.cs" Inherits="Lab2.TakeNotes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table class="center" style="width:60%">
        <tr>
            <td class ="bigText">Take Notes</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Select Note Taker Name:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlEmployeeName" runat="server" AutoPostBack="true"></asp:DropDownList></td>

            <td><asp:Label ID="Label2" runat="server" Text="Select the Customer Name:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlCustomerName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlCustomerName_SelectedIndexChanged"></asp:DropDownList></td>

            <td><asp:Label ID="Label5" runat="server" Text="Select the Ticket Opening Date:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlOpenDate" runat="server" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        <tr>
            <td colspan="2"><asp:Label ID="Label4" runat="server" Text="Enter Note Title"></asp:Label></td>
            <td><asp:TextBox ID="txtbxNoteTitleNT" runat="server"></asp:TextBox></td>

            <td><asp:Label ID="Label3" runat="server" Text="Enter Note Contents"></asp:Label></td>
            <td colspan="2" rowspan="2"><textarea ID="txtbxNoteContentsNT" rows="10" cols="30" runat="server"></textarea></td>
        </tr>
        <tr>
            <td><asp:Button ID="btnCommitNT" runat="server" Text="Commit" OnClick="btnCommitNT_Click" /></td>
            <td><asp:Button ID="btnPopNT" runat="server" Text="Populate" OnClick="btnPopNT_Click" /></td>
            <td><asp:Button ID="btnClearNT" runat="server" Text="Clear" OnClick="btnClearNT_Click" /></td>

            <td>
                <div class="errorMsg">
                    <asp:Label ID="lblErrorMsg" runat="server" Text=" "></asp:Label>
                </div>
            </td>
        </tr>
    </table>

</asp:Content>
