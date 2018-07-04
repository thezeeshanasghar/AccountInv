﻿using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory
{
    public partial class AddConfig : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Config_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            lblSuccessMessage.Text = "Your config has been successfully created";
            lblSuccessMessage.ForeColor = Color.Green;
            lblSuccessMessage.Visible = true;

        }
    }
}