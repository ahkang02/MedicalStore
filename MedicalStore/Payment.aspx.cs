using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore
{
    public partial class Payment : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize the session variables
                Session["CustomerName"] = "Joe Dellon";
                Session["PhoneNumber"] = "012-69853624";
                Session["Address"] = "1301, jalan tong song";
                Session["TotalPaymentAmount"] = "1563.60";
                if (Session["TotalPaymentAmount"] != null)
                {
                    decimal totalPaymentAmount = Convert.ToDecimal(Session["TotalPaymentAmount"]);
                    lblTotalPaymentAmount.Text = totalPaymentAmount.ToString("0.00");
                }
            }
        }

        protected void paymentMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            // Set all panel controls to invisible by default
            creditCardPanel.Visible = false;
            fpxPanel.Visible = false;
            eWalletPanel.Visible = false;
            cashOnDeliveryPanel.Visible = false;

            // Set the visible panel control based on the selected payment method
            switch (paymentMethod.SelectedValue)
            {
                case "Credit":
                    creditCardPanel.Visible = true;
                    break;
                case "FPX":
                    fpxPanel.Visible = true;
                    break;
                case "E-Wallet":
                    eWalletPanel.Visible = true;
                    break;
                case "Cash":
                    cashOnDeliveryPanel.Visible = true;
                    break;

            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Assuming you have a connection string defined in your web.config file
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    // Create a SqlCommand to insert the payment details into the database
                    SqlCommand command = new SqlCommand("INSERT INTO Payment (PaymentID, PaymentMethod, PaymentAmount, PaymentDateTime) VALUES (@PaymentID, @PaymentMethod, @PaymentAmount, @PaymentDateTime)", connection);

                    // Retrieve the payment information from the session
                    decimal paymentAmount = Convert.ToDecimal(Session["TotalPaymentAmount"]);
                    string selectedPaymentMethod = paymentMethod.SelectedValue;

                    // Generate a new payment ID
                    string newPaymentID = GenerateNewPaymentID(connection);

                    // Set the parameter values
                    command.Parameters.AddWithValue("@PaymentID", newPaymentID);
                    command.Parameters.AddWithValue("@PaymentMethod", selectedPaymentMethod);
                    command.Parameters.AddWithValue("@PaymentAmount", paymentAmount);
                    command.Parameters.AddWithValue("@PaymentDateTime", DateTime.Now);

                    // Execute the query
                    command.ExecuteNonQuery();

                    // Redirect to the appropriate payment simulator page based on the selected payment method
                    string redirectUrl = "";

                    switch (selectedPaymentMethod)
                    {
                        case "Credit":
                            redirectUrl = $"PaymentSimulator.aspx?paymentMethod=credit&paymentID={newPaymentID}";
                            break;
                        case "FPX":
                            redirectUrl = $"PaymentSimulator.aspx?paymentMethod=fpx&paymentID={newPaymentID}";
                            break;
                        case "E-Wallet":
                            redirectUrl = $"PaymentSimulator.aspx?paymentMethod=ewallet&paymentID={newPaymentID}";
                            break;
                        case "Cash":
                            redirectUrl = $"PaymentSimulator.aspx?paymentMethod=cod&paymentID={newPaymentID}";
                            break;
                    }

                    Response.Redirect(redirectUrl);
                }
                catch (Exception ex)
                {
                    // Handle any exceptions that occur during the database connection or query execution
                    // Display an error message to the user or perform any other necessary actions
                }
            }
        }


        // Generate a new payment ID
        private string GenerateNewPaymentID(SqlConnection connection)
        {
            // Retrieve the latest payment ID from the database
            SqlCommand command = new SqlCommand("SELECT MAX(CAST(RIGHT(PaymentID, LEN(PaymentID) - 1) AS INT)) FROM Payment", connection);
            string latestPaymentID = command.ExecuteScalar()?.ToString();

            // Generate the new payment ID
            int newPaymentIndex = 1;
            if (!string.IsNullOrEmpty(latestPaymentID))
            {
                int.TryParse(latestPaymentID, out int lastIndex);
                newPaymentIndex = lastIndex + 1;
            }

            string newPaymentID = "P" + newPaymentIndex.ToString("D3"); // Format the index as a 3-digit number with leading zeros

            return newPaymentID;
        }



        protected void Page_PreRender(object sender, EventArgs e)
        {
            // Retrieve the customer information from the session
            string customerName = Session["CustomerName"] as string;
            string phoneNumber = Session["PhoneNumber"] as string;
            string address = Session["Address"] as string;


            // Populate the delivery information fields
            txtDeliveryName.Text = customerName;
            txtDeliveryPhone.Text = phoneNumber;
            txtDeliveryAddress.Text = address;

            // Populate the billing information fields
            txtBillingName.Text = customerName;
            txtBillingPhoneNo.Text = phoneNumber;
            txtBillingAddress.Text = address;

        }


    }
}