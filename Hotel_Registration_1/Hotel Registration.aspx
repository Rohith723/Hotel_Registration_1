<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Hotel Registration.aspx.cs" Inherits="Hotel_Registration_1.Hotel_Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="max-width:450px;padding:0">
        <!--Header-->
        <div class="text-center py-3 border-bottom">
            <i class="bi bi-chevron float-start ms-3 fs-4"></i>
            <div style="letter-spacing:2px;font-size:13PX;color:#999">REGISTRATION</div>
            <div style="font-family:'Playfair Display';font-style:italic;">Your Luxury Stay</div>
        </div>

        <!--hero Image-->
        <div style="position:relative;">
            <img src="Images/Hotel_Reg_Hero.jpg" class="img-fluid w-100" style="height:250px;object-fit:cover;"/>
            <div style="position:absolute;bottom:20px;left:20px;color:white;">
                <div style="font-size:12px;letter-spacing:2px">WELCOME BACK  <asp:Label ID="Label1" runat="server"></asp:Label></div>
            </div>
        </div>
        <div class="p3">
            <!--Dates-->
            <div style="font-size:12px;letter-spacing:3px;color:#c9a14a;">RESERVATION DATES</div>
            <div class="row mt-2">
                <div class="col-6">
                    <asp:Label ID="Label2" runat="server" Text="Check-In" class="small text-muted"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                </div>
                <div class="col-6">
                    <asp:Label ID="Label3" runat="server" Text="Check-Out" class="small text-muted"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
        </div>
            <!--Accomodation-->

            <div class="mt-4" style="font-size:12px;letter-spacing:3px;color:#c9a14a;">ACCOMMODATIONS</div>
            <div class="border-rounded p-3 mt-2">
                <asp:RadioButton ID="RadioButton1" runat="server" Font-Bold="True" Text="Deluxe"/>
                &nbsp;<p class="small text-muted ms-4">City views, king bedding & premium luxury.</p>
            </div>
            <div class="border-rounded p-3">
                <asp:RadioButton ID="RadioButton2" runat="server" Font-Bold="True" Text="Standard"/>
                &nbsp;<p class="small text-muted ms-4">Elegant comfort with garden views.</p>
            </div>

            <!--Amenities-->
            <div class="mt-4" style="font-size:12px;letter-spacing:3px;color:#c9a14a;">AMENITIES</div>
            <div class="d-flex gap-3 mt-2">
            <div class="form-check">
                <asp:CheckBox ID="CheckBox1" runat="server" CssClass="form-check-input" Text="A/C" />
            </div>
            <div class="form-check">
                <asp:CheckBox ID="CheckBox2" runat="server" CssClass="form-check-input" Text="PC" />
            </div>
    <!-- Add more amenities here if needed -->
            </div>

            
            <!--Requests-->

            <div class="mt-5" style="font-size:12px;letter-spacing:3px;color:#c9a14a;">SPECIAL REQUESTS</div>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control mt-2" Rows="4" TextMode="MultiLine" placeholder="Please share dietary preferences, celebrations, or personal requests..."></asp:TextBox>

            <!--Button-->
            <asp:Button ID="Button1" runat="server" Text="CONFIRM RESERVATION" CssClass="btn w-100 mt-4" style="background:#111;color:white;letter-spacing:3px;padding:14px;" OnClick="Button1_Click"/>

            <div class="text-center mt-3 small-text-muted">EXPERIENCE REFINEMENT AT EVERY TURN</div>

    </div>
</asp:Content>
