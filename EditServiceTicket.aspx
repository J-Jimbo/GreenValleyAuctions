<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Lab1.Master" AutoEventWireup="true" CodeBehind="EditServiceTicket.aspx.cs" Inherits="Lab3.EditServiceTicket" %>
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
            <td class ="bigText">Current Service Info</td>
        </tr>

        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Initiating Employee:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlEmployeeName" runat="server" AutoPostBac="true"></asp:DropDownList></td>

            <td><asp:Label ID="Label3" runat="server" Text="Ticket Status:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxTicketStatus" runat="server"></asp:TextBox></td>

            <td><asp:Label ID="Label4" runat="server" Text="Ticket Opening Date:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxOpenDate" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label6" runat="server" Text="Ticket Deadline:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxDeadline" runat="server"></asp:TextBox></td>
        </tr>
    </table>
    <table class="center" style="width:60%">
        <tr>
            <td class ="bigText">Current Move Info</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label7" runat="server" Text="Origin Address:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxOriginAddress" runat="server"></asp:TextBox></td>

            <td><asp:Label ID="Label8" runat="server" Text="Destination Address:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxDestAddress" runat="server"></asp:TextBox></td>

            <td><asp:Label ID="Label9" runat="server" Text="Fuel Cost:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxFuelCost" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label10" runat="server" Text="Food Cost:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxFoodCost" runat="server"></asp:TextBox></td>

            <td><asp:Label ID="Label11" runat="server" Text="Lodging Cost"></asp:Label></td>
            <td><asp:TextBox ID="txtbxLodgeCost" runat="server"></asp:TextBox></td>
        </tr>
    </table>   
    <table class="center" style="width:60%">
        <tr>
            <td class ="bigText">Current Auction Info</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label12" runat="server" Text="Current Contact:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlContact" runat="server" AutoPostBack="true"></asp:DropDownList></td>

            <td><asp:Label ID="Label14" runat="server" Text="Current Auction Event:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlAucEvent" runat="server"></asp:DropDownList></td>
        </tr>
    </table>
    <table class="center"style="width:60%">
        <tr>
           <td><asp:Button ID="btnCommit" runat="server" Text="Commit" OnClick="btnCommit_Click" /></td>

            <td><asp:Label ID="Label13" runat="server" Text="Select the Ticket Type to Update:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlTicketType" runat="server"></asp:DropDownList></td>

            <td><asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" /></td>

            <td>
                <div class="errorMsg">
                    <asp:Label ID="lblErrorMsg1" runat="server" Text=" "></asp:Label>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
