using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class Profile : System.Web.UI.Page
    {
        string[] user;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (string[])Session["user"];

            if (user != null && user.Length > 0)
            {
                // The array is initialized and contains data
                lblName.Text = user[1];
                lblEmail.Text = user[2];
                lblGender.Text = user[3];
                lblContactNo.Text = user[4];
                lblAddress.Text = user[5];
                lblUsername.Text = user[6];
            }
            else
            {
                Response.Redirect("Login.aspx");
                // The array is not initialized or does not contain data
            }


        }

        protected void editBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditProfile.aspx");
        }

        protected void lbProfile_Click(object sender, EventArgs e)
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