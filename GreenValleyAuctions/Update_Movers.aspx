<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Update_Movers.aspx.cs" Inherits="GreenValleyAuctions.Update_Movers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="TableInception" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <table style="margin:auto;">
            <tr>
                <td><p><asp:Label ID="Label1" runat="server" Text="Search Employees:"></asp:Label></P></td>
                <td><asp:TextBox ID="txtBxEmpSearchName" runat="server" Class="form-control"></asp:TextBox></td>
                <td><asp:Button ID="btnSearchEmp" runat="server" Text="Search" OnClick="btnSearchEmp_Click" class="btn btn-primary btn-intake rounded-pill mediabutton" /></td>
            </tr>
            <tr>
                <td></td>
                <td><asp:ListBox ID="lstBxEmpNames" runat="server" AutoPostBack="true" Width="150px" Height="200px" Class="form-control"></asp:ListBox></td>
                <td></td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnEditEmp" runat="server" Text="Edit Employee" OnClick="btnEditEmp_Click" class="btn btn-primary btn-intake rounded-pill mediabutton" />
                </td>
                <td><p><asp:Label ID="tstLbl" runat="server" Text=""></asp:Label></P></td>
            </tr>
        </table>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Table ID="Table2" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <p><asp:Label ID="Label2" runat="server" Text="First Name:"></asp:Label></P>
                            <asp:TextBox ID="txtBxEmpFirstName" runat="server" Class="form-control"></asp:TextBox>
                            <br />
                            <p><asp:Label ID="Label3" runat="server" Text="Last Name:"></asp:Label></P>
                            <asp:TextBox ID="txtxBxEmpLastName" runat="server" Class="form-control"></asp:TextBox>
                            <br />
                            <p><asp:Label ID="Label4" runat="server" Text="Phone:"></asp:Label></P>
                            <asp:TextBox ID="txtBxEmpPhone" runat="server" Class="form-control"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            
                
            
            
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                                <asp:Button ID="btnUpdateEmp" runat="server" Text="Update Existing" class="btn btn-primary btn-intake rounded-pill mediabutton" OnClick="btnUpdateEmp_Click" />

            </asp:TableCell>
            <asp:TableCell>
                                <asp:Button ID="btnCreateEmp" runat="server" Text="Create New" class="btn btn-primary btn-intake rounded-pill mediabutton" OnClick="btnCreateEmp_Click" />

            </asp:TableCell>
            <asp:TableCell>
                                <asp:Button ID="btnPopulate" runat="server" Text="Populate" class="btn btn-primary btn-intake rounded-pill mediabutton" OnClick="btnPopulate_Click" />

            </asp:TableCell>
            <asp:TableCell>
                                <p><asp:Label ID="lblResult" runat="server" Text=""></asp:Label></p>

            </asp:TableCell>
        </asp:TableRow>
        
    </asp:Table>
    
        
        
</asp:Content>
