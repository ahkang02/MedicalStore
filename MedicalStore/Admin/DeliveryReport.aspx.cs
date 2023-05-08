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
    public partial class DeliveryReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            int orCount = 0;
            int packagingCount = 0;
            int transitCount = 0;
            int ofdCount = 0;
            int deliveredCount = 0;
            int completedCount = 0;
            int total = 0;

            string sqlRetrieveStaff = "Select * From Deliveries";

            SqlCommand cmdRetrieve1 = new SqlCommand(sqlRetrieveStaff, con);
            SqlDataReader dr = cmdRetrieve1.ExecuteReader();

            while (dr.Read())
            {
                if (string.Equals(dr["Status"], "Order Received"))
                {
                    orCount++;
                }
                else if (string.Equals(dr["Status"], "Packaging"))
                {
                    packagingCount++;
                }
                else if (string.Equals(dr["Status"], "In Transit"))
                {
                    transitCount++;
                }
                else if (string.Equals(dr["Status"], "Out For Delivery"))
                {
                    ofdCount++;
                }
                else if (string.Equals(dr["Status"], "Delivered"))
                {
                    deliveredCount++;
                }
                else if (string.Equals(dr["Status"], "Completed"))
                {
                    completedCount++;
                }

            }
            con.Close();

            total = orCount + packagingCount + transitCount + ofdCount + deliveredCount + completedCount;
            lblCustCnt.Text = orCount.ToString();
            lblStaffCnt.Text = transitCount.ToString(); 
            lblTotalCnt.Text = total.ToString();
            lblManagerCnt.Text = ofdCount.ToString();
            lblAdminCnt.Text = deliveredCount.ToString(); 
            lblComplete.Text = completedCount.ToString();
        }
    }
}