<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CustomerPortalHome.aspx.cs" Inherits="Lab_3.CustomerPortalHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
            <asp:Table ID="tblCustomerButtons" runat="server" HorizontalAlign="Center" BorderColor="SkyBlue" BorderWidth="2px" Height="100px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnNewCustomer" runat="server" Text="New Customer" Height="100px" Width="200px" OnClick="btnNewCustomer_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnExistingCustomer" runat="server" Text="Existing Customer" Height="100px" Width="200px" OnClick="btnExistingCustomer_Click"/>
                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>
        </div>
   </asp:Content>
