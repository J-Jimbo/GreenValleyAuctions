<%--Created by Ben Ortt--%>

<%@ Page Title="" Language="C#" MasterPageFile="~/Lab1.Master" AutoEventWireup="true" CodeBehind="AddCustomer.aspx.cs" Inherits="Lab1.AddCustomer" %>

<%--Links the stylesheet--%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="Style.css" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Creates the table to hold all of the input text boxes and labels to organize them-->
    <table class="center" style="width:60%">
        <tr>
            <td class ="bigText">Customer Information</td>
        </tr>
        <tr>
            <td><asp:Label ID="Label1" runat="server" Text="Name:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxCustomerName" runat="server" Width="85px"></asp:TextBox></td>

            <td><asp:Label ID="Label5" runat="server" Text="Adress:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxCustomerAddress" runat="server" Width="200px"></asp:TextBox></td>

            <td><asp:Label ID="Label2" runat="server" Text="Email:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxCustomerEmail" runat="server"></asp:TextBox></td>
                        
        </tr>
        <tr>
            <td><asp:Label ID="Label3" runat="server" Text="Phone Number:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxCustomerPhone" runat="server"></asp:TextBox></td>

            <td><asp:Label ID="Label4" runat="server" Text="Initial Contact Method:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlInitialContact" runat="server" AutoPostBack="true"></asp:DropDownList></td>

            <td><asp:Label ID="Label6" runat="server" Text="If other, specifiy:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxOtherContact" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
            <td><asp:Label ID="Label7" runat="server" Text="How did you hear about us:"></asp:Label></td>
            <td><asp:TextBox ID="txtbxHDYH" runat="server"></asp:TextBox></td>

            <td><asp:Label ID="Label8" runat="server" Text="Service Requested:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlServiceRequested" runat="server" AutoPostBack="true"></asp:DropDownList></td>

            <td><asp:Label ID="Label10" runat="server" Text="Service Deadline (YYYY-MM-DD):"></asp:Label></td>
            <td><asp:TextBox ID="txtbxServiceDeadline" runat="server"></asp:TextBox></td>
        </tr>
        <tr>
       

            

            <td><asp:Label ID="Label9" runat="server" Text="Employee Name:"></asp:Label></td>
            <td><asp:DropDownList ID="ddlEmployeeName" runat="server" AutoPostBack="true"></asp:DropDownList></td>
        </tr>
        </table>

        <table class="center" style="width:60%">
            <tr>
                <td class ="bigText">Move Information</td>
            </tr>
            <tr>
                <td><asp:Label ID="Label11" runat="server" Text="Origin Address:"></asp:Label></td>
                <td><asp:TextBox ID="txtbxOriginAddress" runat="server"></asp:TextBox></td>

                <td><asp:Label ID="Label12" runat="server" Text="Destination Address:"></asp:Label></td>
                <td><asp:TextBox ID="txtbxDestinationAddress" runat="server"></asp:TextBox></td>

                <td><asp:Label ID="Label13" runat="server" Text="Fuel Cost:"></asp:Label></td>
                <td><asp:TextBox ID="txtbxFuelCost" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="Label14" runat="server" Text="Food Cost:"></asp:Label></td>
                <td><asp:TextBox ID="txtbxFoodCost" runat="server"></asp:TextBox></td>

                <td><asp:Label ID="Label15" runat="server" Text="Lodging Cost:"></asp:Label></td>
                <td><asp:TextBox ID="txtbxLodgingCost" runat="server"></asp:TextBox></td>
            </tr>
        </table>

        <table class="center" style="width:60%">
            <tr>
                <td class ="bigText">Auction Information</td>
            </tr>
            <tr>
                <td><asp:Label ID="Label16" runat="server" Text="Select an Employee Contact:"></asp:Label></td>    
                <td><asp:DropDownList ID="ddlContactEmployee" runat="server" AutoPostBack="true"></asp:DropDownList></td>
                <td></td>
                <td></td>
                <td></td>
                <td></td>
            </tr>
        </table>

        <table class="center" style="width:60%">
        <tr>
            <td><asp:Button ID="btnPopulate" runat="server" Text="Populate Move" OnClick="btnPopulate_Click" /></td>
            <td><asp:Button ID="btnPopulateAuc" runat="server" Text="Populate Auction" OnClick="btnPopulateAuc_Click" /></td>
            <td><asp:Button ID="btnCommit" runat="server" Text="Commit" OnClick="btnCommit_Click" /></td>
            <td><asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click"/></td>
  
            <td>
                <div class="errorMsg">
                    <asp:Label ID="lblErrorMsg" runat="server" Text=" "></asp:Label>
                </div>
            </td>
        </tr>
        </table>
        
</asp:Content>
