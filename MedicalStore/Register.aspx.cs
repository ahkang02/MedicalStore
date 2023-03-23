using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

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

            if(string.IsNullOrEmpty(username))
            {
                errorString += "Error: Username cannot be empty."; 
            }else if(string.IsNullOrEmpty(password))
            {
                errorString += "Error: Password cannot be empty.";
            } else if(string.IsNullOrEmpty(repeatPassword))
            {
                errorString += "Error: Repeat Password cannot be empty.";
            }else if(!repeatPassword.Equals(password))
            {
                errorString += "Error: Repeat password not matched.";
            }else if(string.IsNullOrEmpty(email))
            {
                errorString += "Error: Email cannot be empty.";
            }else if(!formCheck.Checked)
            {
                errorString += "Error: Please agree to the terms of use.";
            }
            
            lblError.Text = errorString;


        }

        protected void txtName_TextChanged(object sender, EventArgs e)
        {

        }
    }
}