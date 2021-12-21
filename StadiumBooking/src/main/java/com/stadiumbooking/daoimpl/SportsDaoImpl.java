package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.SportsDao;
import com.stadiumbooking.module.Sports;

public class SportsDaoImpl implements SportsDao{

	@Override
	public int getSportsId(String sportsName,String eventName) throws ClassNotFoundException, SQLException  {
	
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String query="select * from sports_info where sportsName=? and eventName=?";
		
		PreparedStatement stmt=con.prepareStatement(query);
		stmt.setString(1, sportsName);
		stmt.setString(2, eventName);
		ResultSet rs=stmt.executeQuery();
		int num=0;
		if(rs.next()) {
		 num=rs.getInt(1);
		System.out.println(num);
		
		}
		con.close();
		return num;
		
	}

	@Override
	public void insertSports(Sports sports) throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		System.out.println("Insert Process");
		String query="insert into sports_info(sportsName,eventName ) values(?,?)";
		
		PreparedStatement stmt=con.prepareStatement(query);
		stmt.setString(1, sports.getSportsName());
		stmt.setString(2, sports.getEventName());
		
		System.out.println(stmt.executeUpdate()+" row Inserted");
		System.out.println("Value Inserted Successfully");
		
	}

	@Override
	public ResultSet getAllSports() throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select * from sports_info";
		
		ResultSet rs=stmt.executeQuery(query);

	
		return rs;
	}

}
