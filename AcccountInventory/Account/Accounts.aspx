<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="AcccountInventory.Accounts" %>


<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>
<%@ Register Src="~/scipts.ascx" TagPrefix="uc1" TagName="scipts" %>

<!DOCTYPE HTML>
<html>
<head runat="server">
    <title>Accounts</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" runat="server" href="~/assets/css/main.css" />
    <style>
        table td {
            padding: 1.75em 5px !important;
        }
    </style>
    <script src="../assets/js/jquery.min.js"></script>
    <script>
        function callConfirm() {
            if (confirm('Would you like to change the status of Account, press OK to continue.')) {
                $("#btnOnConfirm").click();
            }
            else {
                $("#btnCancel").click();
            }
        }
    </script>
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
                            <h2>Accounts</h2>
                        </header>
                        <asp:HyperLink ID="addNewAccount" href="AddAccount.aspx" runat="server" CssClass="button primary">Add New</asp:HyperLink>
                        <br />
                        <br />
                        <div class="table-wrapper">
                            <%--OnRowDataBound="accountGrid_RowDataBound"--%>
                            <asp:GridView ID="accountGrid" AutoGenerateColumns="False" runat="server"
                                DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="ID" runat="server" Text='<%# Eval("ID") %>' Style="display: none;"></asp:Label>
                                            <%--                                            <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%# Eval("Active") %>' />--%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code-Proj Code" HeaderStyle-Width="170" SortExpression="Name">
                                        <ItemTemplate>
                                            <%# Eval("AccountCode") %> -  <%# Eval("Code") %>
                                            <%--                      <asp:TextBox style="padding: 1.75em 10px;" ID="AlternateCode" runat="server" Text='<%# Bind("AlternateCode") %>' />
                      <asp:TextBox style="padding: 1.75em 10px;" ID="Type" runat="server" Text='<%# Bind("Type") %>' /> --%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
                                    <asp:BoundField DataField="Name" HeaderText="Particular" SortExpression="Name" />
                                    <asp:BoundField DataField="Debit" HeaderText="Debit" SortExpression="Debit" />


                                    <asp:BoundField DataField="Credit" HeaderText="Credit" SortExpression="Credit" />
                                    <%--<asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                                    <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />

                                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />--%>
                                    <asp:BoundField DataField="YearStart" HeaderText="Date" SortExpression="YearStart" ApplyFormatInEditMode="true" DataFormatString="{0:dd/MM/yyy}" />


                                    <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
                                    <%-- <asp:CommandField ShowEditButton="True" />--%>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hyperlink1" NavigateUrl='<%#Eval("ID","~/Account/UpdateAccount.aspx?ID={0}")%>'
                                                Target="_blank" runat="server">
                        <i class='fa fa-edit' aria-hidden='true'></i>
                                            </asp:HyperLink>
                                            <%--  <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete"
                                                OnClientClick="return confirm('Are you sure you want to delete this record?')">
                        <i class='fa fa-trash' aria-hidden='true'></i>
                                            </asp:LinkButton>--%>
                                            <asp:CheckBox ID="chkActive" runat="server" AutoPostBack="true" Checked='<%# Convert.ToBoolean(Eval("Active")) %>'
                                                OnCheckedChanged="chkActive_CheckedChanged" CommandName="Active" Text="Active" />
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>



                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                SelectCommand="SELECT [AccountCode], [Name], [ProjectCode], [Type], [Debit], 
        [Credit], [Address], [Phone], [Email], [YearStart], a.ID,p.Code, a.Active FROM Account AS a
        INNER JOIN  Project AS p ON a.ProjectCode=p.Id ORDER BY [AccountCode]"
                                DeleteCommand="UPDATE [Account] SET [Active]='False'  WHERE [ID] = @ID">
                                <DeleteParameters>
                                    <asp:Parameter Name="ID" Type="Int32" />
                                </DeleteParameters>

                            </asp:SqlDataSource>


                        </div>
                    </section>
                    <asp:Button ID="btnOnConfirm" OnClick="btnOnConfirm_Click" style="display:none;" Text="test" runat="server" />
                    <asp:Button ID="btnCancel" OnClick="btnCancel_Click" style="display:none;" Text="test" runat="server" />
                </form>
            </div>
        </div>

        <uc1:menu runat="server" ID="menu" />
    </div>
    <uc1:scipts runat="server" ID="scipts" />

</body>
</html>
