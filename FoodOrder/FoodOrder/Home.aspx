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
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <p></p>
    <p>
        <asp:Button ID="AdminButton" runat="server" OnClick="AdminButton_Click" Text="Admin" />
        <asp:Button ID="CompanyButton" runat="server" Text="Company" OnClick="CompanyButton_Click" />
        <asp:Button ID="UserButton" runat="server" Text="User" OnClick="UserButton_Click" />
    </p>
    <asp:MultiView ID="MultiView1" runat="server">
        <asp:View ID="AdminView" runat="server">
            <asp:Label ID="Label1" runat="server" Text="Username: " ForeColor="#00FF99"></asp:Label>
            <asp:TextBox ID="AdminLoginTextBox" runat="server" CssClass="aayhan1" Height="39px" Width="134px" ValidationGroup="3"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Password: " ForeColor="#00FF99"></asp:Label>
&nbsp;<asp:TextBox ID="AdminPasswordTextBox" runat="server" CssClass="aayhan1" Height="39px" TextMode="Password" Width="135px" ValidationGroup="3"></asp:TextBox>
            <br />
            <asp:Button ID="AdminLoginButton" runat="server" CssClass="aayhan2" OnClick="AdminLoginButton_Click" Text="Login" ValidationGroup="3" />
            &nbsp;&nbsp;
            <asp:Button ID="AdminSignUpButton" runat="server" CssClass="aayhan2" OnClick="AdminSignUpButton_Click" Text="Sign Up" />
            <br />
            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        </asp:View>
        <asp:View ID="CompanyView" runat="server">
            <asp:Label ID="Label4" runat="server" Text="Username: " ForeColor="#FF6666"></asp:Label>
            <asp:TextBox ID="CompanyLoginTextBox" runat="server" CssClass="aayhan1" Height="39px" Width="134px" ValidationGroup="4"></asp:TextBox>
            <br />
            <asp:Label ID="Label5" runat="server" Text="Password: " ForeColor="#FF6666"></asp:Label>
            &nbsp;<asp:TextBox ID="CompanyPasswordTextBox" runat="server" CssClass="aayhan1" Height="39px" TextMode="Password" Width="135px" ValidationGroup="4"></asp:TextBox>
            <br />
            <asp:Button ID="CompanyLoginButton" runat="server" CssClass="aayhan2" OnClick="CompanyLoginButton_Click" Text="Login" ValidationGroup="4" />
            &nbsp;&nbsp;
            <asp:Button ID="CompanySignUpButton" runat="server" CssClass="aayhan2" OnClick="CompanySignUpButton_Click" Text="Sign Up" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label6" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        </asp:View>
        <asp:View ID="UserView" runat="server">
            <asp:Label ID="Label7" runat="server" Text="Username: "></asp:Label>
            <asp:TextBox ID="UserLoginTextBox" runat="server" CssClass="aayhan1" Height="39px" Width="134px" ValidationGroup="5"></asp:TextBox>
            <br />
            <asp:Label ID="Label8" runat="server" Text="Password: "></asp:Label>
            &nbsp;<asp:TextBox ID="UserPasswordTextBox" runat="server" CssClass="aayhan1" Height="39px" TextMode="Password" Width="135px" ValidationGroup="5"></asp:TextBox>
            <br />
            <asp:Button ID="UserLoginButton" runat="server" BackColor="#CCFFFF" CssClass="aayhan2" OnClick="UserLoginButton_Click" Text="Login" ValidationGroup="5" />
            &nbsp;&nbsp;
            <asp:Button ID="UserSignUpButton" runat="server" BackColor="#CCFFFF" CssClass="aayhan2" OnClick="UserSignUpButton_Click" Text="Sign Up" />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="Label9" runat="server" ForeColor="Red" Text="Label" Visible="False"></asp:Label>
        </asp:View>
    </asp:MultiView>
    <p style="margin-left: 400px">
        &nbsp;</p>
    <p style="margin-left: 400px">
        &nbsp;</p>
<p style="margin-left: 400px">
&nbsp;&nbsp;&nbsp;
        </p>
    <p style="margin-left: 560px">
        &nbsp;
        &nbsp;&nbsp;&nbsp;
    </p>
    
</asp:Content>

