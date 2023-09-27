<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignIn.aspx.cs" Inherits="wwwroot_SignIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registeration</title>


    <meta charset ="UTF-8" />
    <meta name="description" content="Free Web Tutorial" />
    <meta name ="keywords" content="HTML, CSS, XML, JS" />
    <meta name="author" content="Areeba" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />


    <link href="CSS/Header.css" rel="stylesheet" />
    <link href="CSS/Footer.css" rel="stylesheet" />
    <link href="CSS/LoginCSS.css" rel="stylesheet" />

     <%--Linking CSS--%>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
    <link href="CSS/w3.css" rel="stylesheet" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>

    <script type="text/javascript">

        function Validate() {
            var pass = document.getElementById("txtPassword").value;
            var confirmPass = document.getElementById("txtConfirmPass").value;
            if (pass != confirmPass) {
                alert('Password do not match');
                document.getElementById("txtConfirmass").focus();

                return false;
            }

            return true;
        }
    </script>

    <%--Validation using jquery--%>
        <%--<script type="text/javascript">
            $(function () {
                $("#btnSubmit").click(function () {
                    var pass = $("#txtPassword").val();
                    var confirmPass = $("#txtConfirmPass").val();
                    if (pass != confirmPass) {
                        alert("Jquery Password and confirm password do not match");
                        return false;
                    }
                    return true;

                })
            })

        </script>--%>

</head>
<body onload="Validate()">
    <form id="form1" runat="server" >
    <div>

        <%--This is the Header Section--%>
        <header>
            <div class="wrapper">
                <h1> AREEBA WEBSITE </h1>
                <nav>
                    <ul>
                        <li><a href="#"> Home </a></li>
                        <li><a href="#"> PortFolio </a></li>
                        <li><a href="#"> Contact </a></li>
                        <li><a href="Login.aspx"> Login </a></li>
                    </ul>
                </nav>

            </div>
        </header>
        <%--Header Section end here--%>


        <%--Linking SignIn for using w3CSS  Starting--%>

                         <h2 class="w3-center">Sign In&nbsp;</h2>
        <div class="container">
                  
                 <div class="w3-row w3-section">
                   <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user"></i></div>
                     <div class="w3-rest">


                         <%--Using AJAX Extension Start--%>
                         <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                         <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                             <ContentTemplate>
                                 <asp:TextBox ID="txtUserName" runat="server" class="w3-input w3-border w3-border w3-round-large"  placeholder="First Name" OnTextChanged="txtUserName_TextChanged" AutoPostBack="true" ></asp:TextBox>
                                 <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

                             </ContentTemplate>
                         </asp:UpdatePanel>


                         <%--Using AJAX Extension End--%>


                     </div>

                 </div>
                 
                 <div class="w3-row w3-section">
                   <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-lock "></i></div>
                     <div class="w3-rest">
                       <asp:TextBox ID="txtPassword" runat="server" class="w3-input w3-border w3-border w3-round-large"  placeholder="Password" ></asp:TextBox>
                          <%--Using Field Validator--%>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Password is Empty" ControlToValidate="txtPassword" ForeColor="#FF5050"></asp:RequiredFieldValidator>

                     </div>
                 </div>
                 
                 <div class="w3-row w3-section">
                   <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-lock"></i> </div>
                     <div class="w3-rest">
                       <asp:TextBox ID="txtConfirmPass" runat="server" class="w3-input w3-border w3-border w3-round-large"  placeholder="ConfirmPassword" ></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Confirm Password in empty" ControlToValidate="txtConfirmPass" ForeColor="#FF3300"></asp:RequiredFieldValidator>
                         &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="*Password not match" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPass" ForeColor="#FF3300"></asp:CompareValidator>
                     </div>
                 </div>
                 
            <asp:Button ID="btnSubmit" runat="server" Text="Submit" class="w3-button w3-block w3-section w3-blue w3-ripple w3-padding" OnClick="btnSubmit_Click" OnClientClick="return Validate();" />

            

       


    

        <%--Linking SignIn for using w3CSS  Ending--%>
        </div>

    </div>
    </form>
</body>
</html>
