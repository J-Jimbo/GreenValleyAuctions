<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Auction_Scheduling.aspx.cs" Inherits="GreenValleyAuctions.Auction_Scheduling" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<asp:ScriptManager ID="smAuctionSchedule" runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="postbackAffect" runat="server">
        <ContentTemplate>--%>
            <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">

                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAuction_scheduling" runat="server" Text="Auction Scheduling Form"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLookAt" runat="server" Text="Look At: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CheckBox ID="cbLookAt" runat="server" AutoPostBack="true" OnCheckedChanged="cbLookAt_CheckedChanged" CausesValidation="false"/>
                    </asp:TableCell>
                </asp:TableRow>
                 <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblBringInOrPickUP" runat="server" Text="Bring In or Pick Up : "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RadioButtonList ID="rblBringInOrPickUP" runat="server" RepeatDirection="Horizontal" CausesValidation="true">
                            <asp:ListItem Text="Bring In" Value="Bring In"></asp:ListItem>
                              <asp:ListItem Text="Pick Up" Value="Pick Up"></asp:ListItem>
                        </asp:RadioButtonList>
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvBorP" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblBringInOrPickUP"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="truck" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblTruck" runat="server" Text="Tuck Accesibility"></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="accesbility" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblDistance" runat="server" Text="Distance to door: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDistance" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvDistance" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtDistance"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="driveway" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblDriveWay" runat="server" Text="Driveway Conditions: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDriveWayConditions" runat="server"></asp:TextBox>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvconditions" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtDriveWayConditions"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="supplies" Visible="false">
                    <asp:TableCell VerticalAlign="Top">
                        <asp:Label ID="lblSupplies" runat="server" Text="Supplies needed: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CheckBoxList ID="cblSupplies" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" DataSourceID="datasrcSupplies" DataTextField="SupplyType" DataValueField="SupplyID" OnDataBound="cblSupplies_DataBound"></asp:CheckBoxList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Boxes" Visible="false">
                    <asp:TableCell VerticalAlign="Top">
                        <asp:Label ID="lblNumBoxes" runat="server" Text="Number of Boxes: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                         <br />
                        <asp:TextBox ID="txtsmallBox" runat="server" placeholder="Small"></asp:TextBox>
                        <br />
                         <asp:TextBox ID="txtMedBox" runat="server" placeholder="Medium"></asp:TextBox>
                        <br />
                         <asp:TextBox ID="txtLrgBox" runat="server" placeholder="Large"></asp:TextBox>
                        <br />
                         <asp:TextBox ID="txtArtBox" runat="server" placeholder="Art"></asp:TextBox>
                        <br />
                         <asp:TextBox ID="txtsPads" runat="server" placeholder="Small Pads"></asp:TextBox>
                        <br />
                         <asp:TextBox ID="txtLPads" runat="server" placeholder="Large Pads"></asp:TextBox>
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvsmallbox" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtsmallBox"></asp:RequiredFieldValidator>
                         <br />
                         <asp:RequiredFieldValidator ID="rfvmedbox" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtMedBox"></asp:RequiredFieldValidator>
                         <br />
                         <asp:RequiredFieldValidator ID="rfvlrgbox" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtLrgBox"></asp:RequiredFieldValidator>
                         <br />
                          <asp:RequiredFieldValidator ID="rfvart" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtArtBox"></asp:RequiredFieldValidator>
                         <br />
                         <asp:RequiredFieldValidator ID="rfvsmallPads" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtsPads"></asp:RequiredFieldValidator>
                         <br />
                         <asp:RequiredFieldValidator ID="rfvlargePads" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtLPads"></asp:RequiredFieldValidator>
                         <br />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Qtruck" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblQTruck" runat="server" Text="How Many Trucks: "></asp:Label>
                        <asp:TextBox ID="txtQuantityTrucks" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvQuantityTrucks" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtQuantityTrucks" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvTrucks" runat="server" ErrorMessage="CustomValidator" Text="Trucks selected and number of trucks are not equal" OnServerValidate="cvTrucks_ServerValidate"></asp:CustomValidator>
                        </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="whichtrucks" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblTrucks" runat="server" Text="Select which Trucks: "></asp:Label>
                        <asp:DropDownList ID="ddlTrucks" runat="server" DataTextField="EquipmentName" DataValueField="EquipmentID" DataSourceID="datasrcTruckList" OnDataBound="ddlTrucks_DataBound"></asp:DropDownList>
                        <asp:Button ID="btnAdd" runat="server" Text="Add Truck" OnClick="btnAdd_Click" CausesValidation="false"/>
                        <asp:Button ID="btnRemoveTruck" runat="server" Text="Remove Truck" OnClick="btnRemoveTruck_Click" CausesValidation="false"/>
                        <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="listTrucks" Visible="false">
                    <asp:TableCell>
                        <asp:ListBox ID="lbTrucks" runat="server"></asp:ListBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="Qmovers" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblQMovers" runat="server" Text="How Many Crew Members: "></asp:Label>
                        <asp:TextBox ID="txtQuantityMovers" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtQuantityMovers" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvnumMovers" runat="server" ErrorMessage="CustomValidator" Text="Movers selected and number of movers not equal" OnServerValidate="cvnumMovers_ServerValidate"></asp:CustomValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="whichCrew" Visible="false">
                    <asp:TableCell>
                        <asp:Label ID="lblSelecetMovers" runat="server" Text="Select which Employee: "></asp:Label>
                        <asp:DropDownList ID="ddlMovers" runat="server"  DataTextField="Worker" DataValueField="EmployeeID" DataSourceID="datasrcMovers" OnDataBound="ddlMovers_DataBound"></asp:DropDownList>
                        <asp:Button ID="btnAddMover" runat="server" Text="Add Movers" OnClick="btnAddMover_Click" CausesValidation="false"/>
                        <asp:Button ID="btnRemove" runat="server" Text="Remove Movers" OnClick="btnRemove_Click" CausesValidation="false"/>
                        <asp:Label ID="lblMoverError" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow ID="listCrew" Visible="false">
                    <asp:TableCell>
                        <asp:ListBox ID="lbMovers" runat="server" ></asp:ListBox>
                    </asp:TableCell>
                </asp:TableRow>
                
        
            </asp:Table>
     <%--</ContentTemplate>
        <Triggers>
            <asp:AsyncPostBackTrigger ControlID="ddlMovers" />
        </Triggers>
