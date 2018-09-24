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
    public partial class Project : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void projectGrid_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {

                string lblblockValue = ((Label)e.Row.FindControl("lblBlock")).Text;
                if (lblblockValue == "False")
                {
                    e.Row.BackColor = Color.FromName("#ffc266");
                    //  e.Row.ForeColor = Color.White;
                }
            }
        }

        protected void chkActive_CheckedChanged(object sender, EventArgs e)
        {
            CheckBox status = (CheckBox)sender;
            GridViewRow row = (GridViewRow)status.NamingContainer;
            int id = Convert.ToInt32(((Label)(row.FindControl("ID"))).Text);
            bool active = status.Checked;
            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "UPDATE PROJECT SET Active = @active Where ID ="+id;
                SqlCommand command = new SqlCommand(query, con);
                command.Parameters.AddWithValue("@active", active);
                con.Open();
                command.ExecuteNonQuery();
                con.Close();
            }
        }
    }
}