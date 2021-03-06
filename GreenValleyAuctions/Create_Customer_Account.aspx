<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Create_Customer_Account.aspx.cs" Inherits="Lab3.Create_Customer_Account" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Table ID="Table1" runat="server" Width="1144px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblLogin" runat="server" Text="Login Information: "></asp:Label>
                        <br />
                        <asp:Label ID="lblUserName" runat="server" Text="Email/UserName"></asp:Label>
                        
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtUserName" runat="server" ></asp:TextBox>
                         <asp:CustomValidator ID="cvUserName" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txtUserName" Text="UserName Exists" Forecolor="Red" OnServerValidate="cvUserName_ServerValidate"></asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtUserName"></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblPass" runat="server" Text="Password: "></asp:Label>
                        <br />
                        <asp:Label ID="lblPassCheck" runat="server" Text="Retype Password: "></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Left">
                        <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPass" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtPass"></asp:RequiredFieldValidator>
                        <br />
                        <asp:TextBox ID="txtPassCheck" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCheck" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtPassCheck"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="cvPass" runat="server" ErrorMessage="CompareValidator" Text="Passwords Do not Match" ControlToValidate="txtPassCheck" ControlToCompare="txtPass"></asp:CompareValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblName" runat="server" Text="Name:"></asp:Label>
                        <br />
                        <asp:Label ID="lblFirstName" runat="server" Text="First Name: "></asp:Label>
                        <asp:TextBox ID="txtFirstName" runat="server"></asp:TextBox>
                        <asp:CustomValidator ID="cvFirstName" runat="server" ErrorMessage="CustomValidator" ControlToValidate="txtFirstName" Text="Customer Exists" Forecolor="Red" OnServerValidate="cvFirstName_ServerValidate"></asp:CustomValidator>
                        <asp:RequiredFieldValidator ID="rfvFName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtFirstName" ></asp:RequiredFieldValidator>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Label ID="lblLastName" runat="server" Text="Last Name: "></asp:Label>
                        <asp:TextBox ID="txtLastName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvLName" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtLastName" ></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblAddress" runat="server" Text="Address: "></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell ColumnSpan="8">
                        <asp:Label ID="lblStreet" runat="server" Text="Street: "></asp:Label>
                        <asp:TextBox ID="txtStreet" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvStreet" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtStreet" ></asp:RequiredFieldValidator>
                        <asp:Label ID="lblCity" runat="server" Text="City: "></asp:Label>
                        <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCity" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtCity" ></asp:RequiredFieldValidator>
                        <asp:Label ID="lblState" runat="server" Text="State: "></asp:Label>
                        <asp:TextBox ID="txtState" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvState" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtState" ></asp:RequiredFieldValidator>
                        <asp:Label ID="lblZip" runat="server" Text="Zip: "></asp:Label>
                        <asp:TextBox ID="txtZip" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvZip" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtZip" ></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblContact" runat="server" Text="Contact Information: "></asp:Label>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell>
                        <asp:Label ID="lblPhone" runat="server" Text="Phone"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell >
                        <asp:TextBox ID="txtPhone" runat="server" TextMode="Phone"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPhone" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ForeColor="Red" ControlToValidate="txtPhone" ></asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell >
                        <asp:Button ID="btnCreate" runat="server" Text="Create Account" OnClick="btnCreate_Click" />
                        &nbsp;
                        <asp:Label ID="lblStatus" runat="server" Text="" ForeColor="Green"></asp:Label>
                        &nbsp;
                        <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" CausesValidation="false"/>
                        &nbsp;
                        <asp:Button ID="BtnCLear" runat="server" Text="Clear" onclick="BtnCLear_Click" CausesValidation="false"/>
                        &nbsp;
                        <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click" CausesValidation="false"/>
                        &nbsp;
                        <asp:Button ID="BtnHome" runat="server" Text="Home" CausesValidation="false"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
    </form>
    <footer>
         <br />
        Created By: Jimmy Magnier and Jon Asay
    </footer>
</body>
</html>
