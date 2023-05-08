using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace MedicalStore
{
    public partial class Cart : System.Web.UI.Page
       
    
    

    {
        

        protected void Page_Load(object sender, EventArgs e)
        {
            
        }
        protected void addNewOrderButton_Click(object sender, CommandEventArgs e)
        {

            SqlConnection con3;
            string strCon3 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con3 = new SqlConnection(strCon3);
            con3.Open();
            string strGetID = "SELECT MAX(SUBSTRING(OrderID, 2, 4)) AS OrderID FROM Orders";
            SqlCommand command2 = new SqlCommand(strGetID, con3);
            string getNextMaxID = (string)command2.ExecuteScalar();
            int ID = Convert.ToInt32(getNextMaxID) + 1;
            string nextID = ID.ToString("000");
            con3.Close();




            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Insert Statement Into DB
            con = new SqlConnection(strCon);


            //float price = float.Parse(button.CommandName, NumberStyles.Currency, CultureInfo.InvariantCulture);

            string OrderID = "";

            SqlConnection con5;
            string strCon5 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Insert Statement Into DB
            con5 = new SqlConnection(strCon5);

            using (SqlConnection connection = new SqlConnection(strCon5))
            {
                OrderID = 'O' + nextID;

                string InsertQuery = "INSERT INTO Orders (OrderID) " +
                    "VALUES (@OrderID)";


                using (SqlCommand command = new SqlCommand(InsertQuery, connection))
                {
                    // set the parameter value for productId
                    command.Parameters.AddWithValue("@OrderID", OrderID);


                    // open the connection and execute the command
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();


                }


            }

            con5.Close();

        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {


        

            string productID = Request.Form["hdnProductID"];
            float subtotal = float.Parse(Request.Form["hdnSubtotal"]);
            int quantity = int.Parse(Request.Form["hdnQuantity"]);

            // Code to update product goes here

            // TODO: remove the product record from the table using the productId
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Update Statement Into DB
            using (SqlConnection con = new SqlConnection(strCon))
            {
                con.Open();

                string UpdateProduct = "UPDATE Order_Details SET Quantity=@Quantity, SubTotal=@SubTotal WHERE ProductID=@ProductID";

                using (SqlCommand command = new SqlCommand(UpdateProduct, con))
                {
                    // Set the parameters for the SQL command
                    command.Parameters.AddWithValue("@ProductID", productID);
                    command.Parameters.AddWithValue("@Quantity", quantity);
                    command.Parameters.AddWithValue("@SubTotal", subtotal);
 

                    // Execute the SQL command
                    command.ExecuteNonQuery();
                }
                con.Close();
            }


            SqlConnection con6;
            string strCon6 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            con6 = new SqlConnection(strCon6);
            con6.Open();
            string strGetID = "SELECT MAX(SUBSTRING(OrderID, 2, 4)) AS OrderID FROM Orders";
            SqlCommand command2 = new SqlCommand(strGetID, con6);
            string getNextMaxID = (string)command2.ExecuteScalar();
            int ID = Convert.ToInt32(getNextMaxID);
            string nextID = ID.ToString("000");
            con6.Close();


            string orderID = " ";

            float totalAmount = float.Parse(Request.Form["hdnTotal"]);
            string status = Request.Form["hdnDelivery"];
            DateTime orderDate = DateTime.Today;
            string customerID = "C001";

            orderID = 'O' + nextID;



            SqlConnection con3;
                string strCon3 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

                // Insert Statement Into DB
                con3 = new SqlConnection(strCon3);

                using (SqlConnection connection = new SqlConnection(strCon3))
                {


                    string InsertQuery = "UPDATE Orders SET OrderDate=@OrderDate, TotalAmount=@TotalAmount, Status=@Status, CustomerID=@CustomerID WHERE OrderID=@OrderID";
             
                //"INSERT INTO Orders (OrderID, OrderDate, TotalAmount,Status,CustomerID) " +
                //        "VALUES (@OrderID, @OrderDate, @TotalAmount,@Status,@CustomerID)";


                    using (SqlCommand command = new SqlCommand(InsertQuery, connection))
                    {
                        // set the parameter value for productId
                        command.Parameters.AddWithValue("@OrderID", orderID);
                        command.Parameters.AddWithValue("@OrderDate", orderDate);
                        command.Parameters.AddWithValue("@TotalAmount", totalAmount);
                        command.Parameters.AddWithValue("@Status", status);
                        command.Parameters.AddWithValue("@CustomerID", customerID);



                        // open the connection and execute the command
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();


                    }


                }

                con3.Close();
            


            


    


            Response.Redirect("Payment.aspx");


        }
 

        protected void RemoveProduct(object sender, CommandEventArgs e)
        {
          
            // TODO: remove the product record from the table using the productId
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            // Insert Statement Into DB
            con = new SqlConnection(strCon);

            string productId = e.CommandArgument.ToString();
            string deleteQuery = "DELETE FROM Order_Details WHERE ProductID = @ProductId";
            using (SqlConnection connection = new SqlConnection(strCon))
            {
         

                using (SqlCommand command = new SqlCommand(deleteQuery, connection))
                {
                    // set the parameter value for productId
                    command.Parameters.AddWithValue("@ProductId", productId);

                    // open the connection and execute the command
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();

                  
                }


            }

            con.Close();
            
        }

    }
}
