<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Service_Ticket.aspx.cs" Inherits="Lab2.Service_Ticket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblNote" runat="server" Width="674px">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" >
                <asp:Label ID="lblCustomer" runat="server" Text="Select Customer with In Progress Service:"></asp:Label>
                <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="datasrcCustomerList"  AutoPostBack="true" DataTextField="customerName" DataValueField="WorkFlowID"></asp:DropDownList>
                 <hr />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblTitle" runat="server" Text="Note Title: "></asp:Label>
                <asp:TextBox ID="txtTitle" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNoteTitle" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required Field"  ForeColor="Red" Font-Bold="true" ControlToValidate="txtTitle"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblNote" runat="server" Text="Note: "></asp:Label>
                <br />
                <asp:TextBox ID="txtNote" runat="server" Height="300" Width="500" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvNote" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required Field" ForeColor="Red" Font-Bold="true" ControlToValidate="txtNote"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnSaveNote" runat="server" Text="Save Note"  OnClick="btnSaveNote_Click" />
                <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
            </asp:TableCell>
            
        </asp:TableRow>
    </asp:Table>

      <%--sql Data scources --%>
            <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" 
                SelectCommand="SELECT trim(FirstName) + ' ' + trim(LastName) as customerName, wf.WorkFlowID from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID full join Customer c on c.CustomerID = WF.CustomerID where Wf.CurrentStatus = 'In Progress'"></asp:SqlDataSource>
            
</asp:Content>

