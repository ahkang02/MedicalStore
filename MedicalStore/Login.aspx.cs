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
    public partial class Login : System.Web.UI.Page
    {
        string username;
        string password;
        string errorString = "";
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            username = txtUsername.Text;
            password = EncryptPassword(txtPassword.Text);

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string cmdSelect = "select * from customers where username = @username";
            SqlCommand command = new SqlCommand(cmdSelect, con);
            command.Parameters.AddWithValue("@username", username);
            SqlDataReader dr = command.ExecuteReader();

            if (dr.Read())
            {
                if(string.Equals(password, dr["password"]))
                {
                    string[] user = {dr["customerid"].ToString(), dr["name"].ToString(), dr["email"].ToString(), dr["gender"].ToString(), dr["contactnumber"].ToString(), dr["address"].ToString(), dr["username"].ToString(), };
                    Session["user"] = user;
                    Response.Redirect("Homepage.aspx");
                }
                else
                {
                    errorString += "Error: Invalid password, please try again.";
                }
            }
            else
            {
                errorString += "Error: Invalid username or username does not exist, please try again.";
            }
            lblError.Text = errorString;
            con.Close();
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
    }
}