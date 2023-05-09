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
using System.Net;
using System.Net.Mail;

namespace MedicalStore
{
    public partial class Login : System.Web.UI.Page
    {
        string username;
        string password;
        string password1;
        string enteredOTP;
        string errorString = "";
        string successString = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.Abandon();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            username = txtUsername.Text;
            password = EncryptPassword(txtPassword.Text);
            password1 = txtPassword.Text;
            enteredOTP = txtOtp.Text;
            string savedOTP = Session["OTP"] as string;

            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            if (string.IsNullOrEmpty(username))
            {
                errorString += "Error: Username cannot be empty.";
            }
            else if (string.IsNullOrEmpty(password))
            {
                errorString += "Error: Password cannot be empty.";
            }
            else
            {
                if (Regex.IsMatch(username, "^S\\d{3}$"))
                {
                    string cmdSelectStaff = "select * from staffs where staffid = @staffid";
                    SqlCommand command = new SqlCommand(cmdSelectStaff, con);
                    command.Parameters.AddWithValue("@staffid", username);
                    SqlDataReader dr = command.ExecuteReader();

                    if (dr.Read())
                    {
                        if (string.Equals(password, dr["password"].ToString()))
                        {
                            string[] staff = { dr["staffid"].ToString(), dr["name"].ToString(), dr["email"].ToString(), dr["gender"].ToString(), dr["contactnumber"].ToString(), dr["address"].ToString(), dr["roleid"].ToString() };

                            SqlConnection con1;
                            string strCon1 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                            con1 = new SqlConnection(strCon1);
                            con1.Open();

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

                            Response.Redirect("Admin/Dashboard.aspx");
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
                        if (string.IsNullOrEmpty(enteredOTP))
                        {
                            errorString += "Error: OTP cannot be empty.";
                        }
                        else if (enteredOTP != savedOTP)
                        {
                            errorString += "Error: Invalid OTP. Please enter the correct OTP sent to your email.";
                        }
                        else
                        {
                            if (string.Equals(password, dr1["password"].ToString()))
                            {
                                string[] user = { dr1["customerid"].ToString(), dr1["name"].ToString(), dr1["email"].ToString(), dr1["gender"].ToString(), dr1["contactnumber"].ToString(), dr1["address"].ToString(), dr1["username"].ToString() };
                                Session["user"] = user;

                                Response.Redirect("Homepage.aspx");
                            }
                            else
                            {
                                errorString += "Error: Invalid password, please try again.";
                            }
                        }

                    }
                    else
                    {
                        errorString += "Error: Invalid username or username does not exist, please try again.";
                    }

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

        protected void btnOtp_Click(object sender, EventArgs e)
        {
            string email = "";
            username = txtUsername.Text;


            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();


            string cmdSelectCust = "select * from customers where username = @username";
            SqlCommand command1 = new SqlCommand(cmdSelectCust, con);
            command1.Parameters.AddWithValue("@username", username);
            SqlDataReader dr1 = command1.ExecuteReader();


            if (dr1.Read())
            {
                email = dr1["email"].ToString();
            }
            else
            {
                errorString += "Error: Invalid username or username does not exist, please try again.";
            }
            con.Close();

            string otp = GenerateOTP();
            Session["OTP"] = otp;
            string subject = "Login Authentication - Your OTP";
            string body = "Dear user,Your OTP for login is " + otp + ". Thank you for using our website!";

            if (string.IsNullOrEmpty(username))
            {
                errorString += "Error: Username cannot be empty.";
            }
            else
            {
                // Create a new MailMessage object

                try
                {
                    var fromAddress = new MailAddress("e-healthy@outlook.com", "From Name");
                    var toAddress = new MailAddress(email, "To Name");

                    var smtp = new SmtpClient
                    {
                        Host = "smtp-mail.outlook.com",
                        Port = 587, // or 465 for SSL
                        EnableSsl = true, // set to true for SSL or TLS connections
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential()
                    };

                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);
                    }

                    successString += "An OTP has been sent to your email address. Please enter it below to verify your login.";
                }
                catch (Exception ex)
                {
                    errorString += "Error sending email: " + ex.Message;
                }
                lblMsg.Text = successString;
                lblError.Text = errorString;
            }
        }

        private static string GenerateOTP()
        {
            // Generate a random 6-digit OTP
            using (RNGCryptoServiceProvider provider = new RNGCryptoServiceProvider())
            {
                byte[] data = new byte[4];
                provider.GetBytes(data);
                int value = BitConverter.ToInt32(data, 0) % 1000000;
                return value.ToString("D6");
            }

        }

        public static string GeneratePassword(int length = 8)
        {
            const string validChars = "ABCDEFGHJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#$%^&*?_-";
            var random = new Random();

            var chars = new char[length];
            for (int i = 0; i < length; i++)
            {
                chars[i] = validChars[random.Next(validChars.Length)];
            }

            return new string(chars);
        }

        protected void btnForgot_Click(object sender, EventArgs e)
        {
            string email = "";
            username = txtUsername.Text;


            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();


            string cmdSelectCust = "select * from customers where username = @username";
            SqlCommand command1 = new SqlCommand(cmdSelectCust, con);
            command1.Parameters.AddWithValue("@username", username);
            SqlDataReader dr1 = command1.ExecuteReader();


            if (dr1.Read())
            {
                email = dr1["email"].ToString();
            }
            con.Close();

            password = GeneratePassword();




            string subject = "Login Authentication - Your OTP";
            string body = "Dear user,Your OTP for login is " + password + ". Thank you for using our website!";

            if (string.IsNullOrEmpty(username))
            {
                errorString += "Error: Username cannot be empty.";
            }
            else
            {
                // Create a new MailMessage object

                try
                {
                    //SqlConnection con;
                    //string strCon1 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                    //con = new SqlConnection(strCon);
                    con.Open();


                    string cmdUpdatePass = "update customers set password = @password where username = @username";
                    SqlCommand command2 = new SqlCommand(cmdUpdatePass, con);
                    command2.Parameters.AddWithValue("@username", username);
                    command2.Parameters.AddWithValue("@password", EncryptPassword(password));
                    command2.ExecuteNonQuery();

                    con.Close();

                    var fromAddress = new MailAddress("e-healthy@outlook.com", "From Name");
                    var toAddress = new MailAddress(email, "To Name");

                    var smtp = new SmtpClient
                    {
                        Host = "smtp-mail.outlook.com",
                        Port = 587, // or 465 for SSL
                        EnableSsl = true, // set to true for SSL or TLS connections
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        UseDefaultCredentials = false,
                        Credentials = new NetworkCredential("", "")
                    };

                    using (var message = new MailMessage(fromAddress, toAddress)
                    {
                        Subject = subject,
                        Body = body
                    })
                    {
                        smtp.Send(message);
                    }

                    successString += "A password has been sent to your email address.";
                }
                catch (Exception ex)
                {
                    errorString += "Error sending email: " + ex.Message;
                }
                lblMsg.Text = successString;
                lblError.Text = errorString;
            }
        }
    }
}