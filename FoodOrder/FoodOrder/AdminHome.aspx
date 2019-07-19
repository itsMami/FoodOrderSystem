<%@ Page Title="" Language="C#" MasterPageFile="~/FoodOrder/Admin.Master" AutoEventWireup="true" CodeBehind="AdminHome.aspx.cs" Inherits="FoodOrder.AdminHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">

        .test {
	background-color:#fa3c3c;
	-moz-border-radius:11px;
	-webkit-border-radius:11px;
	border-radius:11px;
    transition: all .5s ease;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:11px 16px;
	text-decoration:none;
}
.test:hover {
	background-color:white;
    color : black;
    box-shadow: 0 0 4px rgb(204, 204, 204)
}
.test:active {
	position:relative;
	top:1px;
}
/*Styling Selectbox*/
.dropdown {
  width: 300px;
  display: inline-block;
  background-color: #b2b2b2;
  border-radius: 5px;
  box-shadow: 0 0 2px rgb(204, 204, 204);
  transition: all .5s ease;
  position: relative;
  font-size: 14px;
  color: white;
  height: 100%;
  text-align: left;
            top: -2px;
            left: 1px;
        }

.dropdown:hover {
    background-color: #fff;
    color: black;
    box-shadow: 0 0 4px rgb(204, 204, 204)
}


 .mydatagrid
{
	width: 80%;
	border: solid 2px black;
	min-width: 80%;
}
.header
{
	background-color: #646464;
	font-family: Arial;
	color: White;
	border: none 0px transparent;
	height: 25px;
	text-align: center;
	font-size: 16px;
}

.rows
{
	background-color: #fff;
	font-family: Arial;
	font-size: 14px;
	color: #000;
	min-height: 25px;
	text-align: left;
	border: none 0px transparent;
}
.rows:hover
{
	background-color: #808080;
	font-family: Arial;
	color: #fff;
	text-align: left;
}
.selectedrow
{
	background-color: #808080;
	font-family: Arial;
	color: #fff;
	font-weight: bold;
	text-align: left;
}
.mydatagrid a /** FOR THE PAGING ICONS  **/
{
	background-color: Transparent;
	padding: 5px 5px 5px 5px;
    transition: all .5s ease;
	color: #fff;
	text-decoration: none;
	font-weight: bold;
}

.mydatagrid a:hover /** FOR THE PAGING ICONS  HOVER STYLES**/
{
	background-color: #fa3c3c;
	color: #fff;
}
.mydatagrid span /** FOR THE PAGING ICONS CURRENT PAGE INDICATOR **/
{
	background-color: #c9c9c9;
	color: #000;
	padding: 5px 5px 5px 5px;
}
.pager
{
	background-color: #646464;
	font-family: Arial;
	color: White;
	height: 30px;
	text-align: left;
}

.mydatagrid td
{
	padding: 5px;
}
.mydatagrid th
{
	padding: 5px;
}

    </style>
</asp:Content>
    <asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <p style="width: 924px; height: 91px; vertical-align: top; text-align: left;">
            <asp:ListBox ID="ListBox1" runat="server" Height="91px" Width="490px" Style ="" CssClass="test"></asp:ListBox>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
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
            -Remove the admin rights from the user.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </p>
        <p style="width: 760px; height: 27px">
            &nbsp;<asp:Button ID="ShowInfoButton" runat="server" OnClick="ShowInfoButton_Click" Text="Show" CssClass="test" Width="89px" />

            &nbsp;&nbsp;<asp:Button ID="DeleteButton" runat="server" Text="Delete" OnClick="DeleteButton_Click" CssClass="test" Width="89px" />
            &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="MakeAdminButton" runat="server" OnClick="MakeAdminButton_Click" Text="Make Admin" Width="150px" CssClass="test" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="RemoveAdminButton" runat="server" OnClick="RemoveAdminButton_Click" Text="Remove Admin" CssClass="test" Width="150px" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
        Add/Remove City/District&nbsp;&nbsp;</p>
    <p>
        <asp:DropDownList ID="CityList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="CityList_SelectedIndexChanged" Height="30px" Width="130px" CssClass="dropdown">
            <asp:ListItem Selected="True" Value="-1">Select A City</asp:ListItem>
        </asp:DropDownList>
&nbsp;
        <asp:Button ID="DeleteCityButton" runat="server" Height="50px" Text="Delete" Width="130px" OnClick="DeleteCityButton_Click" CssClass="test" />
    </p>
<p>
        <asp:TextBox ID="CityTextBox" runat="server" Width="94px" CssClass="test"></asp:TextBox>
        <asp:Button ID="AddCityButton" runat="server" Height="50px" Text="Add" Width="130px" OnClick="AddCityButton_Click" CssClass="test" />
    </p>
<p>
        <asp:DropDownList ID="DistrictList" runat="server" Height="30px" Width="130px" CssClass="dropdown">
            <asp:ListItem Selected="True" Value="-1">Select A District</asp:ListItem>
        </asp:DropDownList>
        <asp:Button ID="DeleteDistrictButton" runat="server" Text="Delete" OnClick="DeleteDistrictButton_Click" CssClass="test" Height="50px" Width="130px" />
    </p>
<p>
        <asp:TextBox ID="DistrictTextBox" runat="server" Width="94px" CssClass="test"></asp:TextBox>
        <asp:Button ID="AddDistrictButton" runat="server" Text="Add" Width="130px" OnClick="AddDistrictButton_Click" CssClass="test" Height="50px" />
    </p>
<p>
        <asp:ListBox ID="ListBox2" runat="server" Height="80px" Width="130px" CssClass="test"></asp:ListBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete" CssClass="test" Height="50px" Width="130px" />
    </p>
<p>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="test" Width="94px"></asp:TextBox>
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Add" CssClass="test" Height="50px" Width="130px" />
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


<asp:Content ID="Content5" runat="server" contentplaceholderid="ContentPlaceHolder5">
    <asp:Image ID="Image1" runat="server" Height="88px" ImageUrl="/Images/marka.png" Width="167px" />
</asp:Content>
<asp:Content ID="Content6" runat="server" contentplaceholderid="ContentPlaceHolder6">
    <asp:Button ID="listAdminButton" runat="server" OnClick="ListAdminButton_Click" Text="List All Admins" BackColor="#CC0000" BorderColor="White" BorderStyle="None" BorderWidth="0px" ForeColor="White" Height="60px" Width="130px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ListCompanyButton" runat="server" OnClick="ListCompanyButton_Click" Text="List All Companies" BackColor="#CC0000" BorderStyle="None" ForeColor="White" Height="60px" Width="130px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ListUserButton" runat="server" Text="List All Users" OnClick="ListUserButton_Click" BackColor="#CC0000" BorderStyle="None" ForeColor="White" Height="60px" Width="130px" />
        &nbsp;
</asp:Content>
<asp:Content ID="Content7" runat="server" contentplaceholderid="ContentPlaceHolder7">
    <p>
            Welcome Back!</p>
</asp:Content>



