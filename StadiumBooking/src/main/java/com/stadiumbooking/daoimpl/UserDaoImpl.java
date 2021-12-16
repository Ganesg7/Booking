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
		Scanner sc = new Scanner(System.in);
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();

		
			System.out.println("Enter Name To Update");
			String que = "update users set name=? where userid=?";
			PreparedStatement pstmt = con.prepareStatement(que);
			String name=sc.nextLine();
			int id=Integer.parseInt(sc.nextLine());
			pstmt.setString(1, name);
			pstmt.setInt(2, id);
			System.out.println(pstmt.executeUpdate()+" Updated");
					
			System.out.println("Enter Username To Update");
			String que1 = "update users set username=(?) where userid=?";
			PreparedStatement pstmt1 = con.prepareStatement(que1);
			String username=sc.nextLine();
			int id1=Integer.parseInt(sc.nextLine());
			pstmt1.setString(1, username);
			pstmt1.setInt(2, id1);
			System.out.println(pstmt1.executeUpdate()+" Updated");
			

			System.out.println("Enter Password To Update");
			String que2 = "update users set password=(?) where userid=?";
			PreparedStatement pstmt2 = con.prepareStatement(que2);
			String password=sc.nextLine();
			int id2=Integer.parseInt(sc.nextLine());
			pstmt2.setString(1, password);
			pstmt2.setInt(2, id2);
			System.out.println(pstmt2.executeUpdate()+" Updated");
			

			System.out.println("Enter Email To Update");
			String que3 = "update users set email=(?) where userid=?";
			PreparedStatement pstmt3 = con.prepareStatement(que3);
			String email=sc.nextLine();
			int id3=Integer.parseInt(sc.nextLine());
			pstmt3.setString(1, email);
			pstmt3.setInt(2, id3);
			System.out.println(pstmt3.executeUpdate()+" Updated");

		
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