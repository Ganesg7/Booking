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
        #stadium{
            position: absolute;
            left: 400px;
            top: 100px;
        }
    </style>
</head>
<body>
    <div class="sidenav">
         <a href="UserProfile.jsp">Profile</a>
        <a href="matchDetails.jsp">Matchs Details</a>
        <a href="stadiumDetalis.jsp">Stadium Details</a>
        <a href="sportsDetalis.jsp">Sports Details</a>
       <a href="Getallusers.jsp?deleteId=0">All User</a>
        <a href="AllMatchDetails.jsp">All Matchs Details</a>
        <a href="allBookingDetails.jsp">Booking Details</a>
        <a href="allUserWalletList.jsp">All User Wallet List</a>
        <a href="stadiumList.jsp">Stadium Lists</a>
        <a href="ratingList.jsp">Rating Lists</a>
        <a href="index.jsp">Logout</a>
    </div>
    <br>
    <div id="stadium">
    <form action="stadium" onsubmit="return insert()">

        <label ><b>Stadium Name:</b></label>
        <input type="text" name="stadiumName" id="stadiumName" >
        <br>
        
        <label style="visibility: hidden;" id="stadiumError">Enter Stadium Name</label>
        <br>
        <label ><b>Stadium Image :</b></label>
        <input type="url" name="stadiumImge" id="stadiumImge">
        <br>
        <label style="visibility: hidden;" id="image">Enter Image Url</label>
        <br>
        <button type="submit">Submit</button>
     

    </form>
</div>
</body>
</html>
<script>
    function insert(){

        var sstadiumName=document.getElementById("stadiumName");
        var stadiumImge=document.getElementById("stadiumImge");

        if(sstadiumName.value.trim() ==""){
            console.log("vanakkam")
            document.getElementById("stadiumError").style.visibility="visible";
            document.getElementById("stadiumError").style.color="red";
            document.getElementById("stadiumError").style.position="relative";
            document.getElementById("stadiumError").style.left="100px";
            return false;
        }
        else if(stadiumImge.value.trim()==""){
            document.getElementById("image").style.visibility="visible";
            document.getElementById("image").style.color="red";
            document.getElementById("image").style.position="relative";
            document.getElementById("image").style.left="100px";
            return false;

        }
    }
</script>