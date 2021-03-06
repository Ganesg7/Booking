<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.stadiumbooking.module.User"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.stadiumbooking.daoimpl.UserDaoImpl"%>




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
	background-color: steelblue;
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

input {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

#update {
	visibility: hidden;
	position: absolute;
	left: 450px;
	top: 60px;
}

#update {
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	width: 50%;
}

#userInfo {
	position: absolute;
	left: 300px;
	top: 50px;
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


	<%
	int i = (int) session.getAttribute("id");
	
	System.out.println(i);
	UserDaoImpl userDao = new UserDaoImpl();

	ResultSet rs1 = userDao.getUserById(i);
	%>
	<div id="userInfo">
		<%
		if (rs1.next()) {
		%>
		<label for=""><b>Name:</b> &nbsp; <%=rs1.getString(2)%> </label> <br>
		<label for=""><b>Username:</b>&nbsp; <%=rs1.getString(3)%> </label> <br>
		<label for=""><b>Mobile:</b>&nbsp; <%=rs1.getLong(7)%> </label> <br>
		<label for=""><b>Email:</b> &nbsp; <%=rs1.getString(6)%> </label> <br>
		<button onclick="update()">Update</button>
		<%
		}
		%>

	</div>



	<div id="update">

		<form action="update" onsubmit="return validate()">
		

			<label><b>Name:</b></label> <br>
		    <input type="text" 	name="updateName" id="updateName"> <br>
		    <label id="uname" style="visibility: hidden;">Enter Name</label> <br>

			<label><b>Username:</b></label> <br> 
			<input type="text"	name="updateUsername" id="updateUsername"> <br>			
		    <label id="username" style="visibility: hidden;">Enter Username</label> <br>
			
			
			
			<label ><b>Password:</b></label> <br> 
			<input	type="text" name="updatePassword" id="updatePassword"> <br>
			<label for="" id="lpass" style="visibility: hidden;">EnterPassword</label> <br>
			
			<label for=""><b>Email:</b></label> <br> 
		    <input	type="email" name="updateEmail" id="updateEmail"> <br>
			<label for="" id="lmail" style="visibility: hidden;">Enter	Email</label> <br> 
			
			<label for=""><b>Phone Number:</b></label> <br>
			<input type="number" name="updateNumber" id="updateNumber"> <br>
			<label for="" id="mobile" style="visibility: hidden;">Enter	phone Number</label>
			
			<button type="submit">Submit</button>
			<input type="text" name="role" id="role" style="visibility: hidden;">
		</form>

	</div>

</body>
</html>
<script>
function update(){
    document.getElementById("update").style.visibility="visible";
    <%int j = (int) session.getAttribute("id");

System.out.println(j);
UserDaoImpl userDao1 = new UserDaoImpl();

ResultSet rs2 = userDao.getUserById(j);
if (rs2.next()) {%>

       document.getElementById("updateName").value="<%=rs2.getString(2)%>";
       document.getElementById("updateUsername").value="<%=rs2.getString(3)%>";
       document.getElementById("role").value="<%=rs2.getString(4) %>";
       document.getElementById("updatePassword").value="<%=rs2.getString(5)%>";
       document.getElementById("updateEmail").value="<%=rs2.getString(6)%>";
       document.getElementById("updateNumber").value="<%=rs1.getString(7)%>";
<%}%>
	}

	function validate() {

		var name = document.getElementById("updateName");
		var username = document.getElementById("updateUsername");
		var password = document.getElementById("updatePassword");
		var email = document.getElementById("updateEmail");
		var phonenumber = document.getElementById("updateNumber");

		var passExpression = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{6,12}$/;
		var emailExpression = /[A-Za-z0-9]+[@][a-zA-Z]+[.][A-Za-z]{2,3}/;
		var mobileExpression = /[6-9][0-9]{9}$/;

		if (name.value.trim() == "") {
			document.getElementById("uname").style.visibility = "visible";
			document.getElementById("uname").style.color = "red";
			return false;
		} else if (name.value.trim() < 5) {
			document.getElementById("uname").style.visibility = "visible";
			document.getElementById("uname").style.color = "red";
			document.getElementById("luname").innerHTML = 'Name Too Short';
			return false;
		} else if (username.value.trim() == "") {
			document.getElementById("username").style.visibility = "visible";
			document.getElementById("username").style.color = "red";
			return false;
		} else if (username.value.trim() < 5) {
			document.getElementById("username").style.visibility = "visible";
			document.getElementById("username").style.color = "red";
			document.getElementById("username").innerHTML = "Username Too Short";
			return false;
		} else if (password.value.trim() == "") {

			document.getElementById("lpass").style.color = "red";
			document.getElementById("lpass").style.visibility = "visible";
			return false;
		} else if (password.value.trim().length < 5) {

			document.getElementById("lpass").style.visibility = "visible";
			document.getElementById("lpass").style.color = "red";
			document.getElementById("lpass").innerHTML = "Password Too Short";
			return false;
		}

		else if (email.value.trim() == "") {
			document.getElementById("lmail").style.visibility = "visible";
			document.getElementById("lmail").style.color = "red";

			return false;
		} else if (emailExpression.test(email.value) == false) {
			document.getElementById("lmail").style.visibility = "visible";
			document.getElementById("lmail").style.color = "red";
			document.getElementById("lmail").innerHTML = "Invalid Email Format";

			return false;
		}

		else if (phonenumber.value.trim() == "") {
			document.getElementById("mobile").style.visibility = "visible";
			document.getElementById("mobile").style.color = "red";

			return false;
		}

		else if (mobileExpression.test(phonenumber.value) == false) {
			document.getElementById("mobile").innerHTML = "Invalid Number";
			document.getElementById("mobile").style.visibility = "visible";
			document.getElementById("mobile").style.color = "red";
			return false;
		} else if (mobileExpression.test(phonenumber.value)
				&& emailExpression.test(email.value)) {
			return true;
		}

	}
</script>