using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class Product : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void addToCartButton_Click(object sender, EventArgs e)
        {

            SqlConnection con2;
            string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con2 = new SqlConnection(strCon2);
            con2.Open();
            string strGetID = "SELECT MAX(SUBSTRING(RefundID, 2, 4)) AS OrderID FROM Orders";
            SqlCommand command2 = new SqlCommand(strGetID, con2);
            string getNextMaxID = (string)command2.ExecuteScalar();
            int ID = Convert.ToInt32(getNextMaxID) + 1;
            string nextID = ID.ToString("000");
            con2.Close();




            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Insert Statement Into DB
            con = new SqlConnection(strCon);

            Button button = (Button)sender;
            string productID = button.CommandArgument;

            float price = float.Parse(button.CommandName);
            //float price = float.Parse(button.CommandName, NumberStyles.Currency, CultureInfo.InvariantCulture);

            string OrderID = "";
            int quantity = 1;
            using (SqlConnection connection = new SqlConnection(strCon))
            {
                connection.Open();

                // Get the maximum refund ID from the Refund table
                string query = "SELECT MAX(CAST(SUBSTRING(OrderID, 2, LEN(OrderID) - 1) AS INT)) FROM Order_Details";
                SqlCommand command = new SqlCommand(query, connection);
                object result = command.ExecuteScalar();

                // Getting the RefundID
                OrderID = 'O' + nextID;

                // Insert the refund data into the Refund table
                query = "INSERT INTO Order_Details (OrderID, ProductID, Quantity, Subtotal) VALUES (@OrderID, @ProductID, @Quantity, @Subtotal)";
                command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@OrderID", OrderID);
                command.Parameters.AddWithValue("@ProductID", productID);
                command.Parameters.AddWithValue("@Quantity", quantity);
                command.Parameters.AddWithValue("@Subtotal", price);
                result = command.ExecuteNonQuery();


            }

            con.Close();

        }


    }
}
