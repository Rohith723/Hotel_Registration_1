using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Registration_1
{
    public partial class User_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"]==null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            if (!IsPostBack)
            {
                GetData();
            }
        }
        private void GetData()
        {
                 string UserName= Session["UserName"].ToString();
                 SqlConnection con = new SqlConnection("data source=.; database=Hotel_Registration; integrated security=true");
                 string query= "SELECT * FROM UserRegistration WHERE UserName=@UserName";
                 SqlCommand cmd = new SqlCommand(query, con);
                 cmd.Parameters.AddWithValue("@UserName", UserName);
                 SqlDataAdapter da = new SqlDataAdapter(cmd);
                 DataTable dt = new DataTable();
                 da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string userName = GridView1.DataKeys[e.RowIndex].Value.ToString();

            SqlConnection con = new SqlConnection("data source=.; database=Hotel_Registration; integrated security=true");
            con.Open();

            SqlCommand cmd = new SqlCommand("DELETE FROM UserRegistration WHERE UserName=@UserName", con);
            cmd.Parameters.AddWithValue("@UserName", userName);
            cmd.ExecuteNonQuery();

            con.Close();
            GetData();
        }
    

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GetData();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridView1.Rows[e.RowIndex];

            string userName = GridView1.DataKeys[e.RowIndex].Value.ToString();
            string Email = ((TextBox)row.FindControl("TextBox5")).Text;
            string PhoneNumber = ((TextBox)row.FindControl("TextBox6")).Text;

            SqlConnection con = new SqlConnection("data source=.; database=Hotel_Registration; integrated security=true");
            con.Open();

            SqlCommand cmd = new SqlCommand(
                "UPDATE UserRegistration SET Email=@Email, PhoneNumber=@PhoneNumber WHERE UserName=@UserName", con);

            cmd.Parameters.AddWithValue("@Email", Email);
            cmd.Parameters.AddWithValue("@PhoneNumber", PhoneNumber);
            cmd.Parameters.AddWithValue("@UserName", userName);

            cmd.ExecuteNonQuery();
            con.Close();

            GridView1.EditIndex = -1;
            GetData();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            GetData();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GetData();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Hotel Registration.aspx");
        }
    }
}