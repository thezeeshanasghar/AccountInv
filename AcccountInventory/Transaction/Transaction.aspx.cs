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
            while(sdr.Read())
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
            if(selectedDate.Date < startDate.Date || selectedDate.Date > endDate.Date)
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
            var description = txtDescription;
            var arr = ddSelectedValue.Split('-');
            string projectCode = arr[0];
            string accountCode = arr[1];

            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT * FROM Project where Code='"+projectCode+"'";
            //string g = "SELECT * FROM Project, Account WHERE Project.Code="+projectCode+ "AND Account.AccountCode="+accountCode+"";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {

                description.Text = sdr["Description"].ToString(); 
                particular.Enabled = false;
                description.Enabled = false;
            }
            lblStartDate.Visible = true;
            lblEndDate.Visible = true;
           
        }
    }
}