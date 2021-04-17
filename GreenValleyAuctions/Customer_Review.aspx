<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Review.aspx.cs" Inherits="GreenValleyAuctions.Customer_Review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblTitle" runat="server" Text="Leave a Review "></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblRate" runat="server" Text="Rate your Experiance"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlRating" runat="server">
                            <asp:ListItem Text="1" Value="1"></asp:ListItem>
                            <asp:ListItem Text="2" Value="2"></asp:ListItem>
                            <asp:ListItem Text="3" Value="3"></asp:ListItem>
                            <asp:ListItem Text="4" Value="4"></asp:ListItem>
                            <asp:ListItem Text="5" Value="5"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:Label ID="lblComments" runat="server" Text="Comments: "></asp:Label>
                        <hr />
                        <asp:TextBox ID="txtComments" runat="server" Height="300" Width="500" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblOnline" runat="server" Text="Review Us Online!"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:HyperLink ID="hlGoogle" runat="server" NavigateUrl="https://www.google.com/search?q=Green+Valley+Auction+Virgina&rlz=1C1CHZL_enUS759US759&oq=Green+Valley+Auction+Virgina&aqs=chrome..69i57j0i13i30j0i8i13i30.18964j0j1&sourceid=chrome&ie=UTF-8" Target="_blank">Google Review</asp:HyperLink>
                    </asp:TableCell>
                 </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:HyperLink ID="hlFacebook" runat="server" NavigateUrl="https://www.facebook.com/greenvalleyauctions/" Target="_blank">Facebook</asp:HyperLink>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:HyperLink ID="hlYelp" runat="server" NavigateUrl="https://www.yelp.com/biz/green-valley-auctions-mount-crawford" Target="_blank">yelp</asp:HyperLink>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

        </div>
    </form>
</body>
</html>
