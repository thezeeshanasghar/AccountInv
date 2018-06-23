<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="AcccountInventory.AddAccount" %>

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

       
        <!-- Sidebar -->
        <div id="sidebar">
            <div class="inner">

                <!-- Search -->
                <section id="search" class="alt">
                    <form method="post" action="#">
                        <input type="text" name="query" id="query" placeholder="Search" />
                    </form>
                </section>

                <!-- Menu -->
                <nav id="menu">
                    <header class="major">
                        <h2>Menu</h2>
                    </header>
                    <ul>
                        <li><a href="index.html">Homepage</a></li>
                        <li><a href="generic.html">Generic</a></li>
                        <li><a href="elements.html">Elements</a></li>
                        <li>
                            <span class="opener">Submenu</span>
                            <ul>
                                <li><a href="#">Lorem Dolor</a></li>
                                <li><a href="#">Ipsum Adipiscing</a></li>
                                <li><a href="#">Tempus Magna</a></li>
                                <li><a href="#">Feugiat Veroeros</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Etiam Dolore</a></li>
                        <li><a href="#">Adipiscing</a></li>
                        <li>
                            <span class="opener">Another Submenu</span>
                            <ul>
                                <li><a href="#">Lorem Dolor</a></li>
                                <li><a href="#">Ipsum Adipiscing</a></li>
                                <li><a href="#">Tempus Magna</a></li>
                                <li><a href="#">Feugiat Veroeros</a></li>
                            </ul>
                        </li>
                        <li><a href="#">Maximus Erat</a></li>
                        <li><a href="#">Sapien Mauris</a></li>
                        <li><a href="#">Amet Lacinia</a></li>
                    </ul>
                </nav>

                <!-- Section -->
                <section>
                    <header class="major">
                        <h2>Ante interdum</h2>
                    </header>
                    <div class="mini-posts">
                        <article>
                            <a href="#" class="image">
                                <img src="images/pic07.jpg" alt="" /></a>
                            <p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
                        </article>
                        <article>
                            <a href="#" class="image">
                                <img src="images/pic08.jpg" alt="" /></a>
                            <p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
                        </article>
                        <article>
                            <a href="#" class="image">
                                <img src="images/pic09.jpg" alt="" /></a>
                            <p>Aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore aliquam.</p>
                        </article>
                    </div>
                    <ul class="actions">
                        <li><a href="#" class="button">More</a></li>
                    </ul>
                </section>

                <!-- Section -->
                <section>
                    <header class="major">
                        <h2>Get in touch</h2>
                    </header>
                    <p>Sed varius enim lorem ullamcorper dolore aliquam aenean ornare velit lacus, ac varius enim lorem ullamcorper dolore. Proin sed aliquam facilisis ante interdum. Sed nulla amet lorem feugiat tempus aliquam.</p>
                    <ul class="contact">
                        <li class="fa-envelope-o"><a href="#">information@untitled.tld</a></li>
                        <li class="fa-phone">(000) 000-0000</li>
                        <li class="fa-home">1234 Somewhere Road #8254<br />
                            Nashville, TN 00000-0000</li>
                    </ul>
                </section>

                <!-- Footer -->
                <footer id="footer">
                    <p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
                </footer>

            </div>
        </div>

    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>

</body>
</html>
