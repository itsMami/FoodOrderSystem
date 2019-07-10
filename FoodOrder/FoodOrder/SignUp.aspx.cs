using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace FoodOrder.FoodOrder
{
    public partial class SignUp : System.Web.UI.Page
    {
        static string connectionString = "Data Source=EXPER10;Initial Catalog=FoodOrder;Integrated Security=True";
       
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC ShowAllPrivileges", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    membershipList.DataSource = reader;
                    membershipList.DataValueField = "ID";
                    membershipList.DataTextField = "Privilege";
                    membershipList.DataBind();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC InsertUser '" + usernameTextBox.Text + "','"
                  + passwordTextBox1.Text+ "','" + emailTextBox.Text + "','" +phoneTextBox.Text 
                  + "'," + membershipList.SelectedValue, connection);
                connection.Open();
                command.ExecuteReader();
                Response.Redirect("Home.aspx");
                
            }
           
        }
    }
}