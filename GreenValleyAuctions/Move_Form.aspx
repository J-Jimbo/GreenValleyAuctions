<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Move_Form.aspx.cs" Inherits="GreenValleyAuctions.Move_Form" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="row">
                   <div class="col-md-1">
                    <a class="nav-link" href="Customer_Info.aspx">Profile</a>
                 </div>

          <div class="col-md-1 offset-md-0">
             <div class="dropdown">
              <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Move Forms
              </button>
              <div class="dropdown-menu">
                <a class="dropdown-item" href="Move_Schedule_Screen.html">Move Schedule</a>
                <a class="dropdown-item" href="#">Move Assessment</a>
                <a class="dropdown-item" href="Move_Form.html">Move Form</a>
                <a class="dropdown-item" href="Completion_Form.aspx">Completion Form</a>

              </div>
            </div>
            </div>

           <div class="col-md-1 offset-md-1">
                    <a class="nav-link" href="Service_Ticket.aspx">Notes</a>
                 </div>
    </div>
    <asp:Table ID="Table1" runat="server" HorizontalAlign="Center">
        <asp:TableRow>
                <asp:TableCell HorizontalAlign="center">
                   <asp:Label ID="lblContactInfo" runat="Server" Text="Contact Information" Font-Bold="true"  Font-Size="Large"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
        <%-- Customer Info --%>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDtName" runat="server" Text="Name: " Font-Bold="true"></asp:Label>
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblTContanctDate" runat="server" Text="Contact Date: "></asp:Label>
                    <asp:Label ID="lblContactDate" runat="server" Text=""></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDtAddress" runat="server" Text="Address: " Font-Bold="true"></asp:Label>
                    <asp:Label ID="lblAddress" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblTMoveDate" runat="server" Text="Moving Date:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Textbox ID="txtMoveDate" runat="server"></asp:Textbox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                      <asp:Label ID="lblDtPhone" runat="server" Text="Phone: "  Font-Bold="true" ></asp:Label>
                      <asp:Label ID="lblPhone" runat="server" Text=""></asp:Label>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblNumberOfMen" runat="server" Text="Number Of Men: "></asp:Label>
                    <asp:DropDownList ID="ddlNumberOfMen" runat="server" >
                       <asp:ListItem Text="1" Value="1" ></asp:ListItem>
                        <asp:ListItem Text="2" Value="2" ></asp:ListItem>
                        <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                        <asp:ListItem Text="4" Value="4" ></asp:ListItem>
                        <asp:ListItem Text="5" Value="5" ></asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
        <%-- TO AND FROM ADDRESS --%>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblFrom" runat="server" Text="From Address" Font-Bold="true"></asp:Label>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblTo" runat="server" Text="To Address" Font-Bold="true"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:TextBox ID="txtFromAddress" runat="server" Width="200px" ></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell></asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtToAddress" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        <%-- RADIO BUTTONS --%>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblConsign" runat="server" Text="Items to Consign?"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="RBLConsign" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblSmall" runat="server" Text="Smalls for Us to Pack?"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="RBLSmalls" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
        <%-- HOUSE LAYOUT --%>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center" >
                    <asp:Label ID="lblLayout" runat="server" Text="House Layout" Font-Bold="true" ></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblStories" runat="server" Text="Stories:"></asp:Label>
                     <asp:DropDownList id="ddlStories" runat="server" >
                        <asp:ListItem Text="1" Value="2" ></asp:ListItem>
                        <asp:ListItem Text="2" Value="2" ></asp:ListItem>
                    </asp:DropDownList>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                   <asp:Label ID="lblBedroom" runat="server" Text="Bedrooms: " ></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList id="ddlBedrooms" runat="server" >
                        <asp:ListItem Text="1" Value="2" ></asp:ListItem>
                        <asp:ListItem Text="2" Value="2" ></asp:ListItem>
                        <asp:ListItem Text="3" Value="3" ></asp:ListItem>
                        <asp:ListItem Text="4" Value="4" ></asp:ListItem>
                        <asp:ListItem Text="5" Value="5" ></asp:ListItem>
                        <asp:ListItem Text="6" Value="6" ></asp:ListItem>
                        <asp:ListItem Text="7" Value="7" ></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtBedrooms" runat="server" ></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblSQF" runat="server" Text="Square Footage:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtSQF" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLivingRooom" runat="server" Text="Living Room:"></asp:Label> 
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddllivingroom" runat="server">
                        <asp:ListItem Text="0" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtLivingRoom" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblAttic" runat="server" Text="Attic:"></asp:Label>
                    </asp:Tablecell>
                    <asp:TableCell>
                    <asp:DropDownList ID="ddlAttic" runat="server">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtAttic" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDining" runat="server" Text="Dining Room:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlDining" runat="server">
                        <asp:ListItem Text="0" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtDining" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblBasement" runat="server" Text="Basement:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlBasement" runat="server">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>  
                        </asp:DropDownList>
                    <asp:TextBox ID="txtBasement" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDenFam" runat="server" Text="Den/Family Room:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlDenFam" runat="server">
                        <asp:ListItem Text="0" Value="0" ></asp:ListItem>
                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                        </asp:DropDownList>
                    <asp:TextBox ID="txtDenFam" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblGarage" runat="server" Text="Garage:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:DropDownList ID="ddlGarage" runat="server">
                        <asp:ListItem Text="Yes" Value ="Yes"></asp:ListItem>
                        <asp:ListItem Text="No" Value="No"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:TextBox ID="txtGarage" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        <%-- Additional Info --%>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center" >
                    <asp:Label ID="lblAdditional" runat="server" Text="Additional" Font-Bold="true"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblLarge" runat="server" Text="Large/Awkward/Unusual Items:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtLarge" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblCollectibles" runat="server" Text="Collectibles and High Value Items:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtCollectibles" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblAppliance" runat="server" Text="Appliances:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtAppliance" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblOutBuildings" runat="server" Text="Out Buildings: "></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtOutBuildings" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
            <asp:TableCell>
                    <asp:Label ID="lblPiano" runat="server" Text="Piano:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="RBLPiano" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblMower" runat="server" Text="Lawn Mower:"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:RadioButtonList ID="RBLMower" runat="server" RepeatDirection="Horizontal" AutoPostBack="true">
                        <asp:ListItem Text="Yes" Value="Yes"></asp:ListItem>
                        <asp:ListItem Value="No" Text="No"></asp:ListItem>
                    </asp:RadioButtonList>
                </asp:TableCell>
            </asp:TableRow>
        <%-- ACCESSIBILITY --%>
            <asp:TableRow>
                <asp:TableCell HorizontalAlign="Center" >
                    <asp:Label ID="lblAccessibility" runat="server" Text="Accessibility" Font-Bold="true"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblDistance" runat="server" Text="Distance From Truck to Door?"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtDistance" runat="server"></asp:TextBox>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Label ID="lblObstacles" runat="server" Text="Obstacles?"></asp:Label>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:TextBox ID="txtObstacles" runat="server"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        <%-- NOTES --%>
            <asp:TableRow>
                <asp:TableCell>
                    <asp:Label ID="lblNotes" runat="server" Text="Additional Notes" Font-Bold="true"></asp:Label>
                </asp:TableCell>
            </asp:TableRow>
            <asp:TableRow>
                <asp:TableCell ColumnSpan="4">
                    <asp:TextBox ID="txtNote" runat="server" Wrap="true" Height="100" Width="100%" TextMode="MultiLine"></asp:TextBox>
                </asp:TableCell>
            </asp:TableRow>
        <%-- BUTTONS --%>
            <asp:TableRow HorizontalAlign="Center">
                <asp:TableCell HorizontalAlign="Center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click"/>
                </asp:TableCell>
                
                <asp:TableCell>
                    <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click"/>
                </asp:TableCell>
                <asp:TableCell>
                    <asp:Button ID="bnClear" runat="server" Text="Clear" OnClick="bnClear_Click" CausesValidation="false" />
                </asp:TableCell>
            </asp:TableRow>
        </asp:Table>
</asp:Content>
