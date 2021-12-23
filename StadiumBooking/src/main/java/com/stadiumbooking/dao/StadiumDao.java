package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface StadiumDao {

	public ResultSet getAllStadiumList() throws ClassNotFoundException, SQLException;
}
