<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="AcccountInventory.AddAccount" %>

<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtool" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head runat="server">
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
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <section>
                        <header class="major">
                            <h2>Add New Account</h2>
                        </header>
                        
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="Label" CssClass="alert alert-success"> </asp:Label>
                        <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert"
                            DataKeyNames="ID" DataSourceID="SqlDataSource1">

                            <InsertItemTemplate>

                                <div class="col-md-6">
                                    <div class="col-md-2" style="width: 25%;position: relative;bottom: 5px;">
                                    Code:
                                 <asp:TextBox ID="CodeTextBox" runat="server" Text='<%# Bind("Code") %>' />
                                    <asp:RequiredFieldValidator ID="reqCode" runat="server" ForeColor="Red" ValidationGroup="insert" Display="Dynamic" ControlToValidate="CodeTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                                
                               


                                <div class="col-md-2" style="width: 25%; margin-left: 68%; position: relative;bottom: 68px;">
                                    Alt Code:
                                 <asp:TextBox ID="AlternateCodeTextBox" runat="server" Text='<%# Bind("AlternateCode") %>' />
                                </div>
                                 <div class="col-md-2" style="width: 25%;margin-left: 33%;position: relative;bottom: 133px;">
                                    Type:
                        
                                    <asp:DropDownList ID="ddType" runat="server" SelectedValue='<%# Bind("Type") %>' >
                                        <asp:ListItem>H-1</asp:ListItem>
                                        <asp:ListItem>H-2</asp:ListItem>
                                        <asp:ListItem>T-0</asp:ListItem>
                                    </asp:DropDownList>



                                    <asp:RequiredFieldValidator ID="reqtype" runat="server" ValidationGroup="insert" Display="Dynamic" ForeColor="Red" ControlToValidate="ddType" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                </div>
                                    </div>
                                 <div class="col-md-6" style="    margin-top: -107px;">
                                    Name:
                                 <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                                    <asp:RequiredFieldValidator ID="reqname" runat="server" ValidationGroup="insert" Display="Dynamic" ForeColor="Red" ControlToValidate="NameTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                </div>
                                <div class="col-md-6">
                                    Debit:
                                 <asp:TextBox ID="DebitTextBox" runat="server" Text='<%# Bind("Debit") %>' />
                                    <asp:RequiredFieldValidator ID="regdebit" runat="server" ValidationGroup="insert" Display="Dynamic" ForeColor="Red" ControlToValidate="DebitTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                </div>
                                <div class="col-md-6">
                                    Credit:
                                 <asp:TextBox ID="CreditTextBox" runat="server" Text='<%# Bind("Credit") %>' />
                                    <asp:RequiredFieldValidator ID="regxcridet" ValidationGroup="insert" Display="Dynamic"
                                        runat="server" ForeColor="Red" ControlToValidate="CreditTextBox"
                                        ErrorMessage="Required"></asp:RequiredFieldValidator>

                                </div>

                                <div class="col-md-6">
                                    Address:
                                 <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                                </div>
                                <div class="col-md-6">
                                    Phone:
                                 <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                                    <asp:RegularExpressionValidator ID="regxphone" ValidationGroup="insert" runat="server" Display="Dynamic" ControlToValidate="PhoneTextBox"
                                        ValidationExpression="^((\+92)|(0092))-{0,1}\d{3}-{0,1}\d{7}$|^\d{11}$|^\d{4}-\d{7}$" ForeColor="Red"
                                        ErrorMessage="Phone number not in valid format"></asp:RegularExpressionValidator>

                                </div>

                                <div class="col-md-6">
                                    Email:
                                 <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                                    <asp:RegularExpressionValidator ID="regemail" runat="server" ValidationGroup="insert" Display="Dynamic"
                                        ControlToValidate="EmailTextBox" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                                        ForeColor="Red" ErrorMessage="Email not in valid format"></asp:RegularExpressionValidator>

                                </div>
                                <div class="col-md-6" style="display: none">
                                    Active:
                                 <asp:CheckBox ID="ActiveCheckBox" Text="true" runat="server" Checked='<%# Bind("Active") %>' />
                                </div>

                                <div class="col-md-6">
                                    YearStart:
                       
            
                      <asp:TextBox ID="YearStartTextBox" runat="server"  Text='<%# Bind("YearStart") %>' />
                                     <ajaxtool:CalendarExtender ID="Calendar" runat="server" TodaysDateFormat="MM/dd/yyyy"
                                         TargetControlID="YearStartTextBox" Format="MM/dd/yyyy"></ajaxtool:CalendarExtender>
                       <asp:RequiredFieldValidator ID="reqyearstart" ValidationGroup="insert" Display="Dynamic"
                            runat="server" ForeColor="Red" ControlToValidate="YearStartTextBox"
                            ErrorMessage="Required"></asp:RequiredFieldValidator> 
                                </div>

                                <br />
                                <asp:LinkButton ID="InsertButton" CssClass="btn btn-success" ValidationGroup="insert" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                <br />

                            </InsertItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                            InsertCommand="INSERT INTO [Account] ([Name], [AlternateCode], [Phone], [Email], [YearStart], [Type], [Address],[Code],[Active],[Debit],[Credit]) 
      VALUES (@Name, @AlternateCode, @Phone, @Email, @YearStart, @Type, @Address,@Code,'true',@Debit,@Credit)"
                            OnInserted="AccountInserted">

                            <InsertParameters>

                                <asp:Parameter Name="Code" Type="String" />
                                <asp:Parameter Name="Name" Type="String" />
                                <asp:Parameter Name="AlternateCode" Type="String" />
                                <asp:Parameter Name="Phone" Type="String" />
                                <asp:Parameter Name="Email" Type="String" />
                                <asp:Parameter Name="Active" Type="String" />
                                <asp:Parameter DbType="Date" Name="YearStart" />
                                <asp:Parameter Name="Type" Type="String" />
                                <asp:Parameter Name="Address" Type="String" />
                            </InsertParameters>
                        </asp:SqlDataSource>

                        <asp:HyperLink ID="lnkAccount" href="Accounts.aspx" runat="server">
                            Back To List
                        </asp:HyperLink>

                    </section>
                </form>
            </div>
        </div>

        <uc1:menu runat="server" ID="menu" />

    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>
