<%@ Page Title="" Language="C#" MasterPageFile="~/FoodOrder/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="FoodOrder.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p>
            Welcome Back!</p>
        <p>
            <asp:Button ID="listAdminButton" runat="server" OnClick="ListAdminButton_Click" Text="List All Admins" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ListCompanyButton" runat="server" OnClick="ListCompanyButton_Click" Text="List All Companies" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ListUserButton" runat="server" Text="List All Users" OnClick="ListUserButton_Click" />
        </p>
        <p>
            <asp:ListBox ID="ListBox1" runat="server" Height="184px" Width="647px"></asp:ListBox>
        </p>
        <p>
            &nbsp;<asp:Button ID="ShowInfoButton" runat="server" OnClick="ShowInfoButton_Click" Text="Show" />
&nbsp;&nbsp;&nbsp;
            <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" Height="127px" Width="639px">
            </asp:GridView>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
        <p>
        </p>
       
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <asp:Label ID="usernameLabel" runat="server" Text="Label"></asp:Label>
</asp:Content>

