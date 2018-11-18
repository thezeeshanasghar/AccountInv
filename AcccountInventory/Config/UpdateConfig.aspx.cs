using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
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
            if (!IsPostBack)
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
  

        protected void FormView1_ItemUpdated(object sender, EventArgs e)
        {
            lblSuccessMessage.Text = "Record updated successfully";
            lblSuccessMessage.Visible = true;
        }

        protected void FormView1_ItemUpdating(object sender, EventArgs e)
        {
            int id = Convert.ToInt32(Request.QueryString["ID"]);
            FormViewRow row = FormView1.Row;
            TextBox StartDate = (TextBox)row.FindControl("StartDateTextBox");
            TextBox EndDate = (TextBox)row.FindControl("EndDateTextBox");
            TextBox companyName = (TextBox)row.FindControl("CompanyNameTextBox");
            TextBox address = (TextBox)row.FindControl("txtAddress");
            TextBox email = (TextBox)row.FindControl("txtEmail");
            TextBox phone = (TextBox)row.FindControl("txtPhone");
            TextBox fax = (TextBox)row.FindControl("txtFax");

            DateTime startDate = DateTime.ParseExact(StartDate.Text, "dd/MM/yyyy", null);
            DateTime endDate = DateTime.ParseExact(EndDate.Text, "dd/MM/yyyy", null);

            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "UPDATE Config SET StartDate ='" + startDate.ToString("yyyy-MM-dd hh:mm:ss")
                + "',EndDate ='" + endDate.ToString("yyyy - MM - dd hh: mm: ss") + "',CompanyName='" + companyName.Text + "',Address ='" + address.Text
                + "',Email ='" + email.Text + "',Phone ='" + phone.Text + "',Fax ='" + fax.Text + "' WHERE ID =" + id;
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}