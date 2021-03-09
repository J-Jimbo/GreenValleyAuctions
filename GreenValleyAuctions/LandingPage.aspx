<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LandingPage.aspx.cs" Inherits="Lab3.LandingPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Jimmy Magnier and Jon Asay</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="lblStatus" runat="server" Text="" ></asp:Label>
            <asp:Table ID="Table1" runat="server" Height="682px" Width="1283px">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell VerticalAlign="Middle">
                        <asp:Label ID="lblLogin" runat="server" Text="Login:"></asp:Label>
                        <br />
                        <asp:Button ID="btnEmpLogin" runat="server" Text="Login"  OnClick="btnEmpLogin_Click"/>
                        &nbsp;
                        <asp:Button ID="btnRequest" runat="server" Text="Create Service Request" OnClick="btnRequest_Click" />
                        <br />
                        <asp:Label ID="lblquestion" runat="server" Text="Don't Have An Account?"></asp:Label>
                        <asp:HyperLink ID="hlCreateAccount" runat="server" Text="Create Account" NavigateUrl="~/Create_Customer_Account.aspx"></asp:HyperLink>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                     <asp:Label ID="lblWelcome" runat="server" Text="Welcome To Our Application"></asp:Label>
                     </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
    <footer>
         <br />
        Created By: Madison Consulting 04
    </footer>
</body>

</html>
