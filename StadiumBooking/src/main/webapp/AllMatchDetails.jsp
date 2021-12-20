<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
   <%@page import="com.stadiumbooking.daoimpl.MatchDaoImpl" %>
    <%@page import="java.sql.ResultSet" %>
    
    <%
    MatchDaoImpl matchDao=new MatchDaoImpl();
    ResultSet rs=matchDao.getAllMatchDetalis();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

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
        
      
        }
           #sportInfo{
            position: absolute;
            left: 300px;
        }
        #mathcInfo{
            position: absolute;
            left: 600px;
            
}
#matchInfo hr{
width:400px;
}
img{
width:50px;
height:50px;
}
button{
background-color:lightgreen;
color:red;
position:relative;
left:60px;
}
.matchDetalis {
position:relative;
left:40px;
}
    </style>

</head>
<body>

   <div class="sidenav">
        <a href="UserProfile.jsp">Profile</a>
        <a href="matchDetails.jsp">Matchs Detalis</a>
        <a href="Getallusers.jsp">All User</a>
        <a href="AllMatchDetails.jsp">All Matchs Detalis</a>
        <a href="#">Booking Details</a>
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
        <img src="<%=rs.getString(8) %>" >  &nbsp;  &nbsp; <label ><b><%=rs.getString(6) %></b> &nbsp; Vs &nbsp; <b> <%=rs.getString(7) %> </b></label>
   &nbsp;  &nbsp;     <img src="<%=rs.getString(9) %>" alt=""> <br> <br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label class="matchDetalis" ><%=rs.getString(3) %></label><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label class="matchDetalis" ><%=rs.getString(4) %></label><br>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label class="matchDetalis" ><%=rs.getDate(5) %></label><br>

        <button>Book Now</button>
        <hr>
<%} %>

    </div>

</body>
</html>