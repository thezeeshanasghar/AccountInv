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
    public partial class AddProject : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Project_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
          
            lblSuccessMessage.Text = "Your project has been successfully created";
            lblSuccessMessage.ForeColor = Color.Green;
            lblSuccessMessage.Visible = true;
            
        }

        protected void CodeTextBox_TextChanged(object sender, EventArgs e)
        {
            FormViewRow row = FormView1.Row;

            // Retrieve the ProductNameLabel control from
            // the data row.
            TextBox Code = (TextBox)row.FindControl("CodeTextBox");
            LinkButton insertbtn = (LinkButton)row.FindControl("InsertButton");
            string constr = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string qry = "select Code from Project p where p.Code ='" + Code.Text + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                lblError.Text = "Code must be different";
                insertbtn.Enabled = false;


            }
            else
            {
                lblError.Text = "";
                insertbtn.Enabled = true;
               

            }
            con.Close();
        }

    }
}