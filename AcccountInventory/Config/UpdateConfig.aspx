<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateConfig.aspx.cs" Inherits="AcccountInventory.UpdateConfig" %>


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
    <title>Update Config</title>
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
                <uc1:header runat="server" ID="header" />

                <form id="form1" runat="server">
                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <section>
                                <header class="major">
                                    <h2>Update Config</h2>
                                </header>

                                <asp:Label ID="lblSuccessMessage" runat="server" Text="" ForeColor="Green" CssClass="alert alert-success"> </asp:Label>
                                <asp:Label ID="lblerror" runat="server" Text="" ForeColor="Red"> </asp:Label>

                                <asp:FormView ID="FormView1" runat="server" DefaultMode="Edit"
                                    DataKeyNames="ID" DataSourceID="SqlDataSource1"
                                    onitemupdating="FormView1_ItemUpdating" OnItemUpdated="FormView1_ItemUpdated"
                                    >

                                    <EditItemTemplate>
                                        <div class="col-md-6">
                                            Start Date:
                                
                                    <asp:TextBox ID="StartDateTextBox" runat="server" OnTextChanged="EndDateTextBox_TextChanged" AutoPostBack="true" 
                                        Text='<%# Bind("StartDate","{0:dd/MM/yyy}") %>' />
                                            <ajaxtool:CalendarExtender ID="Calendar" runat="server" TodaysDateFormat="dd/MM/yyyy"
                                                TargetControlID="StartDateTextBox" Format="dd/MM/yyyy"></ajaxtool:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="reqyearstart" Display="Dynamic"
                                                runat="server" ForeColor="Red" ControlToValidate="StartDateTextBox"
                                                ErrorMessage="Start Date is required"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="col-md-2">
                                            End Date:
                                
                      <asp:TextBox ID="EndDateTextBox" runat="server" OnTextChanged="EndDateTextBox_TextChanged" AutoPostBack="true" Text='<%# Bind("EndDate","{0:dd/MM/yyyy}") %>' />
                                            <ajaxtool:CalendarExtender ID="CalendarExtender1" runat="server" TodaysDateFormat="dd/MM/yyyy"
                                                TargetControlID="EndDateTextBox" Format="dd/MM/yyyy"></ajaxtool:CalendarExtender>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" Display="Dynamic"
                                                runat="server" ForeColor="Red" ControlToValidate="EndDateTextBox"
                                                ErrorMessage="End Date is required"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-2">
                                            Company Name:
                                
                      <asp:TextBox ID="CompanyNameTextBox" runat="server" Text='<%# Bind("CompanyName") %>' />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                ControlToValidate="CompanyNameTextBox" ForeColor="Red"
                                                ErrorMessage="Company name is required"></asp:RequiredFieldValidator>

                                        </div>
                                        <div class="col-md-2">
                                            Address:
                                            <asp:TextBox ID="txtAddress" runat="server" Text='<%# Bind("Address") %>' />
                                        </div>
                                        <div class="col-md-2">
                                            Email:
                                            <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("Email") %>' />
                                        </div>
                                        <div class="col-md-2">
                                            Phone:
                                            <asp:TextBox ID="txtPhone" runat="server" Text='<%# Bind("Phone") %>' />
                                        </div>
                                        <div class="col-md-2">
                                            Fax:
                                            <asp:TextBox ID="txtFax" runat="server" Text='<%# Bind("Fax") %>' />
                                        </div>
                                        <br />
                                        <asp:LinkButton ID="UpdateButton" runat="server" OnClick="FormView1_ItemUpdated"  CausesValidation="True" CommandName="Update" Text="Update" />
                                    </EditItemTemplate>


                                </asp:FormView>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountConnectionString %>"
                                    SelectCommand="SELECT * FROM [Config] WHERE ([ID] = @ID)"
                                    OnUpdated="FormView1_ItemUpdated" OnUpdating="FormView1_ItemUpdating">
                                    
                                    <SelectParameters>
                                        <asp:QueryStringParameter DefaultValue="0" Name="ID" QueryStringField="ID" Type="Int32" />
                                    </SelectParameters>

                                    <UpdateParameters>
                                        <asp:Parameter DbType="Date" Name="StartDate" />
                                        <asp:Parameter DbType="Date" Name="EndDate" />
                                        <asp:Parameter DbType="String" Name="CompanyName" />
                                        <asp:Parameter DbType="String" Name="Address" />
                                        <asp:Parameter DbType="String" Name="Email" />
                                        <asp:Parameter DbType="String" Name="Phone" />
                                        <asp:Parameter DbType="String" Name="Fax" />
                                    </UpdateParameters>
                                </asp:SqlDataSource>

                                <asp:HyperLink ID="lnkAccount" href="Config.aspx" runat="server">
                                        Back To List
                                </asp:HyperLink>

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

