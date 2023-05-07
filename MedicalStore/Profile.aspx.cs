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
        string customerid, name, email, gender, contactNumber, address, username;
        protected void Page_Load(object sender, EventArgs e)
        {
            user = (string[])Session["user"];

            if (user != null && user.Length > 0)
            {
                // The array is initialized and contains data
                customerid = user[0];
                name = user[1];
                email = user[2];
                gender = user[3];
                contactNumber = user[4];
                address = user[5];
                username = user[6];

                lblName.Text = name;
                lblUsername.Text = username;
                lblEmail.Text = email;
                lblGender.Text = gender;
                lblAddress.Text = address;
                lblContactNo.Text = contactNumber;
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