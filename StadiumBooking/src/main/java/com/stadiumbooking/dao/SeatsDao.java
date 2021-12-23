package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.module.Seats;

public interface SeatsDao {
	public void bookingSeats(Seats seats) throws ClassNotFoundException, SQLException;
	public ResultSet getSeatById(int userId) throws ClassNotFoundException, SQLException;
	public ResultSet getSeatsDetalis() throws ClassNotFoundException, SQLException;

}
