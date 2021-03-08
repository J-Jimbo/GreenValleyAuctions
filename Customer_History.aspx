<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Customer_History.aspx.cs" Inherits="Lab3.Customer_History" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Table ID="tableInception" runat="server">
        <asp:TableRow>
            <asp:TableCell VerticalAlign="Top">
                <asp:Table ID="tblPage" runat="server" >
                    <asp:TableRow>
                        <asp:TableCell>
                             <asp:Label ID="lblSearch" runat="server" Text="Search for Customer:"></asp:Label>
                             <asp:TextBox ID="txtSearch" runat="server" ></asp:TextBox>
                             <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"/>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:ListBox ID="lbResults" runat="server"  Width="250px" AutoPostBack="true" DataTextField="customerName" DataValueField="FullName"></asp:ListBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:DetailsView ID="dtvTicketHistory" runat="server" DataSourceID="datasrcWorkFlow"  DefaultMode="ReadOnly" AllowPaging="true" Height="50px" Width="125px"  OnPageIndexChanged="dtvTicketHistory_PageIndexChanged">
                
                            </asp:DetailsView>
                        </asp:TableCell>
                     </asp:TableRow>
                    </asp:Table>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Table ID="tblNote" runat="server">
                    <asp:TableRow>
                        <asp:TableCell>
                            <asp:Label ID="lblNoteTitle" runat="server" Text="Note Title: "></asp:Label>
                            <br />
                            <asp:ListBox ID="lbNoteTitle" runat="server" AutoPostBack="true" DataTextField="TicketName" DataValueField="TicketName" width="200" OnSelectedIndexChanged="lbNoteTitle_SelectedIndexChanged"></asp:ListBox>
                        </asp:TableCell>
                        <asp:TableCell>
                            <asp:Label ID="lblEmplist" runat="server" Text="Employee History:" Width="200"></asp:Label>
                            <br />
                            <asp:ListBox ID="lbEmployeeList" runat="server" AutoPostBack="true"  DataTextField="employeeName" DataValueField="WFHistoryID" Width="200"></asp:ListBox>
                        </asp:TableCell>
                      </asp:TableRow>
                    <asp:TableRow>
                        <asp:TableCell ColumnSpan="2">
                            <asp:Label ID="lblNoteBody" runat="server" Text="Note Body: "></asp:Label>
                             <br />
                             <asp:TextBox ID="txtNoteBody" runat="server" width="400" height="200" TextMode="MultiLine" Wrap="true"></asp:TextBox>
                        </asp:TableCell>
                    </asp:TableRow>
                    </asp:Table>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    
            
        
        
    
    <%--SQL DATA Sources  --%> 
   <asp:SqlDataSource ID="datasrcWorkFlow" runat="server" ConnectionString="<%$ ConnectionStrings:Lab3 %>"  
       SelectCommand="Select trim(FirstName) + ' ' + trim(LastName) as FullName,EngagmentDate,CompletionDate,Review,CurrentStatus 
       from WorkFlow wf inner join customer c on c.CustomerID = wf.CustomerID  
       where FirstName = @FullName or  LastName = @FullName or trim(FirstName) + ' ' + trim(LastName) = @FullName ">
        <SelectParameters>
            <asp:ControlParameter Name="FullName" Type="string"  ControlID="lbResults"/>
        </SelectParameters>
   </asp:SqlDataSource>
    

   
</asp:Content>
