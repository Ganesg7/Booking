<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="com.stadiumbooking.daoimpl.MatchDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    
    <%
    MatchDaoImpl matchDao=new MatchDaoImpl();
    ResultSet rs=matchDao.getAllMatchDetalis();
    %>
    
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
        #sportInfo{
            position: absolute;
            left: 300px;
        }
        #mathcInfo{
            position: absolute;
            left: 500px;
            top: 50px;
        }
    </style>
</head>

<body>
    <div class="sidenav">
        <a href="UserProfile.jsp">Profile</a>
        <a href="allMatchDetalis.jsp">Matchs Detalis</a>
        <a href="#">My Match</a>
        <a href="#">Payment</a>
        <a href="index.jsp">Logout</a>
    </div>
<!-- 
    <div id="sportInfo">
    
        <b>{sports.name}</b>  &nbsp; <b>{sports.name}</b> &nbsp; <b>{sports.name}</b>
        <br> <br>
        <hr>
     </div>
 -->
 
 
    <div id="mathcInfo">
 <%while(rs.next())
	 {%>     
     <br>
        <img src="<%=rs.getString(8) %>" alt="">  &nbsp;  &nbsp; <label for=""><b><%=rs.getString(6) %></b> &nbsp; Vs &nbsp; <b> <%=rs.getString(7) %> </b></label>
        <img src="<%=rs.getString(9) %>" alt=""> <br> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for=""><%=rs.getString(3) %></label><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for=""><%=rs.getString(4) %></label><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label for=""><%=rs.getDate(5) %></label><br>

        <button><%=rs.getInt(13) %> Book Now</button>
        <hr>
<%} %>

    </div>
    
</body>
</html>