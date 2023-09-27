<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Landing Page.aspx.cs" Inherits="wwwroot_Landing_Page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Webpage Design</title>
    <link rel="stylesheet" href="style.css"/>
    <link href="CSS/HomePage.css" rel="stylesheet" />

    <style>
body {
  background-image: url('Images/Laptop.jpg');
  background-repeat: no-repeat;
  background-attachment: fixed;  
  background-size: cover;
}


</style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="main">
            <div class="navbar">
                <div class="icon">
                    
                 <asp:Image ID="Image1" runat="server" Width="80px" Height="80px" ImageUrl="~/wwwroot/Images/inventory.png" /> 
            </div>

                <div class="menu">
                <ul>
                    <li><a href="#">HOME</a></li>
                    <li><a href="#">ABOUT</a></li>
                    <li><a href="#">SERVICE</a></li>
                    <li><a href="#">DESIGN</a></li>
                    <li><a href="#">CONTACT</a></li>
                </ul>
            </div>

                 <div class="search">
                <input class="srch" type="search" name="" placeholder="Type To text">
                <a href="#"> <button class="btn">Search</button></a>
            </div>
               

            </div> 

            <div class="content">
                <h1>Inventory Central: <br/><span>Your Stock Control</span> <br/>Headquarters</h1>
                <br/>
                <p class="par"> "Effortlessly manage your inventory. Add, organize, and categorize <br> products with ease. Stay organized and focused on growing your 
                    <br/> business. Simplify inventory management today."</p>
                    <br/>

                    <button class="cn"><a href="#">JOIN US</a></button>
                    

                    <div class="form">
                        <h2>Click Login</h2>
                        <input type="email" name="email" placeholder="Enter Email Here"/>
                        <input type="password" name="" placeholder="Enter Password Here"/>
                        <asp:Button class="btnn" ID="Button1" BackColor="Orange" runat="server" Text="Login"  OnClick="Button1_Click"/>

                         <p class="link">Don't have an account<br>
                    <a href="SignIn.aspx">Sign up </a> here</a></p>
                    


                      <%--  <div class="icons">
                            <a href="#"><ion-icon name="logo-facebook"></ion-icon></a>
                            <a href="#"><ion-icon name="logo-instagram"></ion-icon></a>
                            <a href="#"><ion-icon name="logo-twitter"></ion-icon></a>
                            <a href="#"><ion-icon name="logo-google"></ion-icon></a>
                            <a href="#"><ion-icon name="logo-skype"></ion-icon></a>
                      </div>--%>

                </div>
                   
    </form>
</body>
</html>
