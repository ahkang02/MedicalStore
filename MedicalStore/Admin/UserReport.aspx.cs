using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace MedicalStore.Admin
{
    public partial class CustomerReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con;
            string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con = new SqlConnection(strCon);
            con.Open();

            string sqlRetrieveCust = "Select count(*) from customers";

            SqlCommand cmdRetrieve = new SqlCommand(sqlRetrieveCust, con);
            int count = (int)cmdRetrieve.ExecuteScalar();

            int staffCount = 0;
            int ManagerCount = 0;

            SqlConnection con1;
            string strCon1 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
            con1 = new SqlConnection(strCon1);
            con1.Open();

            string sqlRetrieveStaff = "Select * from staffs";

            SqlCommand cmdRetrieve1 = new SqlCommand(sqlRetrieveStaff, con1);
            SqlDataReader dr = cmdRetrieve1.ExecuteReader();

            if (dr.Read())
            {
                if (string.Equals(dr["roleID"], "R002"))
                {

                }
                else if (string.Equals(dr["roleID"], "R003"))
                {

                }
                
            }

        }
    }
}