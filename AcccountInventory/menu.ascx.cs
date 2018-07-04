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
            object type = Session["UserType"];
            if (type != null)
                if (type.ToString().Equals("Admin"))
                    config.Visible = true;
                else
                    config.Visible = false;
        }


    }
}