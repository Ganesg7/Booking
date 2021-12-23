package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.stadiumbooking.daoimpl.RatingsDaoImpl;
import com.stadiumbooking.module.Ratings;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class RatingController extends HttpServlet {

	RatingsDaoImpl ratingDao=new RatingsDaoImpl();
	
	public void service (HttpServletRequest req, HttpServletResponse res) {
		HttpSession session3 = req.getSession();
		Double rating=Double.parseDouble(req.getParameter("ratingNumber"));
		int stadiumId=Integer.parseInt(req.getParameter("stadiumId"));
		String review=req.getParameter("review");
		int userId = (int) session3.getAttribute("id");
		Ratings ratings=new Ratings(userId,review,rating,stadiumId);
		try {
			ratingDao.ratingStadium(ratings);
			res.sendRedirect("UserProfile.jsp");
		} catch (ClassNotFoundException | SQLException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
