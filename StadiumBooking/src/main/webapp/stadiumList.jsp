<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.ResultSet"%>
     <%@page import="com.stadiumbooking.daoimpl.StadiumDaoImpl" %>
     <%StadiumDaoImpl stadiumDao=new StadiumDaoImpl(); %>
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
        </style>
</head>
<body>
  <table>
   <tr>
   <th>Stadium Name</th>
   <th></th>
   </tr>
   <tr>
       <%ResultSet rs=stadiumDao.getAllStadiumList(); 
while(rs.next()){
%>
     
   <div>
 
   <td><a href="rating.jsp?stadiumId=<%=rs.getInt(1)%>"><%=rs.getString(2) %></a></td>
  <td> <img src="<%=rs.getString(3) %>" ></td>
       </tr>
       
    </div>
     <%} %></table>
</body>
</html>