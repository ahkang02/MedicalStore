using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore.Admin
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (this.Session["Staffs"] != null)
            {
                lblUser.Text = "Staff";
            }else if (this.Session["Managers"] != null)
            {
                lblUser.Text = "Manager";
            }else if (this.Session["Admin"] != null)
            {
                lblUser.Text = "Admin";
            }
        }

        protected void btnLogout_click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("../Login.aspx");
            // Remove a specific session variable
        }
    }
}