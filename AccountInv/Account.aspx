<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Account.aspx.cs" Inherits="AccountInv.Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblphone" runat="server" Text="Phone"></asp:Label>
    <asp:TextBox ID="txtphone" runat="server"></asp:TextBox>
     <asp:Label ID="lblname" runat="server" Text="Name"></asp:Label>
    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
     <asp:Label ID="lbltype" runat="server" Text="Account type"></asp:Label>
    <asp:TextBox ID="txttype" runat="server"></asp:TextBox>
    <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
    <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
    <br />
    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add" />
    <asp:Label ID="lblsuccess" ForeColor="Green" runat="server" Text=""></asp:Label>
    <asp:GridView ID="gridaccount" runat="server" AutoGenerateColumns="false" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lblphone" runat="server" Text='<%#Eval("Phone") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
                 <asp:TemplateField>
                <ItemTemplate>
                       <asp:Label ID="lblname" runat="server" Text='<%#Eval("Name") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Label ID="lblaccountType" runat="server" Text='<%#Eval("Type") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
              <asp:TemplateField>
                <ItemTemplate>
                      <asp:Label ID="lbladdress" runat="server" Text='<%#Eval("Address") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button ID="btnUpdate" OnCommand="btnUpdate_Command" CommandArgument='<%#Eval("ID") %>' runat="server" Text="Update" />
                    
                </ItemTemplate>
            </asp:TemplateField>
             <asp:TemplateField>
                <ItemTemplate>
                <asp:Button ID="btndelete" OnCommand="btndelete_Command" CommandArgument='<%#Eval("ID") %>' runat="server" Text="Delete" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>
</asp:Content>
