<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="AcccountInventory.Transaction" %>

<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtool" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>

<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<html>
<head runat="server">
    <title>Add Transaction</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/custom.css" />
</head>
<body class="is-preload">

    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <div class="inner">

                <uc1:header runat="server" ID="header" />
                <form id="form1" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <section>
                        <header class="major">
                            <h2>Transaction</h2>
                        </header>
                        Fiscal Year(
                         <asp:Label ID="lblStartDate" runat="server" Text="Label"></asp:Label>
                        &nbsp;to&nbsp;
                         <asp:Label ID="lblEndDate" runat="server" Text="Label"></asp:Label>
                        )
                    </section>
                    <section>
                        <h3>Master Details</h3>
                        <asp:Label ID="lblDateError" runat="server" Text="Label"></asp:Label><br />
                        <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>
                        <asp:TextBox ID="txtDate" runat="server" OnTextChanged="txtDate_TextChanged" AutoPostBack="true" />
                        <ajaxtool:CalendarExtender ID="Calendar" runat="server" TodaysDateFormat="MM/dd/yyyy"
                            TargetControlID="txtDate" Format="MM/dd/yyyy"></ajaxtool:CalendarExtender>
                        <asp:RequiredFieldValidator ID="reqyDate" ValidationGroup="insert" Display="Dynamic"
                            runat="server" ForeColor="Red" ControlToValidate="txtDate"
                            ErrorMessage="Required"></asp:RequiredFieldValidator>

                        <asp:Label ID="lblCode" runat="server" Text="Code"></asp:Label>
                        <asp:DropDownList OnSelectedIndexChanged="ddProjectCode_SelectedIndexChanged"
                            ID="ddProjectCode" runat="server" DataSourceID="ddProjectCodeDataSource"
                            DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="ddProjectCodeDataSource" runat="server"
                            ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                            SelectCommand="SELECT CONCAT(p.Code, '-', a.AccountCode) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>

                        <asp:Label ID="lblCodeName" runat="server" Text="CodeName"></asp:Label>
                        <asp:TextBox ID="txtCodeName" runat="server"></asp:TextBox>
                        <asp:Label ID="lblRefNumber1" runat="server" Text="Ref#"></asp:Label>
                        <asp:TextBox ID="txtRefNumber1" runat="server"></asp:TextBox>

                        <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                        <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                        <asp:Label ID="lblRefNumber2" runat="server" Text="Ref#2"></asp:Label>
                        <asp:TextBox ID="txtRefNumber2" runat="server"></asp:TextBox>
                        <h3>Child Table</h3>
                        <div class="table-wrapper">
                            <table class="alt ddColumn">
                                <thead>
                                    <tr>
                                        <th>Code</th>
                                        <th>Branch</th>
                                        <th>Code Name</th>
                                        <th>Description</th>
                                        <th>Debit</th>
                                        <th>Credit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td >
                                            <asp:DropDownList OnSelectedIndexChanged="ddProjectCode_SelectedIndexChanged"
                                                ID="DropDownList1" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(p.Code, '-', a.AccountCode) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList OnSelectedIndexChanged="ddProjectCode_SelectedIndexChanged"
                                                ID="DropDownList2" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(p.Code, '-', a.AccountCode) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList OnSelectedIndexChanged="ddProjectCode_SelectedIndexChanged"
                                                ID="DropDownList3" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(p.Code, '-', a.AccountCode) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList OnSelectedIndexChanged="ddProjectCode_SelectedIndexChanged"
                                                ID="DropDownList4" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(p.Code, '-', a.AccountCode) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DropDownList OnSelectedIndexChanged="ddProjectCode_SelectedIndexChanged"
                                                ID="DropDownList5" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(p.Code, '-', a.AccountCode) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox24" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
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
