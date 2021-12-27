package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.stadiumbooking.daoimpl.MatchDaoImpl;
import com.stadiumbooking.daoimpl.SeatsDaoImpl;
import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.module.Seats;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/booking")
public class BookingController extends HttpServlet {
	
	SeatsDaoImpl seatDao=new SeatsDaoImpl();
	MatchDaoImpl matchDao=new MatchDaoImpl();
	WalletDaoImpl walletDao=new WalletDaoImpl();
	public void service(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session2 = req.getSession();
	
		int seatCounts=Integer.parseInt(req.getParameter("seatCounts"));
		System.out.println(seatCounts);
		String seatclass=req.getParameter("category");
		System.out.println(seatclass);
		int totalprice=Integer.parseInt(req.getParameter("totalprice"));
		System.out.println(totalprice);
		int matchId=Integer.parseInt(req.getParameter("matchIds"));
		System.out.println(matchId);
		int userId =  (int) session2.getAttribute("id");
		System.out.println(userId);
		
		String ticketNumber=req.getParameter("ticketNumber");
		
		System.out.println(seatclass+seatCounts+totalprice+matchId+userId);
		Seats seats=new Seats(userId,ticketNumber,matchId,seatclass,totalprice,seatCounts);
		
		try {
			seatDao.bookingSeats(seats);
			walletDao.updateUserWallet(userId, totalprice);
			matchDao.updateAvailableSeats(seatCounts, matchId);
			
			res.sendRedirect("mymatch.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
