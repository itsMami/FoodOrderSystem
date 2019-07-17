using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;


//User signup webform
//clear fields buggy

namespace FoodOrder.FoodOrder
{
    public partial class Home : System.Web.UI.Page
    {
        static string connectionString = "Data Source=EXPER10;Initial Catalog=FoodOrder;Integrated Security=True;MultipleActiveResultSets=True";
        static string password;
        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (password != null)
            {
                companysignuppassword1.Attributes.Add("value", password);
                companysignuppassword2.Attributes.Add("value", password);
            }
        }

        protected void AdminLoginButton_Click(object sender, EventArgs e)
        {
            Label3.Visible = false;
            if (AdminLoginTextBox.Text != "" && AdminPasswordTextBox.Text != "")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC checkLogin '" + AdminLoginTextBox.Text +
                        "'," + AdminPasswordTextBox.Text + "," + 1, connection);
                    connection.Open();
                    if (command.ExecuteScalar() != null)
                    {
                        SqlCommand command2 = new SqlCommand("EXEC FindAdminOrNot '" + AdminLoginTextBox.Text + "'", connection);
                        Label3.Visible = true;
                        switch (command2.ExecuteScalar().ToString())
                        {
                            case "True":
                                Page.Response.Redirect("AdminHome.aspx?username=" + AdminLoginTextBox.Text);
                                break;
                            case "False":
                                Label3.Visible=true;
                                Label3.Text = "You need to be approved first to login! Please wait for the confirmation.";
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
            if (MultiView2.GetActiveView() == AdminSignUp)
                MultiView2.SetActiveView(emptyView);
            else
            {
                MultiView2.SetActiveView(AdminSignUp);
            }
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
            if (MultiView2.ActiveViewIndex != 0)
                Label39.Text = "𝕊𝕀𝔾ℕ 𝕌ℙ";
            else
            {
                Label39.Text = "𝔸𝔹𝕆𝕌𝕋 𝕌𝕊";
            }
        }

        protected void AdminButton_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(AdminView);
            MultiView2.SetActiveView(emptyView);
        }

