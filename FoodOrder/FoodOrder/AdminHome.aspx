<%@ Page Title="" Language="C#" MasterPageFile="~/FoodOrder/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="FoodOrder.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
       
      

    </style>
</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p style="width: 924px; height: 91px; vertical-align: top; text-align: left;">
            <asp:ListBox ID="ListBox1" runat="server" Height="91px" Width="490px" Style ="" CssClass="myListBox"></asp:ListBox></p>
        <p style="width: 924px; height: 23px; vertical-align: top; text-align: left;">
            Please Select a User to perform:
        </p>
        <p style="width: 924px; height: 23px; vertical-align: top; text-align: left;">
            -Show Details</p>
        <p style="width: 924px; height: 23px; vertical-align: top; text-align: left;">
            -Delete</p>
        <p style="width: 924px; height: 23px; vertical-align: top; text-align: left;">
            -Make the user an admin</p>
        <p style="width: 924px; height: 23px; vertical-align: top; text-align: left;">
            -Remove the admin rights from the user.
        </p>
        <p style="width: 760px; height: 27px">
            <asp:Button ID="ShowInfoButton" runat="server" OnClick="ShowInfoButton_Click" Text="Show" CssClass="myButton" Width="89px" />

            <asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" CssClass="myButton" Width="89px" />
            <asp:Button ID="MakeAdminButton" runat="server" OnClick="MakeAdminButton_Click" Text="Make Admin" Width="150px" CssClass="myButton" />
            <asp:Button ID="RemoveAdminButton" runat="server" OnClick="RemoveAdminButton_Click" Text="Remove Admin" CssClass="myButton" Width="150px" />
            
        </p>
        <p style="width: 492px">
            <asp:GridView ID="GridView1" runat="server" Height="127px" Width="494px" CssClass="mydatagrid">
                <Columns>
                    <asp:BoundField />
                </Columns>
                <HeaderStyle CssClass="header" />
                <PagerStyle CssClass="pager" />
                <RowStyle CssClass="rows" />
                <SelectedRowStyle CssClass="selectedrow" />
            </asp:GridView>
        </p>
               
</asp:Content>
<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <asp:Label ID="usernameLabel" runat="server" Text="Label"></asp:Label>
</asp:Content>

<asp:Content ID="Content4" runat="server" contentplaceholderid="ContentPlaceHolder4">
    <p>
        Add/Remove City/District</p>
    <p>
        <asp:DropDownList ID="CityList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CityList_SelectedIndexChanged" Height="30px" Width="130px" CssClass="dropdown">
            <asp:ListItem Selected="True" Value="-1">Select A City</asp:ListItem>
        </asp:DropDownList>

        <asp:Button ID="DeleteCityButton" runat="server" Height="50px" Text="Delete" Width="130px" OnClick="DeleteCityButton_Click" CssClass="myButton" />
    </p>
<p>
        <asp:TextBox ID="CityTextBox" runat="server" Width="94px" CssClass="myTextBox"></asp:TextBox>
        <asp:Button ID="AddCityButton" runat="server" Height="50px" Text="Add" Width="130px" OnClick="AddCityButton_Click" CssClass="myButton" />
    </p>
<p>
        <asp:DropDownList ID="DistrictList" runat="server" Height="30px" Width="130px" CssClass="dropdown">
            <asp:ListItem Selected="True" Value="-1">Select A District</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="DeleteDistrictButton" runat="server" Text="Delete" OnClick="DeleteDistrictButton_Click" CssClass="myButton" Height="50px" Width="130px" />
    </p>
<p>
        <asp:TextBox ID="DistrictTextBox" runat="server" Width="94px" CssClass="myTextBox"></asp:TextBox>
        <asp:Button ID="AddDistrictButton" runat="server" Text="Add" Width="130px" OnClick="AddDistrictButton_Click" CssClass="myButton" Height="50px" />
    </p>
<p>
        <asp:ListBox ID="ListBox2" runat="server" Height="80px" Width="130px" CssClass="myListBox"></asp:ListBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete" CssClass="myButton" Height="50px" Width="130px" />
    </p>
<p>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="myTextBox" Width="94px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add" CssClass="myButton" Height="50px" Width="130px" />
    </p>
   
</asp:Content>


<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder5">
    <asp:Image ID="Image1" runat="server" Height="88px" ImageUrl="/Images/marka.png" Width="167px" />
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder6">
    <asp:Button ID="listAdminButton" runat="server" OnClick="ListAdminButton_Click" Text="List All Admins" Height="60px" Width="130px" CssClass="myButton" />
   <asp:Button ID="ListCompanyButton" runat="server" OnClick="ListCompanyButton_Click" Text="List All Companies" Height="60px" Width="180px" CssClass="myButton" />
       
            <asp:Button ID="ListUserButton" runat="server" Text="List All Users" OnClick="ListUserButton_Click" Height="60px" Width="130px" CssClass="myButton" />
       
</asp:Content>
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder7">
    <p>
            Welcome Back!</p>
</asp:Content>



