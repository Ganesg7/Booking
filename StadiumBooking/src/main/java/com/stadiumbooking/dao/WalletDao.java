package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.stadiumbooking.module.Wallet_details;

public interface WalletDao {

	public void insertAmount(Wallet_details wallete) throws ClassNotFoundException, SQLException;
	public ResultSet allUserWalletList() throws ClassNotFoundException, SQLException;
	public void updateUserWallet(int userId, int amount) throws ClassNotFoundException, SQLException;
	public void updateCancleTicketPrice(int amount,int userId);
}