        protected void CompanyButton_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(CompanyView);
            MultiView2.SetActiveView(emptyView);
        }

        protected void UserButton_Click(object sender, EventArgs e)
        {
            MultiView1.SetActiveView(UserView);
            MultiView2.SetActiveView(emptyView);
        }
        protected void CompanyLoginButton_Click(object sender, EventArgs e)
        {
            Label6.Visible = false;
            if (CompanyLoginTextBox.Text != "" && CompanyPasswordTextBox.Text != "")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC checkLogin '" + CompanyLoginTextBox.Text +
                        "'," + CompanyPasswordTextBox.Text + "," + 2, connection);
                    connection.Open();
                    if (command.ExecuteScalar() != null)
                    {
                        Page.Response.Redirect("CompanyPanel.aspx?username=" + CompanyLoginTextBox.Text);
                    }
                    else
                    {
                        Label6.Visible = true;
                        Label6.Text = "You Entered a Wrong Username or Password!";
                    }
                }
            }
            else
            {
                Label6.Visible = true;
                Label6.Text = "Fill the required areas";
            }
        }
        protected void CompanySignUpButton_Click(object sender, EventArgs e)
        {
            if (MultiView2.GetActiveView() == CompanySignUp)
                MultiView2.SetActiveView(emptyView);
            else
            {
                MultiView2.SetActiveView(CompanySignUp);
            } 
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC ListAllCities", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                companyCityList.DataSource = reader;
                companyCityList.DataTextField = "Name";
                companyCityList.DataValueField = "ID";
                companyCityList.DataBind();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                CompanyDistrictList.Items.Clear();
                SqlCommand command = new SqlCommand("EXEC ListAllDistrictsWithCity " + companyCityList.SelectedItem.Value, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                CompanyDistrictList.DataSource = reader;
                CompanyDistrictList.DataTextField = "Name";
                CompanyDistrictList.DataValueField = "ID";
                CompanyDistrictList.DataBind();
            }
            if (MultiView2.ActiveViewIndex != 0)
                Label39.Text = "𝕊𝕀𝔾ℕ 𝕌ℙ";
            else
            {
                Label39.Text = "𝔸𝔹𝕆𝕌𝕋 𝕌𝕊";
            }
        }

        protected void UserLoginButton_Click(object sender, EventArgs e)
        {
            Label9.Visible = false;
            if (UserLoginTextBox.Text != "" && UserPasswordTextBox.Text != "")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC checkLogin '" + UserLoginTextBox.Text +
                        "'," + UserPasswordTextBox.Text + "," + 3, connection);
                    connection.Open();
                    if (command.ExecuteScalar() != null)
                    {
                        Page.Response.Redirect("UserPanel.aspx?username=" + UserLoginTextBox.Text);
                    }
                    else
                    {
                        Label9.Visible = true;
                        Label9.Text = "You Entered a Wrong Username or Password!";
                    }
                }
            }
            else
            {
                Label9.Visible = true;
                Label9.Text = "Fill the required areas";
            }
        }

        protected void UserSignUpButton_Click(object sender, EventArgs e)
        {
            if (MultiView2.GetActiveView() == UserSignUp)
                MultiView2.SetActiveView(emptyView);
            else
            {
                MultiView2.SetActiveView(UserSignUp);
            } 
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC ListAllCities", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                userCityList.DataSource = reader;
                userCityList.DataTextField = "Name";
                userCityList.DataValueField = "ID";
                userCityList.DataBind();
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                UserDistrictList.Items.Clear();
                SqlCommand command = new SqlCommand("EXEC ListAllDistrictsWithCity " + userCityList.SelectedItem.Value, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                UserDistrictList.DataSource = reader;
                UserDistrictList.DataTextField = "Name";
                UserDistrictList.DataValueField = "ID";
                UserDistrictList.DataBind();
            }
            if (MultiView2.ActiveViewIndex != 0)
                Label39.Text = "𝕊𝕀𝔾ℕ 𝕌ℙ";
            else
            {
                Label39.Text = "𝔸𝔹𝕆𝕌𝕋 𝕌𝕊";
            }
        }

        protected void adminJoinUs_Click(object sender, EventArgs e)
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
                    else
                    {
                        Admindublicatelabel.Visible = true;
                    }
                }
            }
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
            companysignuppassword1.Attributes.Add("value", password);
            companysignuppassword2.Attributes.Add("value", password);
        }

        protected void companyNextPage_Click(object sender, EventArgs e)
        {
            MultiView2.SetActiveView(CompanyInformation);
            password = companysignuppassword1.Text;
            companysignuppassword1.Attributes.Add("value", password);
            companysignuppassword2.Attributes.Add("value", password);
        }

        protected void companymenubutton_Click(object sender, EventArgs e)
        {
            companysignuppassword1.Attributes.Add("value", password);
            companysignuppassword2.Attributes.Add("value", password);
            if (companyCityList.SelectedValue != "-1" && CompanyDistrictList.SelectedValue != "-1")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {

                    SqlCommand command = new SqlCommand("EXEC CheckUsername '" + companysignupusername.Text + "'", connection);
                    connection.Open();
                    if (command.ExecuteScalar() == null)
                    {
                        companyDublicateLabel.Visible = false;

                        SqlCommand command2 = new SqlCommand("EXEC InsertUser '" + companysignupusername.Text + "','" + password + "',"
                            + companyCityList.SelectedItem.Value + "," + CompanyDistrictList.SelectedItem.Value + ",'" + companysignupemail1.Text + "','" +
                        companysignupphone.Text + "'," + 2 + "," + 0, connection);
                        command2.ExecuteReader();

                        SqlCommand command3 = new SqlCommand("EXEC showIDbyUsername " + companysignupusername.Text, connection);
                       
                        int userID = ((int)command3.ExecuteScalar());

                        SqlCommand command4 = new SqlCommand("EXEC InsertCompany '" + companyinformationname.Text + "'," + userID + ",'" + companysignupemail1.Text + "'," + companysignupphone.Text + "," + CompanyDistrictList.SelectedItem.Value + 
                         "," + Convert.ToInt32(workstartlist.SelectedValue) + "," + Convert.ToInt32(workendlist.SelectedValue) + "," + Convert.ToInt32(companyservicetime.SelectedValue) + "," + Convert.ToInt32(companyminprice.SelectedValue) + "," + 0,connection);
                        command4.ExecuteReader();


                    }
                    else
                    {
                        companyDublicateLabel.Visible = true;
                    }
                }
            }
        }

        protected void companyCityList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                CompanyDistrictList.Items.Clear();
                SqlCommand command = new SqlCommand("EXEC ListAllDistrictsWithCity " + companyCityList.SelectedItem.Value, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                CompanyDistrictList.DataSource = reader;
                CompanyDistrictList.DataTextField = "Name";
                CompanyDistrictList.DataValueField = "ID";
                CompanyDistrictList.DataBind();
            }


            companysignuppassword1.Attributes.Add("value", password);
            companysignuppassword2.Attributes.Add("value", password);
        }

        protected void prevpage_Click(object sender, EventArgs e)
        {
            MultiView2.SetActiveView(CompanySignUp);
            companysignuppassword1.Attributes.Add("value", password);
            companysignuppassword2.Attributes.Add("value", password);
        }

        protected void CompanyDistrictList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }

        protected void userSignUpClick(object sender, EventArgs e)
        {
            if (userCityList.SelectedValue != "-1" && UserDistrictList.SelectedValue != "-1")
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    
                    SqlCommand command = new SqlCommand("EXEC CheckUsername '" + usersignupusername.Text + "'", connection);
                    connection.Open();
                    if (command.ExecuteScalar() == null)
                    {
                        userDublicateLabel.Visible = false;

                        SqlCommand command2 = new SqlCommand("EXEC InsertUser '" + usersignupusername.Text + "','" + usersignuppassword1.Text + "',"
                            + userCityList.SelectedItem.Value + "," + UserDistrictList.SelectedItem.Value + ",'" + usersignupemail1.Text + "','" +
                        usersignupphone.Text + "'," + 3 + "," + 0, connection);
                        command2.ExecuteReader();

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
                    else
                    {
                        userDublicateLabel.Visible = true;
                    }
                }
            }
        }

        protected void UserCityList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                UserDistrictList.Items.Clear();
                SqlCommand command = new SqlCommand("EXEC ListAllDistrictsWithCity " + userCityList.SelectedItem.Value, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                UserDistrictList.DataSource = reader;
                UserDistrictList.DataTextField = "Name";
                UserDistrictList.DataValueField = "ID";
                UserDistrictList.DataBind();
            }
           
        }

        
    }
}