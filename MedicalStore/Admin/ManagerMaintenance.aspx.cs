using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore.Admin
{
    public partial class ManagerMaintenance : System.Web.UI.Page
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
        string insertPassword = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            repeatUser.DataSource = SqlDataSource1;
            repeatUser.DataBind();
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnSubmitNew_Click(object sender, EventArgs e)
        {
            insertID = string.Empty;
            insertName = txtNameNew.Text.ToString();
            insertGender = ddlGenderNew.SelectedValue.ToString();
            insertEmail = txtEmailNew.Text.ToString();
            insertAddress = txtAddressNew.Text.ToString();
            insertContact = txtContactNew.Text.ToString();
            insertPassword = txtPasswordNew.Text.ToString();

            try
            {

                con2 = new SqlConnection(strCon2);
                con2.Open();
                string strGetID = "SELECT MAX(SUBSTRING(staffID, 2, 4)) AS staffID FROM Staffs";
                SqlCommand command2 = new SqlCommand(strGetID, con2);
                string getNextMaxID = (string)command2.ExecuteScalar();
                int ID = Convert.ToInt32(getNextMaxID) + 1;
                string nextID = ID.ToString("000");
                con2.Close();

                // Getting the staffID
                insertID = 'S' + nextID;

                try
                {
                    // Insert Statement Into DB
                    con3 = new SqlConnection(strCon3);
                    con3.Open();

                    string strInsert = "INSERT INTO [Staffs] (StaffID, Name, Email, Gender, ContactNumber, Address, Password, RoleID, Status) values(@StaffID, @Name, @Email, @Gender, @ContactNumber, @Address, @Password, @RoleID, @Status)";
                    SqlCommand command3 = new SqlCommand(strInsert, con3);
                    command3.Parameters.AddWithValue("@StaffID", insertID);
                    command3.Parameters.AddWithValue("@Name", insertName);
                    command3.Parameters.AddWithValue("@Email", insertEmail);
                    command3.Parameters.AddWithValue("@Gender", insertGender);
                    command3.Parameters.AddWithValue("@ContactNumber", insertContact);
                    command3.Parameters.AddWithValue("@Address", insertAddress);
                    command3.Parameters.AddWithValue("@Password", insertPassword);
                    command3.Parameters.AddWithValue("@RoleID", hdfRole.Value.ToString());
                    command3.Parameters.AddWithValue("@Status", "Pending");
                    int n = command3.ExecuteNonQuery();


                    if (n > 0)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Staff Registered has been successfully registered!');", true);
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

        protected void repeatUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            string staffID = e.CommandArgument.ToString();
            string staffName = string.Empty;
            string staffGender = string.Empty;
            string staffEmail = string.Empty;
            string staffPhone = string.Empty;
            string staffPassword = string.Empty;
            string staffAddress = string.Empty;

            switch (e.CommandName)
            {
                case "Edit":
                    ScriptManager.RegisterStartupScript(this, GetType(), "ShowEditModal", "showEditModal();", true);
                    con2 = new SqlConnection(strCon2);
                    con2.Open();

                    string strSelect = "SELECT * FROM Staffs Where StaffID = '" + staffID + "'";
                    SqlCommand cmd = new SqlCommand(strSelect, con2);
                    SqlDataReader dr = cmd.ExecuteReader();

                    while (dr.Read())
                    {
                        staffName = dr.GetString(1);
                        staffEmail = dr.GetString(2);
                        staffGender = dr.GetString(3);
                        staffPhone = dr.GetString(4);
                        staffAddress = dr.GetString(5);
                        staffPassword = dr.GetString(6);
                        hdfID.Value = dr.GetString(0);
                    }

                    txtNameEdit.Text = staffName;
                    txtEmailEdit.Text = staffEmail;
                    ddlGenderEdit.SelectedValue = staffGender.Trim();
                    txtContactEdit.Text = staffPhone;
                    txtAddressEdit.Text = staffAddress;
                    txtPasswordEdit.Attributes.Add("value", staffPassword);

                    con2.Close();

                    break;
                case "Delete":
                    try
                    {
                        con = new SqlConnection(strCon);
                        con.Open();

                        string strUpdate = "UPDATE Staffs Set Status = @Status Where StaffID = @StaffID";
                        SqlCommand com = new SqlCommand(strUpdate, con);
                        com.Parameters.AddWithValue("@Status", "Inactive Account (Removed)");
                        com.Parameters.AddWithValue("@StaffID", staffID);
                        int n = com.ExecuteNonQuery();

                        if (n > 0)
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Staff account deleted successfully.');", true);
                        }
                        else
                        {
                            ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Deletion with errors');", true);
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
            string staffID = hdfID.Value.ToString();
            string newstaffName = txtNameEdit.Text;
            string newstaffEmail = txtEmailEdit.Text;
            string newGender = ddlGenderEdit.SelectedValue;
            string newContact = txtContactEdit.Text;
            string newAddress = txtAddressEdit.Text;
            string newPassword = txtPasswordEdit.Text;

            con2 = new SqlConnection(strCon2);
            con2.Open();

            string strUpdate = "UPDATE Staffs SET Name = @Name, Email = @Email, Gender = @Gender, ContactNumber = @ContactNumber, Address = @Address, Password = @Password Where StaffID = @StaffID";
            SqlCommand command = new SqlCommand(strUpdate, con2);
            command.Parameters.AddWithValue("@Name", newstaffName);
            command.Parameters.AddWithValue("@Email", newstaffEmail);
            command.Parameters.AddWithValue("@Gender", newGender);
            command.Parameters.AddWithValue("@ContactNumber", newContact);
            command.Parameters.AddWithValue("@Address", newAddress);
            command.Parameters.AddWithValue("@Password", newPassword);
            command.Parameters.AddWithValue("@staffID", staffID);
            int n = command.ExecuteNonQuery();

            if (n > 0)
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Manager Info Updated Successfully.');", true);
            }
            else
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Manager with errors'); location.reload(true)", true);
            }

            con2.Close();
        }
    }
}