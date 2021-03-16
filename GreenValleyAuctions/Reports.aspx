<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Lab2.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%-- table for first report, customer--%>
            <asp:Table ID="tblCustomerSelection" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblSelection" runat="server" Text="Choose a Customer: "></asp:Label>
                        <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="datasrcCustomerList" DataTextField="customerName" 
                            DataValueField="customerID"  OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                    
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="CustomerGrid" runat="server" EmptyDataText="No Data on Customer">

                        </asp:GridView>
                    </asp:TableCell>

                </asp:TableRow>
            </asp:Table>
            <br />
            <hr />
           <%-- table for second report, service event--%>
            <asp:Table ID="tblServiceChart" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceChart" runat="server" Text="Choose a Service Type: "></asp:Label>
                        <asp:DropDownList ID="ddlService" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlService_SelectedIndexChanged">
                            <asp:ListItem Text="Moving" Value="Moving"></asp:ListItem>
                            <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="ServiceGrid" runat="server" EmptyDataText="No Customer selected">

                        </asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>



               <%--sql Data scources --%>
            <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="SELECT FirstName + ' ' + LastName as customerName, customerID from Customer"></asp:SqlDataSource>


</asp:Content>
