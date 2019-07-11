using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


namespace FoodOrder.FoodOrder
{
    public partial class CompanyPanel : System.Web.UI.Page
    {
        static string connectionString = "Data Source=EXPER10;Initial Catalog=FoodOrder;Integrated Security=True;MultipleActiveResultSets=True";
        int companyID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.Request.QueryString["username"] != null)
            {
                CompanyNameLabel.Text = Page.Request.QueryString["username"];
            }
            if (!IsPostBack)
            {
                GetMenu();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetFoodPrice " + ListBox1.SelectedItem.Value, connection);
                connection.Open();
                TextBox1.Text = command.ExecuteScalar().ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC UpdateFoodName " + ListBox1.SelectedItem.Value + ",'" + TextBox2.Text + "'", connection);
                connection.Open();
                command.ExecuteReader();
            }
            GetMenu();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC DeleteFood " + ListBox1.SelectedItem.Value, connection);
                connection.Open();
                command.ExecuteReader();
                GetMenu();
            }
        }



        private void GetMenu()
        {
            ListBox1.Items.Clear();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCompanyIDFromUserName '" + CompanyNameLabel.Text + "'", connection);
                connection.Open();
                companyID = ((int)command.ExecuteScalar());
                SqlCommand command2 = new SqlCommand("EXEC GetCompanyFoods " + companyID + ",'" + DropDownList1.SelectedItem.Text + "'", connection);
                
                SqlDataReader reader = command2.ExecuteReader();
                if (reader != null)
                {
                    ListBox1.DataSource = reader;
                    ListBox1.DataValueField = "ID";
                    ListBox1.DataTextField = "FoodName";
                    ListBox1.DataBind();
                }
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            GetMenu();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC InsertCompanyFood '" + TextBox2.Text + "'," + TextBox1.Text + ",'" + DropDownList2.SelectedItem.Text + "'," + companyID, connection);
                connection.Open();
                command.ExecuteReader();
                
            }
            GetMenu();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GetMenu();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC UpdateFoodPrice " + ListBox1.SelectedItem.Value + "," + Convert.ToInt32(TextBox1.Text), connection);
                connection.Open();
                command.ExecuteReader();
            }
            GetMenu();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC UpdateFoodType " + ListBox1.SelectedItem.Value + ",'" + DropDownList2.SelectedItem.Text + "'", connection);
                connection.Open();
                command.ExecuteReader();
            }
            GetMenu();
        }

        protected void Button7_Click(object sender, EventArgs e)
        {

        }

       
    }
}