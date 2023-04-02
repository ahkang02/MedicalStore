using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class EditProfile : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            
        }

        protected void lbProfile_Click2(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void lbOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orders.aspx");
        }

        protected void lbDelivery_Click(object sender, EventArgs e)
        {
            Response.Redirect("Delivery.aspx");
        }
    }
}