<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Lab_3.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div> </div>
           <asp:Table ID="Table1" runat="server" HorizontalAlign="Center" BorderColor="SkyBlue" BorderWidth="2px">
              <asp:TableRow>
                  <asp:TableCell>
                      <asp:Label ID="lblTitle" runat="server" Text="User Login" Font-Bold Font-Underline></asp:Label>
                  </asp:TableCell>
              </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>
                       <asp:Label ID="lblUserName" runat="server" Text="Username:"></asp:Label>
                   </asp:TableCell>
                   <asp:TableCell>
                       <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                   </asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell>
                       <asp:Label ID="lblPassword" runat="server" Text="Password:"></asp:Label>
                   </asp:TableCell>
                   <asp:TableCell>
                       <asp:TextBox ID="txtPassword" runat="server" TextMode ="Password"></asp:TextBox>
                   </asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                       <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                   </asp:TableCell>
               </asp:TableRow>
               <asp:TableRow>
                   <asp:TableCell ColumnSpan="2" HorizontalAlign="Left">
                       <asp:Button ID="btnLogin" runat="server" Text="Login ->" OnClick="btnLogin_Click" BorderColor="SkyBlue"/>
                   </asp:TableCell>
               </asp:TableRow>
           </asp:Table>
    
            
            

</asp:Content>
