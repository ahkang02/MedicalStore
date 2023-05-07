using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class Orders : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void lbOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("Orders.aspx");
        }

        protected void lbProfile_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        protected void lbDelivery_Click(object sender, EventArgs e)
        {
            Response.Redirect("Delivery.aspx");
        }
        
         protected void repeaterOrder_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
        protected void btnRefund_Click(object sender, EventArgs e)
        {
            
            Button btnRefund = (Button)sender;
            string orderID = btnRefund.CommandArgument;

            Response.Redirect(string.Format("~/Refund.aspx?OrderID={0}", orderID));


        }
    }
}
