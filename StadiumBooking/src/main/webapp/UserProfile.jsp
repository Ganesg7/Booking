<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@page import= "com.stadiumbooking.module.User" %>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="com.stadiumbooking.daoimpl.UserDaoImpl" %>

  
    
   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Pofile</title>
<style type="text/css">


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
   



  #userInfo{
            position: absolute;
            left: 300px;
            top: 50px;
        }
    </style>
</head>
<body>

  <div class="sidenav">
        <a href="UserProfile.jsp">Profile</a>
        <a href="MatchDetali.html">Matchs Detalis</a>
        <a href="Getallusers.jsp">All User</a>
        <a href="AllMatchDetails.jsp">Matchs Detalis</a>
        <a href="#">Booking Details</a>
        <a href="index.jsp">Logout</a>
    </div>


 <%int i = (int)session.getAttribute("id"); %>
   <% 
  System.out.println(i);
   UserDaoImpl userDao=new UserDaoImpl();
   
	ResultSet rs1=userDao.getUserById(i);
    
    %>
  <div id="userInfo">
<% if(rs1.next()){
	%>
        <label for=""><b>Name:</b> &nbsp; <%= rs1.getString(2)%>  </label> <br>
        <label for=""><b>Username:</b>&nbsp; <%= rs1.getString(3)%> </label> <br>
        <label for=""><b>Mobile:</b>&nbsp; <%= rs1.getLong(7)%> </label> <br>
        <label for=""><b>Email:</b> &nbsp; <%= rs1.getString(6)%> </label> <br>
 <%} %>
 
 
  </div>
</body>
</html>
<script>

</script>