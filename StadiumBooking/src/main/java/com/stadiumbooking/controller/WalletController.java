package com.stadiumbooking.controller;

import java.io.IOException;
import java.sql.SQLException;

import com.stadiumbooking.daoimpl.WalletDaoImpl;
import com.stadiumbooking.module.Wallet_details;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/wallets")
public class WalletController extends HttpServlet {
	WalletDaoImpl walletDao=new WalletDaoImpl();
	public void service(HttpServletRequest req,HttpServletResponse res) {
		int userId=Integer.parseInt(req.getParameter("userID"));
		Long amount=Long.parseLong(req.getParameter("amount"));
		
		Wallet_details wallet=new Wallet_details(userId,amount);
		try {
			walletDao.insertAmount(wallet);
			res.sendRedirect("wallet.jsp");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
