using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

//ProductID , Name , Description , Type , Price , AddedDate , ImageName , ManufacturerID

namespace MedicalStore
{
    public partial class ProductMaintenance : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=C:\Users\User\Documents\GitHub\MedicalStore\MedicalStore\App_Data\MedicalStore.mdf;Integrated Security=True");
        string imageNameSave;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {   
            fuProduct.SaveAs(Request.PhysicalApplicationPath + @"\Images\ProductImg\" + fuProduct.FileName.ToString());

            imageNameSave = fuProduct.FileName.ToString();

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into Products values('"+txtID.Text+"','"+txtName.Text+"','"+txtDescription.Text+"','"+txtType.Text+"',"+txtPrice.Text+ ",CURRENT_TIMESTAMP,'"+ imageNameSave.ToString()+"','"+ddlManufacturer.SelectedItem.Value+"')";
            cmd.ExecuteNonQuery();
            con.Close();
        }

       
    }
}