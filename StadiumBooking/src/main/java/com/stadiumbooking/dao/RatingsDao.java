package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.module.Ratings;

public interface RatingsDao {
	public void ratingStadium(Ratings ratings) throws ClassNotFoundException, SQLException;
	public ResultSet getAllRatings() throws ClassNotFoundException, SQLException;

}
