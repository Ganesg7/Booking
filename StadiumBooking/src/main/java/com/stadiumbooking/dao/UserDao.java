package com.stadiumbooking.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.stadiumbooking.module.User;



public interface UserDao {

	public void insertUser(User user) throws ClassNotFoundException, SQLException;
    ResultSet getAllUser() throws ClassNotFoundException, SQLException;
	public ResultSet getUserById(int id) throws ClassNotFoundException, SQLException;
	public void updateUser(int userId,String name,String username,String password,String email,Long phoneNumber) throws ClassNotFoundException, SQLException;
	public void deleteUser(int userId) throws ClassNotFoundException, SQLException;
	public ResultSet validateUser(String username, String password) throws ClassNotFoundException, SQLException;
	public boolean checkUser(String username, String password) throws ClassNotFoundException, SQLException;
}
