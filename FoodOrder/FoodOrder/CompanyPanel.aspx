<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompanyPanel.aspx.cs" Inherits="FoodOrder.FoodOrder.CompanyPanel" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<link href="mystyle.css" rel="stylesheet" />
    <style type="text/css">
        .myStyle {
            border-style:none;
            color:black;
            transition: all 1s ease;
        }
        .myStyle:hover{
            border-color:white;
            color:white;
            transform:scale(1.3);
        }
        .auto-style1 {
            width: 100%;
            height: 492px;
        }
        .auto-style2 {
            width: 162px;
        }
        .auto-style3 {
            width: 542px;
        }
        .auto-style4 {
            width: 542px;
            font-size: xx-large;
            height: 79px;
        }
        .auto-style5 {
            width: 162px;
            height: 79px;
        }
        .auto-style6 {
            height: 79px;
            font-size: xx-large;
        }
        .auto-style7 {
            background-color: #fa3c3c;
            -moz-border-radius: 11px;
            -webkit-border-radius: 11px;
            border-radius: 11px;
            transition: all .5s ease;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            padding: 11px 16px;
            text-decoration: none;
            margin-left: 0px;
        }
        .auto-style8 {
            width: 162px;
            height: 631px;
        }
        .auto-style9 {
            width: 542px;
            height: 631px;
        }
        .auto-style10 {
            height: 631px;
        }
        .auto-style11 {
            background-color: #fa3c3c;
            -moz-border-radius: 11px;
            -webkit-border-radius: 11px;
            border-radius: 11px;
            transition: all .5s ease;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            padding: 11px 16px;
            text-decoration: none;
            margin-left: 140px;
        }
        .auto-style12 {
            background-color: #fa3c3c;
            -moz-border-radius: 11px;
            -webkit-border-radius: 11px;
            border-radius: 11px;
            transition: all .5s ease;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            padding: 11px 16px;
            text-decoration: none;
            margin-left: 84px;
            margin-top: 0px;
        }
        .auto-style14 {
            background-color: #fa3c3c;
            -moz-border-radius: 11px;
            -webkit-border-radius: 11px;
            border-radius: 11px;
            transition: all .5s ease;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            padding: 11px 16px;
            text-decoration: none;
            margin-left: 86px;
        }
        .auto-style15 {
            background-color: #fa3c3c;
            -moz-border-radius: 11px;
            -webkit-border-radius: 11px;
            border-radius: 11px;
            transition: all .5s ease;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            padding: 11px 16px;
            text-decoration: none;
            margin-left: 82px;
        }
        .auto-style16 {
            background-color: #fa3c3c;
            -moz-border-radius: 11px;
            -webkit-border-radius: 11px;
            border-radius: 11px;
            transition: all .5s ease;
            display: inline-block;
            cursor: pointer;
            color: #ffffff;
            font-family: Arial;
            font-size: 14px;
            font-weight: bold;
            padding: 11px 16px;
            text-decoration: none;
            margin-left: 84px;
            margin-top: 20px;
        }
        .auto-style17 {
            display: inline-block;
            background-color: #b2b2b2;
            border-radius: 5px;
            box-shadow: 0 0 2px rgb(204, 204, 204);
            transition: all .5s ease;
            font-size: 14px;
            color: white;
            text-align: left;
            top: -28px;
            left: 6px;
            margin-left: 124px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table class="auto-style1">
            <tr>
                <td class="auto-style5" style="text-align: center; vertical-align: top; background-color: #FF0000;">
                </td>
                <td class="auto-style4" style="background-color: #FF0000; text-align: center; vertical-align: middle">𝓨𝓞𝓤𝓡 𝓜𝓔𝓝𝓤</td>
                <td style="text-align: center; vertical-align: middle; background-color: #FF0000;" class="auto-style6">
                    𝓒𝓞𝓜𝓟𝓐𝓝𝓨 𝓓𝓔𝓣𝓐𝓘𝓛𝓢</td>
            </tr>
            <tr>
                <td class="auto-style8" style="text-align: center; vertical-align: top; background-color: #FF0000;">
                    <asp:Label ID="Label1" runat="server" Text="Welcome,<br/>"></asp:Label>
                    <asp:Label ID="CompanyNameLabel" runat="server" Text="Label"></asp:Label>
                    <br />
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" style="margin-left: 0px" Text="Sign Out" Width="65px" CssClass="myStyle" BackColor="Red" />          
                </td>
                <td class="auto-style9" style="background-color: #D7D5D2; vertical-align: top;"><br />
                    <asp:Label ID="Label5" runat="server" Text="List: "></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="124px" style="margin-left: 127px" CssClass="dropdown">
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" Height="111px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" Width="283px" CssClass="myListBox"></asp:ListBox>
                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Delete" Width="116px" CssClass="auto-style11" />
                    <br />
                    <asp:Label ID="Label7" runat="server" ForeColor="Red" Text="Please Select an Item and Enter a Value!" Visible="False"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="Type/Food Name:"></asp:Label>
                     
                    <asp:TextBox ID="TextBox2" runat="server" style="margin-left: 32px" Width="111px" CssClass="test"></asp:TextBox>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Update Name" CssClass="auto-style12" />
                    <br />
                    <br />
                    <asp:Label ID="Label2" runat="server" Text="Price: "></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" TextMode="Number" Width="113px" style="margin-left: 125px" CssClass="test"></asp:TextBox>

                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="Update Price" Width="171px" CssClass="auto-style15" />
                    <br />
                    <br />
                    <asp:Label ID="Label6" runat="server" Text="Type: "></asp:Label>
<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" Height="30px" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" Width="120px" CssClass="auto-style17">
                    </asp:DropDownList>
                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="Update Type" Width="169px" CssClass="auto-style14" />
                    <br />
                    <br />
                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="Add Food" CssClass="auto-style16" Width="201px" />
                    
                </td>
                <td style="text-align: center; vertical-align: top; background-color: #D7D5D2;" class="auto-style10">
                    <br />
                    <br />

                    <asp:Label ID="Label8" runat="server" style="font-weight: 700" Text="Work Hours"></asp:Label>

                    <br />
                   
                    <asp:Label ID="Label9" runat="server" Text="0"></asp:Label>
<asp:Label ID="Label10" runat="server" Text="-"></asp:Label>
<asp:Label ID="Label11" runat="server" Text="0"></asp:Label>
                    <br />
                    <asp:Label ID="Label12" runat="server" style="font-weight: 700" Text="Service Time"></asp:Label>
                    
                    <br />
                    <asp:Label ID="Label13" runat="server" Text="0"></asp:Label>
                    <br />
                    <asp:Label ID="Label14" runat="server" style="font-weight: 700" Text="Minimum Price"></asp:Label>
                    
                    <br />
                    
                    <asp:Label ID="Label15" runat="server" Text="0"></asp:Label>
                    <br />
                    <br />
                    <asp:DropDownList ID="DropDownList3" runat="server" AutoPostBack="True" style="margin-left: 0px" CssClass="dropdown" Height="21px" Width="50px">
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
                    &emsp;
                    <asp:Label ID="Label16" runat="server" Text="-"></asp:Label>

                    <asp:DropDownList ID="DropDownList4" runat="server" AutoPostBack="True" style="margin-left: 27px" CssClass="dropdown" Height="17px" Width="50px">
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
                    <asp:Button ID="Button7" runat="server" OnClick="Button7_Click1" Text="Update Work Hours" Width="200px" CssClass="auto-style7" />
                    <br />
                    <br />
                    <br />
                    <asp:DropDownList ID="DropDownList5" runat="server" AutoPostBack="True" CssClass="dropdown" Height="20px" Width="50px">
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                        <asp:ListItem>60</asp:ListItem>
                        <asp:ListItem>75</asp:ListItem>
                        <asp:ListItem>90</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="Update Service Time" Width="200px" CssClass="auto-style7" />
                    <br />
                    <br />
                    <br />
                    <asp:DropDownList ID="DropDownList6" runat="server" AutoPostBack="True" CssClass="dropdown" Height="20px" Width="50px">
                        <asp:ListItem>0</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem Value="30"></asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                    </asp:DropDownList>
                    <br />
                    <br />
                    <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="Update Minimum Price" Width="200px" CssClass="auto-style7" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2" style="text-align: center; vertical-align: top">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td style="text-align: left; vertical-align: top">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
