<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Completion_Form.aspx.cs" Inherits="GreenValleyAuctions.Completion_Form1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="col-md-1">
                    <a class="nav-link" href="Customer_Info.aspx">Profile</a>
     </div>

     <asp:Table ID="tblCFCustomer" runat="server" HorizontalAlign="Center"  Width="600px"  >
                <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblSearch" runat="server" Text="Search Customer: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSearch" runat="server" ></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="btnSearch" runat ="server" Text="-->" OnClick="btnSearch_Click" />
                </asp:TableCell>
                    </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="grdCustomerSearch" runat="server" AlternatingRowStyle="#eaaaff" EmptyDataText ="Customer Does Not Exist!"></asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="tblCFExpenses" runat="server" HorizontalAlign ="Center"  Width="600px" >
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblFinanceHeader" Text="Finances: " Font-Bold="true" runat="server" ></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblSubtotal" Text="Subtotal: " runat="server" ></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtSubtotal" runat="server" ></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lbladdexpenses" runat="server" Text="Additional Expenses Occured: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtaddexpenses" runat ="server" ></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblTotalCost" runat="server" Text="Total Cost: " ></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell> 
                        <asp:TextBox ID="txtTotalCost" runat="server" ></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button Id="btncalculate" runat="server" Text="Total Cost" OnClick="btncalculate_Click"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblpaymentreceived" runat="server" Text="Payment Received? "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButtonlist ID="Rblpaymentreceived" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="Rblpaymentreceived_SelectedIndexChanged">
                            <asp:ListItem Value="Yes">Yes</asp:ListItem> 
                            <asp:ListItem Value="No">No</asp:ListItem>
                            <asp:ListItem Value="Partial">Partial</asp:ListItem>
                            </asp:RadioButtonlist>
                        <asp:Label ID="lblPartial" runat="server" Visible="false" Text="Remaining Amount: "></asp:Label>
                        <asp:TextBox ID="txtpartial" runat="server" Visible="false" ></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="tblCFEmployees" runat="server" HorizontalAlign ="Center"  Width="600px" >
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEEtitle" runat="server" Font-Bold="true" Text="Employees and Equipment Involved: "></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmployees" runat="server" Text="Employees Associated" ></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButtonList ID="RBLEmployees" runat="server" RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">Brad Campbell</asp:ListItem>
                            <asp:ListItem Value="2">Sebastian</asp:ListItem>
                            <asp:ListItem Value="3">Zach</asp:ListItem>
                            <asp:ListItem Value="4">Greg</asp:ListItem>
                            <asp:ListItem Value="5">Sam</asp:ListItem>
                            <asp:ListItem Value="6">Scotty</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEquipmentUsed" runat="server" Text="Equipment Used: " ></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButtonList ID="RBLEquipment" runat="server"  RepeatDirection="Horizontal">
                            <asp:ListItem Value="1">2015</asp:ListItem>
                            <asp:ListItem Value="2">2011</asp:ListItem>
                            <asp:ListItem Value="3">Cube</asp:ListItem>
                            <asp:ListItem Value="4">GMC</asp:ListItem>
                            <asp:ListItem Value="5">Green</asp:ListItem>
                            <asp:ListItem Value="6">Van</asp:ListItem>
                            <asp:ListItem Value="7">Trailer</asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="tblCFNotes" runat="server" HorizontalAlign ="Center"  Width="600px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblHeaderNotes" runat="server" Text="Additional Notes: " Font-Bold="true" ></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox ID="txtAdditionalNotes" runat="server" width="600" height="100" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <asp:Table ID="tblsave" runat="server" HorizontalAlign ="Center" BorderWidth="1" BorderColor="Black" BorderStyle="Solid">
                <asp:TableRow>
                    <asp:TableCell>
            <asp:Button ID="btnSave" Text="Save" runat="server" OnClick="btnSave_Click" /> </asp:TableCell> <asp:TableCell> <asp:Button ID="btnpopulate" OnClick="btnpopulate_Click" runat="server" Text="Populate" /> <asp:Button ID="btnHistory" runat="server" Text="Show History" OnClick="btnHistory_Click" /></asp:TableCell>
                </asp:TableRow>
                </asp:Table>
            <asp:Table ID="tblHistory" runat="server" HorizontalAlign="Center" BorderWidth="1" BorderColor="Black" BorderStyle="Solid" Width="600px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="grdHistory" runat="server" AlternatingRowStyle="#eaaaff" EmptyDataText ="No Recent Reports"></asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>

</asp:Content>
