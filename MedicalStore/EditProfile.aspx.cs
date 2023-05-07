using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace MedicalStore
{
    public partial class EditProfile : System.Web.UI.Page
    {
        string customerid, name, email, address, contact, gender, username, errorString;
        string[] user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                user = (string[])Session["user"];
                customerid = user[0];
                username = user[6];
            }

            if (!IsPostBack)
            {
                if (Session["user"] != null)
                {
                    user = (string[])Session["user"];
                    
                    txtName.Text = user[1];
                    txtEmail.Text = user[2];
                    txtAddress.Text = user[5];
                    txtContact.Text = user[4];
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            name = txtName.Text;
            email = txtEmail.Text;
            address = txtAddress.Text;
            contact = txtContact.Text;
            gender = ddlGender.SelectedItem.Text;
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string sqlUpdate = "update customers set name = @name, email = @email, gender = @gender, contactnumber = @contactnumber, address = @address where customerid = @customerid";
            SqlCommand cmdUpdate = new SqlCommand(sqlUpdate, con);
            cmdUpdate.Parameters.AddWithValue("@name", name);
            cmdUpdate.Parameters.AddWithValue("@email", email);
            cmdUpdate.Parameters.AddWithValue("@gender", gender);
            cmdUpdate.Parameters.AddWithValue("@contactnumber", contact);
            cmdUpdate.Parameters.AddWithValue("@address", address);
            cmdUpdate.Parameters.AddWithValue("@customerid", customerid);

            int n = cmdUpdate.ExecuteNonQuery();
            if (n > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Personal Info Updated Successfully.');", true);
                string[] newUser = {customerid, name, email, gender, contact, address, username };
                Session["user"] = newUser;
                
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Failed to update Personal Info.');", true);
            }
            Response.Redirect("Profile.aspx");
            con.Close();
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