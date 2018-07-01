﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddConfig.aspx.cs" Inherits="AcccountInventory.AddConfig" %>

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
    <title>Add Config</title>
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
                            <h2>Add New Config</h2>
                        </header>
                        
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="Label" CssClass="alert alert-success"> </asp:Label>
                        <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert"
                            DataKeyNames="ID" DataSourceID="SqlDataSource1">

                            <InsertItemTemplate>

                                <div class="col-md-6">
                                    <div class="col-md-2">
                                    Start Date:
                                
                      <asp:TextBox ID="StartDateTextBox" runat="server"  Text='<%# Bind("StartDate") %>' />
                                     <ajaxtool:CalendarExtender ID="Calendar" runat="server" TodaysDateFormat="MM/dd/yyyy"
                                         TargetControlID="StartDateTextBox" Format="MM/dd/yyyy"></ajaxtool:CalendarExtender>
                       <asp:RequiredFieldValidator ID="reqyearstart" ValidationGroup="insert" Display="Dynamic"
                            runat="server" ForeColor="Red" ControlToValidate="StartDateTextBox"
                            ErrorMessage="Required"></asp:RequiredFieldValidator>  
                                    </div>
                                
                               


                                <div class="col-md-2" >
                                     End Date:
                                
                      <asp:TextBox ID="EndDateTextBox" runat="server"  Text='<%# Bind("EndDate") %>' />
                                     <ajaxtool:CalendarExtender ID="CalendarExtender1" runat="server" TodaysDateFormat="MM/dd/yyyy"
                                         TargetControlID="EndDateTextBox" Format="MM/dd/yyyy"></ajaxtool:CalendarExtender>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="insert" Display="Dynamic"
                            runat="server" ForeColor="Red" ControlToValidate="EndDateTextBox"
                            ErrorMessage="Required"></asp:RequiredFieldValidator> 
                                     </div>
                                 
                                    </div>
                                
                                


                                <br />
                                <asp:LinkButton ID="InsertButton" CssClass="btn btn-success" ValidationGroup="insert" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                <br />

                            </InsertItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                            InsertCommand="INSERT INTO [Config] ([StartDate], [EndDate]) 
      VALUES (@StartDate, @EndDate)"
                            OnInserted="Config_Inserted">

                            <InsertParameters>

                                <asp:Parameter DbType="Date" Name="StartDate" />
                                  <asp:Parameter DbType="Date" Name="EndDate" />
                              
                            </InsertParameters>
                        </asp:SqlDataSource>

                        <asp:HyperLink ID="lnkAccount" href="Config.aspx" runat="server">
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


