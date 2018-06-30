<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="AcccountInventory.Login" %>

<!DOCTYPE html>


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
            <div class="inner" style="margin-left: 26%;
    margin-top: 167px;">

               

                <form id="form1" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <section>
                        <header class="major">
                            <h2>Login</h2>
                        </header>

                                <div class="col-md-6">
                                    Email:
                                 <asp:TextBox ID="EmailTextBox" style="width: 50%;" runat="server" ValidationGroup="login" Text='<%# Bind("Email") %>' />
                                    <asp:RequiredFieldValidator ValidationGroup="login" ForeColor="Red" ID="reqemail" Display="Dynamic" ControlToValidate="EmailTextBox" runat="server" 
                                        ErrorMessage="Email required"
                                        ></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regemail" runat="server" ValidationGroup="insert" Display="Dynamic"
                                        ControlToValidate="EmailTextBox" ValidationExpression="^\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$"
                                        ForeColor="Red" ErrorMessage="Email not in valid format"></asp:RegularExpressionValidator>

                                </div>
                                <div class="col-md-6">
                                    Password:
                                 <asp:TextBox ID="Passwordtextbox" style="width: 50%;" TextMode="Password" runat="server" ValidationGroup="login" Text='<%# Bind("Password") %>' />
                                      <asp:RequiredFieldValidator ForeColor="Red" ValidationGroup="login" ID="reqpassword" Display="Dynamic" ControlToValidate="Passwordtextbox" runat="server" 
                                        ErrorMessage="Password required"
                                        ></asp:RequiredFieldValidator>
                                     </div>

                              <asp:Button ID="loginButton" style="margin-top: 12px;" OnClick="loginButton_Click" CssClass="btn btn-success"
                                   ValidationGroup="login" runat="server" CausesValidation="True" CommandName="Insert" Text="Login" />
                        <br />
                        <asp:Label ID="lblError" runat="server" ForeColor="Red" Text=""></asp:Label>
                        
                       

                        
                        
                    </section>
                </form>
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

