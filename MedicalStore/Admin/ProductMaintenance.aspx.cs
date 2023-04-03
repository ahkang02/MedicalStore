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
        string imageRename, imageSave;
        string date = DateTime.Now.ToString("dd/MM/yy"); // includes leading zeros

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            imageRename=ProductMaintenance.GetRandomEncryptedText(10).ToString();    
            fuProduct.SaveAs(Request.PhysicalApplicationPath + "./images/" + fuProduct.FileName.ToString());

            imageSave = "./images/" + imageRename + fuProduct.FileName.ToString();

            con.Open();
            SqlCommand cmd = con.CreateCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = "insert into Products values('"+txtID.Text+"','"+txtName.Text+"','"+txtDescription.Text+"','"+txtType.Text+"',"+txtPrice.Text+ ",CURRENT_TIMESTAMP,'"+imageSave.ToString()+"','"+ddlManufacturer.SelectedItem.Value+"')";
            cmd.ExecuteNonQuery();
            con.Close();
        }

        public static string GetRandomEncryptedText(int length)
        {
            char[] chars = "abcdefghijklmnopqrstuvwxyz123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".ToCharArray();
            string password = string.Empty;
            Random random = new Random();

            for (int i = 0; i < length; i++)
            {
                int x = random.Next(1, chars.Length);
                if (!password.Contains(chars.GetValue(x).ToString()))
                    password += chars.GetValue(x);
                else
                    i = i - 1;
            }
            return password;
        }
    }
}