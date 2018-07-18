using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
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
            

            // Retrieve the ProductNameLabel control from
            // the data row.
             
            getConfigData();
            
        }
        protected void getConfigData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT * FROM Config";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                FormViewRow row = FormView1.Row;
                TextBox YearStart = (TextBox)row.FindControl("YearStartTextBox");
                YearStart.Text= Convert.ToDateTime(sdr["StartDate"]).ToString("MM/dd/yy");
                
            }
          
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
            DropDownList selected = (DropDownList)row.FindControl("ddType");
            TextBox address = (TextBox)row.FindControl("AddressTextBox");
            TextBox phone = (TextBox)row.FindControl("PhoneTextBox");
            TextBox email = (TextBox)row.FindControl("EmailTextBox");
            if (debit.Text != "0")
            {
                creidt.Text = "0";
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
            }
        }

        protected void CreditTextBox_TextChanged(object sender, EventArgs e)
        {
            FormViewRow row = FormView1.Row;
            TextBox debit = (TextBox)row.FindControl("DebitTextBox");
            TextBox creidt = (TextBox)row.FindControl("CreditTextBox");
            DropDownList selected = (DropDownList)row.FindControl("ddType");
            TextBox address = (TextBox)row.FindControl("AddressTextBox");
            TextBox phone = (TextBox)row.FindControl("PhoneTextBox");
            TextBox email = (TextBox)row.FindControl("EmailTextBox");

            if (creidt.Text != "0")
            {
                debit.Text = "0";
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