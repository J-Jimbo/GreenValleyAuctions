<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerFacing.Master" AutoEventWireup="true" CodeBehind="CustomerRequest.aspx.cs" Inherits="Lab3.CustomerRequest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="center">
        <tr>
            <td class ="bigText">Create a Request for Service</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label8" runat="server" Text="Service Requested:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlServiceRequested" runat="server" AutoPostBack="true"></asp:DropDownList></td>

            <td><asp:Label ID="Label10" runat="server" Text="Service Deadline (YYYY-MM-DD):"></asp:Label></td>
            <td><asp:TextBox ID="txtbxServiceDeadline" runat="server"></asp:TextBox></td>

            <td><asp:Label ID="Label3" runat="server" Text="Description of Needs:"></asp:Label></td>
            <td colspan="2" rowspan="2"><textarea ID="txtbxDescriptionNeeds" rows="10" cols="30" runat="server"></textarea></td>
        </tr>
        <tr>
            <td><asp:Button ID="btnRequest" runat="server" Text="Request Service" OnClick="btnRequest_Click" /></td>
        </tr>
        <tr>
            <td>
                <div class="errorMsg">
                    <asp:Label ID="lblErrorMsg" runat="server" Text=""></asp:Label>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
