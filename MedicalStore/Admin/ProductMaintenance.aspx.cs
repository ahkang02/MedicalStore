using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

//ProductID , Name , Description , Type , Price , AddedDate , ImageName , ManufacturerID

namespace MedicalStore
{
    public partial class ProductMaintenance : System.Web.UI.Page
    {
        // Connection 1
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con2;
        string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con3;
        string strCon3 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        string insertID = string.Empty;
        string insertName = string.Empty;
        string insertDescription = string.Empty;
        string insertType = string.Empty; 
        double insertPrice = 0;
        string insertAddedDate;
        string insertImageName = string.Empty;
        string insertManuID = string.Empty;
        int insertQuantity = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            repeatUser.DataSource = SqlDataSource2;
            repeatUser.DataBind();
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmitNew_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(strCon);
                con.Open();

                insertName = txtNameNew.Text;
                insertDescription = txtDescriptionNew.Text;
                insertPrice = Convert.ToDouble(txtPriceNew.Text.ToString());
                insertImageName = fuProductNew.PostedFile.FileName.ToString();
                insertManuID = ddlManufacturerNew.SelectedValue.ToString().Trim();
                insertQuantity = Convert.ToInt32(txtQtyNew.Text);
                insertAddedDate = DateTime.Now.ToString("dd/MM/yyyy");
                insertType = ddlProductTypeNew.SelectedValue.ToString().Trim();
                con.Close();

                try
                {
                    con2 = new SqlConnection(strCon2);
                    con2.Open();
                    string strGetID = "SELECT MAX(SUBSTRING(ProductID, 2, 4)) AS ProductID FROM Products";
                    SqlCommand command2 = new SqlCommand(strGetID, con2);
                    string getNextMaxID = (string)command2.ExecuteScalar();
                    int ID = Convert.ToInt32(getNextMaxID) + 1;
                    string nextID = ID.ToString("0000");
                    con2.Close();

                    // Getting the CustomerID
                    insertID = 'P' + nextID;

                    try
                    {
                        // Insert Statement Into DB
                        con3 = new SqlConnection(strCon3);
                        con3.Open();

                        string strInsert = "INSERT INTO [Products] (ProductID, Name, Description, Type, Price, AddedDate, ImageName, ManufacturerID, Quantity) values(@ProductID, @Name, @Description, @Type, @Price, @AddedDate, @ImageName, @ManufacturerID, @Quantity)";
                        SqlCommand command3 = new SqlCommand(strInsert, con3);
                        command3.Parameters.AddWithValue("@ProductID", insertID);
                        command3.Parameters.AddWithValue("@Name", insertName);
                        command3.Parameters.AddWithValue("@Description", insertDescription);
                        command3.Parameters.AddWithValue("@Type", insertType);
                        command3.Parameters.AddWithValue("@Price", insertPrice);
                        command3.Parameters.AddWithValue("@AddedDate", insertAddedDate);
                        command3.Parameters.AddWithValue("@ImageName", insertImageName);
                        command3.Parameters.AddWithValue("@ManufacturerID", insertManuID);
                        command3.Parameters.AddWithValue("@Quantity", insertQuantity);
                        int n = command3.ExecuteNonQuery();


                        if (n > 0)
                        {
                            // Download File

                            fuProductNew.SaveAs(HttpContext.Current.Request.PhysicalApplicationPath + "Images/ProductImg" + fuProductNew.FileName);
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Product added successfully.');", true);
                        }
                        else
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Registration with issue');", true);
                        }
                        con3.Close();

                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }

                }
                catch (Exception ex)
                {
                    Response.Write(ex.ToString());
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void repeatUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string productID = e.CommandArgument.ToString();
            string productName = string.Empty;
            string productDescription = string.Empty;
            string productPrice = string.Empty;
            DateTime productAddedDate;
            string productImageName = string.Empty;
            string productManuID = string.Empty;
            int productQuantity = 0;

            switch (e.CommandName)
            {
                //    case "Edit":
                //        ScriptManager.RegisterStartupScript(this, GetType(), "ShowEditModal", "showEditModal();", true);
                //        con2 = new SqlConnection(strCon2);
                //        con2.Open();

                //        string strSelect = "SELECT * FROM Customers Where CustomerID = '" + customerID + "'";
                //        SqlCommand cmd = new SqlCommand(strSelect, con2);
                //        SqlDataReader dr = cmd.ExecuteReader();

                //        while (dr.Read())
                //        {
                //            customerName = dr.GetString(1);
                //            customerEmail = dr.GetString(2);
                //            customerGender = dr.GetString(3);
                //            customerPhone = dr.GetString(4);
                //            customerAddress = dr.GetString(5);
                //            customerPassword = dr.GetString(7);
                //            hdfID.Value = dr.GetString(0);
                //        }

                //        txtNameEdit.Text = customerName;
                //        txtEmailEdit.Text = customerEmail;
                //        ddlGenderEdit.SelectedValue = customerGender.Trim();
                //        txtContactEdit.Text = customerPhone;
                //        txtAddressEdit.Text = customerAddress;
                //        txtPasswordEdit.Attributes.Add("value", customerPassword);

                //        con2.Close();

                //        break;
                //    case "Delete":
                //        try
                //        {
                //            con = new SqlConnection(strCon);
                //            con.Open();

                //            string strUpdate = "UPDATE Customers Set Status = @Status Where CustomerID = @CustomerID";
                //            SqlCommand com = new SqlCommand(strUpdate, con);
                //            com.Parameters.AddWithValue("@Status", "Inactive Account (Removed)");
                //            com.Parameters.AddWithValue("@CustomerID", customerID);
                //            int n = com.ExecuteNonQuery();

                //            if (n > 0)
                //            {
                //                ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Customer account deleted successfully.')", true);
                //            }
                //            else
                //            {
                //                ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Deletion with errors')", true);
                //            }

                //            con.Close();
                //        }
                //        catch (Exception ex)
                //        {
                //            Response.Write(ex.ToString());
                //        }
                //        break;

                //    default:
                //        break;
                //}
            }

        }

