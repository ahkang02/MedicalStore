using System;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Net;
using System.Xml.Linq;
using System.Collections.Generic;

namespace MedicalStore
{
    public partial class PaymentSimulator : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Retrieve the payment details from the session
                string paymentID = Session["PaymentID"] as string;
                string paymentMethod = Session["PaymentMethod"] as string;
                decimal paymentAmount = Convert.ToDecimal(Session["PaymentAmount"]);
                DateTime paymentDateTime = Convert.ToDateTime(Session["PaymentDateTime"]);

                // Display the values
                lblPaymentID.Text = paymentID;
                lblPaymentMethod.Text = paymentMethod;
                lblPaymentAmount.Text = paymentAmount.ToString("0.00");
                lblPaymentDateTime.Text = paymentDateTime.ToString();

            }
        }

        protected void btnSuccess_Click(object sender, EventArgs e)
        {
            // Retrieve the payment details from the session
            string paymentID = Session["PaymentID"] as string;
            string paymentMethod = Session["PaymentMethod"] as string;
            decimal paymentAmount = Convert.ToDecimal(Session["PaymentAmount"]);
            DateTime paymentDateTime = Convert.ToDateTime(Session["PaymentDateTime"]);

            string deliveryID = GenerateNewDeliveryID();
            string deliveryStatus = "Preparing";
            DateTime date = DateTime.Now;
            DateTime deliveryDate = date.Date;
            float deliveryFee = 5;
            string deliveryName = Session["DeliveryName"] as string;
            string deliveryAddress = Session["DeliveryAddress"] as string;
            string deliveryPhoneNo = Session["DeliveryPhoneNo"] as string;
            string staffID = GetRandomStaffID();

            string orderID = GenerateNewOrderID();
            DateTime orderDate = date.Date;
            string orderStatus = "Preparing";
            string[] user = Session["user"] as string[];

            if (user != null)
            {
                string customerId = user[0];
                string customerName = user[1];
                string email = user[2];
                string gender = user[3];
                string contactNumber = user[4];
                string address = user[5];
                string username = user[6];

                // Save the payment details to the database
                SavePaymentToDatabase(paymentID, paymentMethod, paymentAmount, paymentDateTime);
                SaveDeliveryToDatabase(deliveryID, deliveryStatus, deliveryDate, deliveryFee, deliveryName, deliveryAddress, deliveryPhoneNo, staffID);
                SaveOrderToDatabase(orderID, orderDate, paymentAmount, orderStatus, paymentID, customerId, deliveryID);
            }

            // Redirect to the receipt page
            Response.Redirect("Receipt.aspx");
        }

        protected void btnFailed_Click(object sender, EventArgs e)
        {
            // Redirect to the product page
            Response.Redirect("Product.aspx");
        }

        private void SavePaymentToDatabase(string paymentID, string paymentMethod, decimal paymentAmount, DateTime paymentDateTime)
        {
            try
            {
                // Retrieve the connection string from the web.config file
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create a SQL command to insert a new payment record
                    string query = "INSERT INTO Payment (PaymentID, PaymentMethod, PaymentAmount, PaymentDateTime) VALUES (@PaymentID, @PaymentMethod, @PaymentAmount, @PaymentDateTime)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Set the parameter values
                        command.Parameters.AddWithValue("@PaymentID", paymentID);
                        command.Parameters.AddWithValue("@PaymentMethod", paymentMethod);
                        command.Parameters.AddWithValue("@PaymentAmount", paymentAmount);
                        command.Parameters.AddWithValue("@PaymentDateTime", paymentDateTime);

                        // Open the database connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception or display an error message
                // Logging or displaying a user-friendly error message is recommended
                // For simplicity, this example just throws the exception again
                throw ex;
            }
        }

        private void SaveDeliveryToDatabase(string deliveryID, string status, DateTime date, float fee, string name, string address, string phoneno, string staffID)
        {
            try
            {
                // Retrieve the connection string from the web.config file
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create a SQL command to insert a new delivery record
                    string query = "INSERT INTO Deliveries (DeliveryID, Status, Date, Fee, Name, Address,ContactNumber, StaffID) VALUES (@DeliveryID, @DeliveryStatus, @DeliveryDate, @DeliveryFee, @DeliveryName, @DeliveryAddress, @DeliveryContactNumber, @DeliveryStaffID)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Set the parameter values
                        command.Parameters.AddWithValue("@DeliveryID", deliveryID);
                        command.Parameters.AddWithValue("@DeliveryStatus", status);
                        command.Parameters.AddWithValue("@DeliveryDate", date);
                        command.Parameters.AddWithValue("@DeliveryFee", fee);
                        command.Parameters.AddWithValue("@DeliveryName", name);
                        command.Parameters.AddWithValue("@DeliveryAddress", address);
                        command.Parameters.AddWithValue("@DeliveryContactNumber", phoneno);
                        command.Parameters.AddWithValue("@DeliveryStaffID", staffID);

                        // Open the database connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception or display an error message
                // Logging or displaying a user-friendly error message is recommended
                // For simplicity, this example just throws the exception again
                throw ex;
            }


        }

        // Generate a new delivery ID
        private string GenerateNewDeliveryID()
        {

            // Retrieve the latest delivery ID from the database
            string latestDeliveryID = GetLatestDeliveryIDFromDatabase();

            // Generate the new delivery ID
            int newDeliveryIndex = 1;
            if (!string.IsNullOrEmpty(latestDeliveryID))
            {
                int.TryParse(latestDeliveryID.Substring(1), out newDeliveryIndex);
                newDeliveryIndex++; // Increment the index by 1
            }

            string newDeliveryID = "D" + newDeliveryIndex.ToString("D3"); // Format the index as a 3-digit number with leading zeros


            return newDeliveryID;
        }

        // Retrieve the latest delivery ID from the database
        private string GetLatestDeliveryIDFromDatabase()
        {
            // Assuming you have a connection string defined in your web.config file
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string latestDeliveryID = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 DeliveryID FROM Deliveries ORDER BY DeliveryID DESC";

                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    latestDeliveryID = reader["DeliveryID"].ToString();
                }

                reader.Close();
                connection.Close();
            }

            return latestDeliveryID;
        }
        private string GetRandomStaffID()
        {
            try
            {
                // Retrieve the connection string from the web.config file
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create a SQL command to retrieve all staff IDs from the Staffs table
                    string query = "SELECT StaffID FROM Staffs";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Open the database connection
                        connection.Open();

                        // Execute the command and retrieve the staff IDs
                        SqlDataReader reader = command.ExecuteReader();
                        List<string> staffIDs = new List<string>();
                        while (reader.Read())
                        {
                            string staffID = reader["StaffID"].ToString();
                            staffIDs.Add(staffID);
                        }
                        reader.Close();

                        // Randomly pick one staff ID
                        Random random = new Random();
                        int randomIndex = random.Next(0, staffIDs.Count);
                        string randomStaffID = staffIDs[randomIndex];

                        // Return the randomly picked staff ID
                        return randomStaffID;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception or display an error message
                // Logging or displaying a user-friendly error message is recommended
                // For simplicity, this example just throws the exception again
                throw ex;
            }
        }

        private void SaveOrderToDatabase(string orderID, DateTime orderDate, decimal totalamount, string status, string paymentID, string customerID, string deliveryID)
        {
            try
            {
                // Retrieve the connection string from the web.config file
                string connectionString = WebConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    // Create a SQL command to insert a new order record
                    string query = "INSERT INTO Orders (OrderID, OrderDate, TotalAmount, Status, PaymentID, CustomerID, DeliveryID, RefundID) VALUES (@OrderID, @OrderDate, @OrderTotalAmount, @OrderStatus, @PaymentID, @CustomerID, @DeliveryID, @RefundID)";

                    using (SqlCommand command = new SqlCommand(query, connection))
                    {
                        // Set the parameter values
                        command.Parameters.AddWithValue("@OrderID", orderID);
                        command.Parameters.AddWithValue("@OrderDate", orderDate);
                        command.Parameters.AddWithValue("@OrderTotalAmount", totalamount);
                        command.Parameters.AddWithValue("@OrderStatus", status);
                        command.Parameters.AddWithValue("@PaymentID", paymentID);
                        command.Parameters.AddWithValue("@CustomerID", customerID);
                        command.Parameters.AddWithValue("@DeliveryID", deliveryID);
                        command.Parameters.AddWithValue("@RefundID", DBNull.Value);

                        // Open the database connection and execute the command
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception or display an error message
                // Logging or displaying a user-friendly error message is recommended
                // For simplicity, this example just throws the exception again
                throw ex;
            }


        }

        // Generate a new order ID
        private string GenerateNewOrderID()
        {

            // Retrieve the latest order ID from the database
            string latestOrderID = GetLatestOrderIDFromDatabase();

            // Generate the new order ID
            int newOrderIndex = 1;
            if (!string.IsNullOrEmpty(latestOrderID))
            {
                int.TryParse(latestOrderID.Substring(1), out newOrderIndex);
                newOrderIndex++; // Increment the index by 1
            }

            string newOrderID = "O" + newOrderIndex.ToString("D3"); // Format the index as a 3-digit number with leading zeros


            return newOrderID;
        }

        // Retrieve the latest order ID from the database
        private string GetLatestOrderIDFromDatabase()
        {
            // Assuming you have a connection string defined in your web.config file
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string latestOrderID = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 OrderID FROM Orders ORDER BY OrderID DESC";

                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    latestOrderID = reader["OrderID"].ToString();
                }

                reader.Close();
                connection.Close();
            }

            return latestOrderID;
        }
    }
}
