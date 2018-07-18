﻿using System;
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
            if (ddPA.SelectedValue != "")
            {
                lblDateError.Visible = false;
                //insert in transparent
                DateTime pDate = Convert.ToDateTime(txtDate.Text);
                int pAccountId = Convert.ToInt32(ddPA.SelectedValue);
                string description = txtDescription.Text;
                string ref1 = txtRefNumber1.Text;
                string ref2 = txtRefNumber2.Text;
                string connectionString = ConfigurationManager.ConnectionStrings["AccountConnectionString"].ToString();
                SqlConnection con = new SqlConnection(connectionString);
                con.Open();
                string query = "INSERT INTO TransParent(Date,AccountID,Description,Ref1,Ref2)"
                    + "VALUES('" + pDate + "'," + pAccountId + ",'" + description + "','" + ref1 + "','" + ref2 + "'); SELECT CAST(SCOPE_IDENTITY() AS int)";
                SqlCommand cmd = new SqlCommand(query, con);
                int transParentId = (int)cmd.ExecuteScalar();

                if (transParentId > 0)
                {


                    for (int i = 1; i <= 5; i++)
                    {
                        DropDownList ddl = (DropDownList)Page.Form.FindControl("ddtr" + i);
                        if (ddl.SelectedValue != "")
                        {

                            TextBox txtDescriptiontr = (TextBox)Page.Form.FindControl("txtDescriptiontr_" + i);
                            TextBox txtDebitTr = (TextBox)Page.Form.FindControl("txtDebittr_" + i);
                            TextBox txtCreditTr = (TextBox)Page.Form.FindControl("txtCredittr_" + i);

                            int accountId = Convert.ToInt32(ddl.SelectedValue);
                            string desc = Convert.ToString(txtDescriptiontr.Text);
                            int debit = Convert.ToInt32(txtDebitTr.Text);
                            int credit = Convert.ToInt32(txtCreditTr.Text);

                            //insert in transchild
                            string q = "INSERT INTO TransChild(TransParentID,AccountID,Description,Debit,Credit)"
                              + "VALUES(" + transParentId + "," + accountId + ",'" + desc + "'," + debit + "," + credit + ")";
                            SqlCommand cmd1 = new SqlCommand(q, con);
                            cmd1.ExecuteNonQuery();
                        }
                        if (i == 5)
                            lblDateError.Text = "Your transaction is saved successfully";
                        lblDateError.ForeColor = Color.Green;
                        lblDateError.Visible = true;
                    }
                    if (con.State == System.Data.ConnectionState.Open)
                        con.Close();
                }
            }
            else
            {
                lblDateError.Text = "Please select account holder first";
                lblDateError.ForeColor = Color.Red;
                lblDateError.Visible = true;
            }

        }

        protected void txtDebittr_1_TextChanged(object sender, EventArgs e)
        {
            int totalDebit = 0;
            int totalCredit = 0;
            for (int i = 1; i <= 5; i++)
            {
                DropDownList ddPA = (DropDownList)Page.Form.FindControl("ddtr" + i);
                if (ddPA.SelectedValue != "")
                {

                    TextBox txtDebitTr = (TextBox)Page.Form.FindControl("txtDebittr_" + i);
                    TextBox txtCreditTr = (TextBox)Page.Form.FindControl("txtCredittr_" + i);
                    int debit = txtDebitTr.Text != "" ? Convert.ToInt32(txtDebitTr.Text) : 0;
                    int credit = txtCreditTr.Text != "" ? Convert.ToInt32(txtCreditTr.Text) : 0;

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