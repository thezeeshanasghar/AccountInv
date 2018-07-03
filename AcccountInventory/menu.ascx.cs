using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory
{
    public partial class menu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string type = Session["UserType"].ToString();
            if (type == "Admin")
            {
                config.Visible = true;
            }
            else
            {
                config.Visible = false;
            }
        }

       
    }
}