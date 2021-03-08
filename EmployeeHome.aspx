<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="EmployeeHome.aspx.cs" Inherits="Lab_3.EmployeeHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
           <asp:Table ID="tblEmployeeHome" runat="server" height="300px" Width="600px" HorizontalAlign="Center" BorderWidth="2" BorderColor="SkyBlue">
                <asp:TableRow>
                    <asp:TableCell ColumnSpan="2" HorizontalAlign="Center">
                        <asp:Label ID="lblHome" runat="server" Text="Employee Home" Font-Bold="true" Font-Underline="true" Font-Size="Large"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblMotivationalQ" runat="server" Text="Daily Motivation:" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblMotivation" runat="server" Text="If you aim at nothing, you will hit it every time. – Zig Zigler"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblGoal" runat="server" Text="Month Goal:" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblMonthGoal" runat="server" Text="Acquire 10 New Customers."></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblGoalYear" runat="server" Text="Year Goal:" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblYearGoal" runat="server" Text="Acquire 120 New Customers"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmpName" runat="server" Text="Employee Name:" Font-Bold="true"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblEmployeeName" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                </asp:TableRow>
            </asp:Table>
        </div>
   </asp:Content>
