using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory
{
    public partial class Transaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                txtDate.Text = DateTime.Now.Date.ToString("MM/dd/yyyy");
                lblStartDate.Visible = false;
                lblEndDate.Visible = false;
                lblDateError.Visible = false;
                tr_1.Visible = false;
                tr_2.Visible = false;
                tr_3.Visible = false;
                tr_4.Visible = false;
                tr_5.Visible = false;
                incButton.Visible = false;
                getConfigData();
            }

        }
        protected void getConfigData()
        {
            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT * FROM Config";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                lblStartDate.Text = Convert.ToDateTime(sdr["StartDate"]).ToString("MM/dd/yy");
                lblEndDate.Text = Convert.ToDateTime(sdr["EndDate"]).ToString("MM/dd/yy");
            }
            lblStartDate.Visible = true;
            lblEndDate.Visible = true;
        }


        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = Convert.ToDateTime(txtDate.Text);
            DateTime startDate = Convert.ToDateTime(lblStartDate.Text);
            DateTime endDate = Convert.ToDateTime(lblEndDate.Text);
            if (selectedDate.Date < startDate.Date || selectedDate.Date > endDate.Date)
            {
                lblDateError.Visible = true;
                lblDateError.Text = "Date should lie between fiscal year date";
                lblDateError.ForeColor = Color.Red;
            }
        }

        protected void ddProjectCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            var ddSelectedValue = ddPA.SelectedValue;
            var particular = txtParticular;
            var arr = ddSelectedValue.Split('-');
            string accountCode = arr[0];
            //string accountCode = arr[1];

            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT * FROM Account where AccountCode='" + accountCode + "'";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
                while (sdr.Read())
                {

                    particular.Text = sdr["Name"].ToString();
                    particular.Enabled = false;
                }
            else
                particular.Text = "";

            lblStartDate.Visible = true;
            lblEndDate.Visible = true;

        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            var i = Convert.ToInt32(incButton.Text) + 1;
            if (i <= 5)
            {
                TableRow[] tableRow = { tr_1, tr_2, tr_3, tr_4, tr_5 };
                tableRow[i - 1].Visible = true;
                incButton.Text = i.ToString();
            }

        }

        protected void ddtr1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddtr2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddtr3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddtr4_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddtr5_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {

        }
    }
}