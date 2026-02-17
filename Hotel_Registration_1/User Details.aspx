<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="User Details.aspx.cs" Inherits="Hotel_Registration_1.User_Details" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h3 class="text-center mb-4" style="font-family:'Playfair Display'; letter-spacing:3px;">USER DETAILS</h3>
    </div>
 <asp:GridView ID="GridView1" runat="server"
    CssClass="table table-bordered table-hover text-center align-middle"
    AutoGenerateColumns="False"
    DataKeyNames="UserName"
    OnRowDeleting="GridView1_RowDeleting"
    OnRowEditing="GridView1_RowEditing"
    OnRowUpdating="GridView1_RowUpdating"
    OnRowCancelingEdit="GridView1_RowCancelingEdit">

    <Columns>

        <asp:TemplateField HeaderText="User Name">
            <ItemTemplate>
                <%# Eval("UserName") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control"
                    Text='<%# Bind("UserName") %>'/>
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Email">
            <ItemTemplate>
                <%# Eval("Email") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"
                    Text='<%# Bind("Email") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Phone">
            <ItemTemplate>
                <%# Eval("PhoneNumber") %>
            </ItemTemplate>
            <EditItemTemplate>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="form-control"
                    Text='<%# Bind("PhoneNumber") %>' />
            </EditItemTemplate>
        </asp:TemplateField>

        <asp:TemplateField HeaderText="Actions">
            <ItemTemplate>
                <asp:LinkButton runat="server" CommandName="Edit"
                    CssClass="btn btn-warning btn-sm me-2">Edit</asp:LinkButton>

                <asp:LinkButton runat="server" CommandName="Delete"
                    CssClass="btn btn-danger btn-sm"
                    OnClientClick="return confirm('Delete this user?');">Delete</asp:LinkButton>
            </ItemTemplate>

            <EditItemTemplate>
                <asp:LinkButton runat="server" CommandName="Update"
                    CssClass="btn btn-success btn-sm me-2">Save</asp:LinkButton>

                <asp:LinkButton runat="server" CommandName="Cancel"
                    CssClass="btn btn-secondary btn-sm">Cancel</asp:LinkButton>
            </EditItemTemplate>
        </asp:TemplateField>

    </Columns>
</asp:GridView>


    <div class="text-center mt-4">
        <asp:Button ID="Button1" runat="server" Text="🏨 Click Here to Register Hotel" CssClass="btn btn-primary btn-lg px-5" OnClick="Button1_Click" />
    </div>
</asp:Content>
