<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Auction_Pick_Up.aspx.cs" Inherits="GreenValleyAuctions.Auction_Pick_Up" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tableForm" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
               <p> <asp:Label ID="lblForm" runat="server" Text="Auction Pick Up Form"></asp:Label></p>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Table ID="TableContact" runat="server">
                    <asp:TableRow>
                        <asp:TableCell >
                            <p><asp:Label ID="lblContact" runat="server" Text="Contact Information" ></asp:Label></p>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <p><asp:Label ID="lblName" runat="server" Text="Name: "></asp:Label></p>
                        </asp:TableCell>
                        <asp:TableCell>
                            <p><asp:Label ID="lblShowName" runat="server" Text=""></asp:Label></p>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <p><asp:Label ID="lblPhone" runat="server" Text="Phone: "></asp:Label></p>
                        </asp:TableCell>
                        <asp:TableCell>
                            <p><asp:Label ID="lblShowPhone" runat="server" Text=""></asp:Label></p>
                        </asp:TableCell>
                    </asp:TableRow>
                     <asp:TableRow>
                        <asp:TableCell>
                            <p><asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label></p>
                        </asp:TableCell>
                        <asp:TableCell>
                            <p><asp:Label ID="lblSHowEmai" runat="server" Text=""></asp:Label></p>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <p><asp:Label ID="lblContactDate" runat="server" Text="ContactDate: "></asp:Label></p>
                        </asp:TableCell>
                        <asp:TableCell>
                           <p> <asp:Label ID="lblShowDate" runat="server" Text=""></asp:Label></P>
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
                            <p><asp:Label ID="lblDates" runat="server" Text="Possible Action Dates: "></asp:Label></p>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <p><asp:Label ID="lblBringIn" runat="server" Text="Bring in Date: "></asp:Label></p>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtBringIn" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                           <p> <asp:Label ID="lblPickUp" runat="server" Text="Pick Up Date: "></asp:Label></p>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPickUp" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                          <p>  <asp:Label ID="lblLookAt" runat="server" Text="Look At Date: "></asp:Label></p>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtLookAt" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                           <p> <asp:Label ID="lblAppraisal" runat="server" Text="Appraisal Date: "></asp:Label></p>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAppraisal" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <p><asp:Label ID="lblConfirmedDate" runat="server" Text="Confirmed Action Dates"></asp:Label></P>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <p><asp:Label ID="lblBringConfirmed" runat="server" Text="Bring in Date: "></asp:Label></P>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtBringInConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <p><asp:Label ID="lblPickUpConfirmed" runat="server" Text="Pick Up Date: "></asp:Label></P>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtPickUpConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                           <p> <asp:Label ID="lblLookAtConfirmed" runat="server" Text="Look At Date: "></asp:Label></P>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtLookAtConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                           <p> <asp:Label ID="lblAppraisalConfirmed" runat="server" Text="Appraisal Date: "></asp:Label></P>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtAppraisalConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow HorizontalAlign="Right">
                        <asp:TableCell>
                            <p><asp:Label ID="lblSaleConfirmed" runat="server" Text="Sale Date: "></asp:Label></P>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:TextBox ID="txtSaleDateConfirmed" runat="server"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <p><asp:Label ID="lblStorage" runat="server" Text="Storage Required"></asp:Label></P>
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
                          <p>  <asp:Label ID="lblLocation" runat="server" Text="Storage Location: " Visible="false"></asp:Label></P>
                        </asp:TableCell>
                        <asp:TableCell>
                           <p> <asp:TextBox ID="txtLocation" runat="server" Visible="false"></asp:TextBox></p>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnPopulate" runat="server" Text="Populate" class="btn btn-primary btn-intake rounded-pill mediabutton"  OnClick="btnPopulate_Click"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-primary btn-intake rounded-pill mediabutton"  OnClick="btnSave_Click"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnClear" runat="server" Text="Clear" class="btn btn-primary btn-intake rounded-pill mediabutton"   OnClick="btnClear_Click" CausesValidation="false"/>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Button ID="btnBack" runat="server" Text="Back" class="btn btn-primary btn-intake rounded-pill mediabutton"   OnClick="btnBack_Click" CausesValidation="false"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
                
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
</asp:Content>
