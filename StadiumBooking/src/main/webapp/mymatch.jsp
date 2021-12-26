<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

 <%@page import="java.sql.ResultSet"%>
 <%@page import="com.stadiumbooking.daoimpl.MatchDaoImpl" %>
 <%@page import="com.stadiumbooking.daoimpl.SeatsDaoImpl" %>
<% 
SeatsDaoImpl seatDao=new SeatsDaoImpl();
MatchDaoImpl matchDao=new MatchDaoImpl(); %>
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
        .matchDetalis{

             position: relative;
            left: 00px;
            text-align: center;
        }
</style>
</head>
<body>

 <div class="sidenav">
       <a href="usersprofile.jsp">Profile</a>
       <a href="allMatchDetalis.jsp">Matchs Detalis</a>
        <a href="mymatch.jsp?ticketId=0">My Match</a>
        <a href="#">Payment</a>
        <a href="stadiumList.jsp">Stadium Lists</a>
        <a href="ratingList.jsp">Rating Lists</a>
        <a href="index.jsp">Logout</a>
    </div>



 <%int userId = (int)session.getAttribute("id"); %>
<% 
ResultSet rs=seatDao.getSeatById(userId);
while(rs.next()){
int matchIds=rs.getInt(4);
%>

<%ResultSet rs1=matchDao.getMatchByMatchId(matchIds); 
if(rs1.next()){
%>

    <div class="matchDetalis">

        <b><%=rs1.getString(5) %></b>  Vs <b><%=rs1.getString(6) %></b>
        <br>
        <label><%=rs1.getString(2) %></label>
        <label><%=rs1.getString(1) %></label>
        <br>
        <label><%=rs1.getString(3) %></label>
         <label><%=rs1.getString(4) %></label>
         <br>
<%} %>
      <label><%=rs.getString(5) %></label>
<br>
         <label>Number Of Ticktes:<%=rs.getInt(7)%></label>

         <br>
         <label>Seats Numbers:<%=rs.getString(3) %></label>
         <br>
         <%if(rs.getString(8).equals("Booked")) {%>
<a href="mymatch.jsp?ticketId=<%= rs.getInt(1)%>">Cancelle Ticktes</a>
<%}
         else{
         
         %>
         <lable>Cancelled</lable>
         <%} %>
<hr style="width: 300px;">
<br>

    </div>
    <%} %>
    
    <% 
 int ticketId=Integer.parseInt(request.getParameter("ticketId"));

    seatDao.cancelledSeats(ticketId);%>  
    
    
</body>
</html>