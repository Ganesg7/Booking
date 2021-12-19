package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.SQLException;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.SeatsDao;
import com.stadiumbooking.module.Seats;

public class SeatsDaoImpl implements SeatsDao {

	@Override
	public void insertSeats(Seats seats) throws ClassNotFoundException, SQLException {
		
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		
	}

	
}
