package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.module.Match;

public interface MatchDao {
	
	public void insertMatchDetalis(Match match) throws ClassNotFoundException, SQLException;
	public ResultSet getAllMatchDetalis() throws ClassNotFoundException, SQLException;
	public ResultSet getDate() throws ClassNotFoundException, SQLException;
	public ResultSet getMatchByMatchId(int matchId) throws ClassNotFoundException, SQLException;

}
