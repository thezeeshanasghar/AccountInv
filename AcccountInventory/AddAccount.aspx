<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="AcccountInventory.AddAccount" %>

<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>


<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
    <title>Add Account</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="is-preload">

    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <div class="inner">

                <!-- Header -->
                <header id="header">
                    <a href="index.html" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
                    <ul class="icons">
                        <li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
                        <li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
                        <li><a href="#" class="icon fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
                        <li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
                        <li><a href="#" class="icon fa-medium"><span class="label">Medium</span></a></li>
                    </ul>
                </header>

                <form id="form1" runat="server">
                    <section>
                        <header class="major">
                            <h2>Add New Account</h2>
                        </header>
                      

                         <asp:FormView ID="FormView1" runat="server"   DefaultMode="Insert"
                              
                              DataKeyNames="ID" DataSourceID="SqlDataSource1">
                             <EditItemTemplate>
                                 ID:
                                 <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                                 <br />
                                 Code:
                                 <asp:TextBox ID="CodeTextBox" runat="server" Text='<%# Bind("Code") %>' />
                                 <br />
                                 Name:
                                 <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                 <br />
                                 AlternateCode:
                                 <asp:TextBox ID="AlternateCodeTextBox" runat="server" Text='<%# Bind("AlternateCode") %>' />
                                 <br />
                                 Type:
                                 <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                                 <br />
                                 Debit:
                                 <asp:TextBox ID="DebitTextBox" runat="server" Text='<%# Bind("Debit") %>' />
                                 <br />
                                 Credit:
                                 <asp:TextBox ID="CreditTextBox" runat="server" Text='<%# Bind("Credit") %>' />
                                 <br />
                                 Address:
                                 <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                 <br />
                                 Phone:
                                 <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                 <br />
                                 Email:
                                 <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                 <br />
                                 Active:
                                 <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                                 <br />
                                 YearStart:
                                 <asp:TextBox ID="YearStartTextBox" runat="server" Text='<%# Bind("YearStart") %>' />
                                 <br />
                                 Created:
                                 <asp:TextBox ID="CreatedTextBox" runat="server" Text='<%# Bind("Created") %>' />
                                 <br />
                                 <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                 &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                             </EditItemTemplate>
                             <InsertItemTemplate>
                                 Code:
                                 <asp:TextBox ID="CodeTextBox" runat="server" Text='<%# Bind("Code") %>' />
                                 <br />
                                 Name:
                                 <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                 <br />
                                 AlternateCode:
                                 <asp:TextBox ID="AlternateCodeTextBox" runat="server" Text='<%# Bind("AlternateCode") %>' />
                                 <br />
                                 Type:
                                 <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                                 <br />
                                 Debit:
                                 <asp:TextBox ID="DebitTextBox" runat="server" Text='<%# Bind("Debit") %>' />
                                 <br />
                                 Credit:
                                 <asp:TextBox ID="CreditTextBox" runat="server" Text='<%# Bind("Credit") %>' />
                                 <br />
                                 Address:
                                 <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                 <br />
                                 Phone:
                                 <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                 <br />
                                 Email:
                                 <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                 <br />
                                 Active:
                                 <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                                 <br />
                                 YearStart:
                                 <asp:TextBox ID="YearStartTextBox" runat="server" Text='<%# Bind("YearStart") %>' />
                                 <br />
                                 Created:
                                 <asp:TextBox ID="CreatedTextBox" runat="server" Text='<%# Bind("Created") %>' />
                                 <br />
                                 <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                 &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                             </InsertItemTemplate>
                             <ItemTemplate>
                                 ID:
                                 <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
                                 <br />
                                 Code:
                                 <asp:Label ID="CodeLabel" runat="server" Text='<%# Bind("Code") %>' />
                                 <br />
                                 Name:
                                 <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
                                 <br />
                                 AlternateCode:
                                 <asp:Label ID="AlternateCodeLabel" runat="server" Text='<%# Bind("AlternateCode") %>' />
                                 <br />
                                 Type:
                                 <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
                                 <br />
                                 Debit:
                                 <asp:Label ID="DebitLabel" runat="server" Text='<%# Bind("Debit") %>' />
                                 <br />
                                 Credit:
                                 <asp:Label ID="CreditLabel" runat="server" Text='<%# Bind("Credit") %>' />
                                 <br />
                                 Address:
                                 <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
                                 <br />
                                 Phone:
                                 <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
                                 <br />
                                 Email:
                                 <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
                                 <br />
                                 Active:
                                 <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' Enabled="false" />
                                 <br />
                                 YearStart:
                                 <asp:Label ID="YearStartLabel" runat="server" Text='<%# Bind("YearStart") %>' />
                                 <br />
                                 Created:
                                 <asp:Label ID="CreatedLabel" runat="server" Text='<%# Bind("Created") %>' />
                                 <br />

                             </ItemTemplate>
                        </asp:FormView>
                       
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=localhost\SQLEXPRESS;Initial Catalog=AccountInv;Integrated Security=True" ProviderName="System.Data.SqlClient"
                            SelectCommand="SELECT * FROM [Account]" 
                            DeleteCommand="DELETE FROM [Account] WHERE [ID] = @ID" 
                            InsertCommand="INSERT INTO [Account] ([Code], [Name], [AlternateCode], [Type], [Debit], [Credit], [Address], [Phone], [Email], [Active], [YearStart], [Created]) VALUES (@Code, @Name, @AlternateCode, @Type, @Debit, @Credit, @Address, @Phone, @Email, @Active, @YearStart, @Created)" 
                            UpdateCommand="UPDATE [Account] SET [Code] = @Code, [Name] = @Name, [AlternateCode] = @AlternateCode, [Type] = @Type, 
                            [Debit] = @Debit, [Credit] = @Credit, [Address] = @Address, [Phone] = @Phone, [Email] = @Email, [Active] = @Active, 
                            [YearStart] = @YearStart, [Created] = @Created WHERE [ID] = @ID">
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Code" Type="String" />
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="AlternateCode" Type="String" />
                                <asp:Parameter Name="Type" Type="String" />
                                <asp:Parameter Name="Debit" Type="Int64" />
                                <asp:Parameter Name="Credit" Type="Int64" />
                                <asp:Parameter Name="Address" Type="String" />
                                <asp:Parameter Name="Phone" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Active" Type="Boolean" />
                                <asp:Parameter DbType="Date" Name="YearStart" />
                                <asp:Parameter DbType="Date" Name="Created" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="Code" Type="String" />
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="AlternateCode" Type="String" />
                                <asp:Parameter Name="Type" Type="String" />
                                <asp:Parameter Name="Debit" Type="Int64" />
                                <asp:Parameter Name="Credit" Type="Int64" />
                                <asp:Parameter Name="Address" Type="String" />
                                <asp:Parameter Name="Phone" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Active" Type="Boolean" />
                                <asp:Parameter DbType="Date" Name="YearStart" />
                                <asp:Parameter DbType="Date" Name="Created" />
                                <asp:Parameter Name="ID" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
 
                        <asp:HyperLink ID="lnkAccount" href="Accounts.aspx" runat="server" >
                            Back To List
                        </asp:HyperLink>

                    </section>
                </form>
            </div>
        </div>

        <uc1:menu runat="server" id="menu" />
        
    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>
