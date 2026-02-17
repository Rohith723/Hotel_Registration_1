using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace Hotel_Registration_1
{
    public partial class Hotel_Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserName"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                Label1.Text = "Welcome, " + Session["UserName"].ToString();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // --- Room Type ---
            string RoomType;
            int rent = 0;

            if (RadioButton1.Checked)
            {
                RoomType = RadioButton1.Text;
                rent = 5000;
            }
            else if (RadioButton2.Checked)
            {
                RoomType = RadioButton2.Text;
                rent = 2500;
            }
            else
            {
                Response.Write("<script>alert('Please select a Room Type');</script>");
                return;
            }

            string Amenities = string.Empty;
            int cost = 0;

            if (CheckBox1.Checked)
            {
                Amenities += CheckBox1.Text + ", ";
                cost += 1000;
            }
            if (CheckBox2.Checked)
            {
                Amenities += CheckBox2.Text + ", ";
                cost += 700;
            }

            if (string.IsNullOrEmpty(Amenities))
            {
                Amenities = "None";
            }
            else
            {
                Amenities = Amenities.Trim().TrimEnd(',');
            }

            // --- Dates ---
            DateTime CheckInDate = Convert.ToDateTime(TextBox1.Text);
            DateTime CheckOutDate = Convert.ToDateTime(TextBox2.Text);

            int days = (CheckOutDate - CheckInDate).Days;
            if (days <= 0)
            {
                Response.Write("<script>alert('Check-Out date must be after Check-In date');</script>");
                return;
            }

            int roomTotal = rent * days;
            int Amount = roomTotal + cost;

            string SpecialRequests = TextBox3.Text;

            // --- Insert into DB ---
            using (SqlConnection con = new SqlConnection("data source=.;database=Hotel_Registration;integrated security=true"))
            {
                string query = @"INSERT INTO HotelDetails 
                                 (UserName, CheckInDate, CheckOutDate, RoomType, Amenities, Amount, SpecialRequests)
                                 VALUES (@UserName, @CheckInDate, @CheckOutDate, @RoomType, @Amenities, @Amount, @SpecialRequests)";

                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserName", Session["UserName"].ToString());
                cmd.Parameters.AddWithValue("@CheckInDate", CheckInDate.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@CheckOutDate", CheckOutDate.ToString("yyyy-MM-dd"));
                cmd.Parameters.AddWithValue("@RoomType", RoomType);
                cmd.Parameters.AddWithValue("@Amenities", Amenities);
                cmd.Parameters.AddWithValue("@Amount", Amount);
                cmd.Parameters.AddWithValue("@SpecialRequests", SpecialRequests);

                // --- Execute with try/catch ---
                try
                {
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message + "');</script>");
                    return;
                }
            }

            // --- Save to session for success page ---
            Session["CheckInDate"] = CheckInDate.ToString("dd-MMM-yyyy");
            Session["CheckOutDate"] = CheckOutDate.ToString("dd-MMM-yyyy");
            Session["GuestName"] = Session["UserName"].ToString();

            Response.Redirect("Hotel Registration Success.aspx");
        }
    }
}
