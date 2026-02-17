using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Registration_1
{
    public partial class User_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string FirstName = string.Empty, LastName = string.Empty, UserName = string.Empty, Gender = string.Empty, Email = string.Empty, PhoneNumber = string.Empty, Country = string.Empty, Address = string.Empty, Password = string.Empty, ConfirmPassword = string.Empty, LanguagesKnown = string.Empty;
            int Age = Convert.ToInt32(TextBox4.Text);
            FirstName = TextBox1.Text;
            LastName = TextBox2.Text;
            UserName = TextBox3.Text;
            if (RadioButton1.Checked == true)
            {
                Gender = RadioButton1.Text;
            }
            else if (RadioButton2.Checked == true)
            {
                Gender = RadioButton2.Text;
            }
            if (RadioButton3.Checked == true)
            {
                Gender = RadioButton3.Text;
            }
            Email = TextBox5.Text;
            PhoneNumber = TextBox6.Text;
            Country = DropDownList1.SelectedItem.Text;
            Address = TextBox7.Text;
            Password = TextBox8.Text;
            ConfirmPassword = TextBox9.Text;
            if (CheckBox1.Checked == true)
            {
                LanguagesKnown += CheckBox1.Text + " , ";
            }
            if (CheckBox2.Checked == true)
            {
                LanguagesKnown += CheckBox2.Text + " , ";
            }
            if (CheckBox3.Checked == true)
            {
                LanguagesKnown += CheckBox3.Text;
            }
            LanguagesKnown= LanguagesKnown.TrimEnd(',', ' ');

            string query = "INSERT INTO UserRegistration(FirstName,LastName,UserName,Age,Gender,Email,PhoneNumber,Country,Address,Password,ConfirmPassword,LanguagesKnown) values(@FirstName,@LastName,@UserName,@Age,@Gender,@Email,@PhoneNumber,@Country,@Address,@Password,@ConfirmPassword,@LanguagesKnown)";
            SqlConnection con = new SqlConnection("data source=.; database=Hotel_Registration; integrated security=true");
            con.Open();
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@FirstName", FirstName);
            cmd.Parameters.AddWithValue("@LastName", LastName);
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@Age", Age);
            cmd.Parameters.AddWithValue("@Gender", Gender);
            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
            cmd.Parameters.AddWithValue("@Country", Country);
            cmd.Parameters.AddWithValue("@Address", Address);
            cmd.Parameters.AddWithValue("@Password", Password);
            cmd.Parameters.AddWithValue("@ConfirmPassword",ConfirmPassword);
            cmd.Parameters.AddWithValue("@LanguagesKnown", LanguagesKnown);
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("User Registration Success.aspx");
        }
    }
}