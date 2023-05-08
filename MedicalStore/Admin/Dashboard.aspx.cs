using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Newtonsoft.Json;


namespace MedicalStore.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {

        SqlConnection conn;
        string strCon = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        SqlConnection conn2;
        string strCon2 = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Staffs"] != null || Session["Manager"] != null || Session["Admin"] != null)
            {

                jsCodeLiteral.Mode = LiteralMode.Encode;
                jsCodeLiteral.Mode = LiteralMode.PassThrough;
                jsCodeLiteral.Mode = LiteralMode.Transform;
                var labels = new List<string>();
                var data = new List<double>();

                int totalProducts = 0;
                double totalSales = 0;
                int totalRefund = 0;
                int totalOrders = 0;

                int totalUsers = 0;
                int totalCustomers = 0;
                int totalStaffs = 0;
                int totalManagers = 0;

                conn = new SqlConnection(strCon);
                conn.Open();

                string strSelect = "SELECT " +
                    "(SELECT COUNT(*) FROM Products) AS ProductsCount," +
                    "(SELECT SUM(TotalAmount) FROM Orders) AS Sales," +
                    "(SELECT COUNT(*) FROM Refund) AS RefundsCount," +
                    "(SELECT COUNT(*) FROM Orders) AS OrdersCount," +
                    "(SELECT COUNT(*) FROM Customers) AS CustomerCount," +
                    "(SELECT COUNT(*) FROM Staffs WHERE RoleID = 'R002') AS StaffsCount," +
                    "(SELECT COUNT(*) FROM Staffs WHERE RoleID = 'R003') AS ManagerCount";
                SqlCommand command = new SqlCommand(strSelect, conn);
                SqlDataReader dr = command.ExecuteReader();

                while (dr.Read())
                {
                    totalProducts = dr.GetInt32(0);
                    totalSales = dr.GetDouble(1);
                    totalRefund = dr.GetInt32(2);
                    totalOrders = dr.GetInt32(3);
                    totalCustomers = dr.GetInt32(4);
                    totalStaffs = dr.GetInt32(5);
                    totalManagers = dr.GetInt32(6);
                }

                totalUsers = totalStaffs + totalManagers + totalCustomers;
                lblProducts.Text = totalProducts.ToString();
                lblOrders.Text = totalOrders.ToString();
                lblSales.Text = "RM" + totalSales.ToString("0.00");
                lblRefund.Text = totalRefund.ToString();
                lblStaff.Text = totalStaffs.ToString();
                lblUsers.Text = totalUsers.ToString();
                lblManager.Text = totalManagers.ToString();
                lblCustomers.Text = totalCustomers.ToString();

                conn.Close();

                conn2 = new SqlConnection(strCon2);
                conn2.Open();

                string strSelect2 = "SELECT OrderDate , SUM(TotalAmount) AS Total FROM Orders GROUP BY OrderDate";
                SqlCommand command2 = new SqlCommand(strSelect2, conn2);
                SqlDataReader dr2 = command2.ExecuteReader();

                while (dr2.Read())
                {
                    labels.Add(dr2.GetDateTime(0).ToString("dd/MM/yyyy"));
                    data.Add(dr2.GetDouble(1));
                }

                var labelsJson = "[" + string.Join(",", labels.Select(l => $"'{l}'")) + "]";
                var dataJson = "[" + string.Join(",", data) + "]";

                var jsCode = $@"
<script>
                            var ctx = document.getElementById('myChart');
                            new Chart(ctx, {{
                                type: 'line',
                                data: {{
                                    labels: {labelsJson},
                                    datasets: [{{
                                        label: 'Sales',
                                        data: {dataJson}
                                    }}]
                                }}
                            }});
                        </script>";

                jsCodeLiteral.Text = jsCode;


                conn2.Close();
            }else
            {
                Response.Redirect("../Login.aspx");
            }
        }
    }
}