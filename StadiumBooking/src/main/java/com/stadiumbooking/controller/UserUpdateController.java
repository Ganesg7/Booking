package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.stadiumbooking.daoimpl.UserDaoImpl;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/update")
public class UserUpdateController extends HttpServlet {
	
	UserDaoImpl userDao=new UserDaoImpl();

	public void service(HttpServletRequest req, HttpServletResponse res) {
		HttpSession session1 = req.getSession();
		String name=req.getParameter("updateName").trim();
		String username=req.getParameter("updateUsername").trim();
		String role=req.getParameter("role").trim();
		String password=req.getParameter("updatePassword").trim();
		String email=req.getParameter("updateEmail").trim();
		Long phoneNumber=Long.parseLong(req.getParameter("updateNumber"));
		int userId = (int) session1.getAttribute("id");
		System.out.println(name+"\n"+username+"\n"+userId+password+email+phoneNumber+"\n"+role);
		
		try {
			
			if(role.equals("Admin")) 
			{
				userDao.updateUser(userId, name, username, password, email, phoneNumber);
	         	res.sendRedirect("UserProfile.jsp");


	}
	else if(role.equals("User")) {
		userDao.updateUser(userId, name, username, password, email, phoneNumber);
		res.sendRedirect("usersprofile.jsp");
	}
			
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
