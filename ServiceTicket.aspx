<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceTicket.aspx.cs" Inherits="Lab_3.ServiceTicket" MasterPageFile="~/Master.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
            <asp:Table ID="tblServiceTicket" runat="server" HorizontalAlign="Center" BorderWidth="2" BorderColor="SkyBlue">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceTicketHeader" runat="server" Text="Service Ticket" Font-Bold Font-Underline></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCostumer" runat="server" Text="Customer:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlCustomer" runat="server" datasourceID ="dtasrcCustomerName" DataValueFiled ="CustomerName"
                            DataTextField ="CustomerName" AutoPostBack ="True" ></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="dtasrcCustomerName"
                                ConnectionString="Server=Localhost;Database=Lab2;Trusted_Connection=Yes;"
                                 SelectCommand="Select distinct CustomerName From Customer"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmailService" runat="server" Text="Email:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtEmailService" runat="server"></asp:TextBox>
                          <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorEmailS" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtEmailService"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPhoneService" runat="server" Text="Phone Number:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtPhoneService" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorPhoneService" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtPhoneService"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDatePlaced" runat="server" Text="Date Placed:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDatePlacedService" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorDatePlaced" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtDatePlacedService"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblStatusService" runat="server" Text="Ticket Status:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtTicketStatus" runat="server" Text="Active"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblEmployeeAssociated" runat="server" Text="Associated Employee:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <<asp:DropDownList ID="ddlEmployees" runat="server" datasourceID ="dtasrcEmployee" DataValueFiled ="EmployeeName"
                            DataTextField ="EmployeeName" AutoPostBack ="True" ></asp:DropDownList>
                        <asp:SqlDataSource runat="server" ID="dtasrcEmployee"
                                ConnectionString="Server=Localhost;Database=Lab2;Trusted_Connection=Yes;"
                                 SelectCommand="Select distinct EmployeeName From Employee"/>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAddressNew" runat="server" Text="Address/New Address:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
                        <asp:TextBox ID="txtNewAddress" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorNewA" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtNewAddress"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblNotes" runat="server" Text="Notes:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtNotes" runat="server"></asp:TextBox>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnSaveServiceTicket" runat="server" Text="Save" BorderColor="SkyBlue" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnEdit" runat="server" Text="Edit" BorderColor="SkyBlue" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnReturn" runat="server" Text="Return to Employee Home" BorderColor="SkyBlue" PostBackUrl="~/EmployeeHome.aspx" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
                

        </div>
</asp:Content>
