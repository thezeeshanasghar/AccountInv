using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory
{
    public partial class Accounts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void accountGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string lblActiveValue = ((Label)e.Row.FindControl("lblActive")).Text;
                if(lblActiveValue == "False")
                {
                    e.Row.BackColor = Color.FromName("#ffc266");
                  //  e.Row.ForeColor = Color.White;
                }
            }

        }
    }
}