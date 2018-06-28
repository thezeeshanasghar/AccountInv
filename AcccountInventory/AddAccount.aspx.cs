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

        protected void DebitTextBox_TextChanged(object sender, EventArgs e)
        {
            FormViewRow row = FormView1.Row;

            // Retrieve the ProductNameLabel control from
            // the data row.
            TextBox debit = (TextBox)row.FindControl("DebitTextBox");
            TextBox creidt = (TextBox)row.FindControl("CreditTextBox");
            if (debit.Text == "1")
            {
                creidt.Text = "0";
            }
        }

        protected void CreditTextBox_TextChanged(object sender, EventArgs e)
        {
            FormViewRow row = FormView1.Row;
            TextBox debit = (TextBox)row.FindControl("DebitTextBox");
            TextBox creidt = (TextBox)row.FindControl("CreditTextBox");
            if (creidt.Text == "1")
            {
                debit.Text = "0";
            }
        }

        protected void ddType_SelectedIndexChanged(object sender, EventArgs e)
        {
            FormViewRow row = FormView1.Row;
            DropDownList selected = (DropDownList)row.FindControl("ddType");
            TextBox address = (TextBox)row.FindControl("AddressTextBox");
            TextBox phone = (TextBox)row.FindControl("PhoneTextBox");
            TextBox email = (TextBox)row.FindControl("EmailTextBox");
            
            string type = selected.SelectedItem.Value;
            if (type == "H-1" || type == "H-2")
            {
                address.Enabled = false;
                phone.Enabled = false;
                email.Enabled = false;
                address.BackColor = Color.FromName("#d6d1cb");
                phone.BackColor = Color.FromName("#d6d1cb");
                email.BackColor = Color.FromName("#d6d1cb");
            }
            else
            {
                address.Enabled = true;
                phone.Enabled = true;
                email.Enabled = true;
            }
        }
    }
}