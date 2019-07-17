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
                GetCategories();
                GetMenu();
            }
            GetDetails();
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
            if (ListBox1.SelectedItem != null && !string.IsNullOrWhiteSpace(TextBox2.Text))
            {
                Label7.Visible = false;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC UpdateFoodName " + ListBox1.SelectedItem.Value + ",'" + TextBox2.Text + "'", connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                GetMenu();

            }
            else
            {
                Label7.Text = "Please Select an Item to Update it's name!";
                Label7.Visible = true;
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem != null)
            {
                Label7.Visible = false;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC DeleteFood " + ListBox1.SelectedItem.Value, connection);
                    connection.Open();
                    command.ExecuteReader();
                    GetMenu();
                }
            }
            else
            {
                Label7.Text = "Please Select an Item to Delete!";
                Label7.Visible = true;
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
            if (ListBox1.SelectedItem != null && !string.IsNullOrWhiteSpace(TextBox1.Text))
            {
                Label7.Visible = false;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC UpdateFoodPrice " + ListBox1.SelectedItem.Value + "," + Convert.ToInt32(TextBox1.Text), connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                GetMenu();
            }
            else
            {
                Label7.Text = "Please Select an Item to Update it's Price!";
                Label7.Visible = true;
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (ListBox1.SelectedItem != null && DropDownList2.SelectedItem != null)
            {
                Label7.Visible = false;
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC UpdateFoodType " + ListBox1.SelectedItem.Value + ",'" + DropDownList2.SelectedItem.Text + "'", connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                GetMenu();
            }
            else
            {
                Label7.Text = "Please Select an Item to Update it's Type!";
                Label7.Visible = true;
            }
        }
        private void GetCategories()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCategories", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                DropDownList1.DataSource = reader;
                DropDownList1.DataValueField = "ID";
                DropDownList1.DataTextField = "Name";
                DropDownList1.DataBind();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCategories", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                DropDownList2.DataSource = reader;
                DropDownList2.DataValueField = "ID";
                DropDownList2.DataTextField = "Name";
                DropDownList2.DataBind();
            }
            DropDownList1.Items.FindByText("Soups").Selected = true;
            DropDownList2.Items.FindByText("Soups").Selected = true;
        }
        protected void Button7_Click(object sender, EventArgs e)
        {

        }

        private void GetDetails()
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetStartHour " + companyID, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label9.Text = command.ExecuteScalar().ToString();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetEndHour " + companyID, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label11.Text = command.ExecuteScalar().ToString();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetMinimumPrice " + companyID, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label15.Text = command.ExecuteScalar().ToString();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetServiceTime " + companyID, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label13.Text = command.ExecuteScalar().ToString();
            }


        }

        protected void Button7_Click1(object sender, EventArgs e)
        {
            GetCompanyID();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC UpdateWorkHours " + companyID + "," + Convert.ToInt32( DropDownList3.SelectedItem.Value) + "," + Convert.ToInt32(DropDownList4.SelectedItem.Value), connection);
                connection.Open();
                command.ExecuteReader();
            }

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetStartHour " + companyID, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label9.Text = command.ExecuteScalar().ToString();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetEndHour " + companyID, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label11.Text = command.ExecuteScalar().ToString();
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            GetCompanyID();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC UpdateServiceTime " + companyID + "," + Convert.ToInt32(DropDownList5.SelectedItem.Value), connection);
                connection.Open();
                command.ExecuteReader();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetServiceTime " + companyID, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label13.Text = command.ExecuteScalar().ToString();
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            GetCompanyID();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC UpdateMinimumPrice " + companyID + "," + Convert.ToInt32(DropDownList6.SelectedItem.Value), connection);
                connection.Open();
                command.ExecuteReader();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetMinimumPrice " + companyID, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label15.Text = command.ExecuteScalar().ToString();
            }
        }

        private void GetCompanyID() 
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCompanyIDFromUserName '" + CompanyNameLabel.Text + "'", connection);
                connection.Open();
                companyID = ((int)command.ExecuteScalar());
            }
        
        }
    }
}