using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;

namespace MedicalStore
{
    public partial class Register : System.Web.UI.Page
    {
        string username;
        string password;
        string repeatPassword;
        string email;
        string errorString = "";

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

            username = txtUsername.Text;
            password = txtPassword.Text;
            repeatPassword = txtRepeatPw.Text;
            email = txtEmail.Text;
            string id;
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();


            idGenerator();
            if (string.IsNullOrEmpty(username))
            {
                errorString += "Error: Username cannot be empty.";
            }
            else if (string.IsNullOrEmpty(password))
            {
                errorString += "Error: Password cannot be empty.";
            }
            else if (string.IsNullOrEmpty(repeatPassword))
            {
                errorString += "Error: Repeat Password cannot be empty.";
            }
            else if (!repeatPassword.Equals(password))
            {
                errorString += "Error: Repeat password not matched.";
            }
            else if (string.IsNullOrEmpty(email))
            {
                errorString += "Error: Email cannot be empty.";
            }
            else if (!formCheck.Checked)
            {
                errorString += "Error: Please agree to the terms of use.";
            }
            else
            {
                string sqlInsert = "insert into customers(customerid, username, email, password)" +
                "values(@customerid, @username, @email, @password)";

                SqlCommand cmdAdd = new SqlCommand(sqlInsert, con);
                id = idGenerator();
                password = EncryptPassword(password);
                cmdAdd.Parameters.AddWithValue("@customerid", id);
                cmdAdd.Parameters.AddWithValue("@username", username);
                cmdAdd.Parameters.AddWithValue("@email", email);
                cmdAdd.Parameters.AddWithValue("password", password);

                if (id == null)
                {
                    errorString += "Error: Unable to register a new customer.";
                }
                else if (userNameExist(username) == true)
                {
                    errorString += "Error: Username already exist, please enter another.";
                }
                else
                {
                    int n = cmdAdd.ExecuteNonQuery();
                    if (n > 0)
                    {
                        errorString += "Successfully registered as a user!";
                    }
                    else
                    {
                        errorString += "Failed to register a new user";
                    }
                }
            }

            lblError.Text = errorString;

        }

        public static string idGenerator()
        {
            string id="";
            string newId = "";
            int seq;
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string sql = "select top 1 * from customers order by customerid desc";
            SqlCommand cmdSelect = new SqlCommand(sql, con);

            SqlDataReader dr = cmdSelect.ExecuteReader();

            while (dr.Read())
            {
                id = dr["customerid"].ToString();
                seq = int.Parse(id.Substring(1)) + 1;
                newId = string.Format("C{0:D3}", seq);
            }

            con.Close();
            return newId;
        }

        public static bool userNameExist(string username)
        {
            bool exist = false;
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string strSelect = "SELECT * FROM Customers WHERE Username = @username";
            SqlCommand command = new SqlCommand(strSelect, con);
            command.Parameters.AddWithValue("@username", username);
            SqlDataReader drUsername = command.ExecuteReader();
            
            if (drUsername.HasRows)
            {
                exist = true;
            }
            else
            {
                exist = false;
            }

            con.Close();
            return exist;
        }

        public static string EncryptPassword(string password)
        {
            // Create a new instance of the SHA256 hashing algorithm
            using (SHA256 sha256 = SHA256.Create())
            {
                // Convert the password string to a byte array
                byte[] passwordBytes = Encoding.UTF8.GetBytes(password);

                // Compute the hash of the password bytes
                byte[] hashBytes = sha256.ComputeHash(passwordBytes);

                // Convert the hash bytes to a base64-encoded string
                string hashString = Convert.ToBase64String(hashBytes);

                return hashString;
            }
        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}