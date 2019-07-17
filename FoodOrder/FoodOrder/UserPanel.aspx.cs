using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
//SetCompanyPoint Hatalı
namespace FoodOrder.FoodOrder
{
    public partial class UserPanel : System.Web.UI.Page
    {
        int totalPrice;
        static string connectionString = "Data Source=EXPER10;Initial Catalog=FoodOrder;Integrated Security=True;MultipleActiveResultSets=True";
        protected void Page_Load(object sender, EventArgs e)
        {
            totalPrice = Convert.ToInt32(Label23.Text);
            if (Page.Request.QueryString["username"] != null)
            {
                Label2.Text = Page.Request.QueryString["username"];
            }
            if (!IsPostBack)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC ListAllCities", connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    cityList.DataSource = reader;
                    cityList.DataTextField = "Name";
                    cityList.DataValueField = "ID";
                    cityList.DataBind();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    DistrictList.Items.Clear();
                    SqlCommand command = new SqlCommand("EXEC ListAllDistrictsWithCity " + cityList.SelectedItem.Value, connection);
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();
                    DistrictList.DataSource = reader;
                    DistrictList.DataTextField = "Name";
                    DistrictList.DataValueField = "ID";
                    DistrictList.DataBind();
                }
            }
            
           
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home.aspx");
        }

        protected void cityList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                DistrictList.Items.Clear();
                SqlCommand command = new SqlCommand("EXEC ListAllDistrictsWithCity " + cityList.SelectedItem.Value, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                DistrictList.DataSource = reader;
                DistrictList.DataTextField = "Name";
                DistrictList.DataValueField = "ID";
                DistrictList.DataBind();
            }

            CompanyList.Items.Clear();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC ShowCompanyOnDistrict " + DistrictList.SelectedItem.Value, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                CompanyList.DataSource = reader;
                CompanyList.DataTextField = "CompanyName";
                CompanyList.DataValueField = "ID";
                CompanyList.DataBind();
            }
        }
        protected void DistrictList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CompanyList.Items.Clear();
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC ShowCompanyOnDistrict " + DistrictList.SelectedItem.Value, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                CompanyList.DataSource = reader;
                CompanyList.DataTextField = "CompanyName";
                CompanyList.DataValueField = "ID";
                CompanyList.DataBind();
            }
        }

        protected void CompanyList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCompanyPoint " + CompanyList.SelectedItem.Value, connection);
                connection.Open();
                Label25.Text = command.ExecuteScalar().ToString();
            }
           
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCompanyFoods " + CompanyList.SelectedItem.Value + ", 'Soups'", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                SoupList.DataSource = reader;
                SoupList.DataTextField = "FoodName";
                SoupList.DataValueField = "ID";
                SoupList.DataBind();
            }
           
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCompanyFoods " + CompanyList.SelectedItem.Value + ", 'Main Foods'", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                MainFoodList.DataSource = reader;
                MainFoodList.DataTextField = "FoodName";
                MainFoodList.DataValueField = "ID";
                MainFoodList.DataBind();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCompanyFoods " + CompanyList.SelectedItem.Value + ", 'Meats'", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                MeatList.DataSource = reader;
                MeatList.DataTextField = "FoodName";
                MeatList.DataValueField = "ID";
                MeatList.DataBind();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCompanyFoods " + CompanyList.SelectedItem.Value + ", 'Salads'", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                SaladList.DataSource = reader;
                SaladList.DataTextField = "FoodName";
                SaladList.DataValueField = "ID";
                SaladList.DataBind();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCompanyFoods " + CompanyList.SelectedItem.Value + ", 'Drinks'", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                DrinkList.DataSource = reader;
                DrinkList.DataTextField = "FoodName";
                DrinkList.DataValueField = "ID";
                DrinkList.DataBind();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetCompanyFoods " + CompanyList.SelectedItem.Value + ", 'Desserts'", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                DessertList.DataSource = reader;
                DessertList.DataTextField = "FoodName";
                DessertList.DataValueField = "ID";
                DessertList.DataBind();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetStartHour " + CompanyList.SelectedItem.Value, connection);
                connection.Open();
                if(command.ExecuteScalar() != null)
                    Label29.Text = command.ExecuteScalar().ToString();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetEndHour " + CompanyList.SelectedItem.Value, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label31.Text = command.ExecuteScalar().ToString();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetMinimumPrice " + CompanyList.SelectedItem.Value, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label33.Text = command.ExecuteScalar().ToString();
            }
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetServiceTime " + CompanyList.SelectedItem.Value, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                    Label35.Text = command.ExecuteScalar().ToString();
            }
        }

        protected void SoupList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetFoodPrice " + SoupList.SelectedItem.Value, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                {
                    Label11.Text = command.ExecuteScalar().ToString();
                }
            }
        }

        protected void MainFoodList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetFoodPrice " + MainFoodList.SelectedItem.Value, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                {
                    Label13.Text = command.ExecuteScalar().ToString();
                }
            }
        }

        protected void MeatList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetFoodPrice " + MeatList.SelectedItem.Value, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                {
                    Label15.Text = command.ExecuteScalar().ToString();
                }
            }
        }

        protected void SaladList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetFoodPrice " + SaladList.SelectedItem.Value, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                {
                    Label17.Text = command.ExecuteScalar().ToString();
                }
            }
        }

        protected void DrinkList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetFoodPrice " + DrinkList.SelectedItem.Value, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                {
                    Label19.Text = command.ExecuteScalar().ToString();
                }
            }
        }

        protected void DessertList_SelectedIndexChanged(object sender, EventArgs e)
        {
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("EXEC GetFoodPrice " + DessertList.SelectedItem.Value, connection);
                connection.Open();
                if (command.ExecuteScalar() != null)
                {
                    Label21.Text = command.ExecuteScalar().ToString();
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (SoupList.SelectedItem != null)
            {
                BasketList.Items.Add(SoupList.SelectedItem);
                totalPrice += Convert.ToInt32(Label11.Text);
                Label23.Text = totalPrice.ToString();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            if (MainFoodList.SelectedItem != null)
            {
                BasketList.Items.Add(MainFoodList.SelectedItem);
                totalPrice += Convert.ToInt32(Label13.Text);
                Label23.Text = totalPrice.ToString();

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (MeatList.SelectedItem != null)
            {
                BasketList.Items.Add(MeatList.SelectedItem);
                totalPrice += Convert.ToInt32(Label15.Text);
                Label23.Text = totalPrice.ToString();

            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            if (SaladList.SelectedItem != null)
            {
                BasketList.Items.Add(SaladList.SelectedItem);
                totalPrice += Convert.ToInt32(Label17.Text);
                Label23.Text = totalPrice.ToString();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            if (DrinkList.SelectedItem != null)
            {
                BasketList.Items.Add(DrinkList.SelectedItem);
                totalPrice += Convert.ToInt32(Label19.Text);
                Label23.Text = totalPrice.ToString();
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            if (DessertList.SelectedItem != null)
            {
                BasketList.Items.Add(DessertList.SelectedItem);
                totalPrice += Convert.ToInt32(Label21.Text);
                Label23.Text = totalPrice.ToString();
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {

            if (BasketList.SelectedItem != null)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC GetFoodPrice " + BasketList.SelectedItem.Value, connection);
                    connection.Open();
                    if (command.ExecuteScalar() != null)
                    {
                        totalPrice -= Convert.ToInt32(command.ExecuteScalar());
                        Label23.Text = totalPrice.ToString();
                    }
                }
                BasketList.Items.Remove(BasketList.SelectedItem);
            }
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            if (BasketList.Items.Count > 0 && Convert.ToInt32(Label23.Text) > Convert.ToInt32(Label33.Text))
            {
                BasketList.Items.Clear();
                totalPrice = 0;
                Label23.Text = totalPrice.ToString();
                Label26.Text = "Purchase was Successful!";
                Label26.Visible = true;
                Button10.Visible = true;

            }
            else
            {
                Label26.Visible = true;
                Label26.Text = "Please add more items to the basket!";
            }
        }

        protected void Button10_Click(object sender, EventArgs e)
        {
            if (RadioButton1.Checked)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC IncreaseReview " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC SetCompanyPoint " + CompanyList.SelectedItem.Value + "," + 1, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                Label27.Text = "Submitted.";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC GetCompanyPoint " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    Label25.Text = command.ExecuteScalar().ToString();
                }
                Label26.Visible = false;
                Button10.Visible = false;
            }
            else if (RadioButton2.Checked)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC IncreaseReview " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC SetCompanyPoint " + CompanyList.SelectedItem.Value + "," + 2, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                Label27.Text = "Submitted.";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC GetCompanyPoint " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    Label25.Text = command.ExecuteScalar().ToString();
                }
                Label26.Visible = false;
                Button10.Visible = false;
            }
            else if (RadioButton3.Checked)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC IncreaseReview " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC SetCompanyPoint " + CompanyList.SelectedItem.Value + "," + 3, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                Label27.Text = "Submitted.";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC GetCompanyPoint " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    Label25.Text = command.ExecuteScalar().ToString();
                }
                Label26.Visible = false;
                Button10.Visible = false;
            }
            else if (RadioButton4.Checked)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC IncreaseReview " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC SetCompanyPoint " + CompanyList.SelectedItem.Value + "," + 4, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                Label27.Text = "Submitted.";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC GetCompanyPoint " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    Label25.Text = command.ExecuteScalar().ToString();
                }
                Label26.Visible = false;
                Button10.Visible = false;
            }
            else if (RadioButton5.Checked)
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC IncreaseReview " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC SetCompanyPoint " + CompanyList.SelectedItem.Value + "," + 5, connection);
                    connection.Open();
                    command.ExecuteReader();
                }
                Label27.Text = "Submitted.";
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("EXEC GetCompanyPoint " + CompanyList.SelectedItem.Value, connection);
                    connection.Open();
                    Label25.Text = command.ExecuteScalar().ToString();
                }
                Label26.Visible = false;
                Button10.Visible = false;
            }
            else
            {

                Label27.Text = "Please choose an option first!";
            }
        }
    }
}