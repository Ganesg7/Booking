package com.stadiumbooking.daoimpl;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Scanner;

import com.stadiumbooking.connection.ConnectionUtill;

import com.stadiumbooking.dao.UserDao;
import com.stadiumbooking.module.User;



public class UserDaoImpl  implements UserDao  {


	@Override
	public void insertUser(User user) throws ClassNotFoundException, SQLException {

		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String query="insert into users( name, username, role,password, email, phoneNumber) values(?,?,?,?,?,?)";
		
		PreparedStatement stmt=con.prepareStatement(query);
	
		System.out.println(user.getName()+user.getEmail());
		stmt.setString(1, user.getName());
		stmt.setString(2, user.getUsername());
		stmt.setString(3, "User");
		stmt.setString(4, user.getPassword());
		stmt.setString(5, user.getEmail());
		stmt.setLong(6, user.getPhoneNumber());
	
		System.out.println(stmt.executeUpdate()+" row inserted");
		System.out.println("Value Inserted Successfully");
		
		
	}

	@Override
	public ResultSet getAllUser() throws ClassNotFoundException, SQLException {

		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select * from users";
		
		ResultSet rs=stmt.executeQuery(query);

		
		return rs;
		
	}

	@Override
	public ResultSet getUserById(int id) throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		

		System.out.println("Dao"+id);
		
		String query="Select * from users where userid=?";		

		PreparedStatement stmt1=con.prepareStatement(query);		
		stmt1.setInt(1, id);
		ResultSet rs2=stmt1.executeQuery();
	
		return rs2;
	
		
	}

	@Override
	public void updateUser(User user) throws ClassNotFoundException, SQLException {
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		System.out.println("DAOOOOO\n"+user.getName()+"\n"+user.getUsername()+"\n"+user.getUserid()+user.getPassword()+user.getEmail()+user.getPhoneNumber()+"\n"+"DAOOOO");
			String que = "update users set name=?,username=?,password=?,email=?, phoneNumber=? where userid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
			pstmt.setString(1, user.getName());
			pstmt.setString(2, user.getUsername());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getEmail());
			pstmt.setLong(5, user.getPhoneNumber());
			pstmt.setInt(6, user.getUserid());
			int i=pstmt.executeUpdate();
			System.out.println(i+" Updated");
		
		
	}

	@Override
	public void deleteUser(int userId) throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();

		
		String que = "delete from users where userId=?";
		PreparedStatement pstmt = con.prepareStatement(que);
		
		pstmt.setInt(1, userId);
		System.out.println(pstmt.executeUpdate()+" deleted");
		
	}

	@Override
	public ResultSet validateUser(String username,String password) throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
	
		String query="Select * from users where username=? and password=?";		

		PreparedStatement stmt1=con.prepareStatement(query);
		stmt1.setString(1, username);
		stmt1.setString(2,password);
		ResultSet rs=stmt1.executeQuery();
		
		return rs;
		
	}

	@Override
	public boolean checkUser(String username, String password) throws ClassNotFoundException, SQLException {
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
	
		String query="Select * from users where username=? and password=?";		

		PreparedStatement stmt1=con.prepareStatement(query);
		stmt1.setString(1, username);
		stmt1.setString(2,password);
		int i=stmt1.executeUpdate();
		if(i>0) {
			return true;
		}
		else {
			return false;
		}
	
	}


}