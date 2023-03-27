using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedicalStore.Admin
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add(new System.Data.DataColumn("DummyColum1", typeof(String)));

            dr = dt.NewRow();
            dr[0] = "A dummy Data";  //Adds the Dummy Data in the Row
            dt.Rows.Add(dr);


            // Show the DataTable values in the GridView

            GridView1.DataSource = dt;
            GridView1.DataBind();

        }

        protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
        {

        }
    }
}