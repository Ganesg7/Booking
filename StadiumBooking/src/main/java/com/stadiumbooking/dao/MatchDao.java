package com.stadiumbooking.dao;

import java.sql.SQLException;

import com.stadiumbooking.module.Match;

public interface MatchDao {
	
	public void InsertMatchDetalis(Match match) throws ClassNotFoundException, SQLException;

}
