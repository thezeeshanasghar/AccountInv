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
            if(!IsPostBack)
            {
                lblSuccessMessage.Visible = false;
                lblerror.Visible = false;
            }
        }

      

        protected void EndDateTextBox_TextChanged(object sender, EventArgs e)
        {
            FormViewRow row = FormView1.Row;
            TextBox StartDate = (TextBox)row.FindControl("StartDateTextBox");
            TextBox EndDate = (TextBox)row.FindControl("EndDateTextBox");
            LinkButton Updatebtn = (LinkButton)row.FindControl("UpdateButton");

            DateTime startDate = DateTime.ParseExact(StartDate.Text, "dd/MM/yyyy", null);
            DateTime endDate = DateTime.ParseExact(EndDate.Text, "dd/MM/yyyy", null);

            if (startDate > endDate)
            {
                lblerror.Text = "End date must be greater then start date";
                lblerror.Visible = true;
                Updatebtn.Enabled = false;
            }
            else
            {
                Updatebtn.Enabled = true;
                lblerror.Text = "";

            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            lblSuccessMessage.Text = "Record updated successfully";
            lblSuccessMessage.Visible = true;
        }
    }
}