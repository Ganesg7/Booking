<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <style>
        body {
            background-image: url('https://media.istockphoto.com/photos/grand-cricket-stadium-with-wooden-wickets-side-view-in-daylight-picture-id1158435316?b=1&k=20&m=1158435316&s=170667a&w=0&h=GXo6oaRSwWGXh5kqtHG76bIX80wTIFPEBzfDIFLsuE0=');
            background-repeat: no-repeat;
            background-size: 1370px;
            
        }
        ul {
            margin: 0;
            overflow: hidden;
            background-color: transparent;
            color: white;
            font-weight: bolder;
            padding: 16px;
            opacity: 0.5px;
        }

        li {
            float: right;
            color: black;
        }
      #logo {
            font-size:x-large;
            color: black;
            font-style: oblique;
            position: absolute;
            left: 130px;
            top: 35px;
        }

        #png{
            position: absolute;
            top: -5px;
        }

        #login {
            visibility: hidden;
            position: absolute;
            width: 300px;
            height: 300px;
            border: 2px solid white;
            left: 500px;
            top: 250px;
            color: white;
        }

        #login input,
        #login label,
        #login  button,
        #login  i {

            position: relative;
            top: 60px;
            left: 50px;
        }

        #login input {
            background: transparent;
            border: none;
            border-bottom: 2px solid lawngreen;
            color: white;
            font-weight: bold;
        }


        #register {
            color: white;

            visibility: hidden;
            position: absolute;
            width: 300px;
            height: 340px;
            border: 2px solid white;
            top: 250px;
            left:  500px;
        }


        #register input {
            border: none;
            background: transparent;
            border-bottom: 2px solid lawngreen;
            color: white;
            font-weight: bold;
            position: relative;
            left: 60px;
            top: 20px;
        }

        input::placeholder {
            color:white;
            font-size: 14px;
        }
        #register button,
        #register i{
            position: relative;
            left: 40px;
            top: 15px;
        }
        #register label{
        position:relative;
        left:60px;
        top:20px
        }

        button {
            background-color: red;
            color: white;
            width: 100px;
            height: 25px;
            border-radius: 10px;
            font-weight: bold;

        }

        button:hover {
            background-color: green;
        }
        #register button{
        position:relative;
        top:30px;}

        b{
            color:blue;
            font-size: large;
        }
        
        #registered{
            color: green;
            position: absolute;
            left: 500px;
            top: 200px;
            font-weight: bolder;
            font-size: xx-large;
        }
    </style>
</head>

<body>
    <!--Nav Bar-->
    <div id="nav">

        <ul type="none">
            
            <img id="png" src="https://library.kissclipart.com/20180905/gcq/kissclipart-stadium-icon-clipart-stadium-football-computer-ico-394b008bd0e1fa5e.png" 
            style="height: 100px; width: 100px;"
            >
            <b id="logo"> MatchBooking</b>
    
            <li onclick="regsiter()">SignUp</li>
            <li>&nbsp; &nbsp;</li>
            <li>/</li>
            <li> &nbsp; &nbsp; </li>
            <li onclick="logV()">Login</li>
        </ul>
    </div>
  


    <!--Login-->

    <div id="login">
        <b>Login Form</b>
        <form action="adminHomeServes" onsubmit="return validate()">
            <input type="text" id="uname" name="username" placeholder="Username" />
            <br> <label id="luser" style="color:yellow; visibility: hidden;">Enter Username</label> <br>
            <input type="password" id="pass" name="password" placeholder="Password" />
            <br> <label id="lpass" style="color: yellow; visibility: hidden;">Enter Password</label>
            <br> <br>
            <button type="submit">Submit</button>

            <br> <br><i onclick="RegD()">Don't Have An Accont...??</i>
        </form>
    </div>
    <!-- Error Message -->
  
    <%
    String error=(String)session.getAttribute("error");
    if (error!=null) {
    %>
     <h2  id="Emesg" onclick="Error()" style="position:relative; left:500px; top:150px;color:red;visibility:visible"> <%=session.getAttribute("error") %></h2>
   <%} %> <!--Regster-->
    <div id="register">
        <b>Register Form</b>
        <form action="loginserv" method="get" onsubmit="return  reg()">
            <input type="text" id="name" name="name" placeholder="Enter Your Name"> <br>
            <label id="lname" style="visibility: hidden;">Enter Your Name</label>
            <br>
            <input type="text" id="runame" name="uname" placeholder="Enter Your Username"> <br>
            <label for="username" id="luname" style="visibility: hidden;">Enter Your Username</label>
            <br>
            <input type="password" name="pass" id="rpass"    placeholder="Enter Your Password"> <br>
            <label id="repass" style="visibility: hidden;">Enter Password</label>
            <br>
            <input type="email" id="mail" name="mail" placeholder="Enter Your E-mail"> <br>
            <label id="lmail" style="visibility: hidden;">Enter Your E-Mail</label>
            <br>
            <input type="text" name="phone" id="phone" placeholder="Enter Your Mobile Number"> <br>

            <label id="mobile" style="visibility: hidden;">Enter Mobile Number</label>
            <br>
            <button type="submit">Sign Up</button> &nbsp; &nbsp; <button type="reset">Reset</button>
            <br> <br> <i onclick="RegV()">Already Have An Account..??</i>

        </form>

    </div>


</body>

