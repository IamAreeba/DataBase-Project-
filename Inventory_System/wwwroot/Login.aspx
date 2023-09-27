<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="wwwroot_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title> Final Year Project </title>
    <link href="CSS/Header.css" rel="stylesheet" />
    <link href="CSS/Footer.css" rel="stylesheet" />
    <link href="CSS/LoginCSS.css" rel="stylesheet" />

    <meta charset ="UTF-8" />
    <meta name="description" content="Free Web Tutorial" />
    <meta name ="keywords" content="HTML, CSS, XML, JS" />
    <meta name="author" content="Areeba" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />


    <script lang="javascript" type="text/javascript">
        function ValidateForm() {

            var user = document.getElementById("TextBox1").valueOf;
            var psw = document.getElementById("TextBox2").valueOf;

            //Condition No 01;
            if (user == "" && psw == "") {
                alert("UserName and Password are Necessary ! Plz enter and try again...");
                return false;
            }

            else if (user == "") {
                alert("User Name necessary ! plz enter UserName...");
                document.getElementById("TextBox1").focus();
                return false;
            }

            else if (psw == "") {
                alert("Password Name necessary ! plz enter UserName..");
                document.getElementById("TextBox2").focus();
                return false;
            }
        //    else if (User.Length == 0)
        //    {
        //        alert('Enter UserName. It can not be blank ...');
        //    return false;
        //}

        //    // condition N0: 02
        //else if (User.Length < 4)
        //{
        //    alert('Invalid Length. User Name should be atleast 4 characters ...');
        //    return false;
        //}


        //else if (Pass.Length < 4 || Pass.Length >= 18)
        //{
        //    alert('Invalid Length. Password should atleast 4 chracter Long & Max 18 Char ...');
        //    document.getElementById("txtPassword").focus();
        //    return false;
        //}
        //    return true;
        }


        // Autofill Password
        function showPass()
        {
            var cookies = document.cookie;
            var allCookies = cookies.split(";");
            for (ctr = 0; ctr < allCookies.length; ctr++) {
                var dt = allCookies[ctr];
                var str = dt.split("=");
                if (str[0].trim() == document.getElementById("txtUserName").valueOf.Trim())
                {
                    document.getElementById("txtPassword").value = str[1];
                    break;
                }
            }
        }

    </script>

    
</head>
<body onload="showPass()">
    <form id="form1" runat="server">
        <div>
        <%--This is the Header Section--%>
        <header>
            <div class="wrapper">
                <h1> AREEBA WEBSITE </h1>
                <nav>
                    <ul>
                        <li><a href="#"> Home </a></li>
                        <li><a href="#"> About </a></li>
                        <li><a href="#"> Contact </a></li>
                        <li><a href="SignIn.aspx"> SignIn </a></li>
                    </ul>
                </nav>

            </div>
        </header>
        <%--Header Section end here--%> 

        <div style="width:700px; margin-left:350px; margin-top:50px;">
            <h2 style="text-align:center; background-color:lightgreen; padding:10px;"> Login Form </h2>
        </div>

        <div class="imgcontainer">
            <img src="Images/Tick.png" alt="Avtar" class="avtar"/>
            <br />
        </div>

        <div class="container">
            <label for="uname"><b>UserName: 
            <br />
            </b></label>
            <asp:TextBox ID="txtUserName" runat="server" placeholder="Enter UserName" Width="700px"></asp:TextBox>

            <label for="psw"><b>
            <br />
            Password: 
            <br />
            </b></label>
            <asp:TextBox ID="txtPassword" runat="server" placeholder="Enter Password" TextMode="Password" Width="700px"></asp:TextBox>

            <br />

            <asp:Button ID="Button1" runat="server" Text="Login" type="submit" Font-Size="Larger" OnClick="Button1_Click"  OnClientClick="return ValidateForm()" Width="700px" />
            <label>
            <br />
            <br />
            <asp:CheckBox ID="CheckBox1" runat="server" Font-Size="Larger" Text="Remember Me" />
            <br />
            </label>
        </div>

        

    </div>

        <div class="container">
            <button type="button" class="cancelbtn">Cancel</button>
            <span class="psw">Forgot<a href="#">Password?</a><br />
            </span>

        </div>

        <br />  
        <footer>
            <div class="wrapper">

                <div id="footer-info">
                    <p>Copyright@2020 Areeba.in All right reserved</p>
                    <p><a href="#">Terms of Services</a> || <a href="#">Privacy</a></p>
                </div>

                <div id="footer-links">
                    <ul>
                        <li><h5>Home</h5></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Meet The Team</a></li>
                        <li><a href="#">What we do?</a></li>
                        <li><a href="#">Careers</a></li>   
                    </ul>

                    <ul>
                        <li><h5>Company</h5></li>
                        <li><a href="#">About Us</a></li>
                        <li><a href="#">Meet The Team</a></li>
                        <li><a href="#">What we do?</a></li>
                        <li><a href="#">Careers</a></li>   
                    </ul>
                </div>
                <div class="clear">

                </div>

            </div>
        </footer>
   
    </form>
</body>
</html>
