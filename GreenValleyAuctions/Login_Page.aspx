<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login_Page.aspx.cs" Inherits="Lab2.Login_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="btnLanding" runat="server" Text="Return to Landing Page"  OnClick="btnLanding_Click"/>
            <asp:Table ID="tblLogin" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlSelectLoginType" runat="server" AutoPostBack="true">
                            <asp:ListItem Text="Employee" Value="Employee"></asp:ListItem>
                            <asp:ListItem Text="Customer" Value="Customer"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblUsername" runat="server" Text="UserName:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPassWord" runat="server" Text="PassWord:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell >
                        <asp:Button ID="btnLogin" runat="server" Text="Login"  OnClick="btnLogin_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell >
                        <asp:Label ID="lblLoginStatus" runat="server" Text=""></asp:Label>
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
