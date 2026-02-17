using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Registration_1
{
    public partial class Hotel_Details : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Hotel Registration.aspx");
                return;
            }
            if (!IsPostBack)
            {
                LoadGrid();
                LoadLableWelcome();
            }
        }
        void LoadGrid()
        {
            using (SqlConnection con = new SqlConnection("data source=.;database=Hotel_Registration;integrated security=true"))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT HotelId, UserName, RoomType, Amenities, Amount, CheckInDate, CheckOutDate, SpecialRequests FROM HotelDetails WHERE UserName = @UserName", con);

                da.SelectCommand.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());

                DataTable dt = new DataTable();
                da.Fill(dt);

                GridView1.DataSource = dt;
                GridView1.DataBind();

                Repeater1.DataSource = dt;
                Repeater1.DataBind();

                // Total
                int total = 0;
                foreach (DataRow r in dt.Rows)
                {
                    total += Convert.ToInt32(r["Amount"]);
                }
               Label2.Text = total.ToString();
            }
        }
        void LoadLableWelcome()
        {
            Label1.Text = "Welcome " + Session["UserName"].ToString();
        }
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string user = Session["UserName"].ToString();
            DateTime checkIn = Convert.ToDateTime(GridView1.DataKeys[e.RowIndex].Value);

            SqlConnection con = new SqlConnection("data source=.;database=Hotel_Registration;integrated security=true");

            SqlCommand cmd = new SqlCommand(
                "DELETE FROM HotelDetails WHERE UserName=@UserName AND CheckInDate=@CheckIn", con);

            cmd.Parameters.AddWithValue("@UserName", user);
            cmd.Parameters.AddWithValue("@CheckIn", checkIn);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            LoadGrid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            LoadGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            string user = Session["UserName"].ToString();

            // Use DataKey to get CheckInDate
            DateTime checkIn = Convert.ToDateTime(GridView1.DataKeys[e.RowIndex].Value);

            GridViewRow row = GridView1.Rows[e.RowIndex];

            // Find controls using FindControl
            string checkOut = ((TextBox)row.FindControl("txtCheckOut")).Text;
            string room = ((TextBox)row.FindControl("txtRoom")).Text;
            string amenities = ((TextBox)row.FindControl("txtAmenities")).Text;
            string requests = ((TextBox)row.FindControl("txtRequests")).Text;
            string amount = ((TextBox)row.FindControl("txtAmount")).Text;

            using (SqlConnection con = new SqlConnection("data source=.;database=Hotel_Registration;integrated security=true"))
            {
                SqlCommand cmd = new SqlCommand(
                    @"UPDATE HotelDetails 
              SET CheckOutDate=@CheckOut, RoomType=@Room, Amenities=@Amenities,
                  SpecialRequests=@Requests, Amount=@Amount
              WHERE UserName=@UserName AND CheckInDate=@CheckIn", con);

                cmd.Parameters.AddWithValue("@UserName", user);
                cmd.Parameters.AddWithValue("@CheckIn", checkIn);
                cmd.Parameters.AddWithValue("@CheckOut", checkOut);
                cmd.Parameters.AddWithValue("@Room", room);
                cmd.Parameters.AddWithValue("@Amenities", amenities);
                cmd.Parameters.AddWithValue("@Requests", requests);
                cmd.Parameters.AddWithValue("@Amount", amount);

                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            GridView1.EditIndex = -1; // exit edit mode
            LoadGrid(); // reload data
        }


        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            LoadGrid();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            LoadGrid();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string UserName = Session["UserName"].ToString();

            using (SqlConnection con = new SqlConnection("data source=.;database=Hotel_Registration;integrated security=true"))
            {
                string query = "SELECT * FROM HotelDetails WHERE UserName=@UserName";
                SqlDataAdapter da = new SqlDataAdapter(query, con);
                da.SelectCommand.Parameters.AddWithValue("@UserName", UserName);

                DataTable dt = new DataTable();
                da.Fill(dt);

                int total = 0;
                string bill = $"Hotel Booking Bill for {UserName}\n\n";

                foreach (DataRow r in dt.Rows)
                {
                    bill += $"Check-In: {Convert.ToDateTime(r["CheckInDate"]).ToString("dd-MMM-yyyy")}\n";
                    bill += $"Check-Out: {Convert.ToDateTime(r["CheckOutDate"]).ToString("dd-MMM-yyyy")}\n";
                    bill += $"Room: {r["RoomType"]}\n";
                    bill += $"Amenities: {r["Amenities"]}\n";
                    bill += $"Special Requests: {r["SpecialRequests"]}\n";
                    bill += $"Amount: ₹ {r["Amount"]}\n";
                    bill += "------------------------\n";

                    total += Convert.ToInt32(r["Amount"]);
                }

                bill += $"Total Bill: ₹ {total}\n";

                Response.Clear();
                Response.ContentType = "text/plain";
                Response.AddHeader("content-disposition", "attachment;filename=Bill.txt");
                Response.Write(bill);
                Response.End();
            }
        }

    }
}