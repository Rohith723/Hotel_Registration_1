<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Hotel Registration Success.aspx.cs" Inherits="Hotel_Registration_1.Hotel_Registration_Success" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="background:#f8f6f2;min-height:100vh;padding:60px 15px; text-align:center">
        <!--icon-->
        <div style="width:90px;height:90px;border-radius:50%;border:2px solid #c9a14a;margin:auto;display:flex;align-items:center;justify-content:center;">
            <i class="bi bi-check-lg fs-1"></i>
        </div>

        <!--Heading-->

        <h2 style="font-family:'Playfair Display';margin:30px;">Booking Successful</h2>

        <p style="color:#666;font-style:italic;max-width:400px;margin:auto;"> Your luxury stay has been confirmed. We look forward to welcoming you.</p>


        <!--Details card-->

        <div class="mt-5 mx-auto p-4" style="max-width:420px;background:white;border-radius:8px;">
            <small style="color:#c9a14a;letter-spacing:2px;">Guest Name</small>
            <h5>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </h5>
            <hr />
            <div class="row text-center">
                <div class="col-6">
                    <small style="color:#999">CHECK-IN</small><br />
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </div>
                <div class="col-6">
                    <small style="color:#999">CHECK-OUT</small><br />
                    <asp:Label ID="Label3" runat="server"></asp:Label>
                </div>
            </div>
        </div>
        <!--Button-->
        <asp:Button ID="Button1" runat="server" Text="CHECK HOTEL DETAILS" CssClass="btn w-50 mt-4" style="background:#c9a14a; color:white;letter-spacing:3px;padding:15px;max-width:250px;" OnClick="Button1_Click" />
    </div>
</asp:Content>
