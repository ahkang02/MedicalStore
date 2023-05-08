using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
	public partial class Delivery : System.Web.UI.Page
	{
        SqlConnection conn;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
		{
            if (Session["user"] != null)
            {
                string[] user = (string[])Session["user"];
                this.Session["customerID"] = user[0];
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
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

        protected void repeaterOrder_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string deliveryID = e.CommandArgument.ToString();
            switch(e.CommandName)
            {
                case "Received":

                    conn = new SqlConnection(strCon);
                    conn.Open();

                    string strUpdate = "Update Deliveries SET Status = @Status Where DeliveryID = @DeliveryID";
                    SqlCommand command = new SqlCommand(strUpdate, conn);
                    command.Parameters.AddWithValue("@Status", "Completed");
                    command.Parameters.AddWithValue("@DeliveryID", deliveryID);

                    int n1 = command.ExecuteNonQuery();

                    if (n1 > 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Order Received.');", true);
                        Response.Redirect("Delivery.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Caught an error');", true);
                    }
                    conn.Close();

                    break;
                default:
                    break;
            }
        }
    }
}