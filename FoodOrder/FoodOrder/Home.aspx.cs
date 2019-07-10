using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


//Company,User signup webform
//Admin signup, required on specific button click
//clear fields buggy
//menu for company

namespace FoodOrder.FoodOrder
{
    public partial class Home : System.Web.UI.Page
    {
        static string connectionString = "Data Source=EXPER10;Initial Catalog=FoodOrder;Integrated Security=True";
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void AdminLoginButton_Click(object sender, EventArgs e)
        {
            Label3.Visible = false;
            if (AdminLoginTextBox.Text != "" && AdminPasswordTextBox.Text != "")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC checkLogin '" + AdminLoginTextBox.Text +
                        "'," + AdminPasswordTextBox.Text, connection);
                    connection.Open();
                    if (command.ExecuteScalar() != null)
                    {
                        SqlCommand command2 = new SqlCommand("EXEC FindAdminOrNot '" + AdminLoginTextBox.Text + "'", connection);
                        Label3.Visible = true;
                        switch (command2.ExecuteScalar().ToString())
                        {
                            case "True":
                                Page.Response.Redirect("AdminHome.aspx?text=" + AdminLoginTextBox.Text);
                                break;
                            case "False":
                                Label3.Visible=true;
                                Label3.Text = "You need to be approved first to login!Please wait for the confirmation.";
                                break;
                            default:
                                break;
                        }                       
                    }
                    else
                    {
                        Label3.Visible = true;
                        Label3.Text = "You Entered a Wrong Username or Password!";
                    }
                }
            }
            else
            {
                Label3.Visible = true;
                Label3.Text = "Fill the required areas";
            }
        }

        protected void AdminSignUpButton_Click(object sender, EventArgs e)
        {
            MultiView2.SetActiveView(AdminSignUp);
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC ListAllCities", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                signupcitylist.DataSource = reader;
                signupcitylist.DataTextField = "Name";
                signupcitylist.DataValueField = "ID";
                signupcitylist.DataBind();
            }


        }

        protected void AdminButton_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(AdminView);
        }

        protected void CompanyButton_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(CompanyView);
        }

        protected void UserButton_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(UserView);
        }
        protected void CompanyLoginButton_Click(object sender, EventArgs e)
        {

        }
        protected void CompanySignUpButton_Click(object sender, EventArgs e)
        {
            MultiView2.SetActiveView(CompanySignUp);
        }

        protected void UserLoginButton_Click(object sender, EventArgs e)
        {

        }

        protected void UserSignUpButton_Click(object sender, EventArgs e)
        {
            MultiView2.SetActiveView(UserSignUp);
        }

        protected void JoinUs_Click(object sender, EventArgs e)
        {
            if(signupcitylist.SelectedValue != "-1" && signupdistrictlist.SelectedValue != "-1"){
                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    SqlCommand command = new SqlCommand("EXEC CheckUsername '" + adminsignupusername.Text + "'", connection);
                    connection.Open();
                    if (command.ExecuteScalar() == null)
                    {
                        Admindublicatelabel.Visible = false;

                        SqlCommand command2 = new SqlCommand("EXEC InsertUser '" + adminsignupusername.Text + "','" + adminsignuppassword1.Text + "',"
                            + signupcitylist.SelectedItem.Value + "," + signupdistrictlist.SelectedItem.Value + ",'" + adminemailtextbox1.Text + "','" +
                        adminphonetextbox.Text + "'," + 1 + "," + 0,connection);
                        command2.ExecuteReader();
                        ClearFields();
                    }
                    else
                    {
                        Admindublicatelabel.Visible = true;
                    }
                }
            }
        }
        private void ClearFields()
        {
            Admindublicatelabel.Visible = false;
            adminsignupusername.Text = "";
            adminsignuppassword1.Text = "";
            adminsignuppassword2.Text = "";
            adminemailtextbox1.Text = "";
            adminemailtextbox2.Text = "";
            adminphonetextbox.Text = "";
            signupcitylist.SelectedIndex = -1;
            signupdistrictlist.SelectedIndex = -1;


        }

        protected void signupcitylist_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                signupdistrictlist.Items.Clear();
                SqlCommand command = new SqlCommand("EXEC ListAllDistrictsWithCity " + signupcitylist.SelectedItem.Value, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                signupdistrictlist.DataSource = reader;
                signupdistrictlist.DataTextField = "Name";
                signupdistrictlist.DataValueField = "ID";
                signupdistrictlist.DataBind();
            }
        }

        
    }
}