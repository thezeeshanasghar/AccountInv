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
                <li><a href="Home.aspx">Home</a></li>
            
                <li>
                    <span class="opener">Accounts</span>
                    <ul>
                        <li><a href="Accounts.aspx">Account List</a></li>
                        <li><a href="AddAccount.aspx">Add Account</a></li> 
                    </ul>
                </li>
                  <li>
                    <span class="opener">Projects</span>
                    <ul>
                        <li><a href="Project.aspx">Project List</a></li>
                        <li><a href="AddProject.aspx">Add Project</a></li> 
                    </ul>
                </li>
                  <li>
                    <span class="opener">Transactions</span>
                    <ul>
                        <li><a href="Transaction.aspx">Add Transaction</a></li>
                    </ul>
                </li>
                  <li>
                    <span class="opener">Reports</span>
                    <ul>
                        <li><a href="#">Report1</a></li>
                        <li><a href="#">Report1</a></li> 
                    </ul>
                </li>
                  <li>
                    <a href="Login.aspx">Log out</a>
                    
                </li>
            </ul>
        </nav>

         

        <!-- Footer -->
        <footer id="footer">
            <p class="copyright">&copy; Untitled. All rights reserved. Demo Images: <a href="https://unsplash.com">Unsplash</a>. Design: <a href="https://html5up.net">HTML5 UP</a>.</p>
        </footer>

    </div>
</div>
