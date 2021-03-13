<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Initial_Conversation.aspx.cs" Inherits="GreenValleyAuctions.Initial_Conversation" %>
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
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnClear" runat="server" Text="Clear"  OnClick="btnClear_Click" CausesValidation="false"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnPopulate" runat="server" Text="Populate" OnClick="btnPopulate_Click"  CausesValidation="false"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>

   
   
</asp:Content>
