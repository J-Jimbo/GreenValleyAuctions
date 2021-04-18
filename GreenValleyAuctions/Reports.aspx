﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Lab2.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <meta http-equiv="refresh" content="">
    <asp:Table ID="tblReports" runat="server">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnCustomerInteraction" runat="server" Text="Customer Interaction" OnClick="btnCustomerInteraction_Click" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnReport1" runat="server" Text="Report" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnReport2" runat="server" Text="Report" />
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

<%--    -------------------Old Reports------------------------------------%>
     <%--<%-- table for first report, customer--%>
            <%--<asp:Table ID="tblCustomerSelection" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblSelection" runat="server" Text="Choose a Customer: "></asp:Label>
                        <asp:DropDownList ID="ddlCustomer" runat="server" DataSourceID="datasrcCustomerList" DataTextField="customerName" 
                            DataValueField="customerID"  OnSelectedIndexChanged="ddlCustomer_SelectedIndexChanged" AutoPostBack="true"></asp:DropDownList>
                    </asp:TableCell>
                    
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="CustomerGrid" runat="server" EmptyDataText="No Data on Customer">

                        </asp:GridView>
                    </asp:TableCell>

                </asp:TableRow>
            </asp:Table>
            <br />
            <hr />--%>
           <%-- table for second report, service event--%>
            <%--<asp:Table ID="tblServiceChart" runat="server">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblServiceChart" runat="server" Text="Choose a Service Type: "></asp:Label>
                        <asp:DropDownList ID="ddlService" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlService_SelectedIndexChanged">
                            <asp:ListItem Text="Moving" Value="Moving"></asp:ListItem>
                            <asp:ListItem Text="Auction" Value="Auction"></asp:ListItem>
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:GridView ID="ServiceGrid" runat="server" EmptyDataText="No Customer selected">

                        </asp:GridView>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>--%>



               <%--sql Data scources --%>--%>
            <asp:SqlDataSource ID="datasrcCustomerList" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="SELECT FirstName + ' ' + LastName as customerName, customerID from Customer"></asp:SqlDataSource>


</asp:Content>
