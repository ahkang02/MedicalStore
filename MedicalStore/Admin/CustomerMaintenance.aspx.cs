using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore.Admin
{
    public partial class CustomerMaintenance : System.Web.UI.Page
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
        string insertGender = string.Empty;
        string insertEmail = string.Empty;
        string insertAddress = string.Empty;
        string insertContact = string.Empty;
        string insertUsername = string.Empty;
        string insertPassword = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            repeatUser.DataSource = SqlDataSource1;
            repeatUser.DataBind();
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmitNew_Click(object sender, EventArgs e)
        {
            try
            {
                con = new SqlConnection(strCon);
                con.Open();

                insertID = string.Empty;
                insertName = txtNameNew.Text.ToString();
                insertGender = ddlGenderNew.SelectedValue.ToString();
                insertEmail = txtEmailNew.Text.ToString();
                insertAddress = txtAddressNew.Text.ToString();
                insertContact = txtContactNew.Text.ToString();
                insertUsername = txtUsernameNew.Text.ToString();
                insertPassword = txtPasswordNew.Text.ToString();

                bool usernameExists = false;

                // Check Username Duplication
                string strSelect = "SELECT * FROM Customers WHERE Username = '" + insertUsername + "'";
                SqlCommand command = new SqlCommand(strSelect, con);
                SqlDataReader drUsername = command.ExecuteReader();
                if (drUsername.HasRows)
                {
                    usernameExists = true;
                    lblUsernameExists.Text = "Username already exists";
                }

                drUsername.Close();
                con.Close();

                if (usernameExists == false)
                {
                    try
                    {

                        con2 = new SqlConnection(strCon2);
                        con2.Open();
                        string strGetID = "SELECT MAX(SUBSTRING(CustomerID, 2, 4)) AS CustomerID FROM Customers";
                        SqlCommand command2 = new SqlCommand(strGetID, con2);
                        string getNextMaxID = (string)command2.ExecuteScalar();
                        int ID = Convert.ToInt32(getNextMaxID) + 1;
                        string nextID = ID.ToString("000");
                        con2.Close();

                        // Getting the CustomerID
                        insertID = 'C' + nextID;

                        try
                        {
                            // Insert Statement Into DB
                            con3 = new SqlConnection(strCon3);
                            con3.Open();

                            string strInsert = "INSERT INTO [Customers] (CustomerID, Name, Email, Gender, ContactNumber, Address, Username, Password, Status) values(@CustomerID, @Name, @Email, @Gender, @ContactNumber, @Address, @Username, @Password, @Status)";
                            SqlCommand command3 = new SqlCommand(strInsert, con3);
                            command3.Parameters.AddWithValue("@CustomerID", insertID);
                            command3.Parameters.AddWithValue("@Name", insertName);
                            command3.Parameters.AddWithValue("@Email", insertEmail);
                            command3.Parameters.AddWithValue("@Gender", insertGender);
                            command3.Parameters.AddWithValue("@ContactNumber", insertContact);
                            command3.Parameters.AddWithValue("@Address", insertAddress);
                            command3.Parameters.AddWithValue("@Username", insertUsername);
                            command3.Parameters.AddWithValue("@Password", insertPassword);
                            command3.Parameters.AddWithValue("@Status", "Pending");
                            int n = command3.ExecuteNonQuery();


                            if (n > 0)
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Your account has been successfully registered!'); location.reload(true)", true);
                            }
                            else
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Registration with issue'); location.reload(true)", true);
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
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        protected void repeatUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string customerID = e.CommandArgument.ToString();
            string customerName = string.Empty;
            string customerGender = string.Empty;
            string customerEmail = string.Empty;
            string customerPhone = string.Empty;
            string customerPassword = string.Empty;
            string customerAddress = string.Empty;

            switch (e.CommandName)
            {
                case "Edit":
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowEditModal", "showEditModal();", true);
                    con2 = new SqlConnection(strCon2);
                    con2.Open();

                    string strSelect = "SELECT * FROM Customers Where CustomerID = '" + customerID + "'";
                    SqlCommand cmd = new SqlCommand(strSelect, con2);
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        customerName = dr.GetString(1);
                        customerEmail = dr.GetString(2);
                        customerGender = dr.GetString(3);
                        customerPhone = dr.GetString(4);
                        customerAddress = dr.GetString(5);
                        customerPassword = dr.GetString(7);
                        hdfID.Value = dr.GetString(0);
                    }

                    txtNameEdit.Text = customerName;
                    txtEmailEdit.Text = customerEmail;
                    ddlGenderEdit.SelectedValue = customerGender.Trim();
                    txtContactEdit.Text = customerPhone;
                    txtAddressEdit.Text = customerAddress;
                    txtPasswordEdit.Attributes.Add("value", customerPassword);

                    con2.Close();

                    break;
                case "Delete":
                    try
                    {
                        con = new SqlConnection(strCon);
                        con.Open();

                        string strUpdate = "UPDATE Customers Set Status = @Status Where CustomerID = @CustomerID";
                        SqlCommand com = new SqlCommand(strUpdate, con);
                        com.Parameters.AddWithValue("@Status", "Inactive Account (Removed)");
                        com.Parameters.AddWithValue("@CustomerID", customerID);
                        int n = com.ExecuteNonQuery();

                        if (n > 0)
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Customer account deleted successfully.'); location.reload(true)", true);
                        }
                        else
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Deletion with errors'); location.reload(true)", true);
                        }

                        con.Close();
                    }
                    catch (Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }
                    break;

                default:
                    break;
            }
        }

        protected void btnSubmitEdit_Click(object sender, EventArgs e)
        {
            string customerID = hdfID.Value.ToString();
            string newCustomerName = txtNameEdit.Text;
            string newCustomerEmail = txtEmailEdit.Text;
            string newGender = ddlGenderEdit.SelectedValue;
            string newContact = txtContactEdit.Text;
            string newAddress = txtAddressEdit.Text;
            string newPassword = txtPasswordEdit.Text;

            con2 = new SqlConnection(strCon2);
            con2.Open();

            string strUpdate = "UPDATE CUSTOMERS SET Name = @Name, Email = @Email, Gender = @Gender, ContactNumber = @ContactNumber, Address = @Address, Password = @Password Where CustomerID = @CustomerID";
            SqlCommand command = new SqlCommand(strUpdate, con2);
            command.Parameters.AddWithValue("@Name", newCustomerName);
            command.Parameters.AddWithValue("@Email", newCustomerEmail);
            command.Parameters.AddWithValue("@Gender", newGender);
            command.Parameters.AddWithValue("@ContactNumber", newContact);
            command.Parameters.AddWithValue("@Address", newAddress);
            command.Parameters.AddWithValue("@Password", newPassword);
            command.Parameters.AddWithValue("@CustomerID", customerID);
            int n = command.ExecuteNonQuery();

            if (n > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Customer Info Updated Successfully.');", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Update with errors'); location.reload(true)", true);
            }

            con2.Close();
        }
    }
}