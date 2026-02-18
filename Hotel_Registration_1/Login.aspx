<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Hotel_Registration_1.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container text-center" style="padding:80px 0">
        <h2 style="font-family:'Playfair Display';letter-spacing:4px;">WELCOME</h2> 
        <p style="color:gray; font-style:italic;">The experience begins here</p>
        <div class="col-md-5 mx-auto mt-5">

        
            <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control border-0 border-bottom rounded-0 p-3 bg-transparent" placeholder="Username" ValidationGroup="LoginGroup"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="text-danger" Display="Dynamic" ErrorMessage="Username required" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control border-0 border-bottom rounded-0 p-3 bg-transparent mt-3" placeholder="Password" ValidationGroup="LoginGroup" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="text-danger" ErrorMessage="Password required" Display="Dynamic" ValidationGroup="LoginGroup"></asp:RequiredFieldValidator>
        
        </div>

        <div class="text-end mt-2">

            <asp:LinkButton ID="LinkButton1" runat="server" Font-Underline="False">Recovery</asp:LinkButton>

        </div>
        
        <asp:Button ID="Button1" runat="server" Text="SIGN IN" CssClass="btn w-50 mt-4 rounded-pill" style="background:#111; color:white; letter-spacing:3px;padding:12px;" ValidationGroup="LoginGroup" OnClick="Button1_Click" />

        <div class="mt-3 text-muted">OR</div>
         
        <asp:Button ID="Button2" runat="server" Text="REGISTER" CssClass="btn w-50 mt-2 rounded-pill" style="border:1px solid #aaa; letter-spacing:3px; padding:12px;" CausesValidation="False" OnClick="Button2_Click" />


    </div>
</asp:Content>
