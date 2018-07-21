<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Transactions.aspx.cs" Inherits="AcccountInventory.Transaction.Transactions" %>

<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>
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
    <title>Editorial by HTML5 UP</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" runat="server" href="~/assets/css/main.css" />
    <style>
        table td {
            padding: 1.75em 5px !important;
        } 
    </style>
</head>
<body class="is-preload">

    <!-- Wrapper -->
    <div id="wrapper">
        <!-- Main -->
        <div id="main">
            <div class="inner">
                <uc1:header runat="server" ID="header" />
                <form id="form1" runat="server">

                    <section>
                        <header class="major">
                            <h2>Transactions</h2>
                        </header>

                        <br />
                        <br />
                        <div class="table-wrapper">

                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="Date" HeaderText="Date" SortExpression="Date" />
                                    <asp:BoundField DataField="AccountID" Visible="false" HeaderText="AccountID" SortExpression="AccountID" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                    <asp:BoundField DataField="Ref1" HeaderText="Ref1" SortExpression="Ref1" />
                                    <asp:BoundField DataField="Ref2" HeaderText="Ref2" SortExpression="Ref2" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>" SelectCommand="SELECT * FROM [TransParent]"></asp:SqlDataSource>
                            <h2>Child Transactions</h2>
                         
                            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2">
                                <Columns>
                                    <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <asp:BoundField DataField="TransParentID" Visible="false" HeaderText="TransParentID" SortExpression="TransParentID" />
                                    <asp:BoundField DataField="AccountID" Visible="false" HeaderText="AccountID" SortExpression="AccountID" />
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                    <asp:BoundField DataField="Debit" HeaderText="Debit" SortExpression="Debit" />
                                    <asp:BoundField DataField="Credit" HeaderText="Credit" SortExpression="Credit" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>" SelectCommand="SELECT * FROM [TransChild] WHERE ([TransParentID] = @TransParentID)">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="TransParentID" PropertyName="SelectedValue" Type="Int32" />
                                </SelectParameters>
                            </asp:SqlDataSource>

                        </div>
                    </section>
                </form>
            </div>
        </div>
        <uc1:menu runat="server" ID="menu" />
    </div>

    <uc1:scipts runat="server" ID="scipts" />
     
</body>
</html>
