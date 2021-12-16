package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.MatchDao;
import com.stadiumbooking.module.Match;

public class MatchDaoImpl implements MatchDao {

	@Override
	public void InsertMatchDetalis(Match match) throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		DateFormat dateformat=new SimpleDateFormat("dd-MM-yyyy");
		String query="insert into match_info(stadium_name, location,match_date,teamA,teamB,teamAlogo, teamBlogo, totalseats, availableSeats, firstClass_Seats_price, secondClass_seats_price) values(?,?,?,?,?,?,?,?,?,?,?)";
		
		PreparedStatement stmt=con.prepareStatement(query);
	
		String date=dateformat.format(match.getMatch_date());
		stmt.setString(1, match.getStadium_name());
		stmt.setString(2, match.getLocation());
		stmt.setString(3, date);
		stmt.setString(4, match.getTeamA());
		stmt.setString(5, match.getTeamB());
		stmt.setString(6, match.getTeamAlogo());
		stmt.setString(7, match.getTeamBlogo());
		stmt.setInt(8, match.getTotalseats());
		stmt.setInt(9, match.getAvailableSeats());
		stmt.setInt(10, match.getFirstClass_Seats_price());
		stmt.setInt(11, match.getSecondClass_seats_price());
	
		System.out.println(stmt.executeUpdate()+" row inserted");
		System.out.println("Value Inserted Successfully");
		
	}

}
