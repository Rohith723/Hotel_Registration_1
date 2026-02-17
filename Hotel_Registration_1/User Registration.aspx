<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User Registration.aspx.cs" Inherits="Hotel_Registration_1.User_Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container"style="max-width:420px;padding:40px 10px">

        <!--Header-->
        <div class="d-flex align-items-center mb-3">
            <h5 class="m-0" style="font-family:'Playfair Display'">User Registration</h5>
        </div>
        <p class="text-center text-muted mb-1">Join the Elite</p>
        <p class="text-center small"style="letter-spacing:2px;color:#999;">PERSONALIZE YOUR EXPERIENCE</p>

        <!--Personal details-->
        <h6 class="mt-4" style="font-family:'Playfair Display'">Personal Details</h6>

        <hr />
        <asp:TextBox ID="TextBox1" runat="server" placeholder="First Name" CssClass="form-control border-0 border-bottom rounded-0"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="text-danger" Display="Dynamic" ErrorMessage="First Name  required"></asp:RequiredFieldValidator>
        <asp:TextBox ID="TextBox2" runat="server" placeholder="Last Name" CssClass="form-control border-0 border-bottom rounded-0 mt-3"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="text-danger" Display="Dynamic" ErrorMessage="Last Name required"></asp:RequiredFieldValidator>
        <asp:TextBox ID="TextBox3" runat="server" placeholder="User Name" CssClass="form-control border-0 border-bottom rounded-0 mt-3"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" CssClass="text-danger" Display="Dynamic" ErrorMessage="User Name required"></asp:RequiredFieldValidator>
        <div class="row mt-3">
            <div class="col-6">
                <asp:TextBox ID="TextBox4" runat="server" placeholder="Age" CssClass="form-control border-0 border-bottom rounded-0"></asp:TextBox>
                <asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Age should be between 18 to 100" ControlToValidate="TextBox4" CssClass="text-danger" Display="Dynamic" MaximumValue="100" MinimumValue="18" Type="Integer"></asp:RangeValidator>
                <br />
            </div>
            <div class="col-8">
                <div class="mt-1">
                    Gender:  
                    <br />
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="rbgender" Text="Male" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="rbgender" Text="Female" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="rbgender" Text="Other" />
                </div>
            </div>
        </div>
        <!--Residence-->
        <h6 class="mt-4"style="font-family:'Playfair Display'">Residence</h6>

        <hr />

                <asp:TextBox ID="TextBox5" runat="server" placeholder="Email" CssClass="form-control border-0 border-bottom rounded-0"></asp:TextBox>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email required" ControlToValidate="TextBox5" CssClass="text-danger" Display="Dynamic" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"></asp:RegularExpressionValidator>
                <asp:TextBox ID="TextBox6" runat="server" placeholder="Phone Number" CssClass="form-control border-0 border-bottom rounded-0 mt-3"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Phone number required" ControlToValidate="TextBox6" CssClass="text-danger" Display="Dynamic" ValidationExpression="^(?:\+91[-\s]?|91[-\s]?)?[6-9]\d{9}$"></asp:RegularExpressionValidator>
                
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select border-0 border-bottom rounded-0 mt-3">
                    <asp:ListItem>Select Country</asp:ListItem>
                    <asp:ListItem>India</asp:ListItem>
                    <asp:ListItem>USA</asp:ListItem>
                    <asp:ListItem>UK</asp:ListItem>
                </asp:DropDownList>
                <asp:TextBox ID="TextBox7" runat="server" placeholder="Address" CssClass="form-control border-0 border-bottom rounded-0 mt-3" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Address required" ControlToValidate="TextBox7" CssClass="text-danger"></asp:RequiredFieldValidator>

                <!--Security-->
                <h6 class="mt-4"style="font-family:'Playfair Display'">Security</h6>

        <hr />
                <asp:TextBox ID="TextBox8" runat="server" placeholder="Password" CssClass="form-control border-0 border-bottom rounded-0" TextMode="Password"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Use 8+ chars with upper, lower, number &amp; symbol." ControlToValidate="TextBox8" CssClass="text-danger" Display="Dynamic" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&amp;#^()_+\-=\[\]{};':&quot;\\|,.&lt;&gt;\/?]).{8,}$"></asp:RegularExpressionValidator>

                <asp:TextBox ID="TextBox9" runat="server" placeholder="Confirm Password" CssClass="form-control border-0 border-bottom rounded-0 mt-3" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="CompareValidator" ControlToCompare="TextBox8" ControlToValidate="TextBox9" CssClass="texter-danger" Display="Dynamic"></asp:CompareValidator>

        <!--Preferences-->
        <h6 class="mt-4" style="font-family:'Playfair Display'">Preferences</h6>
        <hr />

        <div class="form-check">
            <asp:CheckBox ID="CheckBox1" runat="server" CssClass="form-check-input" />
            <asp:Label ID="Label1" runat="server" Text="English" CssClass="form-check-label"></asp:Label>
        </div>
         <div class="form-check">
            <asp:CheckBox ID="CheckBox2" runat="server" CssClass="form-check-input" />
            <asp:Label ID="Label2" runat="server" Text="Hindi" CssClass="fom-check-label"></asp:Label>
        </div>
         <div class="form-check">
            <asp:CheckBox ID="CheckBox3" runat="server" CssClass="form-check-input" />
            <asp:Label ID="Label3" runat="server" Text="Telugu" CssClass="fom-check-label"></asp:Label>
        </div>

        <!--Submit-->
        <asp:Button ID="Button1" runat="server" Text="COMPLETE REGISTRATION" CssClass="btn w-100 mt-4" style="background:#111;color:white;letter-spacing:3px;padding:14px;" OnClick="Button1_Click"/>

        <p class="text-center mt-3 small">Existing member?<asp:Button ID="Button2" runat="server" Text="SIGN IN" style="color:black;font-weight:bold" OnClick="Button2_Click" /></p>
    </div>
</asp:Content>
