using System;
using System.Collections;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace MedicalStore
{
    public partial class Payment : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Initialize the session variables
                Session["TotalPaymentAmount"] = "1505.00";
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
            switch (paymentMethod.SelectedValue.ToString())
            {
                case "Credit Card":
                    creditCardPanel.Visible = true;
                    break;
                case "FPX":
                    fpxPanel.Visible = true;
                    break;
                case "E-Wallet":
                    eWalletPanel.Visible = true;
                    break;
                case "Cash On Delivery":
                    cashOnDeliveryPanel.Visible = true;
                    break;

            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // Check if the required fields are empty
            if (string.IsNullOrEmpty(txtDeliveryName.Text) ||
                string.IsNullOrEmpty(txtDeliveryPhone.Text) ||
                string.IsNullOrEmpty(txtDeliveryAddress.Text) ||
                string.IsNullOrEmpty(txtDeliveryCity.Text) ||
                string.IsNullOrEmpty(txtDeliveryPostCode.Text) ||
                string.IsNullOrEmpty(txtBillingName.Text) ||
                string.IsNullOrEmpty(txtBillingPhoneNo.Text) ||
                string.IsNullOrEmpty(txtBillingAddress.Text) ||
                string.IsNullOrEmpty(txtBillingCity.Text) ||
                string.IsNullOrEmpty(txtBillingPostCode.Text))
            {
                // Display an error message
                lblErrorMessage.Text = "Please fill in all the required fields.";
                lblErrorMessage.Visible = true;
                return;
            }

            if (paymentMethod.SelectedValue == "Credit Card")
            {
                // Credit card number validation (16 digits)
                string creditCardNumber = txtBillingCardNum.Text.Trim();
                if (!Regex.IsMatch(creditCardNumber, @"^\d{16}$"))
                {
                    // Display an error message
                    lblErrorMessage.Text = "Please enter a valid 16-digit credit card number.";
                    lblErrorMessage.Visible = true;
                    return;
                }

                // Expiry date validation (MM/YY format)
                string expiryDate = txtBillingExpiry.Text.Trim();
                if (!Regex.IsMatch(expiryDate, @"^(0[1-9]|1[0-2])\/\d{2}$"))
                {
                    // Display an error message
                    lblErrorMessage.Text = "Please enter a valid expiry date in the MM/YY format.";
                    lblErrorMessage.Visible = true;
                    return;
                }

                // CVV validation (3 or 4 digits)
                string cvv = txtBillingCvv.Text.Trim();
                if (!Regex.IsMatch(cvv, @"^\d{3}$"))
                {
                    // Display an error message
                    lblErrorMessage.Text = "Please enter a valid 3 digit CVV.";
                    lblErrorMessage.Visible = true;
                    return;
                }
            }


            // Retrieve the payment information from the session
            decimal paymentAmount = Convert.ToDecimal(Session["TotalPaymentAmount"]);
            string selectedPaymentMethod = paymentMethod.SelectedValue;

            // Generate a new payment ID
            string newPaymentID = GenerateNewPaymentID();

            // Store the payment details in individual session variables
            Session["PaymentID"] = newPaymentID;
            Session["PaymentMethod"] = selectedPaymentMethod;
            Session["PaymentAmount"] = paymentAmount;
            Session["PaymentDateTime"] = DateTime.Now;

            Session["DeliveryName"] = txtDeliveryName.Text;
            Session["DeliveryPhoneNo"] = txtDeliveryPhone.Text;
            Session["DeliveryAddress"] = $"{txtDeliveryAddress.Text} {txtDeliveryCity.Text} {txtDeliveryPostCode.Text}";


           

            // Redirect to the appropriate payment simulator page based on the selected payment method
            string redirectUrl = "";

            switch (selectedPaymentMethod.ToString())
            {
                case "Credit Card":
                    redirectUrl = $"PaymentSimulator.aspx?paymentMethod=creditcard";
                    break;
                case "FPX":
                    redirectUrl = $"PaymentSimulator.aspx?paymentMethod=fpx";
                    break;
                case "E-Wallet":
                    redirectUrl = $"PaymentSimulator.aspx?paymentMethod=ewallet";
                    break;
                case "Cash On Delivery":
                    redirectUrl = $"PaymentSimulator.aspx?paymentMethod=cod";
                    break;
            }

            Response.Redirect(redirectUrl);
        }



        // Generate a new payment ID
        private string GenerateNewPaymentID()
        {
            // Check if a payment ID already exists in the session
            string paymentID = Session["PaymentID"] as string;
            if (!string.IsNullOrEmpty(paymentID))
            {
                return paymentID; // Return the existing payment ID
            }

            // Retrieve the latest payment ID from the database
            string latestPaymentID = GetLatestPaymentIDFromDatabase();

            // Generate the new payment ID
            int newPaymentIndex = 1;
            if (!string.IsNullOrEmpty(latestPaymentID))
            {
                int.TryParse(latestPaymentID.Substring(1), out newPaymentIndex);
                newPaymentIndex++; // Increment the index by 1
            }

            string newPaymentID = "P" + newPaymentIndex.ToString("D3"); // Format the index as a 3-digit number with leading zeros


            return newPaymentID;
        }

        // Retrieve the latest payment ID from the database
        private string GetLatestPaymentIDFromDatabase()
        {
            // Assuming you have a connection string defined in your web.config file
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            string latestPaymentID = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "SELECT TOP 1 PaymentID FROM Payment ORDER BY PaymentID DESC";

                SqlCommand command = new SqlCommand(query, connection);

                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                if (reader.Read())
                {
                    latestPaymentID = reader["PaymentID"].ToString();
                }

                reader.Close();
                connection.Close();
            }

            return latestPaymentID;
        }





        protected void Page_PreRender(object sender, EventArgs e)
        {
            // Retrieve the customer information from the session
            

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

            }

            // Populate the delivery information fields
            txtDeliveryName.Text = user[1];
            txtDeliveryPhone.Text = user[4];
            txtDeliveryAddress.Text = user[5];

            // Populate the billing information fields
            txtBillingName.Text = user[1];
            txtBillingPhoneNo.Text = user[4];
            txtBillingAddress.Text = user[5];

        }


    }
}