</html>
<script>
    function logV() {

        document.getElementById("login").style.visibility = "visible";
        document.getElementById("register").style.visibility = "hidden";
        document.getElementById("lname").style.visibility = "hidden";
        document.getElementById("luname").style.visibility = "hidden";
        document.getElementById("repass").style.visibility = "hidden"; 
        document.getElementById("lmail").style.visibility = "hidden";
        document.getElementById("mobile").style.visibility = "hidden";
        document.getElementById("registered").style.visibility="hidden";
        document.getElementById("Emesg").style.visibility="hidden";
        
        
    }

    function regsiter() {
        document.getElementById("login").style.visibility = "hidden";
        document.getElementById("register").style.visibility = "visible";
        document.getElementById("luser").style.visibility = "hidden";
        document.getElementById("lpass").style.visibility = "hidden";
        document.getElementById("registered").style.visibility="hidden";
        document.getElementById("Emesg").style.visibility="hidden";
    }

    function RegD() {


        document.getElementById("register").style.visibility = "visible";
        document.getElementById("login").style.visibility = "hidden";
        document.getElementById("luser").style.visibility = "hidden";
        document.getElementById("lpass").style.visibility = "hidden";
        document.getElementById("registered").style.visibility="hidden";
        document.getElementById("Emesg").style.visibility="hidden";
    }

    function RegV() {

        document.getElementById("login").style.visibility = "visible";
        document.getElementById("register").style.visibility = "hidden";
        document.getElementById("lname").style.visibility = "hidden";
        document.getElementById("luname").style.visibility = "hidden";
        document.getElementById("repass").style.visibility = "hidden"; 
        document.getElementById("lmail").style.visibility = "hidden";
        document.getElementById("mobile").style.visibility = "hidden";
        document.getElementById("registered").style.visibility="hidden";
        document.getElementById("Emesg").style.visibility="hidden";
    }
    
    function Error(){
    	 document.getElementById("Emesg").style.visibility="hidden";
    	 document.getElementById("login").style.visibility = "visible";
    }

    function validate() {
        var username = document.getElementById("uname");
        var password = document.getElementById("pass");

        if (username.value.trim() == "") {

            document.getElementById("luser").style.visibility = "visible";
            username.style.borderBottom = "solid 3px black";
            return false;

        }
        else if (password.value.trim() == "") {

            password.style.borderBottom = "solid 3px black";
            document.getElementById("lpass").style.visibility = "visible";
            return false;
        }
        else if (password.value.trim().length < 5) {

            document.getElementById("lpass").style.visibility = "visible";
            document.getElementById("lpass").innerHTML = "Password Too Short";
            return false;
        }
        else {
            return true;
        }
    }



    function reg() {
        var name = document.getElementById("name");
        var username = document.getElementById("runame");
        var password = document.getElementById("rpass");
        var email = document.getElementById("mail");
        var mobileNumber = document.getElementById("phone");
        var emailExpression=/[A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}/;
        var mobileExpression = /[6-9][0-9]{9}$/;

        if (name.value.trim() == "") {
            document.getElementById("lname").style.visibility = "visible";
            document.getElementById("lname").style.color = "yellow";
            name.style.borderBottom = "2px solid black";
            return false;
        }
        
        else if(name.value.trim().length<5){
            document.getElementById("lname").style.visibility = "visible";
            document.getElementById("lname").style.color = "yellow";
            document.getElementById("lname").innerHTML="Name Too Short";
            username.style.borderBottom = "2px solid black";
            return false;
        }
        
        else if (username.value.trim() == "") {
            document.getElementById("luname").style.visibility = "visible";
            document.getElementById("luname").style.color = "yellow";
            username.style.borderBottom = "2px solid black";
            return false;
        }
        else if(username.value.trim().length<5){
            document.getElementById("luname").style.visibility = "visible";
            document.getElementById("luname").style.color = "yellow";
            document.getElementById("luname").innerHTML="Username Too Short";
            username.style.borderBottom = "2px solid black";
            return false;
        }
        else if (password.value.trim() == "") {
            document.getElementById("repass").style.visibility = "visible";
            document.getElementById("repass").style.color = "yellow";
            password.style.borderBottom = "2px solid black";
            return false;
        }
        else if (password.value.trim().length < 5) {

            document.getElementById("repass").style.visibility = "visible";
            document.getElementById("repass").style.color = "yellow";
            document.getElementById("repass").innerHTML = "Password Too Short";
            return false;
        }
        else if (email.value.trim() == "") {
            document.getElementById("lmail").style.visibility = "visible";
            document.getElementById("lmail").style.color = "yellow";
            email.style.borderBottom = "2px solid black";
            return false;
        }

        else if(emailExpression.test(email.value) == false){
            document.getElementById("lmail").style.visibility = "visible";
            document.getElementById("lmail").style.color = "yellow";
            document.getElementById("lmail").innerHTML="Invalid Email Format";
            email.style.borderBottom = "2px solid black";
            return false;
        }
        
        else if (mobileNumber.value.trim() == "") {
            document.getElementById("mobile").style.visibility = "visible";
            document.getElementById("mobile").style.color = "yellow";
            mobileNumber.style.borderBottom = "2px solid black";
            return false;
        }
        else if (mobileExpression.test(mobileNumber.value) == false) {
            document.getElementById("mobile").innerHTML = "Invalid Number";
            document.getElementById("mobile").style.visibility = "visible";
            document.getElementById("mobile").style.color = "yellow";
            return false;
        }
        else if (mobileExpression.test(mobileNumber.value) && emailExpression.test(email.value)) {
            return true;
        }

    }



</script>