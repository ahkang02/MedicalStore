using System;
using System.Web.Configuration;
using System.Data.SqlClient;

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

                // Store the payment details in the database if the command argument is set
                if (btnSuccess.CommandArgument == "SaveToDatabase")
                {
                    SavePaymentToDatabase(paymentID, paymentMethod, paymentAmount, paymentDateTime);
                }
            }
        }

        protected void btnSuccess_Click(object sender, EventArgs e)
        {
            // Set the command argument to indicate that the payment should be saved to the database
            btnSuccess.CommandArgument = "SaveToDatabase";

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
    }
}
