<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Login.aspx.cs" Inherits="Lab3.Customer_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                     <asp:TableCell>
                        <asp:Button ID="btnHome" runat="server" Text="Home" OnClick="btnHome_Click" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLogin" runat="server" Text="Customer Login: "></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblUserName" runat="server" Text="UserName: "></asp:Label>
                        <br />
                        <asp:Label ID="lblPass" runat="server" Text="Password: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                        <br />
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click"/>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>
    </form>
    <footer>
         <br />
        Created By: Jimmy Magnier and Jon Asay
    </footer>
</body>
</html>
