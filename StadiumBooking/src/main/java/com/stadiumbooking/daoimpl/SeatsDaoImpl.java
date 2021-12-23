package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.SeatsDao;
import com.stadiumbooking.module.Seats;

public class SeatsDaoImpl implements SeatsDao {

	@Override
	public void bookingSeats(Seats seats) throws ClassNotFoundException, SQLException {
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String query="insert into seat_details(userid,ticket_numbers,match_id,seatclass,Totalpirce,seatcount) values(?,?,?,?,?,?)";
		
		PreparedStatement stmt=con.prepareStatement(query);
		System.out.println(seats.getUserid()+" wd  "+seats.getTicket_numbers());
		stmt.setInt(1, seats.getUserid());
		stmt.setString(2, seats.getTicket_numbers());
		stmt.setInt(3, seats.getMatch_id());
		stmt.setString(4, seats.getSeatclass());
		stmt.setInt(5, seats.getTotalpirce());
		stmt.setInt(6, seats.getSeatcount());
		
		System.out.println(stmt.executeUpdate()+" row inserted");
		System.out.println("Value Inserted Successfully");
		
		
		
		
	}

	@Override
	public ResultSet getSeatById(int userId) throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String query="select * from seat_details where userid=?";
		PreparedStatement pst=con.prepareStatement(query);
		pst.setInt(1, userId);
		ResultSet rs=pst.executeQuery();
		return rs;
	}

	@Override
	public ResultSet getSeatsDetalis() throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="select * from seat_details";
		
		ResultSet rs=stmt.executeQuery(query);
		return rs;
	}

	
}
