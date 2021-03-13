<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Create_Customer.aspx.cs" Inherits="Lab2.Create_Customer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblFrom" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
            <asp:TableCell>
                 <asp:Label ID="lblForm" runat="server" Text="Initial Conversation Form"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblServices" runat="server" Text="Services Customer Requires: "></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" >
                 <asp:CheckBoxList ID="CblServices" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                    <asp:ListItem Text="Appraisal" Value="Appraisal"></asp:ListItem>
                    <asp:ListItem Text="Move" Value="Move"></asp:ListItem>
                    <asp:ListItem Text="Consignment" Value="Consignment"></asp:ListItem>
                </asp:CheckBoxList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:CustomValidator ID="CvServices" runat="server" ErrorMessage="CustomValidator" Text="Required" ForeColor="Red"  OnServerValidate="cvServices_ServerValidate"></asp:CustomValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblLookat" runat="server" Text="Requires Look at"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RadioButtonList ID="rblLookAt" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfvLookAt" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblLookAt" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblQuestions" runat="server" Text="Questions: "></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell >
                <asp:Label ID="lblDownsizing" runat="server" Text="Downsizing: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RadioButtonList ID="rblDownsizing" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfvDownsizing" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblDownsizing" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell >
                <asp:Label ID="lblEstate" runat="server" Text="Settling an Estate: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RadioButtonList ID="rblEstate" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
             </asp:TableCell>
             <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfvEstate" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblEstate" ForeColor="Red"></asp:RequiredFieldValidator>
             </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell >
                <asp:Label ID="lblMoving" runat="server" Text="Moving: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RadioButtonList ID="rblMoving" RepeatDirection="Horizontal" runat="server">
                    <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:RadioButtonList>
             </asp:TableCell>
             <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfvMoving" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="rblMoving" ForeColor="Red"></asp:RequiredFieldValidator>
             </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell >
                <asp:Label ID="lblQuantityToSell" runat="server" Text="How much is being sold: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtQuanity" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfvquantity" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtQuanity" ForeColor="Red"></asp:RequiredFieldValidator>
             </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell >
                <asp:Label ID="lblWhatToSell" runat="server" Text="What is being sold: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtWhatToSell" runat="server"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfvWhatToSell" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtWhatToSell" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" >
                <asp:Label ID="lblConversationNotes" runat="server" Text="Conversation Notes: "></asp:Label>
                <br />
                <asp:TextBox ID="txtNote" runat="server" Height="300" Width="500" TextMode="MultiLine" Wrap="true"></asp:TextBox>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RequiredFieldValidator ID="rfvNote" runat="server" ErrorMessage="RequiredFieldValidator" Text="Required" ControlToValidate="txtNote" ForeColor="Red"></asp:RequiredFieldValidator>
            </asp:TableCell>
        </asp:TableRow>
       
    </asp:Table>
    <hr />
    <asp:Table ID="tblCustomerChoice" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblCHoice" runat="server" Text="New or existing Customer ?"></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:RadioButtonList ID="rblChoice" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblChoice_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="New Customer" Value="New Customer"></asp:ListItem>
                    <asp:ListItem Text="Existing Customer" Value="Existing Customer"></asp:ListItem>
                </asp:RadioButtonList>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <hr />
    <asp:Table ID="tblExistingCustomer" runat="server" Visible="false">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Label ID="lblSelect" runat="server" Text="Select Customer: "></asp:Label>
                <asp:DropDownList ID="ddlCustomer" runat="server" DataTextField="customerName" DataValueField="CustomerID"  DataSourceID="datasrcCustomerList"></asp:DropDownList>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Label ID="lblCreateStatus" runat="server" Text=""></asp:Label>
            </asp:TableCell>
            
        </asp:TableRow>
    </asp:Table>
     <%--Table for all customer inputs--%> 
            <asp:Table ID="tblCreateCustomer" runat="server" Visible="false">
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
    <%--Data Sources--%>
    <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" 
                SelectCommand="SELECT distinct trim(FirstName) + ' ' + trim(LastName) as customerName, c.CustomerID from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID full join Customer c on c.CustomerID = WF.CustomerID where NOT Wf.CurrentStatus = 'In Progress' order by customerName"></asp:SqlDataSource>
</asp:Content>
