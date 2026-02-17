using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Registration_1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("User Registration.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string UserName = TextBox1.Text;
            string Password = TextBox2.Text;
            SqlConnection con= new SqlConnection("data source=.; database=Hotel_Registration; integrated security=true");
            string query = "SELECT COUNT(*) FROM UserRegistration WHERE UserName=@UserName AND Password=@Password";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@UserName", UserName);
            cmd.Parameters.AddWithValue("@Password", Password);
            con.Open();
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            con.Close();

            if(count==1)
            {
                Session["UserName"] = UserName;
                Response.Redirect("User Details.aspx");
            }
            else
            {
                Response.Write("<script>alert('Invalid user name and password');</script>");
            }
        }
    }
}