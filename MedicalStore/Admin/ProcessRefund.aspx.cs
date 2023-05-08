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
    public partial class ProcessRefund : System.Web.UI.Page
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
            string refundID = e.CommandArgument.ToString();

            switch (e.CommandName)
            {
                case "Approve":
                    conn = new SqlConnection(strCon);
                    conn.Open();

                    string strUpdate = "UPDATE Refund SET Status = @Status WHERE RefundID = @ID";
                    SqlCommand command = new SqlCommand(strUpdate, conn);
                    command.Parameters.AddWithValue("@Status", "Approve");
                    command.Parameters.AddWithValue("@ID", refundID);
                    int n = command.ExecuteNonQuery();

                    if (n > 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Refund Approved.');", true);
                        Response.Redirect("ProcessRefund.aspx");
                    }
                    else
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Caught an error');", true);
                    }
                    conn.Close();
                    break;

                case "Reject":

                    conn = new SqlConnection(strCon);
                    conn.Open();

                    string strUpdate1 = "UPDATE Refund SET Status = @Status WHERE RefundID = @ID";
                    SqlCommand command1 = new SqlCommand(strUpdate1, conn);
                    command1.Parameters.AddWithValue("@Status", "Rejected");
                    command1.Parameters.AddWithValue("@ID", refundID);
                    int n1 = command1.ExecuteNonQuery();

                    if (n1 > 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Refund Rejected.');", true);
                        Response.Redirect("ProcessRefund.aspx");
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