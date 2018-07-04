<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transaction.aspx.cs" Inherits="AcccountInventory.Transaction" %>

<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtool" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/scipts.ascx" TagPrefix="uc1" TagName="scipts" %>


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
    <link rel="stylesheet" runat="server" href="~/assets/css/main.css" />
    <link rel="stylesheet" runat="server" href="~/assets/css/custom.css" />

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
                    <header class="major">
                        <h2>Transaction</h2>
                    </header>
                    <h3 style="text-align: center">Fiscal Year (
                         <asp:Label ID="lblStartDate" runat="server" Text="Label"></asp:Label>
                        &nbsp;to&nbsp;
                         <asp:Label ID="lblEndDate" runat="server" Text="Label"></asp:Label>
                        )
                    </h3>
                    <section>
                        <div class="row">
                            <div class="col-12">
                                <h3>Account Holder</h3>
                                <asp:Label ID="lblDateError" runat="server" Text="Label"></asp:Label>
                            </div>
                            <div class="col-4-medium">
                                <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>

                                <asp:TextBox ID="txtDate" runat="server" OnTextChanged="txtDate_TextChanged" AutoPostBack="true" />
                                <ajaxtool:CalendarExtender ID="Calendar" runat="server" TodaysDateFormat="MM/dd/yyyy"
                                    TargetControlID="txtDate" Format="MM/dd/yyyy"></ajaxtool:CalendarExtender>
                                <asp:RequiredFieldValidator ID="reqyDate" ValidationGroup="insert" Display="Dynamic"
                                    runat="server" ForeColor="Red" ControlToValidate="txtDate"
                                    ErrorMessage="Required"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-4-medium">
                                <asp:Label ID="lblCode" runat="server" Text="Code"></asp:Label>
                                <asp:DropDownList AppendDataBoundItems="true" OnSelectedIndexChanged="ddProjectCode_SelectedIndexChanged"
                                    ID="ddPA" runat="server" DataSourceID="ddProjectCodeDataSource"
                                    DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                    <Items>
                                        <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                    </Items>
                                </asp:DropDownList>
                                <asp:SqlDataSource ID="ddProjectCodeDataSource" runat="server"
                                    ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                    SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                            </div>
                            <div class="col-4-medium">
                                <asp:Label ID="lblParticular" runat="server" Text="Particular"></asp:Label>
                                <asp:TextBox ID="txtParticular" runat="server"></asp:TextBox>
                            </div>


                            <div class="col-4-medium">
                                <asp:Label ID="lblRefNumber1" runat="server" Text="Ref#1"></asp:Label>
                                <asp:TextBox ID="txtRefNumber1" runat="server"></asp:TextBox>
                            </div>

                            <div class="col-8">
                                <asp:Label ID="lblDescription" runat="server" Text="Description"></asp:Label>
                                <asp:TextBox ID="txtDescription" runat="server"></asp:TextBox>
                            </div>
                            <div class="col-4-medium">
                                <asp:Label ID="lblRefNumber2" runat="server" Text="Ref#2"></asp:Label>
                                <asp:TextBox ID="txtRefNumber2" runat="server"></asp:TextBox>
                            </div>


                        </div>

                        <br />
                        <h3>Suppliers/Customer</h3>
                        <div class="table-wrapper">
                            <table class="alt ddColumn">
                                <thead>
                                    <tr>
                                        <th>Code</th>
                                        <th>Particular</th>
                                        <th>Description</th>
                                        <th>Debit</th>
                                        <th>Credit</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr id="tr_1">
                                        <td>
                                            <asp:DropDownList AppendDataBoundItems="true"
                                                ID="DropDownList1" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                                <Items>
                                                    <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                </Items>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>

                                        <td>
                                            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr runat="server" id="tr_2">
                                        <td>
                                            <asp:DropDownList AppendDataBoundItems="true"
                                                ID="DropDownList2" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                                <Items>
                                                    <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                </Items>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>

                                        <td>
                                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr runat="server" id="tr_3">
                                        <td>
                                            <asp:DropDownList AppendDataBoundItems="true"
                                                ID="DropDownList3" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                                <Items>
                                                    <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                </Items>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>

                                        <td>
                                            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr runat="server" id="tr_4">
                                        <td>
                                            <asp:DropDownList AppendDataBoundItems="true"
                                                ID="DropDownList4" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                                <Items>
                                                    <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                </Items>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>

                                        <td>
                                            <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox></td>
                                    </tr>
                                    <tr runat="server" id="tr_5">
                                        <td>
                                            <asp:DropDownList AppendDataBoundItems="true"
                                                ID="DropDownList5" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="PACode" AutoPostBack="True">
                                                <Items>
                                                    <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                </Items>
                                            </asp:DropDownList>
                                            <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>
                                        </td>

                                        <td>
                                            <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox></td>
                                        <td>
                                            <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox></td>
                                    </tr>

                                </tbody>
                            </table>
                        </div>

                        <button id="btnAdd" onclick="return addRow();">Add Row</button>
                    </section>
                </form>
            </div>
        </div>

        <uc1:menu runat="server" ID="menu" />

    </div>

    <uc1:scipts runat="server" ID="scipts" />
    <script src="<%= Page.ResolveUrl("~/assets/js/custom.js")%>"></script>
</body>
</html>
