<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddAccount.aspx.cs" Inherits="AccountInv.AddAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Account</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:formview id="AccountFromView"
        datasourceid="SqlDataSource1"
        allowpaging="True"
          OnItemCommand="FormView1_ItemCommand"
        datakeynames="ID"
        emptydatatext="No employees found."  
        runat="server" DefaultMode="Insert">

        <rowstyle backcolor="LightGreen"
          wrap="false"/>
        <insertrowstyle backcolor="LightBlue"
          wrap="false"/>

      <%--  <itemtemplate>
            ID:
            <asp:Label ID="IDLabel" runat="server" Text='<%# Eval("ID") %>' />
            <br />
            Code:
            <asp:Label ID="CodeLabel" runat="server" Text='<%# Bind("Code") %>' />
            <br />
            Name:
            <asp:Label ID="NameLabel" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            AlternateCode:
            <asp:Label ID="AlternateCodeLabel" runat="server" Text='<%# Bind("AlternateCode") %>' />
            <br />
            Type:
            <asp:Label ID="TypeLabel" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Debit:
            <asp:Label ID="DebitLabel" runat="server" Text='<%# Bind("Debit") %>' />
            <br />
            Credit:
            <asp:Label ID="CreditLabel" runat="server" Text='<%# Bind("Credit") %>' />
            <br />
            Address:
            <asp:Label ID="AddressLabel" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            Phone:
            <asp:Label ID="PhoneLabel" runat="server" Text='<%# Bind("Phone") %>' />
            <br />
            Email:
            <asp:Label ID="EmailLabel" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Active:
            <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' Enabled="false" />
            <br />
            YearStart:
            <asp:Label ID="YearStartLabel" runat="server" Text='<%# Bind("YearStart") %>' />
            <br />
            Created:
            <asp:Label ID="CreatedLabel" runat="server" Text='<%# Bind("Created") %>' />
            <br />
        </itemtemplate>
            <EditItemTemplate>
                ID:
                <asp:Label ID="IDLabel1" runat="server" Text='<%# Eval("ID") %>' />
                <br />
                Code:
                <asp:TextBox ID="CodeTextBox" runat="server" Text='<%# Bind("Code") %>' />
                <br />
                Name:
                <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
                <br />
                AlternateCode:
                <asp:TextBox ID="AlternateCodeTextBox" runat="server" Text='<%# Bind("AlternateCode") %>' />
                <br />
                Type:
                <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
                <br />
                Debit:
                <asp:TextBox ID="DebitTextBox" runat="server" Text='<%# Bind("Debit") %>' />
                <br />
                Credit:
                <asp:TextBox ID="CreditTextBox" runat="server" Text='<%# Bind("Credit") %>' />
                <br />
                Address:
                <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
                <br />
                Phone:
                <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
                <br />
                Email:
                <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
                <br />
                Active:
                <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
                <br />
                YearStart:
                <asp:TextBox ID="YearStartTextBox" runat="server" Text='<%# Bind("YearStart") %>' />
                <br />
                Created:
                <asp:TextBox ID="CreatedTextBox" runat="server" Text='<%# Bind("Created") %>' />
                <br />
                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" />
                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
            </EditItemTemplate>--%>
        <insertitemtemplate>
            Code:
            <asp:TextBox ID="CodeTextBox" runat="server" Text='<%# Bind("Code") %>' />
            <br />
            Name:
            <asp:TextBox ID="NameTextBox" runat="server" Text='<%# Bind("Name") %>' />
            <br />
            AlternateCode:
            <asp:TextBox ID="AlternateCodeTextBox" runat="server" Text='<%# Bind("AlternateCode") %>' />
            <br />
            Type:
            <asp:TextBox ID="TypeTextBox" runat="server" Text='<%# Bind("Type") %>' />
            <br />
            Debit:
            <asp:TextBox ID="DebitTextBox" runat="server" Text='<%# Bind("Debit") %>' />
            <br />
            Credit:
            <asp:TextBox ID="CreditTextBox" runat="server" Text='<%# Bind("Credit") %>' />
            <br />
            Address:
            <asp:TextBox ID="AddressTextBox" runat="server" Text='<%# Bind("Address") %>' />
            <br />
            Phone:
            <asp:TextBox ID="PhoneTextBox" runat="server" Text='<%# Bind("Phone") %>' />
            <br />
            Email:
            <asp:TextBox ID="EmailTextBox" runat="server" Text='<%# Bind("Email") %>' />
            <br />
            Active:
            <asp:CheckBox ID="ActiveCheckBox" runat="server" Checked='<%# Bind("Active") %>' />
            <br />
            YearStart:
            <asp:TextBox ID="YearStartTextBox" runat="server" Text='<%# Bind("YearStart") %>' />
            <br />
            Created:
            <asp:TextBox ID="CreatedTextBox" runat="server" Text='<%# Bind("Created") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </insertitemtemplate> 

      </asp:formview>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:AccountInvConnectionString %>" SelectCommand="SELECT * FROM [Account]"></asp:SqlDataSource>

      <!-- This example uses Microsoft SQL Server and connects  -->
      <!-- to the Northwind sample database. Use an ASP.NET     -->
      <!-- expression to retrieve the connection string value   -->
      <!-- from the Web.config file.                            -->
      <asp:sqldatasource id="SqlDataSource2"
        selectcommand="SELECT * FROM [Account]"
        connectionstring="<%$ ConnectionStrings:AccountInvConnectionString %>" 
        runat="server"/>
 
    </div>
    </form>
</body>
</html>
