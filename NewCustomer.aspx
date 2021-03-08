<%@ Page Language="C#" MasterPageFile="~/Master.Master" AutoEventWireup="true" CodeBehind="NewCustomer.aspx.cs" Inherits="Lab_3.NewCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <div>
      
            
            <asp:Table ID="tblNewCustomer" runat="server" BorderWidth="2" HorizontalAlign="Center" BorderColor="SkyBlue">
                <asp:TableRow>
                   <asp:TableHeaderCell>
                       <asp:Label ID="lblNewCustomer" runat="server" Text="New Customer Information" Font-Underline Font-Bold></asp:Label>
                   </asp:TableHeaderCell>
               </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCustomerName" runat="server" Text="Customer Name:"></asp:Label>  
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCustomerName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorName" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtCustomerName"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>           
                        <asp:Label ID="lblCustomerPhoneNumber" runat="server" Text="Phone Number: "></asp:Label>  
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCustomerPhoneNumber" runat="server"></asp:TextBox>
                         <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorPhone" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtCustomerPhoneNumber"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID="lblCurrentAddy" runat="server" Text="Current Address"></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCurrentAddress" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorCurrentAddress" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtCurrentAddress"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>           
                        <asp:Label ID="lblCustomerEmail" runat="server" Text="Email Address:"></asp:Label>  
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID="txtCustomerEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorEmail" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtCustomerEmail"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Label ID = "lblCustomerPassword" runat="server" Text="Enter a Password:" ></asp:Label>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:TextBox ID ="txtCustomerPassword" runat="server" ></asp:TextBox>
                            <asp:RequiredFieldValidator 
                            ID="RequiredFieldValidatorPassword" 
                            runat="server" 
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="txtCustomerPassword"
                            SetFocusOnError="true"
                            Text="Required"
                            ForeColor="Red">

                        </asp:RequiredFieldValidator>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" BorderColor="SkyBlue"/>
                    </asp:TableCell>
                    <asp:TableCell>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" BorderColor="SkyBlue"/>
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            
                
           
            
           
            
           
       <div> 
        
        </div>
    </div>
</asp:Content>
