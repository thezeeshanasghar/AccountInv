<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="AcccountInventory.Transaction.CP.Add" %>

<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtool" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/scipts.ascx" TagPrefix="uc1" TagName="scipts" %>


<!DOCTYPE HTML>

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
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <section>
                                <div class="col-12">
                                    <asp:Label ID="lblDateError" runat="server" Text="Label"></asp:Label>
                                </div>
                                <div runat="server" ID="form">
                                    <div class="row">
                                        <div class="col-12">
                                            <h3>Account Holder</h3>
                                        </div>
                                        <div class="col-4-medium">
                                            <asp:Label ID="Label1" runat="server" Text="Date"></asp:Label>

                                            <asp:TextBox ID="txtDate" runat="server" OnTextChanged="txtDate_TextChanged" AutoPostBack="true" />
                                            <ajaxtool:CalendarExtender ID="Calendar" runat="server" TodaysDateFormat="dd/MM/yyyy"
                                                TargetControlID="txtDate" Format="dd/MM/yyyy"></ajaxtool:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="reqyDate" ValidationGroup="insert" Display="Dynamic"
                                                runat="server" ForeColor="Red" ControlToValidate="txtDate"
                                                ErrorMessage="Required"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-4-medium">
                                            <asp:Label ID="lblCode" runat="server" Text="Code"></asp:Label>
                                            <asp:DropDownList AppendDataBoundItems="true" OnSelectedIndexChanged="ddProjectCode_SelectedIndexChanged"
                                                ID="ddPA" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                DataTextField="PACode" DataValueField="AccountId" AutoPostBack="True">
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
                                    <asp:TextBox ID="incButton" Text="0" runat="server"></asp:TextBox>
                                    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add Transaction" />
                                    <br />
                                    <div style="padding-top: 2%;" class="table-wrapper">
                                        <asp:Table ID="Table1" runat="server" CssClass="alt ddColumn">
                                            <asp:TableHeaderRow>
                                                <asp:TableHeaderCell>
                                        Code
                                                </asp:TableHeaderCell>
                                                <asp:TableHeaderCell>
                                        Particular
                                                </asp:TableHeaderCell>
                                                <asp:TableHeaderCell>
                                        Description
                                                </asp:TableHeaderCell>
                                                <asp:TableHeaderCell>
                                        Debit
                                                </asp:TableHeaderCell>
                                                <asp:TableHeaderCell>
                                        Credit
                                                </asp:TableHeaderCell>
                                            </asp:TableHeaderRow>
                                            <asp:TableRow runat="server" ID="tr_1" BorderStyle="Solid">
                                                <asp:TableCell>
                                                    <asp:DropDownList AppendDataBoundItems="true" OnSelectedIndexChanged="ddtr1_SelectedIndexChanged"
                                                        ID="ddtr1" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                        DataTextField="PACode" DataValueField="AccountId" AutoPostBack="True">
                                                        <Items>
                                                            <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                        </Items>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                        SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>

                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtParticulartr_1" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDescriptiontr_1" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDebittr_1" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtCredittr_1" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>

                                            </asp:TableRow>

                                            <asp:TableRow runat="server" ID="tr_2">
                                                <asp:TableCell>
                                                    <asp:DropDownList AppendDataBoundItems="true" OnSelectedIndexChanged="ddtr2_SelectedIndexChanged"
                                                        ID="ddtr2" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                        DataTextField="PACode" DataValueField="AccountId" AutoPostBack="True">
                                                        <Items>
                                                            <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                        </Items>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                        SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>

                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtParticulartr_2" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDescriptiontr_2" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDebittr_2" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtCredittr_2" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>

                                            </asp:TableRow>

                                            <asp:TableRow runat="server" ID="tr_3">
                                                <asp:TableCell>
                                                    <asp:DropDownList AppendDataBoundItems="true" OnSelectedIndexChanged="ddtr3_SelectedIndexChanged"
                                                        ID="ddtr3" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                        DataTextField="PACode" DataValueField="AccountId" AutoPostBack="True">
                                                        <Items>
                                                            <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                        </Items>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                        SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>

                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtParticulartr_3" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDescriptiontr_3" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDebittr_3" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtCredittr_3" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>

                                            </asp:TableRow>

                                            <asp:TableRow runat="server" ID="tr_4">
                                                <asp:TableCell>
                                                    <asp:DropDownList AppendDataBoundItems="true" OnSelectedIndexChanged="ddtr4_SelectedIndexChanged"
                                                        ID="ddtr4" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                        DataTextField="PACode" DataValueField="AccountId" AutoPostBack="True">
                                                        <Items>
                                                            <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                        </Items>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource4" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                        SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>

                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtParticulartr_4" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDescriptiontr_4" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDebittr_4" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtCredittr_4" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>

                                            </asp:TableRow>

                                            <asp:TableRow runat="server" ID="tr_5">
                                                <asp:TableCell>
                                                    <asp:DropDownList AppendDataBoundItems="true" OnSelectedIndexChanged="ddtr5_SelectedIndexChanged"
                                                        ID="ddtr5" runat="server" DataSourceID="ddProjectCodeDataSource"
                                                        DataTextField="PACode" DataValueField="AccountId" AutoPostBack="True">
                                                        <Items>
                                                            <asp:ListItem Text="--Select Code--" Selected="True" Value="" />
                                                        </Items>
                                                    </asp:DropDownList>
                                                    <asp:SqlDataSource ID="SqlDataSource5" runat="server"
                                                        ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                                        SelectCommand="SELECT CONCAT(a.AccountCode, '-',p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId FROM Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode"></asp:SqlDataSource>

                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtParticulartr_5" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDescriptiontr_5" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtDebittr_5" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>
                                                <asp:TableCell>
                                                    <asp:TextBox ID="txtCredittr_5" OnTextChanged="txtDebittr_1_TextChanged" AutoPostBack="true" type="number" min="0" step="0.01" runat="server"></asp:TextBox>
                                                </asp:TableCell>

                                            </asp:TableRow>
                                        </asp:Table>
                                    </div>
                                    <div class="row">

                                        <div style="margin-top: 16px" class="col-4-medium">
                                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                        </div>
                                        <div style="margin-left: 20%;" class="col-4-medium">
                                            <asp:Label ID="lblTotalDebit" runat="server" Text="Tota Debit"></asp:Label>
                                            <asp:TextBox ID="txtTotalDebit" Enabled="false" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-4-medium">
                                            <asp:Label ID="lblTotalCredit" runat="server" Text="Tota Credit"></asp:Label>
                                            <asp:TextBox ID="txtTotalCredit" Enabled="false" runat="server"></asp:TextBox>
                                        </div>

                                        <div style="margin-left: 415px;" class="col-4-medium">
                                            <asp:Label ID="lblDifference" runat="server" Text="Difference(debit-credit)"></asp:Label>
                                            <asp:TextBox ID="txtDifference" runat="server" Enabled="false"></asp:TextBox>
                                        </div>

                                    </div>
                                </div>
                            </section>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </form>
            </div>
        </div>

        <uc1:menu runat="server" ID="menu" />

    </div>

    <uc1:scipts runat="server" ID="scipts" />
    <script src="<%= Page.ResolveUrl("~/assets/js/custom.js")%>"></script>
</body>
</html>
