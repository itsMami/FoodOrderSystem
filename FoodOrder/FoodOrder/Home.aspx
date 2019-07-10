<%@ Page Title="" Language="C#" MasterPageFile="~/FoodOrder/MasterPage.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FoodOrder.FoodOrder.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style3 {
            font-size: xx-large;
            height: 500px;
            width: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <style type="text/css">
        .auto-style3 {
            font-size: xx-large;
            height: 600px;
            width: 0px;
        }
    </style>
    <p style="margin-left: 400px">
        <asp:Label ID="Label1" runat="server" Text="Username: "></asp:Label>
        <asp:TextBox ID="loginTextBox" runat="server" Height="22px" Width="134px" CssClass="aayhan1"></asp:TextBox>
    </p>
    <p style="margin-left: 400px">
        <asp:Label ID="Label2" runat="server" Text="Password: "></asp:Label>
        &nbsp;<asp:TextBox ID="passwordTextBox" runat="server" Width="135px" Height="22px" TextMode="Password" CssClass="aayhan1"></asp:TextBox>
    </p>
<p style="margin-left: 400px">
        <asp:Button ID="loginButton" runat="server" OnClick="loginButton_Click" Text="Login" CssClass="aayhan2" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="signupButton" runat="server" Text="Sign Up" OnClick="signupButton_Click" CssClass="aayhan2" />
    </p>
    <p style="margin-left: 560px">
        &nbsp;
        <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>
&nbsp;&nbsp;&nbsp;
    </p>
    
</asp:Content>

