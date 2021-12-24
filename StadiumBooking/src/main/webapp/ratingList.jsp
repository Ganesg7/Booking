<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@page import="java.sql.ResultSet"%>
        <%@page import="com.stadiumbooking.daoimpl.RatingsDaoImpl" %>
     <%@page import="com.stadiumbooking.daoimpl.StadiumDaoImpl" %>
      <%@page import="com.stadiumbooking.daoimpl.UserDaoImpl"%>
     <%StadiumDaoImpl stadiumDao=new StadiumDaoImpl(); 
     RatingsDaoImpl ratingDao=new RatingsDaoImpl();
     UserDaoImpl userDao=new UserDaoImpl();
     %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
  img{
            width: 300px;
            height: 300px;
            border: 2px solid black;
            position: relative;
            left: 350px;
        }
        b{
            position: relative;
            left: 380px;
        }
       .rating label{
       position: relative;
            left: 200px;
       column-count: 3;
       }
       
       #review{
       border:2px solid black;
      width:100px ;
       }
        </style>
</head>
<body>
<%ResultSet rs=stadiumDao.getAllStadiumList(); 
while(rs.next()){
%>
     
   <div class="rating">
   <img src="<%=rs.getString(3) %>" >
      
       <br>
       <b><%=rs.getString(2) %></b> 
       <br>
       <%int stadiumId=rs.getInt(1);
       System.out.println(stadiumId);
       ResultSet rs1=ratingDao.getAllRatingsById(stadiumId);
       
       while(rs1.next()){
       int userId=rs1.getInt(2);
       
       ResultSet rs3=userDao.getUserById(userId);
       if(rs3.next()){
       %> 
       <b><%=rs3.getString(2) %> &nbsp;<label><%=rs1.getDouble(4) %></label></b>       <br>
       <%} %>
        &nbsp; 
      
      <br> 
       <label id="review"><%=rs1.getString(3) %></label>
       <br>
       <%} %>
       <br>
    </div>
    <hr>
    <br>
     <%} %>
</body>
</html>