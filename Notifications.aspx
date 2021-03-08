<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Master.Master" CodeBehind="Notifications.aspx.cs" Inherits="Lab_3.Notifications" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div> </div>
    <asp:Table ID="Table1" runat="server" BorderWidth="2px" BorderColor="SkyBlue" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:RadioButtonList ID="rblNotifications" runat="server" AutoPostBack="true" OnLoad="rblNotifications_Load"></asp:RadioButtonList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnClear" runat="server" Text="Clear Notification" BorderColor="SkyBlue" OnClick="btnClear_Click"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnHome" runat="server" Text="Home" BorderColor="SkyBlue" OnClick="btnHome_Click"/>
            </asp:TableCell>
        </asp:TableRow>
        
    </asp:Table>
</asp:Content>
