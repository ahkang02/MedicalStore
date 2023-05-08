using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore.Admin
{
    public partial class OrdersTracking : System.Web.UI.Page
    {
        SqlConnection conn;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Staffs"] != null || Session["Manager"] != null || Session["Admin"] != null)
            {
                repeatUser.DataSource = SqlDataSource1;
                repeatUser.DataBind();
            }
            else
            {
                Response.Redirect("../Login.aspx");
            }

        }

        protected void repeatUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string deliveryID = e.CommandArgument.ToString();
            string deliveryStatus = string.Empty;
            string date = string.Empty;
            double fee = 0;
            string recipientName = string.Empty;
            string deliveryAddress = string.Empty;
            string deliveryContact = string.Empty;
            string deliveryBoy = string.Empty;

            switch(e.CommandName)
            {
                case "Update":
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowEditModal", "showEditModal();", true);
                    conn = new SqlConnection(strCon);
                    conn.Open();

                    string strSelect = "SELECT D.DeliveryID, D.Status, D.Date, D.Fee, D.Name, D.Address, D.ContactNumber, S.Name " +
                        "FROM Deliveries D, Orders O, Staffs S " +
                        "Where O.DeliveryID = D.DeliveryID AND D.StaffID = S.StaffID AND D.DeliveryID = @DeliveryID";

                    SqlCommand cmd = new SqlCommand(strSelect, conn);
                    cmd.Parameters.AddWithValue("@DeliveryID", deliveryID);
                    SqlDataReader dr = cmd.ExecuteReader();

                    while(dr.Read())
                    {
                        deliveryStatus = dr.GetString(1);
                        date = dr.GetDateTime(2).ToString("dd/MM/yyyy");
                        fee = dr.GetDouble(3);
                        recipientName = dr.GetString(4);
                        deliveryAddress = dr.GetString(5);
                        deliveryContact = dr.GetString(6);
                        deliveryBoy = dr.GetString(7);
                        hdfID.Value = dr.GetString(0);
                    }

                    txtID.Text = deliveryID;
                    ddlStatusEdit.SelectedValue = deliveryStatus.Trim();
                    txtDate.Text = date;
                    txtFee.Text = fee.ToString();
                    txtName.Text = recipientName;
                    txtAddress.Text = deliveryAddress;
                    txtContact.Text = deliveryContact;
                    txtStaffName.Text = deliveryBoy;

                    conn.Close();

                    break;

                default:
                    break;
            }

        }

        protected void btnSubmitEdit_Click(object sender, EventArgs e)
        {
            string deliveryID = hdfID.Value.ToString();
            string deliveryStatus = ddlStatusEdit.SelectedValue;

            conn = new SqlConnection(strCon);
            conn.Open();

            string strUpdate = "UPDATE DELIVERIES SET STATUS = @STATUS WHERE DELIVERYID = @ID";
            SqlCommand command = new SqlCommand(strUpdate, conn);
            command.Parameters.AddWithValue("@Status", deliveryStatus);
            command.Parameters.AddWithValue("@ID", deliveryID);
            int n = command.ExecuteNonQuery(); 

            if(n > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Delivery Status Updated Successfully.');", true);
            }else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Update with errors');", true);
            }

        }
    }
}