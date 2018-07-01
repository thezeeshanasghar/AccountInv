<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accounts.aspx.cs" Inherits="AcccountInventory.Accounts" %>


<%@ Register Src="~/menu.ascx" TagPrefix="uc1" TagName="menu" %>
<%@ Register Src="~/header.ascx" TagPrefix="uc1" TagName="header" %>



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
                         <asp:GridView ID="accountGrid" AutoGenerateColumns="False" runat="server"
                             OnRowDataBound="accountGrid_RowDataBound"
                              DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966"
                              BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID">
        <Columns>
            <asp:TemplateField>
            <ItemTemplate>
                <asp:Label ID="lblActive" Visible="false" runat="server" Text='<%# Eval("Active") %>' />
            </ItemTemplate>
        </asp:TemplateField>
            <asp:TemplateField HeaderText="Code-Proj Code" SortExpression="Name">
                <ItemTemplate>
                     <%# Eval("Code") %> -  <%# Eval("ProjectCode") %> 
<%--                      <asp:TextBox style="padding: 1.75em 10px;" ID="AlternateCode" runat="server" Text='<%# Bind("AlternateCode") %>' />
                      <asp:TextBox style="padding: 1.75em 10px;" ID="Type" runat="server" Text='<%# Bind("Type") %>' /> --%>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Type" HeaderText="Type" SortExpression="Type" />
            <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
            <asp:BoundField DataField="Debit" HeaderText="Debit" SortExpression="Debit" />


            <asp:BoundField DataField="Credit" HeaderText="Credit" SortExpression="Credit" />
            <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
            <asp:BoundField DataField="Phone" HeaderText="Phone" SortExpression="Phone" />

            <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
            <asp:BoundField DataField="YearStart" HeaderText="YearStart" SortExpression="YearStart" ApplyFormatInEditMode="true"  DataFormatString="{0:d}"  />
            

             <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
             <%-- <asp:CommandField ShowEditButton="True" />--%>
             <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:HyperLink id="hyperlink1" NavigateUrl='<%#Eval("ID","~/UpdateAccount.aspx?ID={0}")%>'   
                        Target="_blank" runat="server">
                        <i class='fa fa-edit' aria-hidden='true'></i>
                    </asp:HyperLink>
                      <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete"
                        OnClientClick="return confirm('Are you sure you want to delete this record?')">
                        <i class='fa fa-trash' aria-hidden='true'></i>
                    </asp:LinkButton>
                            
                </ItemTemplate>
            </asp:TemplateField>
          
        </Columns>

      

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
        SelectCommand="SELECT [Code], [Name], [ProjectCode], [Type], [Debit], [Credit], [Address], [Phone], [Email], [YearStart], [ID], [Active] FROM [Account]"
         DeleteCommand="UPDATE [Account] SET [Active]='False'  WHERE [ID] = @ID">
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
