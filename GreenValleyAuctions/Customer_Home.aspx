<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Home.aspx.cs" Inherits="Lab3.Customer_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Button ID="BtnLogout" runat="server" Text="LogOut" OnClick="BtnLogout_Click"/>
            <asp:Button ID="BtnLanding" runat="server" Text="Home" OnClick="BtnLanding_Click" />
            <hr />
            <asp:Label ID="lblRequest" runat="server" Text="Request a Service"></asp:Label>
            <asp:Table ID="Table1" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblService" runat="server" Text="Select Service Type: "></asp:Label>
                        <hr />
                        <asp:DropDownList ID="dplServiceType" AutoPostBack="true" runat="server">
                            <asp:ListItem Text="Moving" Value="Moving"></asp:ListItem>
                            <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDescription" runat="server" Text="Type Description: "></asp:Label>
                        <hr />
                        <asp:TextBox ID="txtDescription" runat="server" Height="300" Width="500" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnSend" runat="server" Text="Send Request" OnClick="btnSend_Click" />
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
