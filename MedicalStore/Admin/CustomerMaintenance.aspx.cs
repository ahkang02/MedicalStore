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
    public partial class CustomerMaintenance : System.Web.UI.Page
    {


        string insertID = string.Empty;
        string insertName = string.Empty;  
        string insertGender = string.Empty;
        string insertEmail =   string.Empty;
        string insertAddress = string.Empty;
        string insertContact = string.Empty;
        string insertUsername = string.Empty;
        string insertPassword = string.Empty;

        // Connection 1
        SqlConnection con;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        // Connection 2
        SqlConnection con2;
        string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con3;
        string strCon3 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection con4;
        string strCon4 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                bindRepeater();
            }

            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            insertID = string.Empty;
            insertName = string.Empty;
            insertGender = string.Empty;
            insertEmail = string.Empty;
            insertAddress = string.Empty;
            insertContact = string.Empty;
            insertUsername = string.Empty;
            insertPassword = string.Empty;

        }

        protected void bindRepeater()
        {
            con4 = new SqlConnection(strCon4);
            con4.Open();
            SqlCommand cmd = new SqlCommand("Select * from Customers", con4);
            DataSet ds = new DataSet();
            SqlDataAdapter adp = new SqlDataAdapter(cmd);
            adp.Fill(ds);
            repeatUser.DataSource = ds;
            repeatUser.DataBind();
            con4.Close();
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

                            string strInsert = "INSERT INTO [Customers] (CustomerID, Name, Email, Gender, ContactNumber, Address, Username, Password) values(@CustomerID, @Name, @Email, @Gender, @ContactNumber, @Address, @Username, @Password)";
                            SqlCommand command3 = new SqlCommand(strInsert, con3);
                            command3.Parameters.AddWithValue("@CustomerID", insertID);
                            command3.Parameters.AddWithValue("@Name", insertName);
                            command3.Parameters.AddWithValue("@Email", insertEmail);
                            command3.Parameters.AddWithValue("@Gender", insertGender);
                            command3.Parameters.AddWithValue("@ContactNumber", insertContact);
                            command3.Parameters.AddWithValue("@Address", insertAddress);
                            command3.Parameters.AddWithValue("@Username", insertUsername);
                            command3.Parameters.AddWithValue("@Password", insertPassword);
                            int n = command3.ExecuteNonQuery();


                            if (n > 0)
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "Success", "alert('Your account has been successfully registered!'); location.reload(true)", true);
                            }else
                            {
                                ClientScript.RegisterClientScriptBlock(this.GetType(), "Failed", "alert('Registration with issue'); location.reload(true)", true);
                            }
                            con3.Close();

                        }catch(Exception ex)
                        {
                            Response.Write(ex.ToString());
                        }

                    }catch(Exception ex)
                    {
                        Response.Write(ex.ToString());
                    }
                }
            }catch(Exception ex)
            {
                Response.Write(ex.ToString());
            }

        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            
        }

        protected void repeatUser_ItemCommand(object source, RepeaterCommandEventArgs e)
        {

        }
    }
}