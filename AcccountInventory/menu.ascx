<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="menu.ascx.cs" Inherits="AcccountInventory.menu" %>

<!-- Sidebar -->
<div id="sidebar">
    <div class="inner">

        <!-- Search -->
        <section id="search" class="alt">
            <form method="post" action="#">
                <input type="text" name="query" id="query" placeholder="Search" />
            </form>
        </section>

        <!-- Menu -->
        <nav id="menu">
            <header class="major">
                <h2>Menu</h2>
            </header>
            <ul>
                <li><a runat="server" href="~/Home.aspx">Home</a></li>

                <li>
                    <span class="opener">Projects</span>
                    <ul>
                        <li><a runat="server" href="~/Project/Project.aspx">Project List</a></li>
                        <li><a runat="server"  href="~/Project/AddProject.aspx">Add Project</a></li>
                    </ul>
                </li>
                <li>
                    <span class="opener">Accounts</span>
                    <ul>
                        <li><a  runat="server" href="~/Account/Accounts.aspx">Account List</a></li>
                        <li><a  runat="server" href="~/Account/AddAccount.aspx">Add Account</a></li>
                    </ul>
                </li>
                <li runat="server" id="config">
                    <span class="opener">Config</span>
                    <ul>
                        <li><a  runat="server" href="~/Config/Config.aspx">Config List</a></li>

                    </ul>
                </li>
                <li>
                    <span class="opener">Transactions</span>
                    <ul>
                        <li><a runat="server"  href="~/Transaction/Transaction.aspx">Add Transaction</a></li>
                    </ul>
                </li>
                <li>
                    <span class="opener">Reports</span>
                    <ul>
                        <li><a  runat="server" href="#">Report1</a></li>
                        <li><a  runat="server" href="#">Report1</a></li>
                    </ul>
                </li>
                <li>
                    <a  runat="server" href="~/Login.aspx">Log out</a>
                </li>
            </ul>
        </nav>



        <!-- Footer -->
        <footer id="footer">
            <p class="copyright">&copy; AFZ-Sol. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
        </footer>

    </div>
</div>
