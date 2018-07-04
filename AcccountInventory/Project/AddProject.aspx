<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProject.aspx.cs" Inherits="AcccountInventory.AddProject" %>


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
    <title>Add Project</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" runat="server" href="~/assets/css/main.css" />
</head>
<body class="is-preload">

    <!-- Wrapper -->
    <div id="wrapper">

        <!-- Main -->
        <div id="main">
            <div class="inner">
                <uc1:header runat="server" id="header" />

                <form id="form1" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <section>
                        <header class="major">
                            <h2>Add New Project</h2>
                        </header>
                        
                        <asp:Label ID="lblError" runat="server" Text="" ForeColor="Red"> </asp:Label>
                      
                        
                        <asp:Label ID="lblSuccessMessage" runat="server" Text="" CssClass="alert alert-success"> </asp:Label>
                      
                          <asp:FormView ID="FormView1" runat="server" DefaultMode="Insert"
                            DataKeyNames="ID" DataSourceID="SqlDataSource1">

                            <InsertItemTemplate>

                                <div class="col-md-6">
                                    <div class="col-md-2">
                                        Code:
                                 <asp:TextBox ID="CodeTextBox" OnTextChanged="CodeTextBox_TextChanged" AutoPostBack="true" 
                                     style="width: 10%;" MaxLength="2" runat="server" Text='<%# Bind("Code") %>' />
                                        <asp:RequiredFieldValidator ID="reqCode" runat="server" ForeColor="Red" ValidationGroup="insert" Display="Dynamic" ControlToValidate="CodeTextBox" ErrorMessage="Required"></asp:RequiredFieldValidator>
                                    </div>




                                    <div class="col-md-2">
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
                                <asp:LinkButton ID="InsertButton" CssClass="btn btn-success" ValidationGroup="insert" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" CssClass="btn btn-default" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
                                <br />

                            </InsertItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                            InsertCommand="INSERT INTO [Project] ([Code], [Description], [Location], [Responsible], [Block]) 
      VALUES (@Code, @Description, @Location, @Responsible,'true')"
                            OnInserted="Project_Inserted">

                            <InsertParameters>

                                <asp:Parameter Name="Code" Type="String" />
                                <asp:Parameter Name="Description" Type="String" />
                                <asp:Parameter Name="Location" Type="String" />
                                <asp:Parameter Name="Responsible" Type="String" />
                            </InsertParameters>
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
    <uc1:scipts runat="server" id="scipts" />
</body>
</html>

