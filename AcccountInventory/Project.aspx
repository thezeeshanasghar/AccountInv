﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Project.aspx.cs" Inherits="AcccountInventory.Project" %>


<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>


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
    <link rel="stylesheet" href="assets/css/main.css" />
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

                <!-- Header -->
                <header id="header">
                    <a href="#" class="logo"><strong>Editorial</strong> by HTML5 UP</a>
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
                <asp:Label ID="lblBlock" Visible="false" runat="server" Text='<%# Eval("Block") %>' />
            </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField HeaderText="Code" SortExpression="Name">
                <ItemTemplate>
                     <%# Eval("Code") %> 
<%--                      <asp:TextBox style="padding: 1.75em 10px;" ID="AlternateCode" runat="server" Text='<%# Bind("AlternateCode") %>' />
                      <asp:TextBox style="padding: 1.75em 10px;" ID="Type" runat="server" Text='<%# Bind("Type") %>' /> --%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" />
            <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
            <asp:BoundField DataField="Responsible" HeaderText="Responsible" SortExpression="Responsible" />


            

             <asp:BoundField DataField="ID" Visible="false" HeaderText="ID"
                  InsertVisible="False" ReadOnly="True" SortExpression="ID" />
             <%-- <asp:CommandField ShowEditButton="True" />--%>
             <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:HyperLink id="hyperlink1" NavigateUrl='<%#Eval("ID","~/UpdateProject.aspx?ID={0}")%>'   
                        Target="_blank" runat="server">
                        <i class='fa fa-edit' aria-hidden='true'></i>
                    </asp:HyperLink>
                      <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete"
                        OnClientClick="return confirm('Are you sure you want to block this user?')">
                        <i class='fa fa-trash' aria-hidden='true'></i>
                    </asp:LinkButton>
                            
                </ItemTemplate>
            </asp:TemplateField>
          
        </Columns>

      

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
        SelectCommand="SELECT * FROM [Project]"
         DeleteCommand="UPDATE [Project] SET [Block]='False'  WHERE [ID] = @ID">
        <DeleteParameters>
            <asp:Parameter Name="ID" Type="Int32" />
        </DeleteParameters>
     
    </asp:SqlDataSource>
                             </div>
                    </section>
                </form>
            </div>
        </div>

        <uc1:menu runat="server" id="menu" />
    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/browser.min.js"></script>
    <script src="assets/js/breakpoints.min.js"></script>
    <script src="assets/js/util.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
