<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Hotel Details.aspx.cs" Inherits="Hotel_Registration_1.Hotel_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <h3 class="text-center mb-3">🏨 My Hotel Details</h3>
        <asp:Label ID="Label1" runat="server" CssClass="fw-bold text-primary fs-5"></asp:Label>
        <hr />
    </div>
 <asp:GridView ID="GridView1" runat="server"
    CssClass="table table-bordered table-hover text-center align-middle"
    AutoGenerateColumns="False"
    DataKeyNames="CheckInDate"
    OnRowDeleting="GridView1_RowDeleting"
    OnRowEditing="GridView1_RowEditing"
    OnRowUpdating="GridView1_RowUpdating"
    OnRowCancelingEdit="GridView1_RowCancelingEdit"
    OnPageIndexChanging="GridView1_PageIndexChanging">

<Columns>
    <asp:TemplateField HeaderText="User">
        <ItemTemplate><%# Eval("UserName") %></ItemTemplate>
        <EditItemTemplate>
            <asp:Label runat="server" Text='<%# Eval("UserName") %>'></asp:Label>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Check In">
        <ItemTemplate><%# Eval("CheckInDate","{0:dd-MMM-yyyy}") %></ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtCheckIn" runat="server" Text='<%# Eval("CheckInDate","{0:yyyy-MM-dd}") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Check Out">
        <ItemTemplate><%# Eval("CheckOutDate","{0:dd-MMM-yyyy}") %></ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtCheckOut" runat="server" Text='<%# Eval("CheckOutDate","{0:yyyy-MM-dd}") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Room">
        <ItemTemplate><%# Eval("RoomType") %></ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtRoom" runat="server" Text='<%# Eval("RoomType") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Amenities">
        <ItemTemplate><%# Eval("Amenities") %></ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtAmenities" runat="server" Text='<%# Eval("Amenities") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Requests">
        <ItemTemplate><%# Eval("SpecialRequests") %></ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtRequests" runat="server" Text='<%# Eval("SpecialRequests") %>'></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField HeaderText="Bill">
        <ItemTemplate>₹ <%# Eval("Amount") %></ItemTemplate>
        <EditItemTemplate>
            <asp:TextBox ID="txtAmount" runat="server" Text='<%# Eval("Amount") %>' ReadOnly="true"></asp:TextBox>
        </EditItemTemplate>
    </asp:TemplateField>

    <asp:TemplateField>
        <ItemTemplate>
            <asp:LinkButton runat="server" CommandName="Edit" CssClass="btn btn-warning btn-sm">Edit</asp:LinkButton>
            <asp:LinkButton runat="server" CommandName="Delete" CssClass="btn btn-danger btn-sm"
                OnClientClick="return confirm('Delete booking?');">Delete</asp:LinkButton>
        </ItemTemplate>
        <EditItemTemplate>
            <asp:LinkButton runat="server" CommandName="Update" CssClass="btn btn-success btn-sm">Update</asp:LinkButton>
            <asp:LinkButton runat="server" CommandName="Cancel" CssClass="btn btn-secondary btn-sm">Cancel</asp:LinkButton>
        </EditItemTemplate>
    </asp:TemplateField>
</Columns>
</asp:GridView>


<br />

<div class="card p-3 mt-4">
    <h4>Booking Summary</h4>
    <asp:Repeater ID="Repeater1" runat="server">
        <ItemTemplate>
            <div class="mb-2 border-bottom pb-2">
                <strong>Check-In:</strong> <%# Eval("CheckInDate","{0:dd-MMM-yyyy}") %> |
                <strong>Check-Out:</strong> <%# Eval("CheckOutDate","{0:dd-MMM-yyyy}") %><br />
                <strong>Room:</strong> <%# Eval("RoomType") %> |
                <strong>Amenities:</strong> <%# Eval("Amenities") %><br />
                <strong>Special Requests:</strong> <%# Eval("SpecialRequests") %> <br />
                <strong>Amount:</strong> ₹ <%# Eval("Amount") %>
            </div>
        </ItemTemplate>
    </asp:Repeater>
    <hr />
    <strong>Total Bill: ₹</strong> <asp:Label ID="Label2" runat="server"></asp:Label>
    <br />
    <asp:Button ID="Button1" runat="server" Text="Download Bill" CssClass="btn btn-dark mt-2" OnClick="Button1_Click" />
</div>


</asp:Content>
