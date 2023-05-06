using System;
using System.Collections.Generic;
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
            string selectedPaymentMethod = paymentMethod.SelectedValue;

            if (selectedPaymentMethod == "Credit")
            {
                // Redirect to PaymentSimulator.aspx for Credit Card payment
                Response.Redirect("PaymentSimulator.aspx?paymentMethod=credit");
            }
            else if (selectedPaymentMethod == "FPX")
            {
                // Redirect to PaymentSimulator.aspx for FPX payment
                Response.Redirect("PaymentSimulator.aspx?paymentMethod=fpx");
            }
            else if (selectedPaymentMethod == "E-Wallet")
            {
                // Redirect to PaymentSimulator.aspx for E-Wallet payment
                Response.Redirect("PaymentSimulator.aspx?paymentMethod=ewallet");
            }
            else if (selectedPaymentMethod == "COD")
            {
                // Redirect to PaymentSimulator.aspx for Cash On Delivery payment
                Response.Redirect("PaymentSimulator.aspx?paymentMethod=cod");
            }
        }

    }
}