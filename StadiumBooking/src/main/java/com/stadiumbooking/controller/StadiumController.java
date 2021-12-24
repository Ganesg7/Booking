package com.stadiumbooking.controller;

import java.io.IOException;

import com.stadiumbooking.daoimpl.StadiumDaoImpl;
import com.stadiumbooking.module.Stadium_detalis;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/stadium")
public class StadiumController extends HttpServlet {

	
	public void service(HttpServletRequest req, HttpServletResponse res) {
		String stadiumName=req.getParameter("stadiumName");
		String stadiumImage=req.getParameter("stadiumImge");
		
		Stadium_detalis stadium=new Stadium_detalis(stadiumName,stadiumImage);
		StadiumDaoImpl stadiumDao=new StadiumDaoImpl();
		
		try {
			stadiumDao.insertStadium(stadium);
			res.sendRedirect("stadiumDetalis.jsp");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}

