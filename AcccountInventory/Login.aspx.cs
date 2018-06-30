using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Confirmlogin(object sender, SqlDataSourceStatusEventArgs e)
        {

        }

        protected void loginButton_Click(object sender, EventArgs e)
        {

            string email = EmailTextBox.Text;
            Session["email"] = email;
            string password = Passwordtextbox.Text;
            string constr = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(constr);
            con.Open();

            string qry = "select * from Login where Email='" + email + "' and Password='" + password + "'";
            SqlCommand cmd = new SqlCommand(qry, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.Read())
            {
                Response.Redirect("Home.aspx");
            }
            else
            {
                lblError.Text = "Email or Password Incorrect";

            }
            con.Close();
        }

    }
}
