<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Lab2.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="refresh" content="">
    <asp:Table ID="tblReports" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnCustomerInteraction" runat="server" Text="Customer Interaction" OnClick="btnCustomerInteraction_Click" class="btn btn-primary btn-intake rounded-pill mediabutton" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnCustomerContact" runat="server" Text="Customer Contact/Future Jobs" OnClick="btnCustomerContact_Click" class="btn btn-primary btn-intake rounded-pill mediabutton" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnCustomerReport" runat="server" Text="Customer Report" OnClick="btnCustomerReport_Click" class="btn btn-primary btn-intake rounded-pill mediabutton" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <div id="Tableau" runat="server" visible="false">
        <div class='tableauPlaceholder' id='viz1618708769073' style='position: relative'>
            <noscript>
                <a href='#'><img alt='Sprint3_DashBoard ' src='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Sp&#47;Sprint3_DashBoard&#47;Sprint3_DashBoard&#47;1_rss.png' style='border: none' /></a>

            </noscript>
            <object class='tableauViz'  style='display:none;'>
                <param name='host_url' value='https%3A%2F%2Fpublic.tableau.com%2F' /> 
                <param name='embed_code_version' value='3' /> 
                <param name='site_root' value='' />
                <param name='name' value='Sprint3_DashBoard&#47;Sprint3_DashBoard' />
                <param name='tabs' value='no' /><param name='toolbar' value='yes' />
                <param name='static_image' value='https:&#47;&#47;public.tableau.com&#47;static&#47;images&#47;Sp&#47;Sprint3_DashBoard&#47;Sprint3_DashBoard&#47;1.png' />
                <param name='animate_transition' value='yes' /><param name='display_static_image' value='yes' />
                <param name='display_spinner' value='yes' /><param name='display_overlay' value='yes' />
                <param name='display_count' value='yes' /><param name='language' value='en' />
                <param name='filter' value='publish=yes' />

            </object>

        </div>                
        <script type='text/javascript'>        
            var divElement = document.getElementById('viz1618708769073');
            var vizElement = divElement.getElementsByTagName('object')[0];
            if (divElement.offsetWidth > 800) { vizElement.style.width = '1000px'; vizElement.style.height = '827px'; }
            else if (divElement.offsetWidth > 500) { vizElement.style.width = '1000px'; vizElement.style.height = '827px'; }
            else { vizElement.style.width = '100%'; vizElement.style.height = '1127px'; }
            var scriptElement = document.createElement('script');
            scriptElement.src = 'https://public.tableau.com/javascripts/api/viz_v1.js'; vizElement.parentNode.insertBefore(scriptElement, vizElement);                

        </script>
    </div>
    <div id="initalContact" runat="server" visible="false">
        <div class="text-center">
      <h3> Customer Reports </h3>
    </div>
    <div>

    
    <asp:Label ID="lblHistoryTitle" runat="server" Text="Select a button to view previous Services --> "></asp:Label>
        <asp:Button ID="btnUpcomingJobs" runat="server" Text="Upcoming Jobs -->" OnClick="btnUpcomingJobs_Click1" CssClass="btn btn-primary" />
        <asp:Button ID="Button1" runat="server" Text="Initial Contact -->" OnClick="btnInitialContact_Click1" CssClass="btn btn-primary"/>
                    <br />
                    <fieldset>
                        <legend> Recorded Services for Selected Customers: </legend>
                        <asp:GridView
                            runat="server"
                            ID="grdResults"
                            AlternatingRowStyle-BackColor="LightGray"
                            EmptyDataText ="No Results Found">

                        </asp:GridView>
                    </fieldset>
        </div>

    </div>
    <div id="Customer" runat="server" visible="false">
          <table>
            <tr>
                <td><p>Customer List</P></td>
                <td><asp:DropDownList ID="ddlTest" runat="server" AutoPostBack="true" Class="form-control" ></asp:DropDownList></td>
                <td><asp:Button ID="btnShowHistory" runat="server" Text="Show History" class="btn btn-primary btn-intake rounded-pill mediabutton" OnClick="btnShowHistory_Click" /></td>
            </tr>
            <tr>
                <td><P>Ticket List:</P></td>
                <td><asp:ListBox ID="lstBxTicketHistory" runat="server" AutoPostBack="true"></asp:ListBox></td>
            </tr>
            <tr>
                <td><asp:Button ID="btnTicketSelect" runat="server" Text="Details" Class="btn btn-primary btn-intake rounded-pill mediabutton" OnClick="btnTicketSelect_Click" /></td>
            </tr>
        </table>

        <table>
            <tr>
                <td>
                   <p><asp:Label ID="Label1" runat="server" Text="Pack Date:"></asp:Label>
                    <asp:TextBox ID="txtBxPackDate" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
                <td>
                   <p> <asp:Label ID="Label2" runat="server" Text="Move Date:"></asp:Label>
                    <asp:TextBox ID="txtBxMoveDate" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
                <td>
                  <p>  <asp:Label ID="Label3" runat="server" Text="Name:"></asp:Label>
                    <asp:TextBox ID="txtBxFirstName" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
                <td>
                   <p> <asp:Label ID="Label4" runat="server" Text="Move From:"></asp:Label>
                    <asp:TextBox ID="txtBxMoveFrom" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
            </tr>
            <tr>
                <td>
                   <p> <asp:Label ID="Label5" runat="server" Text="Move To:"></asp:Label>
                    <asp:TextBox ID="txtBxMoveTo" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
                <td>
                    <p><asp:Label ID="Label6" runat="server" Text="Phone Number:"></asp:Label>
                    <asp:TextBox ID="txtBxPhone" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
                <td>
                    <p><asp:Label ID="Label7" runat="server" Text="Email:"></asp:Label>
                    <asp:TextBox ID="txtBxEmail" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
                <td>
                    <p><asp:Label ID="Label8" runat="server" Text="Add On Services:"></asp:Label>
                    <asp:TextBox ID="txtBxAddOnServices" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
            </tr>
            <tr>
                <td>
                   <p> <asp:Label ID="Label9" runat="server" Text="Final Cost:"></asp:Label>
                    <asp:TextBox ID="txtBxFinalCost" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
                <td>
                    <p><asp:Label ID="Label10" runat="server" Text="Review:"></asp:Label>
                    <asp:TextBox ID="txtBxReview" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
                <td>
                    <p><asp:Label ID="Label12" runat="server" Text="Reference:"></asp:Label>
                    <asp:TextBox ID="txtBxReference" runat="server" Class="form-control"></asp:TextBox></p>
                </td>
            </tr>
            <tr>
                <td>
                   <p> <asp:Label ID="Label13" runat="server" Text="Notes:"></asp:Label>
                    <textarea ID="txtbxNotes" rows="5" cols="30" runat="server" Class="form-control"></textarea></p>
                </td>
            </tr>
            <tr>
                <td>
                   <p> <asp:Label ID="Label14" runat="server" Text="Movers:"></asp:Label></p>
                    
                </td>
                <td>
                    <asp:ListBox ID="lstBxMovers" runat="server"></asp:ListBox>
                </td>
            </tr>
           
        </table>

    </div>

    


               <%--sql Data scources --%>
            <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="SELECT FirstName + ' ' + LastName as customerName, customerID from Customer"></asp:SqlDataSource>
    
             
</asp:Content>