</asp:UpdatePanel>--%>
    <br />
    <asp:Table ID="AuctionDate" runat="server" Visible="false" HorizontalAlign="Center" >
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDate" runat="server" Text="Select Auction Dates "></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:TextBox ID="txtDate" runat="server" TextMode="Date" ></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnAddDate" runat="server" Text="Add Date" OnClick="btnAddDate_Click" CausesValidation="false" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnRemoveDate" runat="server" Text="Remove Date" OnClick="btnRemoveDate_Click" CausesValidation="false" />
                <asp:Label ID="lblDateError" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:ListBox ID="lbDate" runat="server"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <br />
    <asp:Table ID="noPostback" runat="server" HorizontalAlign="Center" Visible="false">
            <asp:TableRow ID="invForm" Visible="false">
                <asp:TableCell>
                    <asp:Label ID="lblInventoryForm" runat="server" Text="Upload Inventory Form: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:FileUpload ID="fuInventory" runat="server"/>
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
        </asp:Table>
    <br />
    <asp:Table ID="tblButtons" runat="server" HorizontalAlign="Center" Width="500px" >
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" CausesValidation="false" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
     <%--sql Data Sources--%>
    <asp:SqlDataSource ID="datasrcTruckList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select EquipmentName, EquipmentID from Equipment; "></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcMovers" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select trim(EmployeeFirstName)+ ' '+ trim(ISNULL(EmployeeLastName,'')) as Worker, EmployeeID from Employee; "></asp:SqlDataSource>
     <asp:SqlDataSource ID="datasrcSupplies" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select SupplyID, SupplyType from Supplies; "></asp:SqlDataSource>
    
</asp:Content>
