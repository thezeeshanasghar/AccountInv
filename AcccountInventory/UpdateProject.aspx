<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateProject.aspx.cs" Inherits="AcccountInventory.UpdateProject" %>

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
    <title>Add Account</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/css/main.css" />
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
                            <h2>Update Project</h2>
                        </header>
                        
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="Label" CssClass="alert alert-success"> </asp:Label>
                        <asp:FormView ID="FormView1" runat="server" DefaultMode="Edit"
                            DataKeyNames="ID" DataSourceID="SqlDataSource1">

                            <EditItemTemplate>
                                   <div class="col-md-6">
                                    <div class="col-md-2">
                                    Code:
                                 <asp:TextBox ID="CodeTextBox" ReadOnly="true" style="width: 10%;" runat="server" Text='<%# Bind("Code") %>' />
                                    <asp:RequiredFieldValidator ID="reqCode" runat="server" ForeColor="Red" ValidationGroup="insert" Display="Dynamic" ControlToValidate="CodeTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>
                                
                               


                                <div class="col-md-2" >
                                   Description:
                                 <asp:TextBox ID="DescriptionTextBox" runat="server" Text='<%# Bind("Description") %>' />
                                </div>
                                 
                                    </div>
                                 <div class="col-md-6">
                                    Location:
                                 <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Location") %>' />
                                    <asp:RequiredFieldValidator ID="reqname" runat="server" ValidationGroup="insert" Display="Dynamic" ForeColor="Red" ControlToValidate="NameTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                </div>
                                <div class="col-md-6">
                                    Responsible:
                                 <asp:TextBox ID="DebitTextBox" runat="server" Text='<%# Bind("Responsible") %>' />
                                    <asp:RequiredFieldValidator ID="regdebit" runat="server" ValidationGroup="insert" Display="Dynamic" ForeColor="Red" ControlToValidate="DebitTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>

                                </div>
                                

                                
                                

                                
                               

                   

                                
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" 
                                    CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                            </EditItemTemplate>

          
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                           
                             SelectCommand="SELECT * FROM [Project] WHERE ([ID] = @ID)"
                             UpdateCommand="UPDATE [Project] SET [Code] = @Code, [Description] = @Description,
                             [Location] = @Location, [Responsible] = @Responsible WHERE [ID] = @ID"
                             DeleteCommand="DELETE FROM [Project] WHERE [ID] = @ID"
                             InsertCommand="INSERT INTO [Project] ([Code], [Description], [Location], [Responsible]) VALUES (@Code, @Description, @Location, @Responsible)">
                             
                            <DeleteParameters>
                                <asp:Parameter Name="ID" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="Code" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="Location" Type="String" />
                                <asp:Parameter Name="Responsible" Type="String" />
                                
                            </InsertParameters>
                            <SelectParameters>
                                <asp:QueryStringParameter DefaultValue="0" Name="ID" QueryStringField="ID" Type="Int32" />
                            </SelectParameters>
                             
                            <UpdateParameters>
                                 <asp:Parameter Name="Code" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="Location" Type="String" />
                                <asp:Parameter Name="Responsible" Type="String" />
                            </UpdateParameters>
                        </asp:SqlDataSource>

                        <asp:HyperLink ID="lnkAccount" href="Project.aspx" runat="server">
                            Back To List
                        </asp:HyperLink>

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

