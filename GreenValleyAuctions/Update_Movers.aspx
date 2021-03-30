<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Update_Movers.aspx.cs" Inherits="GreenValleyAuctions.Update_Movers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table style="margin:auto;">
            <tr>
                <td><asp:Label ID="Label1" runat="server" Text="Search Employees:"></asp:Label></td>
                <td><asp:TextBox ID="txtBxEmpSearchName" runat="server"></asp:TextBox></td>
                <td><asp:Button ID="btnSearchEmp" runat="server" Text="Search" OnClick="btnSearchEmp_Click" /></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:ListBox ID="lstBxEmpNames" runat="server" AutoPostBack="true" Width="150px" Height="200px"></asp:ListBox></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnEditEmp" runat="server" Text="Edit Employee" OnClick="btnEditEmp_Click" />
                </td>
                <td><asp:Label ID="tstLbl" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
        <table style="margin:auto;">
            <tr>
                <td><asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label></td>
                <td><asp:TextBox ID="txtBxEmpFirstName" runat="server"></asp:TextBox></td>

                <td><asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label></td>
                <td><asp:TextBox ID="txtxBxEmpLastName" runat="server"></asp:TextBox></td>

                <td><asp:Label ID="Label4" runat="server" Text="Phone:"></asp:Label></td>
                <td><asp:TextBox ID="txtBxEmpPhone" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnUpdateEmp" runat="server" Text="Update Existing" OnClick="btnUpdateEmp_Click" /></td>
                <td><asp:Button ID="btnCreateEmp" runat="server" Text="Create New" OnClick="btnCreateEmp_Click" /></td>
                <td><asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" /></td>
                <td><asp:Label ID="lblResult" runat="server" Text=""></asp:Label></td>
            </tr>
        </table>
        
</asp:Content>
