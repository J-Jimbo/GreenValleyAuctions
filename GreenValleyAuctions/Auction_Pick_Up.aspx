<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Auction_Pick_Up.aspx.cs" Inherits="GreenValleyAuctions.Auction_Pick_Up" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tableForm" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblForm" runat="server" Text="Auction Pick Up Form"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table ID="TableContact" runat="server">
                    <asp:TableRow>
                        <asp:TableCell >
                            <asp:Label ID="lblContact" runat="server" Text="Contact Information" ></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblName" runat="server" Text="Name: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblShowName" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblPhone" runat="server" Text="Phone: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblShowPhone" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblSHowEmai" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblContactDate" runat="server" Text="ContactDate: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblShowDate" runat="server" Text=""></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table ID="TablePossibleDates" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblDates" runat="server" Text="Possible Action Dates: "></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:Label ID="lblBringIn" runat="server" Text="Bring in Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtBringIn" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:Label ID="lblPickUp" runat="server" Text="Pick Up Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPickUp" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:Label ID="lblLookAt" runat="server" Text="Look At Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtLookAt" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:Label ID="lblAppraisal" runat="server" Text="Appraisal Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAppraisal" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblConfirmedDate" runat="server" Text="Confirmed Action Dates"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:Label ID="lblBringConfirmed" runat="server" Text="Bring in Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtBringInConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:Label ID="lblPickUpConfirmed" runat="server" Text="Pick Up Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPickUpConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:Label ID="lblLookAtConfirmed" runat="server" Text="Look At Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtLookAtConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:Label ID="lblAppraisalConfirmed" runat="server" Text="Appraisal Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAppraisalConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <asp:Label ID="lblSaleConfirmed" runat="server" Text="Sale Date: "></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtSaleDateConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblStorage" runat="server" Text="Storage Required"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:RadioButtonList ID="rblStorage" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="rblStorage_SelectedIndexChanged">
                                <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                                <asp:ListItem Text="No" Value="No"></asp:ListItem>
                            </asp:RadioButtonList>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblLocation" runat="server" Text="Storage Location: " Visible="false"></asp:Label>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtLocation" runat="server" Visible="false"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnClear" runat="server" Text="Clear"  OnClick="btnClear_Click" CausesValidation="false"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnBack" runat="server" Text="Back"  OnClick="btnBack_Click" CausesValidation="false"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
