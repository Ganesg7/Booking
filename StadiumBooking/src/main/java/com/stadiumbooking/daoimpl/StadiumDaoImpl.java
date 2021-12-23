package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.StadiumDao;

public class StadiumDaoImpl implements StadiumDao {

	@Override
	public ResultSet getAllStadiumList() throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select * from stadium_detalis";
		
		ResultSet rs=stmt.executeQuery(query);

		
		return rs;
	}

}
