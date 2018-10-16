using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AcccountInventory.Transaction.CP
{
    public partial class Update : System.Web.UI.Page
    {
        public int cpParentId { get; set; }
        List<int> dbChildIds = new List<int>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                cpParentId = Convert.ToInt32(Request.QueryString["ID"]);
                ViewState["cpParentID"] = cpParentId;
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
                getCPParent(cpParentId);
                getCPChildren(cpParentId);
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
                lblStartDate.Text = Convert.ToDateTime(sdr["StartDate"]).ToString("dd/MM/yy");
                lblEndDate.Text = Convert.ToDateTime(sdr["EndDate"]).ToString("dd/MM/yy");
            }
            lblStartDate.Visible = true;
            lblEndDate.Visible = true;
        }
        protected void getCPParent(int id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT * FROM CPParent WHERE ID=" + id;
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            while (sdr.Read())
            {
                txtDate.Text = Convert.ToDateTime(sdr["Date"]).ToString("dd/MM/yyyy");
                txtDescription.Text = Convert.ToString(sdr["Description"]);
                txtRefNumber1.Text = Convert.ToString(sdr["Ref1"]);
                txtRefNumber2.Text = Convert.ToString(sdr["Ref2"]);
                txtTotalDebit.Text = Convert.ToString(sdr["TotalDebit"]);
                txtTotalCredit.Text = Convert.ToString(sdr["TotalCredit"]);
                txtDifference.Text = Convert.ToString(sdr["Difference"]);
                int accountId = Convert.ToInt32(sdr["AccountID"]);

                SqlConnection con1 = new SqlConnection(connectionString);
                con1.Open();
                string query1 = "SELECT CONCAT(a.AccountCode, '-', p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId, a.Name as Particular"
                                + " FROM  Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode and a.ID =" + accountId;
                SqlCommand cmd1 = new SqlCommand(query1, con1);
                SqlDataReader sdr1 = cmd1.ExecuteReader();
                while (sdr1.Read())
                {
                    ddPA.Items.Add(new ListItem(Convert.ToString(sdr1["PACode"])));
                    ddPA.SelectedValue = Convert.ToString(sdr1["PACode"]);
                    txtParticular.Text = Convert.ToString(sdr1["Particular"]);
                }
            }
            
            txtDate.Enabled = false;
            txtDescription.Enabled = false;
            txtRefNumber1.Enabled = false;
            txtRefNumber2.Enabled = false;
            txtTotalDebit.Enabled = false;
            txtTotalCredit.Enabled = false;
            txtDifference.Enabled = false;
            ddPA.Enabled = false;
            txtParticular.Enabled = false;
        }
        protected void getCPChildren(int cpParentId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT * FROM CPChild WHERE CPParentID=" + cpParentId;
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            int i = 0;
            TableRow[] tableRow = { tr_1, tr_2, tr_3, tr_4, tr_5 };
            if (sdr.HasRows)
                while (sdr.Read())
                {
                    i = Convert.ToInt32(incButton.Text) + 1;
                    //Set child id 
                    ((Literal)FindControl("tr_" + i + "_Id")).Text = Convert.ToString(sdr["ID"]);
                    dbChildIds.Add(Convert.ToInt32(sdr["ID"]));
                    int accountId = Convert.ToInt32(sdr["AccountID"]);
                    ((TextBox)FindControl("txtDescriptiontr_" + i)).Text = Convert.ToString(sdr["Description"]);
                    ((TextBox)FindControl("txtDebittr_" + i)).Text = Convert.ToString(sdr["Debit"]);
                    ((TextBox)FindControl("txtCredittr_" + i)).Text = Convert.ToString(sdr["Credit"]);
                    tableRow[i - 1].Visible = true;
                    incButton.Text = i.ToString();
                    //Set values in child dropdowns
                    SqlConnection con1 = new SqlConnection(connectionString);
                    con1.Open();
                    string query1 = "SELECT CONCAT(a.AccountCode, '-', p.Code) AS PACode, p.ID AS ProjectId, a.ID AS AccountId, a.Name as Particular"
                                    + " FROM  Project AS p INNER JOIN Account AS a ON p.ID = a.ProjectCode and a.ID =" + accountId;
                    SqlCommand cmd1 = new SqlCommand(query1, con1);
                    SqlDataReader sdr1 = cmd1.ExecuteReader();
                    while (sdr1.Read())
                    {
                        ((DropDownList)FindControl("ddtr" + i)).Items.Add(new ListItem(Convert.ToString(sdr1["PACode"])));
                        ((DropDownList)FindControl("ddtr" + i)).SelectedValue = Convert.ToString(sdr1["PACode"]);
                        ((TextBox)FindControl("txtParticulartr_" + i)).Text = Convert.ToString(sdr1["Particular"]);
                    }
                }
          
            ViewState["dbChildIDs"] = dbChildIds;
        }
        protected void txtDate_TextChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy", null);

            DateTime startDate = DateTime.ParseExact(lblStartDate.Text, "dd/MM/yy", null);
            DateTime endDate = DateTime.ParseExact(lblEndDate.Text, "dd/MM/yy", null);

            if (selectedDate.Date < startDate.Date || selectedDate.Date > endDate.Date)
            {
                lblDateError.Visible = true;
                lblDateError.Text = "Date should lie between fiscal year date";
                lblDateError.ForeColor = Color.Red;
            }
            else
            {
                lblDateError.Visible = false;
            }
        }

        protected void ddProjectCode_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox particular = txtParticular;
            int accountId = Convert.ToInt32(ddPA.SelectedValue);
            setParticular(particular, accountId);
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
            TextBox particular = txtParticulartr_1;
            int accountId = Convert.ToInt32(ddtr1.SelectedValue);
            setParticular(particular, accountId);
        }

        protected void ddtr2_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox particular = txtParticulartr_2;
            int accountId = Convert.ToInt32(ddtr2.SelectedValue);
            setParticular(particular, accountId);
        }

        protected void ddtr3_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox particular = txtParticulartr_3;
            int accountId = Convert.ToInt32(ddtr3.SelectedValue);
            setParticular(particular, accountId);
        }

        protected void ddtr4_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox particular = txtParticulartr_4;
            int accountId = Convert.ToInt32(ddtr4.SelectedValue);
            setParticular(particular, accountId);
        }

        protected void ddtr5_SelectedIndexChanged(object sender, EventArgs e)
        {
            TextBox particular = txtParticulartr_5;
            int accountId = Convert.ToInt32(ddtr5.SelectedValue);
            setParticular(particular, accountId);
        }
        protected void setParticular(TextBox selectedParticular, int selectedAccountId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
            SqlConnection con = new SqlConnection(connectionString);
            con.Open();
            string query = "SELECT * FROM Account where ID=" + selectedAccountId + "";
            SqlCommand cmd = new SqlCommand(query, con);
            SqlDataReader sdr = cmd.ExecuteReader();
            if (sdr.HasRows)
                while (sdr.Read())
                {

                    selectedParticular.Text = sdr["Name"].ToString();
                    selectedParticular.Enabled = false;
                }
            else
                selectedParticular.Text = "";
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            //DateTime pDate = DateTime.Now;
            dbChildIds = (List<int>)ViewState["dbChildIDs"];
            cpParentId = (int)ViewState["cpParentID"];
            float tDebit = float.Parse(txtTotalDebit.Text, CultureInfo.InvariantCulture);
            float tCredit = float.Parse(txtTotalCredit.Text, CultureInfo.InvariantCulture);
            float tDifference = float.Parse(txtDifference.Text, CultureInfo.InvariantCulture);
            if(tDifference >= 0 )
            {
                string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();

                for (int i = 1; i <= 5; i++)
                {
                    if (dbChildIds.Count > 0)
                        if (i <= dbChildIds.Count)
                        {

                            int cpChildTrId = Convert.ToInt32(((Literal)FindControl("tr_" + i + "_Id")).Text);
                            if (!dbChildIds.Contains(cpChildTrId))
                                addNewChildren(i, con);
                        }
                        else
                            addNewChildren(i, con);
                    if (i == 5)
                    {
                        lblDateError.Text = "Your transaction with voucher # " + cpParentId + " is updated successfully, see result in <a href='/Transaction/CP/List.aspx'>Transactions</a>";
                        lblDateError.ForeColor = Color.Green;
                        lblDateError.Visible = true;
                        form.Visible = false;
                        //update parent table
                        float totalDebit = float.Parse(txtTotalDebit.Text, CultureInfo.InvariantCulture);
                        float totalCredit = float.Parse(txtTotalCredit.Text, CultureInfo.InvariantCulture);
                        float difference = float.Parse(txtDifference.Text, CultureInfo.InvariantCulture);
                        string qParent = "UPDATE CPParent SET TotalDebit=" + totalDebit + ",TotalCredit="
                            + totalCredit + ",Difference=" + difference + " WHERE ID=" + cpParentId;
                        SqlCommand cmd = new SqlCommand(qParent, con);
                        cmd.ExecuteNonQuery();
                    }
                }
                if (con.State == System.Data.ConnectionState.Open)
                    con.Close();
            }
            else
            {
                lblDateError.Text = "Sum of Debit must be greater than sum of Credit";
                lblDateError.ForeColor = Color.Red;
                lblDateError.Visible = true;
            }
        }

        protected void addNewChildren(int i, SqlConnection con)
        {

            DropDownList ddl = (DropDownList)Page.Form.FindControl("ddtr" + i);
            if (ddl.SelectedValue != "")
            {
                DateTime pDate = DateTime.ParseExact(txtDate.Text, "dd/MM/yyyy", null);
                TextBox txtDescriptiontr = (TextBox)Page.Form.FindControl("txtDescriptiontr_" + i);
                TextBox txtDebitTr = (TextBox)Page.Form.FindControl("txtDebittr_" + i);
                TextBox txtCreditTr = (TextBox)Page.Form.FindControl("txtCredittr_" + i);

                int accountId = Convert.ToInt32(ddl.SelectedValue);
                string desc = Convert.ToString(txtDescriptiontr.Text);
                float debit = float.Parse(txtDebitTr.Text, CultureInfo.InvariantCulture);
                float credit = float.Parse(txtCreditTr.Text, CultureInfo.InvariantCulture);

                //insert in cpChild
                string q = "INSERT INTO CPChild(CPParentID,AccountID,Description,Debit,Credit,Date)"
                  + "VALUES(" + cpParentId + "," + accountId + ",'" + desc + "'," + debit + "," + credit + ",'" + pDate.ToString("yyyy-MM-dd hh:mm:ss") + "')";
                SqlCommand cmd1 = new SqlCommand(q, con);
                cmd1.ExecuteNonQuery();
            }
        }
        protected void txtDebittr_1_TextChanged(object sender, EventArgs e)
        {
            float totalDebit = 0;
            float totalCredit = 0;
            for (int i = 1; i <= 5; i++)
            {
                DropDownList ddPA = (DropDownList)Page.Form.FindControl("ddtr" + i);
                if (ddPA.SelectedValue != "")
                {

                    TextBox txtDebitTr = (TextBox)Page.Form.FindControl("txtDebittr_" + i);
                    TextBox txtCreditTr = (TextBox)Page.Form.FindControl("txtCredittr_" + i);
                    float debit = txtDebitTr.Text != "" ? float.Parse(txtDebitTr.Text, CultureInfo.InstalledUICulture) : 0;
                    float credit = txtCreditTr.Text != "" ? float.Parse(txtCreditTr.Text, CultureInfo.InstalledUICulture) : 0;

                    if (debit > 0)
                    {
                        credit = 0;
                        txtCreditTr.Text = "0";
                    }
                    else if (credit > 0)
                    {
                        debit = 0;
                        txtDebitTr.Text = "0";
                    }
                    totalDebit += debit;
                    totalCredit += credit;
                }
            }
            txtTotalDebit.Text = totalDebit.ToString();
            txtTotalCredit.Text = totalCredit.ToString();
            txtDifference.Text = (totalDebit - totalCredit).ToString();
        }


    }
}