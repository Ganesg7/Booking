package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.stadiumbooking.daoimpl.SportsDaoImpl;
import com.stadiumbooking.module.Sports;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/sports")
public class SportsController extends HttpServlet {
	SportsDaoImpl sportsDao=new SportsDaoImpl();
	
	public void service(HttpServletRequest req,HttpServletResponse res) {
		System.out.println("SPorts");
		String sportsName=req.getParameter("sportsName");
		String eventName=req.getParameter("eventName");
		
		Sports sports=new Sports(sportsName,eventName);
		try {
			sportsDao.insertSports(sports);
			res.sendRedirect("sportsDetalis.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
