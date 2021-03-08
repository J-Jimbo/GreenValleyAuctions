<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="CustomerSearch.aspx.cs" Inherits="Lab_3.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:Table ID="tblCustomerSearch" runat="server" BorderColor="SkyBlue" BorderWidth="2px" HorizontalAlign="Center">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblSeacrh" runat="server" Text="Search:"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtSearch" runat="server"></asp:TextBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnSearch" runat="server" Text="->" OnClick="btnSearch_Click"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Gridview runat ="server" ID="grdCustomerSearch" AlternatingRowStyle ="#eaaaff" EmptyDataText ="Customer Does Not Exist!">
                                </asp:Gridview>
                            <asp:GridView runat="server" ID="grdView"></asp:GridView>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>

</asp:Content>
