<%@ Page Title="" Language="C#" MasterPageFile="~/FoodOrder/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="FoodOrder.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .grid {}
    </style>
</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p>
            Welcome Back!</p>
        <p>
            <asp:Button ID="listAdminButton" runat="server" OnClick="ListAdminButton_Click" Text="List All Admins" />
&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;
            </p>
<p>
            <asp:Button ID="ListCompanyButton" runat="server" OnClick="ListCompanyButton_Click" Text="List All Companies" />
        </p>
<p>
            <asp:Button ID="ListUserButton" runat="server" Text="List All Users" OnClick="ListUserButton_Click" />
        </p>
        <p style="width: 346px; height: 186px; vertical-align: baseline; text-align: justify;">
            <asp:ListBox ID="ListBox1" runat="server" Height="184px" Width="120px"></asp:ListBox>
        </p>
        <p style="width: 426px; height: 27px">
            &nbsp;<asp:Button ID="ShowInfoButton" runat="server" OnClick="ShowInfoButton_Click" Text="Show" />

            &nbsp;&nbsp;<asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="MakeAdminButton" runat="server" OnClick="MakeAdminButton_Click" Text="Make Admin" Width="86px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="RemoveAdminButton" runat="server" OnClick="RemoveAdminButton_Click" Text="Remove Admin" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p>
            &nbsp;&nbsp;&nbsp;&nbsp;
            </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" Height="127px" Width="494px" CssClass="grid">
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

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder4">
    <p>
        &nbsp;</p>
    <p>
        &nbsp;</p>
    <p>
        <asp:DropDownList ID="CityList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CityList_SelectedIndexChanged" Height="30px" Width="152px">
            <asp:ListItem Selected="True" Value="-1">Select A City</asp:ListItem>
        </asp:DropDownList>
&nbsp;
        <asp:Button ID="DeleteCityButton" runat="server" Height="22px" Text="Delete" Width="70px" OnClick="DeleteCityButton_Click" />
&nbsp;<asp:TextBox ID="CityTextBox" runat="server" Width="142px"></asp:TextBox>
&nbsp;&nbsp;
        <asp:Button ID="AddCityButton" runat="server" Height="22px" Text="Add" Width="65px" OnClick="AddCityButton_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </p>
    <p>
        <asp:DropDownList ID="DistrictList" runat="server" Height="30px" Width="155px">
            <asp:ListItem Selected="True" Value="-1">Select A District</asp:ListItem>
        </asp:DropDownList>
&nbsp;&nbsp;
        <asp:Button ID="DeleteDistrictButton" runat="server" Text="Delete" OnClick="DeleteDistrictButton_Click" />
        <asp:TextBox ID="DistrictTextBox" runat="server" Width="142px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="AddDistrictButton" runat="server" Text="Add" Width="53px" OnClick="AddDistrictButton_Click" />
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


