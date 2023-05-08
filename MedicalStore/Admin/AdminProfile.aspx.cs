using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore.Admin
{
    public partial class AdminProfile : System.Web.UI.Page
    {
        string[] staff;
        string[] manager;
        string[] admin;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            

            if (Session["Staffs"] != null)
            {
                staff = (string[])Session["Staffs"];
                lblStaffID.Text = staff[0];
                lblStaffName.Text = staff[1];
                lblStaffEmail.Text = staff[2];
                lblStaffGender.Text = staff[3];
                lblStaffContactNo.Text = staff[4];
                lblStaffAddress.Text = staff[5];
                lblRole.Text = staff[6];
            }
            else if(Session["Manager"] != null)
            {
                manager = (string[])Session["Manager"];
                lblStaffID.Text = manager[0];
                lblStaffName.Text = manager[1];
                lblStaffEmail.Text = manager[2];
                lblStaffGender.Text = manager[3];
                lblStaffContactNo.Text = manager[4];
                lblStaffAddress.Text = manager[5];
                lblRole.Text = manager[6];
            }
            else if (Session["Admin"] != null)
            {
                admin = (string[])Session["Admin"];
                lblStaffID.Text = admin[0];
                lblStaffName.Text = admin[1];
                lblStaffEmail.Text = admin[2];
                lblStaffGender.Text = admin[3];
                lblStaffContactNo.Text = admin[4];
                lblStaffAddress.Text = admin[5];
                lblRole.Text = admin[6];
            }
            else
            {
                Response.Redirect("../Login.aspx");
                // The array is not initialized or does not contain data
            }

                // The array is initialized and contains data
                
            
            
        }
    }
}