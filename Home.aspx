<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Lab_3.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
            <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" BorderColor="SkyBlue" BorderWidth="2px" Height="100px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnCustomerPortal" runat="server" Text="Customer Portal" Height="100px" Width="200px" OnClick="btnCustomerPortal_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnEmployeePortal" runat="server" Text="Employee Portal" Height="100px" Width="200px" OnClick="btnEmployeePortal_Click"/>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
        </div>
   </asp:Content>
