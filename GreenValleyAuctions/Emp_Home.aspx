<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Emp_Home.aspx.cs" Inherits="Lab2.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <%--Create home button--%> 
            <asp:Table ID="TableHomeBar" runat="server" Width="1282px">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="BtnHome" runat="server" Text="Home"  OnClick="BtnHome_Click" CausesValidation="false"/>
                    </asp:TableCell>
                     <asp:TableCell HorizontalAlign="Right">
                        <asp:Label ID="lblCurrentUser" runat="server" Text=""></asp:Label>
                    </asp:TableCell>
                     <asp:TableCell>
                        <asp:Button ID="btnCreateCustomer" runat="server" Text="Create Customer" OnClick="btnCreateCustomer_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnCreateServiceEvent" runat="server" Text="Create Serice Event" OnClick="btnCreateServiceEvent_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnNote" runat="server" Text="Create Note"  OnClick="btnNote_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnViewWorkFlow" runat="server" Text="View WorkFlow"  OnClick="btnViewWorkFlow_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnHistory" runat="server" Text="View History" OnClick="btnHistory_Click"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnReport" runat="server" Text="View Reports"  OnClick="btnReport_Click"/>
                    </asp:TableCell>
                    <asp:TableCell >
                        <asp:Button ID="btnLogin" runat="server" Text="Login" HorizontalAlign="Right" OnClick="btnLogin_Click"/>
                    </asp:TableCell>
                    <asp:TableCell HorizontalAlign="Right">
                        <asp:Button ID="btnLogOut" runat="server" Text="Logout"  OnClick="btnLogOut_Click"/>
                    </asp:TableCell>
                    
                </asp:TableRow>
            </asp:Table>
            <hr />
            <asp:Table ID="tblTasks" runat="server">
                <asp:TableRow>
                 <asp:TableCell>
                         <%--  <asp:Table ID="tblHome" runat="server" Height="200px" Width="800px" style="margin-top: 9px" HorizontalAlign="left">
                             Create Buttons for Navigation
                            <asp:TableRow>
                                <asp:TableCell ColumnSpan="2">
                                    <asp:Label ID="lblWelcome" runat="server" Text="Welcome Employee"></asp:Label>
                                    <br />
                                     <asp:Label ID="Label1" runat="server" Text="Created by: Madison Consulting 04" ></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>--%>
                        <asp:Table ID="tblNotifications" runat="server">
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Label ID="lblNotifications" runat="server" Text="Notifications: "></asp:Label>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:ListBox ID="lbNotifications" runat="server" DataSourceID="datasrcNotifications" AutoPostBack="true" DataTextField="CustomerName" DataValueField="CustomerRequestID" Width="500"></asp:ListBox>
                                </asp:TableCell>
                            </asp:TableRow>
                            <asp:TableRow>
                                <asp:TableCell>
                                    <asp:Button ID="btnProcess" runat="server" Text="Process Request" OnClick="btnProcess_Click"/>
                                </asp:TableCell>
                            </asp:TableRow>
                          </asp:Table>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow >
                    <asp:TableCell>
                        <asp:Table ID="Table1" runat="server" >
                            <asp:TableRow>
                                <asp:TableCell >
                                    <asp:Button ID="btnCustomer" runat="server" Text="View Customers" OnClick="btnCustomer_Click"/>
                                </asp:TableCell>
                                <asp:TableCell>
                                    <asp:Button ID="btnViewReports" runat="server" Text="Reports" />
                                </asp:TableCell>
                                <asp:TableCell>
                                     <asp:Button ID="btnWorkFlow" runat="server" Text="WorkFLow" />
                                </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </asp:TableCell>
                    
                </asp:TableRow>
            </asp:Table>

              <%--sql Data scources --%>
            <asp:SqlDataSource ID="datasrcNotifications" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" 
                SelectCommand="SELECT trim(FirstName) + ' ' + trim(LastName)+'--'+CAST(DateCreated as VARCHAR)+'-->'+ Status as CustomerName, cr.CustomerRequestID, DateCreated from ServiceRequest sr inner join CustomerRequest cr  on sr.CustomerRequestID = cr.CustomerRequestID order by DateCreated DESC"></asp:SqlDataSource>
         
        </div>
    </form>
   
</body>
</html>
