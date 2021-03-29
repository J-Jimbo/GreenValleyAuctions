<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="WareHouse.aspx.cs" Inherits="GreenValleyAuctions.WareHouse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
		

    <asp:Table ID="tblHome" runat="server" Width="983px">
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search Warehouse" class="form-control" ></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" class="btn btn-primary rounded-pill" />
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow Width="">
            <asp:TableCell>
                <%--<asp:Button ID="btnleft" runat="server" Text="Left" OnClick="btnleft_Click" Style="background-image:url('images/l.png');background-repeat:no-repeat;"/>--%>
                <asp:ImageButton ID="ibtnleft" runat="server" ImageUrl="images/l.png" OnClick="btnleft_Click" Height="100px" Width="100px" />
            </asp:TableCell>
            <asp:TableCell>
                <%--<asp:Button ID="btnRight" runat="server" Text="Right" OnClick="btnRight_Click" Height="100px" Width="200px"/>--%>
                <asp:ImageButton ID="ibtnRight" runat="server" ImageUrl="images/r.png" OnClick="btnRight_Click" Height="100px" Width="100px" />
            </asp:TableCell>
            <asp:TableCell>
                <%--<asp:Button ID="btnTrailer" runat="server" Text="Trailer" />--%>
                 <asp:ImageButton ID="ibtTrailer" runat="server" ImageUrl="images/trailer.png"  OnClick="btnTrailer_Click" Height="100px" Width="100px" />
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
    <asp:Table ID="Left" runat="server" Visible="false" Width="448px">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnL1" runat="server" Text="L1" OnClick="btnL1_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnL2" runat="server" Text="L2" OnClick="btnL2_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnL3" runat="server" Text="L3" OnClick="btnL3_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
             <asp:TableCell>
                 <asp:Button ID="btnL4" runat="server" Text="L4" OnClick="btnL4_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
             <asp:TableCell>
                 <asp:Button ID="btnL5" runat="server" Text="L5" OnClick="btnL5_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
        </asp:TableRow >
        <asp:TableRow ID="L1" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlL1" runat="server" DataSourceID="datasrcL1" OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="L2" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlL2" runat="server" DataSourceID="datasrcL2" OnItemCommand="dlL1_ItemCommand">
                     <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="L3" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlL3" runat="server" DataSourceID="datasrcL3" OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="L4" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlL4" runat="server" DataSourceID="datasrcL4"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="L5" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlL5" runat="server" DataSourceID="datasrcL5"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
     <asp:Table ID="Right" runat="server" Visible="false" Width="448px">
<asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnR1" runat="server" Text="R1" OnClick="btnR1_Click" class="btn btn-primary rounded-pill" />
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnR2" runat="server" Text="R2" OnClick="btnR2_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnR3" runat="server" Text="R3" OnClick="btnR3_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
             <asp:TableCell>
                 <asp:Button ID="btnR4" runat="server" Text="R4" OnClick="btnR4_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
             <asp:TableCell>
                 <asp:Button ID="btnR5" runat="server" Text="R5" OnClick="btnR5_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
        </asp:TableRow >
        <asp:TableRow ID="R1" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlR1" runat="server" DataSourceID="datasrcR1" OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="R2" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlR2" runat="server" DataSourceID="datasrcR2"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="R3" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlR3" runat="server" DataSourceID="datasrcR3"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="R4" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlR4" runat="server" DataSourceID="datasrcR4"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="R5" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlR5" runat="server" DataSourceID="datasrcR5"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
     </asp:Table>
