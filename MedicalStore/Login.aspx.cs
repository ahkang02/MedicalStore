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
using System.Text.RegularExpressions;

namespace MedicalStore
{
    public partial class Login : System.Web.UI.Page
    {
        string username;
        string password;
        String password1;
        string errorString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.Abandon();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            username = txtUsername.Text;
            password = EncryptPassword(txtPassword.Text);
            password1 = txtPassword.Text;
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            if (Regex.IsMatch(username, "^S\\d{3}$"))
            {
                string cmdSelectStaff = "select * from staffs where staffid = @staffid";
                SqlCommand command = new SqlCommand(cmdSelectStaff, con);
                command.Parameters.AddWithValue("@staffid", username);
                SqlDataReader dr = command.ExecuteReader();

                if (dr.Read())
                {
                    if (string.Equals(password1, dr["password"].ToString()))
                    {
                        SqlConnection con1;
                        string strCon1 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                        con1 = new SqlConnection(strCon1);
                        con1.Open();
                        string[] staff = { dr["staffid"].ToString(), dr["name"].ToString(), dr["email"].ToString(), dr["gender"].ToString(), dr["contactnumber"].ToString(), dr["address"].ToString(), dr["roleid"].ToString() };
                        string cmdSelectRole = "select r.rolename from role r, staffs s where s.roleid = r.roleid and s.StaffID=@staffid";
                        SqlCommand command2 = new SqlCommand(cmdSelectRole, con1);
                        command2.Parameters.AddWithValue("@staffid", username);
                        string role = (string)command2.ExecuteScalar();
                        
                        if (string.Equals(role, "Staffs"))
                        {
                            Session["Staffs"] = staff;
                        }
                        else if (string.Equals(role, "Manager"))
                        {
                            Session["Manager"] = staff;
                        }
                        else if (string.Equals(role, "Admin"))
                        {
                            Session["Admin"] = staff;
                        }

                        Response.Redirect("Admin/ProductMaintenance.aspx");
                        con1.Close();
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
            }
            else
            {
                string cmdSelectCust = "select * from customers where username = @username";
            SqlCommand command1 = new SqlCommand(cmdSelectCust, con);
            command1.Parameters.AddWithValue("@username", username);
            SqlDataReader dr1 = command1.ExecuteReader();

            if (dr1.Read())
            {
                if(string.Equals(password, dr1["password"].ToString()))
                {
                    string[] user = {dr1["customerid"].ToString(), dr1["name"].ToString(), dr1["email"].ToString(), dr1["gender"].ToString(), dr1["contactnumber"].ToString(), dr1["address"].ToString(), dr1["username"].ToString() };
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