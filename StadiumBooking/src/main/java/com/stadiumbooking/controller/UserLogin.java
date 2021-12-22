package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.daoimpl.UserDaoImpl;
import com.stadiumbooking.module.User;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/adminHomeServes")
public class UserLogin extends HttpServlet {
	
	UserDaoImpl userDao=new UserDaoImpl();
	public void service(HttpServletRequest req, HttpServletResponse res)  {
		User user=new User();
		
		String userName=req.getParameter("username").trim();
		String passWord=req.getParameter("password").trim();
		System.out.println(userName);
		int id=0;
		try {
			boolean flag;
			
			flag=userDao.checkUser(userName, passWord);
			if(flag) {
			
			ResultSet rs= userDao.validateUser(userName, passWord);
			rs.next();
			String role=rs.getString(4);
			System.out.println(role);
		
			
			int userID = rs.getInt(1);
			HttpSession session = req.getSession();
			session.setAttribute("id", userID);
			 System.out.println(userID);
			rs.close();
			if(role.equals("Admin")) 
					{
				res.sendRedirect("adminHome.html");
				//res.sendRedirect("adminHome.html"+"/"+rs.getInt(1));

			}
			else if(role.equals("User")) {
				res.sendRedirect("userHome.html");
			}
			
			}
			else {
				HttpSession session = req.getSession();
				session.setAttribute("error", "Invalid Username or Password ");
				res.sendRedirect("index.jsp");
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		catch(IOException e) {
			System.out.println(e);
		}
	
	
		

		
		
		
	}
	
	
	
	            
	
}
