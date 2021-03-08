<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Create_ServiceEvent.aspx.cs" Inherits="Lab2.Create_ServiceEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%-- table to accept inputs for every event--%>
            <asp:Table ID="tblCreatEvent" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                         <asp:Table ID="tblSericeEvent" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceTyper" runat="server" Text="Service Type: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dplServiceType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="dplServiceType_SelectedIndexChanged">
                            <asp:ListItem Text="Moving" Value="Moving"></asp:ListItem>
                            <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    
                    <asp:TableCell>
                         <asp:Label ID="lblServiceDate" runat="server" Text="Service Dead Line Date: "></asp:Label>
                        
                    </asp:TableCell>
                    <asp:TableCell >
                        <asp:TextBox ID="txtServiceDate" runat="server"></asp:TextBox>
                        
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:CheckBox ID="cbRange" runat="server" Text="Dead Line Range?" AutoPostBack="true" OnCheckedChanged="cbRange_CheckedChanged"/>
                        <asp:RequiredFieldValidator ID="rfvServiceDate" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceDate" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell>
                        <asp:Label ID="lblEndDate" runat="server" Text="Dead Line End Date" Visible="false"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell >
                        <asp:TextBox ID="txtDateRange" runat="server" Visible="false"></asp:TextBox>
                        <br />
                        <asp:CompareValidator ID="cvDateRange" runat="server" ErrorMessage="CompareValidator" Text="End Date Must Be After Start Date" ForeColor="Red" ControlToValidate="txtDateRange" ControlToCompare="txtServiceDate" Type="Date" Operator="GreaterThan"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceCost" runat="server" Text="Service Cost: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtServiceCost" runat="server"></asp:TextBox>
                    </asp:TableCell>
                       <asp:TableCell>
                        <asp:RequiredFieldValidator ID="rfvServiceCost" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtServiceCost" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell> 
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceCustomer" runat="server" Text="Customer: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="dplCustomer" runat="server" DataSourceID="datasrcCustomerList" DataTextField="customerName" 
                            DataValueField="customerID"  AutoPostBack="true" ></asp:DropDownList>
                        <asp:CustomValidator ID="cvCustomer" runat="server" ErrorMessage="CustomValidator" ControlToValidate="dplCustomer" Text="Cannot have multiple events" ForeColor="Red" OnServerValidate="cvCustomer_ServerValidate" ></asp:CustomValidator>
                        
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmployee" runat="server" Text="Employee Contacts:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlEmpList" runat="server" DataSourceID="datasrcEmployeeList" AutoPostBack="true" DataValueField="employeeId" DataTextField="employeeName"></asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Table ID="tblEventType" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="lblOrignAddress" runat="server" Text="Origin Address:"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                               
                                <asp:TableCell>
                                    <asp:Label ID="lblStreet" runat="server" Text="Street:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtStreet" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell>  
                                <asp:TableCell>
                                    <asp:Label ID="lblCIty" runat="server" Text="City:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtCIty" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtCIty" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell> 
                                <asp:TableCell>
                                    <asp:Label ID="lblState" runat="server" Text="State:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtState" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell> 
                                <asp:TableCell>
                                    <asp:Label ID="lblZip" runat="server" Text="Zip:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtZip" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell> 
                            </asp:TableRow>
                            </asp:Table>
                        <%--table to accept inputs for moving events only--%>
                        <asp:Table ID="tblDestination" runat="server" Visible="false">
                            <asp:TableRow>
                                <asp:TableCell>
                                            <asp:Label ID="lblDestinationAddress" runat="server" Text="Destination Address:"></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="lblDestStrt" runat="server" Text="Street:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtDestStrt" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:RequiredFieldValidator ID="rfvDestStrt" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDestStrt" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell> 
                                <asp:TableCell>
                                    <asp:Label ID="lblDestCity" runat="server" Text="City:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtDestCity" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:RequiredFieldValidator ID="rfvDestCity" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDestCity" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell> 
                                <asp:TableCell>
                                    <asp:Label ID="lblDestState" runat="server" Text="State:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtDestState" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:RequiredFieldValidator ID="rfvDestState" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDestState" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell> 
                                <asp:TableCell>
                                    <asp:Label ID="lblDestZip" runat="server" Text="Zip:"></asp:Label>
                                    <br />
                                    <asp:TextBox ID="txtDestZip" runat="server"></asp:TextBox>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:RequiredFieldValidator ID="rfvDestZip" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtDestZip" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                                </asp:TableCell> 
                            </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
           
            </asp:Table>
            <br />
         <%--   table for buttons, to navigate--%>
            <asp:Table ID="tblButtonBar" runat="server" Height="40px" Width="1004px">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell Width="250">
                        <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" CausesValidation="false"/>
                    </asp:TableCell>
                    <asp:TableCell Width="250">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CausesValidation="true"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell Width="250">
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnNotes" runat="server" Text="Go to Notes"  OnClick="btnNotes_Click" CausesValidation="false"/>
                    </asp:TableCell>
                </asp:TableRow>
             </asp:Table>

            <%--sql Data scources --%>
            <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" 
                SelectCommand="SELECT trim(FirstName) + ' ' + trim(LastName) as customerName, customerID from Customer"></asp:SqlDataSource>
            <asp:SqlDataSource ID="datasrcEmployeeList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" 
                SelectCommand="SELECT trim(EmployeeFirstName) + ' ' + trim(EmployeeLastName) as employeeName, EmployeeID from Employee"></asp:SqlDataSource>
     

</asp:Content>
