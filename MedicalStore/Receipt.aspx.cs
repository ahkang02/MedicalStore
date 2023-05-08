using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class Receipt : System.Web.UI.Page
    {
        string getPaymentID;
        string getDeliveryID;
        decimal subtotal;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the payment details from the session
                string orderID = Session["OrderID"] as string;

                DisplayOrderData(orderID);
                DisplayPaymentData(getPaymentID);
                DisplayDeliveryData(getDeliveryID);

                CalculateSubtotal();
                lblSubtotal.Text = subtotal.ToString("0.00");

            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Homepage.aspx");
        }

        private void DisplayOrderData(string selectedOrderID)
        {
            // Define the connection string
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Define the SQL query
                string query = "SELECT OrderID, OrderDate, TotalAmount, PaymentID, DeliveryID FROM Orders WHERE OrderID = @SelectedOrderID";

                // Create a SqlCommand object
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@SelectedOrderID", selectedOrderID);

                // Open the connection
                connection.Open();

                // Execute the query and get a SqlDataReader
                SqlDataReader reader = command.ExecuteReader();

                // Check if there are any rows returned
                if (reader.HasRows)
                {
                    // Read the first row
                    reader.Read();

                    // Retrieve the data from the reader
                    decimal totalAmount = Convert.ToDecimal(reader["TotalAmount"]);
                    DateTime orderDate = reader.GetDateTime(reader.GetOrdinal("OrderDate"));
                    string formattedOrderDate = orderDate.ToString("yyyy-MM-dd");
                    getPaymentID = reader["PaymentID"].ToString();
                    getDeliveryID = reader["DeliveryID"].ToString();

                    // Assign the data to the label texts
                    lblOrderID.Text = selectedOrderID;
                    lblOrderDate.Text = formattedOrderDate;
                    lblPaymentAmount.Text = totalAmount.ToString("0.00");

                    // Close the reader
                    reader.Close();
                }

                // Close the connection
                connection.Close();
            }
        }


        private void DisplayPaymentData(string selectedPaymentID)
        {
            // Define the connection string
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Define the SQL query
                string query = "SELECT PaymentMethod FROM Payment WHERE PaymentID = @SelectedPaymentID";

                // Create a SqlCommand object
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@SelectedPaymentID", selectedPaymentID);

                // Open the connection
                connection.Open();

                // Execute the query and get a SqlDataReader
                SqlDataReader reader = command.ExecuteReader();

                // Check if there are any rows returned
                if (reader.HasRows)
                {
                    // Read the first row
                    reader.Read();

                    // Retrieve the data from the reader
                    string paymentMethod = reader["PaymentMethod"].ToString();

                    // Assign the data to the label text
                    lblPaymentMethod.Text = paymentMethod;

                    // Close the reader
                    reader.Close();
                }

                // Close the connection
                connection.Close();
            }
        }

        private void DisplayDeliveryData(string selectedDeliveryID)
        {
            // Define the connection string
            string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Define the SQL query
                string query = "SELECT Fee, Name, Address, ContactNumber FROM Deliveries WHERE DeliveryID = @SelectedDeliveryID";

                // Create a SqlCommand object
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@SelectedDeliveryID", selectedDeliveryID);

                // Open the connection
                connection.Open();

                // Execute the query and get a SqlDataReader
                SqlDataReader reader = command.ExecuteReader();

                // Check if there are any rows returned
                if (reader.HasRows)
                {
                    // Read the first row
                    reader.Read();

                    // Retrieve the data from the reader
                    decimal deliveryFee = Convert.ToDecimal(reader["Fee"]);
                    string deliveryName = reader["Name"].ToString();
                    string deliveryAddress = reader["Address"].ToString();
                    string deliveryPhoneNo = reader["ContactNumber"].ToString();

                    // Assign the data to the label text
                    lblDeliveryFee.Text = deliveryFee.ToString("0.00");
                    lblDeliveryName.Text = deliveryName;
                    lblDeliveryAddress.Text = deliveryAddress;
                    lblDeliveryPhoneNo.Text = deliveryPhoneNo;

                    // Close the reader
                    reader.Close();
                }

                // Close the connection
                connection.Close();
            }
        }

        private void CalculateSubtotal()
        {
            // Retrieve the total amount and delivery fee values
            decimal totalAmount = Convert.ToDecimal(lblPaymentAmount.Text);
            decimal deliveryFee = Convert.ToDecimal(lblDeliveryFee.Text);

            // Calculate the subtotal
            subtotal = totalAmount - deliveryFee;
        }


    }
}