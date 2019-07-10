<%@ Page Title="" Language="C#" MasterPageFile="~/FoodOrder/MasterPage.Master" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="FoodOrder.FoodOrder.SignUp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
    .auto-style3 {
        font-size: xx-large;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <p>
    <strong><span class="auto-style3">Sign Up</span></strong></p>
<p>
</p>
<p>
</p>
<p style="margin-left: 160px">
    <asp:Label ID="usernameLabel" runat="server" Text="Username: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="usernameTextBox" runat="server" style="margin-left: 0px" CssClass="aayhan1"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="usernameTextBox" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p style="margin-left: 160px">
    <asp:Label ID="password1Label" runat="server" Text="Password: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="passwordTextBox1" runat="server" style="margin-left: 3px" TextMode="Password" CssClass="aayhan1"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="passwordTextBox1" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p style="margin-left: 160px">
    <asp:Label ID="password2Label" runat="server" Text="Confirm Password: "></asp:Label>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="passwordTextBox2" runat="server" style="margin-left: 1px" TextMode="Password" CssClass="aayhan1"></asp:TextBox>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passwordTextBox1" ControlToValidate="passwordTextBox2" Display="Dynamic" ErrorMessage="Passwords should match" ForeColor="Red"></asp:CompareValidator>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="passwordTextBox2" Display="Dynamic" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p style="margin-left: 160px">
    <asp:Label ID="emailLabel" runat="server" Text="E-mail: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="emailTextBox" runat="server" style="margin-left: 5px" TextMode="Email" CssClass="aayhan1"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="emailTextBox" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p style="margin-left: 160px">
    <asp:Label ID="phoneLabel" runat="server" Text="Phone: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="phoneTextBox" runat="server" style="margin-left: 4px" TextMode="Phone" CssClass="aayhan1"></asp:TextBox>
    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="phoneTextBox" ErrorMessage="*Required" ForeColor="Red"></asp:RequiredFieldValidator>
</p>
<p style="margin-left: 240px">
    *<asp:Label ID="Label1" runat="server" style="font-weight: 700" Text="Please insert your phone using only numbers"></asp:Label>
</p>
<p style="margin-left: 160px">
    <asp:Label ID="membershipLabel" runat="server" Text="Membership: "></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="membershipList" runat="server" CssClass="mydropdownlist">
    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;
</p>
<p style="margin-left: 160px">
    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 245px" Text="Register" Width="126px" CssClass="aayhan2" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</p>
<p>
</p>
<p>
</p>
<p>
</p>
</asp:Content>





