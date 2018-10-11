using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory.Transaction.CR
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearchTransaction_Click(object sender, EventArgs e)
        {
            string query = "SELECT crp.*,CONCAT(a.AccountCode, '-', p.Code) AS PACode FROM CRParent crp INNER JOIN "
                            + "Account a  ON crp.AccountID = a.ID INNER JOIN Project p ON a.ProjectCode = p.ID";

            DataTable dt = new DataTable();
            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            if (!string.IsNullOrEmpty(txtSearch.Text.ToString()))
            {
                int searchTerm = Convert.ToInt32(txtSearch.Text);
                query += " where crp.ID=" + searchTerm + "";
            }
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            dt.Load(sdr);
            //bind the grid
            GridView1.DataSourceID = null;
            GridView1.DataSource = dt;
            GridView1.DataBind();
            con.Close();
        }
    }
}