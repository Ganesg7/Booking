package com.stadiumbooking.daoimpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.stadiumbooking.connection.ConnectionUtill;
import com.stadiumbooking.dao.WalletDao;
import com.stadiumbooking.module.Wallet_details;

public class WalletDaoImpl implements WalletDao {

	@Override
	public void insertAmount(Wallet_details wallete) throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		
		String query="insert into wallet_details(userId,amount) values(?,?)";
		PreparedStatement stmt=con.prepareStatement(query);
		stmt.setInt(1, wallete.getUserId());
		stmt.setLong(2, wallete.getAmount());
		System.out.println(stmt.executeUpdate()+" Row Inserted");
		
	}

	@Override
	public ResultSet allUserWalletList() throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();
		Statement stmt=con.createStatement();
		String query="Select * from wallet_details";
		
		ResultSet rs=stmt.executeQuery(query);

	
		return rs;
	}

	@Override
	public void updateUserWallet(int userId, int totalprice) throws ClassNotFoundException, SQLException {
		ConnectionUtill conUtil=new ConnectionUtill();
		Connection con=conUtil.getDBConnect();

		String query="update wallet_details set amount=amount-? where userId=?";
		
		PreparedStatement pst=con.prepareStatement(query);
		pst.setInt(1, totalprice);
		pst.setInt(2, userId);
		System.out.println(pst.executeUpdate()+" Updated");
		
	}

	@Override
	public void updateCancleTicketPrice(int amount, int userId) {
		// TODO Auto-generated method stub
		
	}

}
