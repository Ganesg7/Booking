package com.stadiumbooking.dao;

import java.sql.SQLException;

import com.stadiumbooking.module.Seats;

public interface SeatsDao {
	public void insertSeats(Seats seats) throws ClassNotFoundException, SQLException;

}
