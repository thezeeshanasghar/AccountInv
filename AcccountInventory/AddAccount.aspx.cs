using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory
{
    public partial class AddAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblSuccessMessage.Visible = false;
        }

        protected void AccountInserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            lblSuccessMessage.Text = "Your account has been successfully created";
            lblSuccessMessage.ForeColor = Color.Green;
            lblSuccessMessage.Visible = true;
            
        }
    }
}