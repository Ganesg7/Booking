package com.stadiumbooking.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.module.Match;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/matchServe")
public class MatchController  extends HttpServlet{
	
	MatchDaoImpl matchDao=new MatchDaoImpl();
	
	public void service(HttpServletRequest req, HttpServletResponse res) {
	
		int spid=0;
		
		String stdName=req.getParameter("stdname");
		System.out.println(stdName);
		String location=req.getParameter("location");
		System.out.println(location);
		String sportsName=req.getParameter("spname");
		System.out.println(sportsName);
		if(sportsName.equals("cricket")) {
			 spid=10;
		}
		
		else if(sportsName.equals("football")) {
			spid=20;
		}
		
				
	       System.out.println(spid);
	
		String teamA=req.getParameter("teamA");
          System.out.println(teamA);
         String teamB=req.getParameter("teamB");
         System.out.println(teamB);
		String teamAlogo=req.getParameter("teamAlogo");
		System.out.println(teamAlogo);
		String teamBlogo=req.getParameter("teamBlogo");
		System.out.println(teamBlogo);
		int totalseats=(int) req.getParameter("totalSeats");
		int availSeats=Integer.parseInt(req.getParameter("availseats"));
		int fClass=Integer.parseInt(req.getParameter("fcalss"));
		int sClass=Integer.parseInt(req.getParameter("sclass" ));
		System.out.println(spid+stdName+location+teamA+teamB+teamAlogo+teamBlogo+totalseats+availSeats+fClass+sClass);
		String dateInString = req.getParameter("matchDate");
		LocalDate date1 = LocalDate.parse(dateInString, DateTimeFormatter.BASIC_ISO_DATE);

		
		
		Match match=new Match(spid,stdName,location,date1,teamA,teamB,teamAlogo,teamBlogo,totalseats,availSeats,fClass,sClass);
		
	}
	

}
