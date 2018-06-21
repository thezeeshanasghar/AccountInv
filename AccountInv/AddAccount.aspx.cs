using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AccountInv
{
    public partial class AddAccount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void FormView1_ItemCommand(object sender, FormViewCommandEventArgs e)
        {
            switch (e.CommandName)
            {
                //case "EditInfo":
                //  FormView1.ChangeMode(FormViewMode.Edit);
                //  break;
                //case "UpdateInfo":
                //    UpdateClub();
                //    FormView1.ChangeMode(FormViewMode.ReadOnly);
                //    gvClubList.DataSource = ClubList.dt;
                //    gvClubList.DataBind();
                //    break; 
                case "SubmitInfo":
                    Insert();
                    //FormView1.ChangeMode(FormViewMode.ReadOnly);
                    //gvClubList.DataSource = ClubList.dt;
                    //gvClubList.DataBind();
                    break;
                //case "CancelUpdate":
                //    FormView1.ChangeMode(FormViewMode.ReadOnly);
                //    break;
                case "Cancel":
                    AccountFromView.ChangeMode(FormViewMode.ReadOnly);
                    break;
                default:
                    break;
            }
            // FOR THE MODE TO CHANGE CALL DATA BIND.
            AccountFromView.DataBind();
        }
        public void Insert()
        {

        }
    }
}