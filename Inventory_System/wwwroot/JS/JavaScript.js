

function ValidateForm() {
    var User = document.getElementById("txtUserName").value;
    var Pass = document.getElementById("txtPassword").value;

    if (User == "" && Pass == "") {
        alert("UserName and Password are necessary ! plz enter and tryagain ...");
        document.getElementById("txtUserName").focus();
        return false;
    }

    else if(User == ""){
        alert("UserName necessary ! plz enter UserName ...");
        document.getElementById("txtUserName").focus();
        return false;
    }

    else if (Pass == "") {
        alert("Password necessary ! plz enter Password ...");
        document.getElementById("txtPassword").focus();
        return false;
    }

    else if (User.length == 0) {
        alert("Enter UserName. It can not be blank ...");
        document.getElementById("txtUserName").focus();
        return false;
    }




        // condition N0: 02
    else if (User.length < 4) {
        alert("Invalid Length. User Name should be atleast 4 characters ...");
        document.getElementById("txtUserName").focus();
        return false;
    }


    else if (Pass .length<4 ||  Pass.length >=18) {
        alert("Invalid Length. Password should atleast 4 chracter Long & Max 18 Char ...");
        document.getElementById("txtPassword").focus();
        return false;
    }

    return true;


}

//function msg()
//{
//    alert("hello you click login button")
//    return true;
//}


