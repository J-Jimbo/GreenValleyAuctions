<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CustomerHome.aspx.cs" Inherits="Lab_3.CustomerHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
            <asp:Table ID="tblCustomerHome" runat="server" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Label ID="lblWelcome" runat="server" Width="500px" Text="Please Click the Button Below to Submit a Service Request"></asp:Label>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell HorizontalAlign="Center">
                        <asp:Button ID="btnServiceRequest" runat="server" Text="Submit Service Request" BorderColor="SkyBlue" OnClick="btnServiceRequest_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>
   </asp:Content>
