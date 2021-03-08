<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="NewService.aspx.cs" Inherits="Lab_3.NewService" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


        <div>
                
            
            <asp:Table ID="Table1" runat="server" BorderWidth="2" Height="149px" Width="621px" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell>
                    <asp:Label runat="server" Text="Create a New Service" Font-Underline Font-Bold></asp:Label>

                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceType" runat="server" Text="Service Type:"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList ID="ddlServiceType" runat="server"  datasourceID ="dtasrcServiceType" DataValueFiled ="ServiceType"
                            DataTextField ="ServiceType" AutoPostBack ="True" ></asp:DropDownList> 
                        <asp:SqlDataSource runat ="server" ID ="dtasrcServiceType"
                                ConnectionString="Server=Localhost;Database=TestForLab3;Trusted_Connection=Yes;"
                                 SelectCommand="Select distinct ServiceType From Service"/>


                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblDatePlace" runat="server" Text="Date Placed: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtDatePlace" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorDate" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtDatePlace"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID ="lblServiceDescription" runat ="server" Text ="Service Description: "></asp:Label>
                         <asp:TextBox ID ="txtServiceDescription" runat ="server"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorServiceD" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtServiceDescription"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>


          <asp:Table ID="tblButtons" runat="server" HorizontalAlign="Center">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnServiceTicket" runat="server" Text="Service Ticket" PostBackUrl="~/ServiceTicket.aspx" />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            
            
        </div>

</asp:Content>
