<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="view_serviceTicket.aspx.cs" Inherits="Lab2.view_serviceTicket" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tblTbles" runat="server" Width="1181px">
        <asp:TableRow>
            <asp:TableCell VerticalAlign="Top">
                 <asp:Table ID="tblView" runat="server">
                    <asp:TableRow>
                         <asp:TableCell>
                               <asp:Label ID="lblEditWorkFlow" runat="server" Text="View/Edit WorkFlow:"></asp:Label>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                                <asp:DetailsView ID="dvWorkFlow" DataSourceID="datasrcWorkFlow" AutoGenerateEditButton="true" DataKeyNames="WorkFlowID" DefaultMode="Edit" runat="server" AllowPaging="true" OnDataBound="dvWorkFlow_DataBound">

                                </asp:DetailsView>
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
            </asp:TableCell>
            <asp:TableCell VerticalAlign="Top">
                 <asp:Table ID="tblHistory" runat="server">
                     <asp:TableRow>
                            <asp:TableCell ColumnSpan="2">
                                 <asp:Label ID="lblCustomer" runat="server" Text="Select Customer To View History:"></asp:Label>
                                <asp:DropDownList ID="ddlHistory" runat="server" DataSourceID="datasrcCustomerHistory" DataTextField="customerName" DataValueField="WorkFLowID" AutoPostBack="true"  OnSelectedIndexChanged="ddlHistory_SelectedIndexChanged"></asp:DropDownList>
                                 </asp:TableCell>
                     </asp:TableRow>
                     <asp:TableRow  >
                         <asp:TableCell ColumnSpan="2" >
                             <asp:Label ID="lblTitleList" runat="server" Text="Note Title: "  Width="200"></asp:Label>
                              <asp:Label ID="lblEmplist" runat="server" Text="Employee History:" Width="200"></asp:Label>
                             <br />
                             <asp:ListBox ID="lbTitleList" runat="server"  AutoPostBack="true" DataTextField="TicketName"  DataValueField="WFHistoryID" OnSelectedIndexChanged="lbTitleList_SelectedIndexChanged" width="200"></asp:ListBox>
                             <asp:ListBox ID="lbEmployeeList" runat="server" AutoPostBack="true"  DataTextField="employeeName" DataValueField="WFHistoryID" Width="200"></asp:ListBox>
                         </asp:TableCell>
                     </asp:TableRow>
                     <asp:TableRow>
                         <asp:TableCell>
                             <asp:Label ID="lblNoteBody" runat="server" Text="Note Body: "></asp:Label>
                             <br />
                             <asp:TextBox ID="txtNoteBody" runat="server" width="400" height="200" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                         </asp:TableCell>
                     </asp:TableRow>
                            
                </asp:Table>
            </asp:TableCell>
            <asp:TableCell VerticalAlign="Top">
                <asp:Table ID="tblEmpSwitch" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblEmployee" runat="server" Text="Select New Employee:"></asp:Label>
                            <br />
                            <asp:DropDownList ID="ddlEmployeeList" runat="server" AutoPostBack="true" DataSourceID="datasrcEmployeeList" DataTextField="employeeName" DataValueField="EmployeeID"></asp:DropDownList>
                            <br />
                            <br />
                            <br />
                            </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblSelectInProgress" runat="server" Text="Select Customer with In Progress Service:"></asp:Label>
                            <br />
                            <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="datasrcCustomerList"  AutoPostBack="true" DataTextField="customerName" DataValueField="WorkFlowID"></asp:DropDownList>
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Button ID="btnSaveSwitch" runat="server" Text="Save Employee Switch"   OnClick="btnSaveSwitch_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
                </asp:Table>
            </asp:TableCell>

        </asp:TableRow>
    </asp:Table>

<%--SQL DATA Sources  --%> 
    <asp:SqlDataSource ID="datasrcWorkFlow" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"  SelectCommand="Select WorkFLowID,EngagmentDate,CompletionDate,Review,CurrentStatus, trim(c.FirstName)+' '+trim(c.LastName) as CustomerName,trim(e.EmployeeFirstName)+' '+trim(e.EmployeeLastName) as EmployeeName
        from WorkFlow wf inner join customer c on wf.CustomerID = c.CustomerID inner join Employee e on wf.EmployeeID = e.EmployeeID where CurrentStatus = 'In Progress'"
        UpdateCommand="UPDATE WorkFlow SET CompletionDate=@CompletionDate, Review=@Review, CurrentStatus=@CurrentStatus where WorkFlowID=@WorkFlowID" ></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcEmployeeList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" 
                SelectCommand="SELECT trim(EmployeeFirstName) + ' ' + trim(EmployeeLastName) as employeeName, EmployeeID from Employee"></asp:SqlDataSource>
     <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" 
                SelectCommand="SELECT trim(FirstName) + ' ' + trim(LastName) as customerName, wf.WorkFlowID from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID full join Customer c on c.CustomerID = WF.CustomerID where Wf.CurrentStatus = 'In Progress'"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcCustomerHistory" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>" 
        SelectCommand="SELECT trim(FirstName) + ' ' + trim(LastName)+'-'+ ISNULL(CAST(CompletionDate as VARCHAR),'In Progress') as customerName, wf.WorkFlowID from Inventory i full join ServiceEvent SE  on i.ItemID = SE.ItemID  full join WorkFlow wf on wf.WorkFlowID = SE.WorkFlowID full join Customer c on c.CustomerID = WF.CustomerID ORDER by customerName"></asp:SqlDataSource>
    
         
</asp:Content>
