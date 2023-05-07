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
    public partial class Return : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

      protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con2;
            string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con2 = new SqlConnection(strCon2);
            con2.Open();
            string strGetID = "SELECT MAX(SUBSTRING(RefundID, 2, 4)) AS RefundID FROM Refund";
            SqlCommand command2 = new SqlCommand(strGetID, con2);
            string getNextMaxID = (string)command2.ExecuteScalar();
            int ID = Convert.ToInt32(getNextMaxID) + 1;
            string nextID = ID.ToString("000");
            con2.Close();

           


            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Insert Statement Into DB
            con = new SqlConnection(strCon);


            //string orderID = orderNo.Text;
            string refundReason = ddlRefund.SelectedValue;
            string refundID = "";
            string status = "In-progress";
            using (SqlConnection connection = new SqlConnection(strCon))
            {
                connection.Open();

                // Get the maximum refund ID from the Refund table
                string query = "SELECT MAX(CAST(SUBSTRING(RefundID, 2, LEN(RefundID) - 1) AS INT)) FROM Refund";
                SqlCommand command = new SqlCommand(query, connection);
                object result = command.ExecuteScalar();

                // Getting the RefundID
                refundID = 'R' + nextID;

                // Insert the refund data into the Refund table
                query = "INSERT INTO Refund (RefundID, Status, Reason, OrderID) VALUES (@RefundID, @Status, @Reason, @OrderID)";
                command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@RefundID", refundID);
                command.Parameters.AddWithValue("@Status", status);
                command.Parameters.AddWithValue("@Reason", refundReason);
                //command.Parameters.AddWithValue("@OrderID", orderID);
                result = command.ExecuteNonQuery();

                Response.Redirect("~/Orders.aspx");

            }

            con.Close();

        }

    }
}
