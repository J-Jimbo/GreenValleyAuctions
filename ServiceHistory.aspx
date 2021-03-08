<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ServiceHistory.aspx.cs" Inherits="Lab_3.ServiceHistory" MasterPageFile="~/Master.Master"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div>
             <fieldset>  
                 <asp:Label ID="lblHistoryTitle" runat="server" Text="Select a button to view previous Services --> "></asp:Label>
                <asp:Button
                    ID="btnCurrentService"
                    runat="server"
                    Text="In Progress Services > " 
                    onClick="btnCurrentService_Click"/>
                <asp:Button 
                    ID="BtnCompletedServices" 
                    runat ="server" 
                    Text ="Completed Services > " 
                    onClick="BtnCompletedServices_Click"/>
           </fieldset>
                    <br />
                    <fieldset>
                        <legend> Recorded Services for Selected Customers: </legend>
                        <asp:GridView
                            runat="server"
                            ID="grdResults"
                            AlternatingRowStyle-BackColor ="#eaaaff"
                            EmptyDataText ="No Results Found" >
                        </asp:GridView>
                    </fieldset>
                </div>

        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Return Home" PostBackUrl="~/Home.aspx" />
</asp:Content>