        protected void btnSubmitEdit_Click(object sender, EventArgs e)
        {
            //string productID = hdfID.Value.ToString();
            //string productName = txtNameEdit.Text;
            //string productDescription = txtDescriptionEdit.Text;
            //double productPrice = Convert.ToDouble(txtPriceEdit.Text);
            //string productImageName = fuProductEdit.PostedFile.FileName.ToString();
            //string productManuID = ddlManufacturerEdit.SelectedValue.ToString().Trim();
            //int productQuantity = Convert.ToInt32(txtQtyEdit.Text);

            //con2 = new SqlConnection(strCon2);
            //con2.Open();

            //string strUpdate = "UPDATE CUSTOMERS SET Name = @Name, Email = @Email, Gender = @Gender, ContactNumber = @ContactNumber, Address = @Address, Password = @Password Where CustomerID = @CustomerID";
            //SqlCommand command = new SqlCommand(strUpdate, con2);
            //command.Parameters.AddWithValue("@Name", newCustomerName);
            //command.Parameters.AddWithValue("@Email", newCustomerEmail);
            //command.Parameters.AddWithValue("@Gender", newGender);
            //command.Parameters.AddWithValue("@ContactNumber", newContact);
            //command.Parameters.AddWithValue("@Address", newAddress);
            //command.Parameters.AddWithValue("@Password", newPassword);
            //command.Parameters.AddWithValue("@CustomerID", customerID);
            //int n = command.ExecuteNonQuery();

            //if (n > 0)
            //{
            //    ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Customer Info Updated Successfully.');", true);
            //}
            //else
            //{
            //    ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Update with errors'); location.reload(true)", true);
            //}

            //con2.Close();
        }
    }
}