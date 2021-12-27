<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .sidenav {
            height: 100%;
            width: 200px;
            position: fixed;

            top: 0;
            left: 0;
            background-color:steelblue;

        }

        .sidenav a {
            padding: 6px 6px 6px 32px;
            text-decoration: none;
            font-size: 23px;
            color: white;
            display: block;
        }

        .sidenav a:hover {
            color: black;
        }

        .main {
            margin-left: 200px;
        }
        #wallet{
            position: absolute;
            left: 400px;
            top: 100px;
        }
    </style>
</head>
<body>

  <div class="sidenav">
       <a href="usersprofile.jsp">Profile</a>
        <a href="allMatchDetalis.jsp">Matchs Detalis</a>
        <a href="mymatch.jsp?ticketId=0">My Match</a>
        <a href="wallet.jsp">Wallet</a>
        <a href="stadiumList.jsp">Stadium Lists</a>
        <a href="ratingList.jsp">Rating Lists</a>
        <a href="index.jsp">Logout</a>
    </div>
 <%int userID = (int)session.getAttribute("id"); %>    
      <div id="wallet">
    <form action="wallets" onsubmit="return insertwallet()">


        <input style="visibility: hidden;" type="text" name="userID" value="<%=userID%>" >
        <br>
        <label ><b>Enter Amount:</b></label>
        <input type="text" name="amount" id="amount">
        <br>
        <label style="visibility: hidden;" id="amountError">Enter Amount</label>
        <br>
        <button type="submit">Submit</button>


    </form>
</div>
    
</body>
</html>
<script>
    function insertwallet(){

        
        var amountDetails=document.getElementById("amount");

        if(amountDetails.value.trim() ==""){
            console.log("Working")
            document.getElementById("amountError").style.visibility="visible";
            document.getElementById("amountError").style.color="red";
            document.getElementById("amountError").style.position="relative";
            document.getElementById("amountError").style.left="100px";
            return false;
        }
            }
</script>