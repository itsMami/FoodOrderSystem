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
    public partial class Home : System.Web.UI.Page
    {
        static string connectionString = "Data Source=EXPER10;Initial Catalog=FoodOrder;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void loginButton_Click(object sender, EventArgs e)
        {
            if (loginTextBox.Text != "" && passwordTextBox.Text != "")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC checkLogin '" + loginTextBox.Text +
                        "'," + passwordTextBox.Text, connection);
                    connection.Open();
                    if (command.ExecuteScalar() != null)
                    {
                        SqlCommand command2= new SqlCommand("EXEC checkLoginPrivilege '" + loginTextBox.Text + "'",connection);
                        SqlDataReader reader = command2.ExecuteReader();
                        while (reader.Read()) 
                        {
                            switch (reader[0].ToString())
                            {
                                case "1"://Admin Login
                                    Page.Response.Redirect("AdminHome.aspx?text=" + loginTextBox.Text);
                                    break;
                                case "2"://Company Login

                                    break;
                                case "3"://User Login

                                    break;
                                default:
                                    break;
                            }
                        }
                       
                    }
                    else
                    {
                        Label3.Visible = true;
                        Label3.Text = "Wrong";
                    }
                }
            }
            else
            {
                Label3.Visible = true;
                Label3.Text = "Fill the required areas";
            }
        }

        protected void signupButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("SignUp.aspx");
        }
    }
}