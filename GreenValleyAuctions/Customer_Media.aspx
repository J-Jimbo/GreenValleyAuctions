<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Customer_Media.aspx.cs" Inherits="GreenValleyAuctions.WebForm1" %>

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
                        <asp:Label ID="lblUpload" runat="server" Text="Upload Media"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
               <asp:TableRow ID="RowLookAt" Visible="false">
                <asp:TableCell>
                    <asp:Label ID="lblImages" runat="server" Text="Upload Images: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:FileUpload ID="fuPhotos" runat="server" AllowMultiple="true" />
                </asp:TableCell>
            </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnUpload" runat="server" Text="Upload Media" OnClick="btnUpload_Click" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
</body>
</html>
