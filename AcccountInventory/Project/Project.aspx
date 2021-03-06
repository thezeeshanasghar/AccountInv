﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="AcccountInventory.Project" %>


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
        <script src="../assets/js/jquery.min.js"></script>
    <script>
        function callConfirm() {
            if (confirm('Would you like to change the status of Project?, press Ok to continue.')) {
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
                            <h2>Project</h2>
                        </header>
                        <asp:HyperLink ID="addNewAccount" href="AddProject.aspx" runat="server" CssClass="button primary">Add New</asp:HyperLink>
                        <br />
                        <br />
                        <div class="table-wrapper">
                            <asp:GridView ID="projectGrid" AutoGenerateColumns="False" runat="server"
                                OnRowDataBound="projectGrid_RowDataBound"
                                DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966"
                                BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID">
                                <Columns>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Label ID="ID"  runat="server" Text='<%# Eval("ID") %>' Style="display: none;"></asp:Label>
                                            <asp:Label ID="lblBlock" Visible="false" runat="server" Text='<%# Eval("Block") %>' />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Code" SortExpression="Code">
                                        <ItemTemplate>
                                            <%# Eval("Code") %>
                                            <%--                      <asp:TextBox style="padding: 1.75em 10px;" ID="AlternateCode" runat="server" Text='<%# Bind("AlternateCode") %>' />
                      <asp:TextBox style="padding: 1.75em 10px;" ID="Type" runat="server" Text='<%# Bind("Type") %>' /> --%>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
                                    <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                                    <asp:BoundField DataField="Responsible" HeaderText="Responsible" SortExpression="Responsible" />




                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="chkActive" runat="server" AutoPostBack="true" Checked='<%# Convert.ToBoolean(Eval("Active")) %>' 
                                                OnCheckedChanged="chkActive_CheckedChanged" CommandName="Active" Text="Active" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%-- <asp:CommandField ShowEditButton="True" />--%>
                                    <asp:TemplateField HeaderText="Action">
                                        <ItemTemplate>
                                            <asp:HyperLink ID="hyperlink1" NavigateUrl='<%#Eval("ID","~/Project/UpdateProject.aspx?ID={0}")%>'
                                                Target="_blank" runat="server">
                        <i class='fa fa-edit' aria-hidden='true'></i>
                                            </asp:HyperLink>
                                            <%--  
                    <asp:CheckBox ID="activeDeactive" runat="server"  CommandName="Delete" 
                         OnClientClick="return confirm('Are you sure you want to block this user?')"/>--%>
                                            
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                </Columns>



                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                SelectCommand="SELECT * FROM [Project] ORDER BY [Code]"
                                DeleteCommand="UPDATE [Project] SET [Block]='False'  WHERE [ID] = @ID ">
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

