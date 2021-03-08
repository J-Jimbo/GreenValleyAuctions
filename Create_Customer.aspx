<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Create_Customer.aspx.cs" Inherits="Lab2.Create_Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <%--Table for all customer inputs--%> 
            <asp:Table ID="tblCreateCustomer" runat="server">
                <asp:TableRow >
                    <asp:TableCell Width="500">
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
                        <asp:CustomValidator ID="cvFirstName" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txtFirstName" Text="Customer Exists" Forecolor="Red" OnServerValidate="cvFirstName_ServerValidate" ></asp:CustomValidator>
                    </asp:TableCell>
                    <asp:TableCell Width="500">
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow  Width="350">
                    <asp:TableCell Width="350">
                        <asp:Label ID="lblStreet" runat="server" Text="Street: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtStreet" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell Width="350">
                        <asp:Label ID="lblCity" runat="server" Text="City: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtCIty" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RfvCIty" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtCIty" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell Width="350">
                        <asp:Label ID="lblState" runat="server" Text="State: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvSTate" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtState"  ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell Width="350">
                        <asp:Label ID="lblZip" runat="server" Text="Zip: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtZip" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell Width="350">
                        <asp:Label ID="lblPhone" runat="server" Text="Phone: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtPhone" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblPhoneType" runat="server" Text="Phone Type: "></asp:Label>
                        <asp:RequiredFieldValidator ID="rfvPhoneType" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="rblPhoneType" text="Required" ForeColor="Red" ></asp:RequiredFieldValidator>
                        <asp:RadioButtonList ID="rblPhoneType" runat="server"  RepeatDirection="Horizontal">
                            <asp:ListItem Text="Business" Value="Business"></asp:ListItem>
                            <asp:ListItem Text="Cell" Value="Cell"></asp:ListItem>
                            <asp:ListItem Text="Home" Value="Home"></asp:ListItem>
                        </asp:RadioButtonList>
                        </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell Width="350">
                        <asp:Label ID="lblEmail" runat="server" Text="Email: "></asp:Label>
                        <br />
                        <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ErrorMessage="RequiredFieldValidator" Text ="Required" ControlToValidate="txtEmail" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell Width="350">
                        <asp:Button ID="btnNext" runat="server" Text="Go to Create Service Event" OnClick="btnNext_Click" CausesValidation="false"/>
                        <asp:Button ID="btnNextProcess" runat="server" Text="Continue Processing Request" OnClick="btnNextProcess_Click" CausesValidation="false" Visible="false" />
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblHear" runat="server" Text="How did you hear about us?"></asp:Label>
                        <br />
                        <asp:TextBox ID="txtHear" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvHear" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtHear" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblContact" runat="server" Text="How Did Customer Contact us?"></asp:Label>
                        <asp:RequiredFieldValidator ID="rfvContact" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="ddlContact" Text="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                        <br />
                        <asp:DropDownList ID="ddlContact" runat="server" autopostback="true" OnSelectedIndexChanged="ddlContact_SelectedIndexChanged">
                            <asp:ListItem Text="In Person" Value="In Person"></asp:ListItem>
                            <asp:ListItem Text="By Phone" Value="By Phone"></asp:ListItem>
                            <asp:ListItem Text="By Email" Value="By Email"></asp:ListItem>
                            <asp:ListItem Text="Other" Value="Other"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:Label ID="lblOther" runat="server" Text="Other: " Visible="false"></asp:Label>
                        <asp:TextBox ID="txtOther" runat="server" Visible="false"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvOther" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtOther" ForeColor="Red"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <br />
           <%-- table for buttons to navigate --%>
            <asp:Table ID="tblButtons" runat="server" Width="1284px">
                <asp:TableRow HorizontalAlign="Center">
                    <asp:TableCell Width="250">
                        <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" CausesValidation="false"/>
                    </asp:TableCell>
                    <asp:TableCell Width="250">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CausesValidation="true"/>
                    </asp:TableCell>
                     <asp:TableCell Width="250">
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false"/>
                    </asp:TableCell>
                </asp:TableRow>
             </asp:Table>
</asp:Content>
