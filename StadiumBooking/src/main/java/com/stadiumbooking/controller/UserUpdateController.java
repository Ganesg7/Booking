package com.stadiumbooking.controller;

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
		HttpSession session = req.getSession();
		String name=req.getParameter("updateName");
		String username=req.getParameter("updateUsername");
		String password=req.getParameter("updatePassword");
		String email=req.getParameter("updateEmail");
		Long phoneNumber=Long.parseLong(req.getParameter("updateNumber"));
		int userId = (int) session.getAttribute("id");
		
		try {
			userDao.updateUser(userId, name, username, password, email, phoneNumber);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
