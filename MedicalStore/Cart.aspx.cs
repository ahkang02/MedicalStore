using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class Cart : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }


        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Payment.aspx");
        }
        
        protected void RemoveRecord_Click(object sender, EventArgs e)
        {
            // Get the ID of the record to remove from the button's CommandArgument property
            int recordId = int.Parse((sender as LinkButton).CommandArgument);


            // Refresh the page to show the updated data
            Response.Redirect(Request.RawUrl);
        }
    }
}
