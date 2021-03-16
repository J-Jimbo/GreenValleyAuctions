<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Move_Schedule_Screen.aspx.cs" Inherits="GreenValleyAuctions.Move_Schedule_Screen" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
        <asp:TableRow >
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                <asp:Label ID="lblMove" runat="server" Text="Move Schedule Screen Form"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                 <asp:Table ID="tblScourceAddress" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="lblOrignAddress" runat="server" Text="Origin Address:"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:TextBox ID="txtOrigin" runat="server" Enabled="false" width="300px "></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                <asp:Table ID="tblDestination" runat="server" Visible="true">
                            <asp:TableRow>
                                <asp:TableCell>
                                            <asp:Label ID="lblDestinationAddress" runat="server" Text="Destination Address:"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:TextBox ID="txtDest" runat="server" Enabled="false" Width="300px"></asp:TextBox>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMoveDate" runat="server" Text="Final Move Date: "></asp:Label>
                <asp:TextBox ID="txtMoveDate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFinalDate" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtMoveDate" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPricingSource" runat="server" Text="Pricing Source: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell HorizontalAlign="Left">
                <asp:RadioButtonList ID="rblPricingScource" runat="server" RepeatDirection="Horizontal">
                    <asp:ListItem Text="MLS" Value="MLS"></asp:ListItem>
                    <asp:ListItem Text="Look At" Value="Look At"></asp:ListItem>
                    <asp:ListItem Text="Phone" Value="Phone"></asp:ListItem>
                    <asp:ListItem Text="Email" Value="Email"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
             <asp:TableCell HorizontalAlign="Left">
                <asp:RequiredFieldValidator ID="rfvPriceScource" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="rblPricingScource" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
            <%--need to attach list somehow --%>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblQTruck" runat="server" Text="How Many Trucks: "></asp:Label>
                <asp:TextBox ID="txtQuantityTrucks" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvQuantityTrucks" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtQuantityTrucks" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblTrucks" runat="server" Text="Select which Trucks: "></asp:Label>
                <asp:DropDownList ID="ddlTrucks" runat="server" DataTextField="EquipmentName" DataValueField="EquipmentName" DataSourceID="datasrcTruckList"></asp:DropDownList>
                <asp:Button ID="btnAdd" runat="server" Text="Add Truck" OnClick="btnAdd_Click" CausesValidation="false"/>
                <asp:Button ID="btnRemoveTruck" runat="server" Text="Remove Truck" OnClick="btnRemoveTruck_Click" CausesValidation="false"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:ListBox ID="lbTrucks" runat="server"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblQMovers" runat="server" Text="How Many Movers: "></asp:Label>
                <asp:TextBox ID="txtQuantityMovers" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtQuantityMovers" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblSelecetMovers" runat="server" Text="Select which Movers: "></asp:Label>
                <asp:DropDownList ID="ddlMovers" runat="server"  DataTextField="Worker" DataValueField="Worker" DataSourceID="datasrcMovers"></asp:DropDownList>
                <asp:Button ID="btnAddMover" runat="server" Text="Add Movers" OnClick="btnAddMover_Click" CausesValidation="false"/>
                <asp:Button ID="btnRemove" runat="server" Text="Remove Movers" OnClick="btnRemove_Click" CausesValidation="false"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:ListBox ID="lbMovers" runat="server"></asp:ListBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblPrice" runat="server" Text="Estimate/Contract Price:" ></asp:Label>
                <asp:TextBox ID="txtPrice" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="rfvPrice" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtPrice" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCostConsumables" runat="server" Text="Cost of Consumables: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtCostConsumables" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvConsumables" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCostConsumables" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblHours" runat="server" Text="Hours"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblEstimate" runat="server" Text="Estimated Hours: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtEstimateHours" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEstimateHours" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtEstimateHours" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblActualHours" runat="server" Text="Actual Hours: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtActualHours" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvActualHours" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtActualHours" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblMilage" runat="server" Text="Milages "></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="OriginMilage" runat="server" Text="Origin Milage: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtOriginMilage" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvOrigin" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtOriginMilage" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblDestinationMilage" runat="server" Text="Destination Milage: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtMilage" runat="server" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvMilage" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtMilage" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblOtherMilage" runat="server" Text="Other Milage: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtOtherMilage" runat="server" OnTextChanged="txtOtherMilage_TextChanged" AutoPostBack="true"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvOther" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtOtherMilage" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lbTotalMilage" runat="server" Text="Total Estimated Miles: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <hr />
                <asp:Label ID="sumMilage" runat="server" Text=""></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblFuel" runat="server" Text="Fuel Costs: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtFuel" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblInsurance" runat="server" Text="Insurance Costs: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtInsurance" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvInsurance" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtInsurance" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblWorkerCost" runat="server" Text="Costs Per Worker: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtWorkerCost" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvWorkerCost" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtWorkerCost" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblFood" runat="server" Text="Food & Hotel Costs: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtFood" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvFood" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFood" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnpopulate" runat="server" Text="Populate" OnClick="btnpopulate_Click"  CausesValidation="false"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnClear" runat="server" Text="Clear"  OnClick="btnClear_Click" CausesValidation="false"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnBack" runat="server" Text="Back" OnClick="btnBack_Click" CausesValidation="false"/>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <%--sql Data Sources--%>
    <asp:SqlDataSource ID="datasrcTruckList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select EquipmentName from Equipment; "></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcMovers" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="Select trim(EmployeeFirstName)+ ' '+ trim(ISNULL(EmployeeLastName,'')) as Worker from Employee; "></asp:SqlDataSource>
</asp:Content>
