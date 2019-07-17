using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace FoodOrder
{//You can add or delete category from admin panel but
 //the companies need to change their page depending on the categories.
    public partial class AdminHome : System.Web.UI.Page
    {
        static string connectionString = "Data Source=EXPER10;Initial Catalog=FoodOrder;Integrated Security=True;MultipleActiveResultSets=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.Request.QueryString["username"] != null)
            {
                usernameLabel.Text = Page.Request.QueryString["username"];
            }
            if (!IsPostBack)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC ListAllCities", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    CityList.DataSource = reader;
                    CityList.DataTextField = "Name";
                    CityList.DataValueField = "ID";
                    CityList.DataBind();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    DistrictList.Items.Clear();
                    SqlCommand command = new SqlCommand("EXEC ListAllDistrictsWithCity " + CityList.SelectedItem.Value, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    DistrictList.DataSource = reader;
                    DistrictList.DataTextField = "Name";
                    DistrictList.DataValueField = "ID";
                    DistrictList.DataBind();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC GetCategories", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    ListBox2.DataSource = reader;
                    ListBox2.DataTextField = "Name";
                    ListBox2.DataValueField = "ID";
                    ListBox2.DataBind();
                }
            }
           


        }

        protected void ListAdminButton_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC listAllAdmin", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                ListBox1.DataSource = reader;
                ListBox1.DataTextField = "Username";
                ListBox1.DataValueField = "ID";
                ListBox1.DataBind();
            }
        }
        protected void ListCompanyButton_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC listAllCompanies", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                ListBox1.DataSource = reader;
                ListBox1.DataTextField = "UserName";
                ListBox1.DataValueField = "ID";
                ListBox1.DataBind();
            }
        }

        protected void ListUserButton_Click(object sender, EventArgs e)
        {
            ListBox1.Items.Clear();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC listAllUsers", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                ListBox1.DataSource = reader;
                ListBox1.DataTextField = "UserName";
                ListBox1.DataValueField = "ID";
                ListBox1.DataBind();
            }
        }

        protected void ShowInfoButton_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem != null)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC showUser " + ListBox1.SelectedItem.Value, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    GridView1.DataSource = reader;
                    GridView1.DataBind();
                }

            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem != null && usernameLabel.Text != ListBox1.SelectedItem.Text)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC DeleteUser " + ListBox1.SelectedValue, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                ListBox1.Items.Remove(ListBox1.SelectedItem);
            }
        }

        protected void AddCityButton_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(CityTextBox.Text))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC InsertCity " + CityTextBox.Text, connection);
                    connection.Open();
                    command.ExecuteReader();
                    CityList.Items.Clear();
                    SqlCommand command2 = new SqlCommand("EXEC ListAllCities", connection);
                    SqlDataReader reader = command2.ExecuteReader();
                    CityList.DataSource = reader;
                    CityList.DataTextField = "Name";
                    CityList.DataValueField = "ID";
                    CityList.DataBind();

                }
                
            }
        }

        protected void DeleteCityButton_Click(object sender, EventArgs e)
        {
            if (CityList.SelectedItem != null)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC DeleteCity " + CityList.SelectedItem.Value, connection);
                    connection.Open();
                    command.ExecuteReader();
                    CityList.Items.Clear();
                    SqlCommand command2 = new SqlCommand("EXEC ListAllCities", connection);
                    SqlDataReader reader = command2.ExecuteReader();
                    CityList.DataSource = reader;
                    CityList.DataTextField = "Name";
                    CityList.DataValueField = "ID";
                    CityList.DataBind();
                }
            }
        }

        protected void CityList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                DistrictList.Items.Clear();
                SqlCommand command = new SqlCommand("EXEC ListAllDistrictsWithCity " + CityList.SelectedItem.Value, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                DistrictList.DataSource = reader;
                DistrictList.DataTextField = "Name";
                DistrictList.DataValueField = "ID";
                DistrictList.DataBind();
            }
        }
        protected void AddDistrictButton_Click(object sender, EventArgs e)
        {

            if (!string.IsNullOrWhiteSpace(DistrictTextBox.Text) && CityList.SelectedIndex != -1)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC InsertDistrict " + DistrictTextBox.Text + "," + CityList.SelectedItem.Value, connection);
                    connection.Open();
                    command.ExecuteReader();
                    DistrictList.Items.Clear();
                    SqlCommand command2 = new SqlCommand("EXEC ListAllDistrictsWithCity " + CityList.SelectedItem.Value, connection);
                    SqlDataReader reader = command2.ExecuteReader();
                    DistrictList.DataSource = reader;
                    DistrictList.DataTextField = "Name";
                    DistrictList.DataValueField = "ID";
                    DistrictList.DataBind();
                }

            }
        }
        protected void DeleteDistrictButton_Click(object sender, EventArgs e)
        {
            if (DistrictList.SelectedItem != null)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC DeleteDistrict " + DistrictList.SelectedItem.Value, connection);
                    connection.Open();
                    command.ExecuteReader();
                    DistrictList.Items.Clear();
                    SqlCommand command2 = new SqlCommand("EXEC ListAllDistrictsWithCity " + CityList.SelectedItem.Value, connection);
                    SqlDataReader reader = command2.ExecuteReader();
                    DistrictList.DataSource = reader;
                    DistrictList.DataTextField = "Name";
                    DistrictList.DataValueField = "ID";
                    DistrictList.DataBind();
                }
            }
        }

        protected void MakeAdminButton_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem != null)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC MakeAdmin " + ListBox1.SelectedItem.Value + ", 1", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                }

            }
        }

        protected void RemoveAdminButton_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem != null)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC MakeAdmin " + ListBox1.SelectedItem.Value + ", 0", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                }

            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (ListBox2.SelectedItem != null)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC DeleteFoodCategory " + ListBox2.SelectedItem.Value, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC GetCategories", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    ListBox2.DataSource = reader;
                    ListBox2.DataTextField = "Name";
                    ListBox2.DataValueField = "ID";
                    ListBox2.DataBind();
                }
            }
                
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC InsertFoodCategory " + TextBox1.Text, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC GetCategories", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    ListBox2.DataSource = reader;
                    ListBox2.DataTextField = "Name";
                    ListBox2.DataValueField = "ID";
                    ListBox2.DataBind();
                }
            }
        }

     

        
    }
}