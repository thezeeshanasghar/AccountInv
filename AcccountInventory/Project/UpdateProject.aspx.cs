using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory
{
    public partial class UpdateProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Project_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            lblSuccessMessage.Text = "Data Updated Successfully";
        }
    }
}