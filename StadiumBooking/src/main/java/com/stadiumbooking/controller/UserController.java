package com.stadiumbooking.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.module.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/loginserv")
public class UserController extends HttpServlet {

	UserDaoImpl userDao=new UserDaoImpl();
	
	public void service(HttpServletRequest req, HttpServletResponse res) {
		String name=req.getParameter("name");
		String uname=req.getParameter("uname");
		String pass=req.getParameter("pass");
		String mail=req.getParameter("mail");
		Long phone=Long.parseLong(req.getParameter("phone"));
		System.out.println(name+"\n"+uname);
		User user=new User(name,uname,pass,mail,phone);
		try {
			userDao.insertUser(user);
			res.sendRedirect("login.jsp");
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch  (IOException e) {
			e.printStackTrace();
		}
		

	}
	
		
	
	
	
}
