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

   <div>
       <%ResultSet rs=stadiumDao.getAllStadiumList(); 

%>
        <img src="https://images.hindustantimes.com/rf/image_size_960x540/HT/p2/2017/09/20/Pictures/_6ae70e06-9def-11e7-ba2d-20fa1b34073f.jpg" alt="">
        
      &nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;
        <img src="https://media-cdn.tripadvisor.com/media/photo-s/09/4e/e5/3c/chepauk-stadium.jpg" alt="">
       <br>
        <b>Chappak</b> <b style="position: relative;left: 720px;">Stadium Name</b>
    </div>
</body>
</html>