<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User Registration Success.aspx.cs" Inherits="Hotel_Registration_1.User_Registration_Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="min-height:100vh;background:linear-gradient(#05070b,#0c1118);color:white;padding:30px;">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div class="text-center">
                <div style="color:#c9a14a;letter-spacing:3px;">ESTATE HOTELS</div>
                <small class="text-muted">LTD.</small>
            </div>
        </div>
        <!--Success Icon-->
        <div class="text-center mt-5">
            <div style="width:90px;height:90px; border:2px solid #c9a14a;border-radius:50%;margin:auto;display:flex;align-items:center;justify-content:center;">
                <i class="bi bi-check2 fs-1 text-warning"></i>
            </div>
        </div>

        <h2 class="text-center mt-4" style="font-family:'Playfair Display'">Registration<br />Successful</h2>
        <!--Message-->
        <p class="text-center text-muted mt-3">Welcome to the distinguished portfolio of <span style="color:#c9a14a">Estate Hotels LTD.</span>Your executive access has been successfully authenticated.</p>

        <!--Login -->
        <asp:Button ID="Button1" runat="server" Text="CLICK ON LOGIN TO CHECK DETAILS" CssClass="btn w-50 mt-3" style="background:#c9a14a; color:black;letter-spacing:2px; padding:14px;" OnClick="Button1_Click" />
    </div>
</asp:Content>
