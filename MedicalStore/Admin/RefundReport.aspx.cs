using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore.Admin
{
    public partial class RefundReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            int rejectCount = 0;
            int approveCount = 0;
            int inProgressCount = 0;
            int total = 0;

            string sqlRetrieveStaff = "Select * From Refund";

            SqlCommand cmdRetrieve1 = new SqlCommand(sqlRetrieveStaff, con);
            SqlDataReader dr = cmdRetrieve1.ExecuteReader();

            while (dr.Read())
            {
                if (string.Equals(dr["Status"], "Approve"))
                {
                    approveCount++;
                }
                else if (string.Equals(dr["Status"], "Rejected"))
                {
                    rejectCount++;
                }else if (string.Equals(dr["Status"], "In-progress"))
                {
                    inProgressCount++;
                }

            }
            con.Close();

            total = approveCount + rejectCount;

            lblCustCnt.Text = approveCount.ToString();
            lblStaffCnt.Text = rejectCount.ToString();;
            lblTotalCnt.Text = total.ToString();
            lblInProgress.Text = inProgressCount.ToString();
        }
    }
}