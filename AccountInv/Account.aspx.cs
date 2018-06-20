using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AccountInv
{
    public partial class Account : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["Connection"].ToString());
        protected void Page_Load(object sender, EventArgs e)
        {
            AccountInfo();
        }

        public void AccountInfo()
        {
                con.Open();
                string constring = "select * from Account where Active=true";
                SqlCommand cmd = new SqlCommand(constring, con);
                cmd.CommandType = CommandType.Text;


                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                gridaccount.Columns[0].HeaderText = "Phone";
                gridaccount.Columns[1].HeaderText = "Name";
                gridaccount.Columns[2].HeaderText = "Account Type";
                gridaccount.Columns[3].HeaderText = "Address";
                //GridView1.Columns[2].HeaderText = "Date";
                gridaccount.DataSource = ds.Tables[0].DefaultView;
                gridaccount.DataBind();
                con.Close();
           
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            if(Session["Update"] !=null){
             string name=txtname.Text;
            string phone=txtphone.Text;
            string address=txtaddress.Text;
            string accountType=txttype.Text;
                 con.Open();
                int id=Convert.ToInt32(Session["id"]);
                string constring = "update Account set Name="+name+",Phone="+phone+",Type="+accountType+",Address="+address+"  where ID="+id;
                SqlCommand cmd = new SqlCommand(constring, con);
                cmd.CommandType = CommandType.Text;


                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                Session.Abandon();
                con.Close();
            }
            else
            {
            string name=txtname.Text;
            string phone=txtphone.Text;
            string address=txtaddress.Text;
            string accountType=txttype.Text;
           con.Open();
            string conString="insert into Account(Name,Type,Address,Phone,Active) values("+name+","+accountType+","+address+","+phone+",true)";
                SqlCommand cmd = new SqlCommand(conString, con);
                cmd.CommandType = CommandType.Text;
              
                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                int result = cmd.ExecuteNonQuery();
                if (result == 1)
                {
                    lblsuccess.Text="Data added";
                   
                }
                con.Close();
        }
           
        }

     

        protected void btnUpdate_Command(object sender, CommandEventArgs e)
        {
              int id=Convert.ToInt32(e.CommandArgument);
            Session["id"]=id;
               con.Open();
                string constring = "select * from Account where ID="+id;
                SqlCommand cmd = new SqlCommand(constring, con);
                cmd.CommandType = CommandType.Text;


                SqlDataAdapter sda = new SqlDataAdapter(cmd);
              DataTable dt = new DataTable();
                sda.Fill(dt);
             foreach (DataRow dr in dt.Rows)
                {
                 //Data poplate in textboxes after that user can edit and update
                    txtname.Text = dr["Name"].ToString();
                    txttype.Text = dr["Type"].ToString();
                    txtaddress.Text = dr["Address"].ToString();
                    txtphone.Text = dr["Phone"].ToString();
                 


                }
            Session["Update"] =true;
            btnAdd.Text="Update";
            con.Close();
             
        }

        protected void btndelete_Command(object sender, CommandEventArgs e)
        {
                con.Open();
       
                int id=Convert.ToInt32(e.CommandArgument);
                string constring = "update Account set Active=false where ID="+id;
                SqlCommand cmd = new SqlCommand(constring, con);
                cmd.CommandType = CommandType.Text;


                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
         con.Close();
             AccountInfo();
               
             
        }
    }
}