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
    public partial class ProductReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {


                SqlConnection con;
                string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                con = new SqlConnection(strCon);
                con.Open();

                int capsuleCount = 0;
                int liquidCount = 0;
                int injectionCount = 0;
                int tabletCount = 0;
                int total = 0;

                string sqlRetrieveStaff = "Select * From Products";

                SqlCommand cmdRetrieve1 = new SqlCommand(sqlRetrieveStaff, con);
                SqlDataReader dr = cmdRetrieve1.ExecuteReader();

                while (dr.Read())
                {
                    if (string.Equals(dr["Type"], "Capsules"))
                    {
                        capsuleCount++;
                    }
                    else if (string.Equals(dr["Type"], "Liquid"))
                    {
                        liquidCount++;
                    }
                    else if (string.Equals(dr["Type"], "Injections"))
                    {
                        injectionCount++;
                    }
                    else if (string.Equals(dr["Type"], "Tablet"))
                    {
                        tabletCount++;
                    }

                }
                con.Close();

                total = capsuleCount + liquidCount + injectionCount + tabletCount;

                lblCustCnt.Text = capsuleCount.ToString();
                lblStaffCnt.Text = liquidCount.ToString();
                lblManagerCnt.Text = injectionCount.ToString();
                lblAdminCnt.Text = tabletCount.ToString();
                lblTotalCnt.Text = total.ToString();
            


        }
    }
}
