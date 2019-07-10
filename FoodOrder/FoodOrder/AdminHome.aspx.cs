using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace FoodOrder
{//gridview css generator
    public partial class AdminHome : System.Web.UI.Page
    {
        static string connectionString = "Data Source=EXPER10;Initial Catalog=FoodOrder;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.Request.QueryString["text"] != null)
            {
                usernameLabel.Text = Page.Request.QueryString["text"];
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
                ListBox1.DataTextField = "UserName";
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
            if (ListBox1.SelectedIndex != -1)
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
            if (ListBox1.SelectedIndex != -1 && usernameLabel.Text != ListBox1.SelectedItem.Text)
            {//You cant delete yourself!
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC DeleteUser " + ListBox1.SelectedValue, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                ListBox1.Items.Remove(ListBox1.SelectedItem);
            }
        }
    }
}