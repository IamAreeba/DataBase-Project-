%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>Dashboard</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <style>
      body {
        font-family: Arial, sans-serif;
      }

      /* Scrollable menu */
      .scrollmenu {
        background-color: #333;
        overflow-x: scroll;
        white-space: nowrap;
      }

      .scrollmenu a {
        display: inline-block;
        color: white;
        text-align: center;
        padding: 14px;
        text-decoration: none;
      }

      .scrollmenu a:hover {
        background-color: #777;
      }

      /* User information */
      .user-info {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 20px;
        background-color: #f5f5f5;
      }

      .user-info h2 {
        font-size: 24px;
        margin: 0;
      }

      .user-info img {
        width: 80px;
        height: 80px;
        border-radius: 50%;
        margin-right: 20px;
      }

      /* Logout button */
      .logout {
        text-align: right;
        margin-top: 20px;
      }

      .logout button {
        height: 26px;
      }
    </style>
  </head>
  <body>
    <form id="form1" runat="server">
      <div class="user-info">
        <h2>
          <img src="~/wwwroot/Images/Avtar.jpg" alt="User avatar" />
          Welcome, <span id="lblUser" runat="server" class="user-name"></span>
        </h2>
      </div>

      <div class="scrollmenu">
        <a href="#">Home</a>
        <a href="#">Add User</a>
        <a href="#">View Record</a>
        <a href="#">About</a>
        <a href="#">Support</a>
        <a href="#">Blog</a>
        <a href="#">Tools</a>
        <a href="#">Custom</a>
        <a href="#">More</a>
        <a href="#">Partners</a>
        <a href="#">Work</a>
        <a href="#">Logout</a>
      </div>

      <h1>Hi... <span id="Label1" runat="server" class="user-name"></span></h1>
      <h1>Welcome to the Home Page...</h1>

      <div class="logout">
        <button id="Button1" runat="server" onclick="Button1_Click">Logout</button>
      </div>
    </form>
  </body>
</html>
