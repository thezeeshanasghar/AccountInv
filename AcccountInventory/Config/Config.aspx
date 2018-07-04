<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Config.aspx.cs" Inherits="AcccountInventory.Config" %>


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
                            <h2>Config</h2>
                        </header>
                        
                        <br />
                         <br />
                        <div class="table-wrapper">
                         <asp:GridView ID="configGrid" AutoGenerateColumns="False" runat="server"
                             
                              DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#CC9966"
                              BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ID">
        <Columns>
          
            
           
            <asp:BoundField DataField="StartDate" HeaderText="Start Date" SortExpression="StartDate" ApplyFormatInEditMode="true"  DataFormatString="{0:d}"  />
            
             <asp:BoundField DataField="EndDate" HeaderText="End Date" SortExpression="EndDate" ApplyFormatInEditMode="true"  DataFormatString="{0:d}"  />
             <asp:BoundField DataField="CompanyName" HeaderText="Company Name" SortExpression="CompanyName"  />
            
             <asp:BoundField DataField="ID" Visible="false" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ID" />
             <%-- <asp:CommandField ShowEditButton="True" />--%>
             <asp:TemplateField HeaderText="Action">
                <ItemTemplate>
                    <asp:HyperLink id="hyperlink1" NavigateUrl='<%#Eval("ID","~/UpdateConfig.aspx?ID={0}")%>'   
                        Target="_blank" runat="server">
                        <i class='fa fa-edit' aria-hidden='true'></i>
                    </asp:HyperLink>
                   <%--   <asp:LinkButton ID="deleteButton" runat="server" CommandName="Delete"
                        OnClientClick="return confirm('Are you sure you want to delete this record?')">
                        <i class='fa fa-trash' aria-hidden='true'></i>
                    </asp:LinkButton>--%>
                            
                </ItemTemplate>
            </asp:TemplateField>
          
        </Columns>

      

    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
        SelectCommand="SELECT * FROM [Config]"
         DeleteCommand="UPDATE [Config] WHERE [ID] = @ID">
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

    <uc1:scipts runat="server" id="scipts" />

</body>
</html>

