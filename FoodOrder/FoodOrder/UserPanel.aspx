<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserPanel.aspx.cs" Inherits="FoodOrder.FoodOrder.UserPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
            height: 632px;
        }
        .auto-style2 {
            width: 206px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style2" style="text-align: center; vertical-align: top; background-color: #FF3300;">
                    <asp:Label ID="label1" runat="server" Text="Welcome Back,"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" BackColor="#FF3300" BorderColor="#FF3300" BorderStyle="None" OnClick="Button1_Click" Text="Sign Out" Width="207px" />
                    <br />
                </td>
                <td aria-live="off" style="text-align: left; vertical-align: top">
                    <asp:DropDownList ID="cityList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="cityList_SelectedIndexChanged">
                    </asp:DropDownList>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="DistrictList" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DistrictList_SelectedIndexChanged">
                        <asp:ListItem Value="-1">Select a City First</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <br />
                    <asp:ListBox ID="CompanyList" runat="server" AutoPostBack="True" Height="70px" OnSelectedIndexChanged="CompanyList_SelectedIndexChanged" Width="134px"></asp:ListBox>
&nbsp;
                    <asp:Label ID="Label24" runat="server" style="font-weight: 700" Text="Point: "></asp:Label>
                    <asp:Label ID="Label25" runat="server" Text="0"></asp:Label>
&nbsp;&nbsp;
                    <asp:Label ID="Label28" runat="server" Text="Service Hours: " style="font-weight: 700"></asp:Label>
                    <asp:Label ID="Label29" runat="server" Text="0"></asp:Label>
&nbsp;<asp:Label ID="Label30" runat="server" Text="-"></asp:Label>
&nbsp;<asp:Label ID="Label31" runat="server" Text="0"></asp:Label>
&nbsp;<asp:Label ID="Label32" runat="server" style="font-weight: 700" Text="Minimum Price: "></asp:Label>
                    <asp:Label ID="Label33" runat="server" Text="0"></asp:Label>
&nbsp;
                    <asp:Label ID="Label34" runat="server" style="font-weight: 700" Text="Service Time: "></asp:Label>
                    <asp:Label ID="Label35" runat="server" Text="0"></asp:Label>
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label3" runat="server" style="font-weight: 700" Text="Soups"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label4" runat="server" style="font-weight: 700" Text="Main Foods"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label9" runat="server" style="font-weight: 700" Text="Basket"></asp:Label>
                    <br />
                    <asp:ListBox ID="SoupList" runat="server" AutoPostBack="True" Height="70px" OnSelectedIndexChanged="SoupList_SelectedIndexChanged" Width="130px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="+" Width="26px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ListBox ID="MainFoodList" runat="server" AutoPostBack="True" Height="70px" OnSelectedIndexChanged="MainFoodList_SelectedIndexChanged" Width="130px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="+" Width="26px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ListBox ID="BasketList" runat="server" AutoPostBack="True" Height="70px" SelectionMode="Multiple" Width="130px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="-" Width="29px" />
                    <br />
                    <asp:Label ID="Label10" runat="server" style="font-weight: 700" Text="Price: "></asp:Label>
                    <asp:Label ID="Label11" runat="server" Text="0"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label12" runat="server" style="font-weight: 700" Text="Price: "></asp:Label>
                    <asp:Label ID="Label13" runat="server" Text="0"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label5" runat="server" style="font-weight: 700" Text="Meats"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label6" runat="server" style="font-weight: 700" Text="Salads"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label22" runat="server" style="font-weight: 700" Text="Total: "></asp:Label>
&nbsp;<asp:Label ID="Label23" runat="server" Text="0"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button9" runat="server" Height="22px" OnClick="Button9_Click" Text="Buy" Width="41px" />
                    <br />
                    <asp:ListBox ID="MeatList" runat="server" AutoPostBack="True" Height="70px" OnSelectedIndexChanged="MeatList_SelectedIndexChanged" Width="130px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="+" Width="26px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ListBox ID="SaladList" runat="server" AutoPostBack="True" Height="70px" OnSelectedIndexChanged="SaladList_SelectedIndexChanged" Width="130px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="+" Width="26px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <br />
                    <asp:Label ID="Label14" runat="server" style="font-weight: 700" Text="Price: "></asp:Label>
                    <asp:Label ID="Label15" runat="server" Text="0"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label16" runat="server" style="font-weight: 700" Text="Price: "></asp:Label>
                    <asp:Label ID="Label17" runat="server" Text="0"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label26" runat="server" style="font-weight: 700" Text="Purchase was successfull.Leave a Review." Visible="False"></asp:Label>
                    <br />
                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label7" runat="server" style="font-weight: 700" Text="Drinks"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label8" runat="server" style="font-weight: 700" Text="Desserts"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton ID="RadioButton1" runat="server" GroupName="Radios" Text="1" />
&nbsp;
                    <asp:RadioButton ID="RadioButton2" runat="server" GroupName="Radios" Text="2" />
&nbsp;
                    <asp:RadioButton ID="RadioButton3" runat="server" GroupName="Radios" Text="3" />
&nbsp;
                    <asp:RadioButton ID="RadioButton4" runat="server" GroupName="Radios" Text="4" />
&nbsp;
                    <asp:RadioButton ID="RadioButton5" runat="server" GroupName="Radios" Text="5" />
                    <br />
                    <asp:ListBox ID="DrinkList" runat="server" AutoPostBack="True" Height="70px" OnSelectedIndexChanged="DrinkList_SelectedIndexChanged" Width="130px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="+" Width="26px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:ListBox ID="DessertList" runat="server" AutoPostBack="True" Height="70px" OnSelectedIndexChanged="DessertList_SelectedIndexChanged" Width="130px"></asp:ListBox>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="+" Width="26px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="Submit" Visible="False" />
                    <br />
                    <asp:Label ID="Label18" runat="server" style="font-weight: 700" Text="Price: "></asp:Label>
                    <asp:Label ID="Label19" runat="server" Text="0"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label20" runat="server" style="font-weight: 700" Text="Price: "></asp:Label>
                    <asp:Label ID="Label21" runat="server" Text="0"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label27" runat="server" Text="Label" Visible="False"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
