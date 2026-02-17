using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hotel_Registration_1
{
    public partial class Hotel_Registration_Success : System.Web.UI.Page
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
                Label1.Text = Session["GuestName"] != null ? Session["GuestName"].ToString() : "Guest";
                Label2.Text = Session["CheckInDate"] != null ? Session["CheckInDate"].ToString() : "N/A";
                Label3.Text = Session["CheckOutDate"] != null ? Session["CheckOutDate"].ToString() : "N/A";
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Hotel Details.aspx");
        }
    }
}