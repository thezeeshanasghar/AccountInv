using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory
{
    public partial class UpdateConfig : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
        }

      

        protected void EndDateTextBox_TextChanged(object sender, EventArgs e)
        {
            FormViewRow row = FormView1.Row;
            TextBox StartDate = (TextBox)row.FindControl("StartDateTextBox");
            TextBox EndDate = (TextBox)row.FindControl("EndDateTextBox");
            LinkButton Updatebtn = (LinkButton)row.FindControl("UpdateButton");
            if (Convert.ToDateTime(StartDate.Text) > Convert.ToDateTime(EndDate.Text))
            {
                lblerror.Text = "End date must be greater then start date";

                Updatebtn.Enabled = false;
            }
            else
            {
                Updatebtn.Enabled = true;
                lblerror.Text = "";
            }
        }
    }
}