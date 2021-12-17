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
	public void updateUser(int userId,String name,String username,String password,String email,Long phoneNumber) throws ClassNotFoundException, SQLException {
		Scanner sc = new Scanner(System.in);
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();

			String que = "update users set name=?,username=?,password=?,email=?, phoneNumber=? where userid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
		
			int id=Integer.parseInt(sc.nextLine());
			pstmt.setString(1, name);
			pstmt.setString(2, username);
			pstmt.setString(3, password);
			pstmt.setString(4, email);
			pstmt.setLong(5, phoneNumber);
			pstmt.setInt(6, userId);
			System.out.println(pstmt.executeUpdate()+" Updated");
		
		
	}

	@Override
	public void deleteUser(User user) throws ClassNotFoundException, SQLException {
		Scanner sc = new Scanner(System.in);
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();

		System.out.println("Enter Username To Delete");
		String que = "delete from users where username=?";
		PreparedStatement pstmt = con.prepareStatement(que);
		String name=sc.nextLine();
		pstmt.setString(1, name);
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