<asp:Table ID="Trailer" runat="server" Visible="false" Width="723px">
        <asp:TableRow>
            <asp:TableCell>
                <asp:Button ID="btnT1" runat="server" Text="T1" OnClick="btnT1_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnT2" runat="server" Text="T2" OnClick="btnT2_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
            <asp:TableCell>
                <asp:Button ID="btnT3" runat="server" Text="T3" OnClick="btnT3_Click" class="btn btn-primary rounded-pill" />
            </asp:TableCell>
             <asp:TableCell>
                 <asp:Button ID="btnT4" runat="server" Text="T4" OnClick="btnT4_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
             <asp:TableCell>
                 <asp:Button ID="btnT5" runat="server" Text="T5" OnClick="btnT5_Click" class="btn btn-primary rounded-pill" />
            </asp:TableCell>
            <asp:TableCell>
                 <asp:Button ID="btnT6" runat="server" Text="T6" OnClick="btnT6_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
            <asp:TableCell>
                 <asp:Button ID="btnT7" runat="server" Text="T7" OnClick="btnT7_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
            <asp:TableCell>
                 <asp:Button ID="btnT8" runat="server" Text="T8" OnClick="btnT8_Click" class="btn btn-primary rounded-pill"/>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="T1" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlT1" runat="server" DataSourceID="datasrcT1"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill" />
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="T2" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlT2" runat="server" DataSourceID="datasrcT2"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="T3" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlT3" runat="server" DataSourceID="datasrcT3"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"  />
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="T4" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlT4" runat="server" DataSourceID="datasrcT4"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="T5" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlT5" runat="server" DataSourceID="datasrcT5"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow ID="T6" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlT6" runat="server" DataSourceID="datasrcT6"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="T7" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlT7" runat="server" DataSourceID="datasrcT7"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
         <asp:TableRow ID="T8" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlT8" runat="server" DataSourceID="datasrcT8"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
     </asp:Table>
    <asp:Table ID="Search" runat="server" Visible="false">
        <asp:TableRow ID="NoResults" Visible="false">
            <asp:TableCell ColumnSpan="2">
                <asp:Label ID="lblNoResults" runat="server" Text="No Results"></asp:Label>
            </asp:TableCell>
        </asp:TableRow>
        <asp:TableRow>
            <asp:TableCell ColumnSpan="2">
                <asp:DataList ID="dlSearch" runat="server" DataSourceID="datasrcSearch"  OnItemCommand="dlL1_ItemCommand">
                    <ItemTemplate>
                        <asp:Label ID="lblName" runat="server" Text= '<%#Eval("CustomerName") %>' commandname="lblName"></asp:Label>
                        
                        <br />
                        <i>Items: </i>
                        <%#Eval("Items") %>
                        <br />
                        <asp:Button ID="btnViewProfile" runat="server" Text="View Profile" class="btn btn-primary rounded-pill"/>
                    </ItemTemplate>
                </asp:DataList>
            </asp:TableCell>
        </asp:TableRow>
    </asp:Table>
     <%--sql Data Sources Left--%>
    <asp:SqlDataSource ID="datasrcL1" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'L1' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcL2" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'L2' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcL3" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'L3' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcL4" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'L4' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcL5" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'L5' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>

    <%--sql Data Sources RIght--%>
    <asp:SqlDataSource ID="datasrcR1" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'R1' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcR2" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'R2' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcR3" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'R3' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcR4" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'R4' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcR5" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'R5' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>

    <%--sql Data Sources Trailer--%>
    <asp:SqlDataSource ID="datasrcT1" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'Trailer 1' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcT2" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'Trailer 2' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcT3" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'Trailer 3' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcT4" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'Trailer 4' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcT5" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'Trailer 5' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcT6" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'Trailer 6' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcT7" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'Trailer 7' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>
    <asp:SqlDataSource ID="datasrcT8" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = 'Trailer 8' group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;"></asp:SqlDataSource>


    <%--sql Data Sources Search--%>
    <asp:SqlDataSource ID="datasrcSearch" runat="server" ConnectionString="<%$ ConnectionStrings:GVA %>" 
                SelectCommand="select trim(C.FirstName)+' '+trim(c.LastName) as CustomerName,count(I.ItemID) as Items, I.ItemStorage, I.ItemLocation  from Customer C inner join WorkFlow WF on C.CustomerID = WF.CustomerID inner join ServiceEvent SE on WF.WorkFlowID=SE.WorkFlowID inner join Inventory I on SE.ItemID=I.ItemID where I.ItemStorage = @Storage group by trim(C.FirstName)+' '+trim(c.LastName),I.ItemStorage, I.ItemLocation;">
       
    </asp:SqlDataSource>
    


    

</asp:Content>
