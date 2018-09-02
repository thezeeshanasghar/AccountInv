<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="AcccountInventory.Transaction.JV.List" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxtool" %>
<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/scipts.ascx" TagPrefix="uc1" TagName="scipts" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Transactions</title>
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
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <section>
                                <header class="major">
                                    <h2>Journal Vouchers</h2>
                                </header>
                                <div class="row">
                                    <div class="col-6-small">
                                        <asp:TextBox ID="txtSearch" placeholder="Enter voucher number" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-4-small">
                                        <asp:Button ID="btnSearchTransaction" runat="server" OnClick="btnSearchTransaction_Click" Text="Search" />
                                    </div>
                                </div>
                                <br />
                                <div class="table-wrapper">
                                    <div style="height: 300px; overflow-y: scroll;">
                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1">
                                            <Columns>
                                                <asp:CommandField ShowSelectButton="True" />
                                                <asp:BoundField DataField="ID" HeaderText="Voucher #" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                                <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="Date" />
                                                <asp:BoundField DataField="PACode" HeaderText="Code" SortExpression="PACode" />
                                                <asp:BoundField DataField="AccountID" Visible="false" HeaderText="AccountID" SortExpression="AccountID" />
                                                <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                                <asp:BoundField DataField="TotalDebit" HeaderText="Total Debit" SortExpression="TotalDebit" />
                                                <asp:BoundField DataField="TotalCredit" HeaderText="Total Credit" SortExpression="TotalCredit" />
                                                <asp:BoundField DataField="Difference" HeaderText="Difference" SortExpression="Difference" />
                                            </Columns>
                                        </asp:GridView>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                            SelectCommand="SELECT jvp.*,CONCAT(a.AccountCode, '-',p.Code) AS PACode
                                             FROM
                                                 JVParent jvp
                                                  INNER JOIN
                                                 Account a
                                                  ON jvp.AccountID = a.ID
                                                  INNER JOIN
                                                 Project p
                                                  ON a.ProjectCode = p.ID"></asp:SqlDataSource>
                                    </div>
                                    <h2>Child Transactions</h2>

                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource2">
                                        <Columns>
                                            <asp:BoundField DataField="ID" HeaderText="Serial Number" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                            <asp:BoundField DataField="JVParentID" Visible="false" HeaderText="JVParentID" SortExpression="JVParentID" />
                                            <asp:BoundField DataField="AccountID" Visible="false" HeaderText="AccountID" SortExpression="AccountID" />
                                            <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" SortExpression="Date" />
                                            <asp:BoundField DataField="PACode" HeaderText="Code" SortExpression="PACode" />
                                            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                            <asp:BoundField DataField="Debit" HeaderText="Debit" SortExpression="Debit" />
                                            <asp:BoundField DataField="Credit" HeaderText="Credit" SortExpression="Credit" />
                                        </Columns>
                                    </asp:GridView>
                                    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                        SelectCommand="SELECT jvc.*,CONCAT(a.AccountCode, '-',p.Code) AS PACode
                                             FROM
                                                 JVChild jvc
                                                  INNER JOIN
                                                 Account a
                                                  ON jvc.AccountID = a.ID
                                                  INNER JOIN
                                                 Project p
                                                  ON a.ProjectCode = p.ID
                                             WHERE ([JVParentID] = @JVParentID)">
                                        <SelectParameters>
                                            <asp:ControlParameter ControlID="GridView1" DefaultValue="0" Name="JVParentID" PropertyName="SelectedValue" Type="Int32" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>

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

</body>
</html>

