<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HomePage01.aspx.cs" Inherits="wwwroot_HomePage01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>DashBoard</title>
    <meta name="viewport"  content="width=device-width, initial-scale=1"/>
    <style>

        div.scrollmenu{
            background-color: #333;
            overflow:auto;
            white-space:nowrap;
        }

            div.scrollmenu a {
                display: inline-block;
                color:white;
                text-align:center;
                padding:14px;
                text-decoration:none;
            }

            div.scrollmenu a:hover{
                background-color: #777;
            }




    </style>




</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <h2>
                <asp:Image ID="Image1" runat="server" Width="80px" Height="80px" ImageUrl="~/wwwroot/Images/Avtar.jpg" /> Welcome, &nbsp; <asp:Label ID="lblUser" runat="server" Text="Label" ForeColor="SeaGreen"></asp:Label>
            </h2>
            <hr />
        </div>

        <div class="scrollmenu">
            <h2>

            <a href="#" >Home</a>
            <a href="#" >Add User</a>
            <a href="#" >View Record</a>
            <a href="#" >About</a>
            <a href="#" >Support</a>
            <a href="#" >Blog</a>
            <a href="#" >Tools</a>

            <a href="#" >Custom</a>
            <a href="#" >More</a>

            <a href="#" >Partners</a>
            <a href="#" >Work</a>
            <a href="#" >Logout</a>


            
            </h2>
        </div>

        





       <h1>Hi....<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> </h1>

        <h1>Welcome To Home Page ...... </h1>

        <div style="float:right">
            <asp:Button ID="Button1" runat="server" Text="Logout" OnClick="Button1_Click" style="height: 26px" />
        </div>
    
    </div>
    </form>
</body>
</html>
