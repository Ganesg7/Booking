<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
<%@page import="com.stadiumbooking.daoimpl.UserDaoImpl"%>
<%@page import="java.sql.ResultSet"%>


<%
   UserDaoImpl userDao1=new UserDaoImpl();
    ResultSet rs = userDao1.getAllUser();
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
        
        table {
             position: absolute;
             left:235px;  
             top:50px;     
            width: 80%;
            border-collapse: collapse;
            
            border-top: none;
        }

        th {
            height: 60px;
            border: 1px solid black;
        }

        td {
        height:20px;
            text-align: center;
            border: 1px solid black;
        }
         th:hover{
            color: blue;
        }
        td:hover{
        color:blue;
        
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
   
    <table id="tabel">
      <tr>  
     <th>User ID</th>
     <th>Name</th>
     <th>Username</th>
     <th>Role</th> 
     <th>Password</th>
     <th>Eamil</th>
     <th>Phone Number</th> 
     <th></th> 
     </tr>  

<% while (rs.next()) 
{ 
   %>
	<tr>
	 <td>
	  <%= rs.getInt(1)%> </td>
	<td><%= rs.getString(2)%></td>
	<td><%= rs.getString(3)%></td> 
	<td><%= rs.getString(4)%> </td> 
	<td> <%=rs.getString(5)%> </td> 
	<td> <%=rs.getString(6)%></td>
	<td><%=rs.getLong(7) %></td>
	<td><a href="Getallusers.jsp?deleteId=<%=rs.getInt(1)%>">Delete</a></td>
	</tr>  
 
<% }  

%>


    	<% 
 int userId=Integer.parseInt(request.getParameter("deleteId"));
System.out.println(userId);
userDao1.deleteUser(userId); %>       
    


</table>


</body>
</html>