<asp:Content ID="Content3" runat="server" contentplaceholderid="ContentPlaceHolder2">
    <asp:MultiView ID="MultiView2" runat="server">
        <asp:View ID="AdminSignUp" runat="server">
            <asp:Label ID="Label10" runat="server" Text="Username: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="adminsignupusername" runat="server" ValidationGroup="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="adminsignuppassword1" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            <asp:Label ID="Admindublicatelabel" runat="server" ForeColor="Red" Text="This username is taken." Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label ID="Label11" runat="server" Text="Password: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="adminsignuppassword1" runat="server" TextMode="Password" ValidationGroup="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="adminsignuppassword1" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            <br />
            <br />
            <asp:Label ID="Label12" runat="server" Text="Confirm Password: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="adminsignuppassword2" runat="server" TextMode="Password" ValidationGroup="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="adminsignuppassword2" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="adminsignuppassword1" ControlToValidate="adminsignuppassword2" Display="Dynamic" ErrorMessage="Passwords Should Match!" ForeColor="Red" ValidationGroup="1"></asp:CompareValidator>
            <br />
            <asp:DropDownList ID="signupcitylist" runat="server" AutoPostBack="True" OnSelectedIndexChanged="signupcitylist_SelectedIndexChanged" Width="153px" ValidationGroup="1">
                <asp:ListItem Selected="True" Value="-1">Select A City</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="signupdistrictlist" runat="server" Height="27px" Width="152px" ValidationGroup="1">
                <asp:ListItem Selected="True" Value="-1">Select A District</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label13" runat="server" Text="E-mail: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="adminemailtextbox1" runat="server" TextMode="Email" ValidationGroup="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="adminemailtextbox1" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label14" runat="server" Text="Confirm E-mail: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="adminemailtextbox2" runat="server" TextMode="Email" ValidationGroup="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="adminemailtextbox2" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="adminemailtextbox1" ControlToValidate="adminemailtextbox2" Display="Dynamic" ErrorMessage="E-mail's should match!" ForeColor="Red" ValidationGroup="1"></asp:CompareValidator>
            <br />
            <asp:Label ID="Label15" runat="server" Text="Phone Number: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="adminphonetextbox" runat="server" ValidationGroup="1"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="adminphonetextbox" ErrorMessage="Required" ForeColor="Red" ValidationGroup="1"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label16" runat="server" Text="Enter your phone in +901111111111 format."></asp:Label>
            <br />
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="adminJoinUs" runat="server" OnClick="adminJoinUs_Click" Text="Join Us" Width="224px" ValidationGroup="1" />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
        </asp:View>
        <asp:View ID="CompanySignUp" runat="server">
            <asp:Label ID="Label17" runat="server" Text="Username: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="companysignupusername" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="companysignupusername" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            <asp:Label ID="companyDublicateLabel" runat="server" ForeColor="Red" Text="This username is taken." Visible="False"></asp:Label>
            <br />
            <asp:Label ID="Label18" runat="server" Text="Password: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="companysignuppassword1" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="companysignuppassword1" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label19" runat="server" Text="Confirm Password: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="companysignuppassword2" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToCompare="companysignuppassword1" ControlToValidate="companysignuppassword2" Display="Dynamic" ErrorMessage="Password's should match!" ForeColor="Red" ValidationGroup="2"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="companysignuppassword2" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            <br />
            <asp:DropDownList ID="companyCityList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="companyCityList_SelectedIndexChanged">
                <asp:ListItem Value="-1">Select a City</asp:ListItem>
            </asp:DropDownList>
            <asp:DropDownList ID="CompanyDistrictList" runat="server" AutoPostBack="True">
                <asp:ListItem Value="-1">Select a District</asp:ListItem>
            </asp:DropDownList>
            <br />
            <asp:Label ID="Label20" runat="server" Text="Company E-mail: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="companysignupemail1" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="companysignupemail1" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label21" runat="server" Text="Confirm E-mail: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="companysignupemail2" runat="server" TextMode="Email"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToCompare="companysignupemail1" ControlToValidate="companysignupemail2" Display="Dynamic" ErrorMessage="E-mail's should match!" ForeColor="Red" ValidationGroup="2"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="companysignupemail2" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label22" runat="server" Text="Company Phone Number: "></asp:Label>
            &nbsp;<asp:TextBox ID="companysignupphone" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="companysignupphone" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ValidationGroup="2"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Label23" runat="server" Text="Enter your phone in +901111111111 format."></asp:Label>
            <br />
            <br />
            <asp:Button ID="companynextpage" runat="server" OnClick="companyNextPage_Click" Text="Next Page" ValidationGroup="2" Width="220px" />
            <br />
        </asp:View>
        <asp:View ID="CompanyInformation" runat="server">
            <br />
            <asp:Label ID="Label25" runat="server" Text="Company Name: "></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="companyinformationname" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="Label26" runat="server" Text="Work Hours Start: "></asp:Label>
            <asp:DropDownList ID="workstartlist" runat="server" AutoPostBack="True">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem>14</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>16</asp:ListItem>
                <asp:ListItem>17</asp:ListItem>
                <asp:ListItem>18</asp:ListItem>
                <asp:ListItem>19</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>21</asp:ListItem>
                <asp:ListItem>22</asp:ListItem>
                <asp:ListItem>23</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label27" runat="server" Text="- Work Hours End: "></asp:Label>
            <asp:DropDownList ID="workendlist" runat="server" AutoPostBack="True">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>11</asp:ListItem>
                <asp:ListItem>12</asp:ListItem>
                <asp:ListItem>13</asp:ListItem>
                <asp:ListItem>14</asp:ListItem>
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>16</asp:ListItem>
                <asp:ListItem>17</asp:ListItem>
                <asp:ListItem>18</asp:ListItem>
                <asp:ListItem>19</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>21</asp:ListItem>
                <asp:ListItem>22</asp:ListItem>
                <asp:ListItem>23</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            <asp:Label ID="Label28" runat="server" Text="Average Service Time: "></asp:Label>
            <asp:DropDownList ID="companyservicetime" runat="server" AutoPostBack="True">
                <asp:ListItem>15</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>45</asp:ListItem>
                <asp:ListItem>60</asp:ListItem>
                <asp:ListItem>75</asp:ListItem>
                <asp:ListItem>90</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label29" runat="server" Text="Minutes"></asp:Label>
            <br />
            <asp:Label ID="Label30" runat="server" Text="Company Minimum Order Price: "></asp:Label>
            <asp:DropDownList ID="companyminprice" runat="server" Height="27px">
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>30</asp:ListItem>
                <asp:ListItem>20</asp:ListItem>
                <asp:ListItem>50</asp:ListItem>
                <asp:ListItem>40</asp:ListItem>
            </asp:DropDownList>
            <asp:Label ID="Label31" runat="server" Text="TL"></asp:Label>
            <br />
            <br />
            <asp:Button ID="prevpage" runat="server" OnClick="prevpage_Click" Text="Previous Page" />
            <asp:Button ID="companymenubutton" runat="server" OnClick="companymenubutton_Click" Text="Create Your Menu" Width="219px" />
            <br />
            <br />
            <br />
        </asp:View>
        <asp:View ID="UserSignUp" runat="server">
        </asp:View>
    </asp:MultiView>
</asp:Content>


