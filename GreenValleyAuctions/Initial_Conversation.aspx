<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Initial_Conversation.aspx.cs" Inherits="GreenValleyAuctions.Initial_Conversation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblFrom" runat="server">
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
                <asp:CustomValidator ID="cvServices" runat="server" ErrorMessage="CustomValidator" Text="Required" ForeColor="Red" ControlToValidate="CblServices" OnServerValidate="cvServices_ServerValidate"></asp:CustomValidator>
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
        </asp:TableRow>
         <asp:TableRow>
            <asp:TableCell >
                <asp:Label ID="lblQuantityToSell" runat="server" Text="How much is being sold: "></asp:Label>
                
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtQuanity" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell >
                <asp:Label ID="lblWhatToSell" runat="server" Text="What is being sold: "></asp:Label>
            </asp:TableCell>
            <asp:TableCell>
                <asp:TextBox ID="txtWhatToSell" runat="server"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2" >
                <asp:Label ID="lblConversationNotes" runat="server" Text="Conversation Notes: "></asp:Label>
                <br />
                <asp:TextBox ID="txtNote" runat="server" Height="300" Width="500" TextMode="MultiLine" Wrap="true"></asp:TextBox>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
   
   
</asp:Content>
