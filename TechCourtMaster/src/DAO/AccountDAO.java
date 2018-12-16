package DAO;
import TechCourt.Account;
import TechCourt.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
public class AccountDAO {

	
	public static List<Account> getAccounts(HttpServletRequest request){
		
		List<Account> accounts = new ArrayList<Account>();
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		
		try {
			conn = dbutil.getConnection(request);
			Statement statement = conn.createStatement();
			ResultSet resultSet = statement.executeQuery("select * from accounts");
			while(resultSet.next()) {
				Account account = new Account();
				account = getAccountFromSet(resultSet);
				accounts.add(account);//Add to arraylist
				
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			dbutil.closeConnection(conn);
		}
		
		return accounts;
		
	}
	
	public static boolean insertAccount(Account account, HttpServletRequest request) {
		boolean accountInserted = true;
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		try {
			conn = dbutil.getConnection(request);
			PreparedStatement insert = conn.prepareStatement("insert into accounts (Username, AccountPassword, email,userbio, accounttype) values (?,?,?,?,?)");
			insert.setString(1, account.getUsername());
			insert.setString(2, account.getPassword());
			insert.setString(3, account.getEmail());
			insert.setString(4, account.getBio());
			insert.setInt(5, account.getAccountType().ordinal() + 1);
			
			insert.executeUpdate();
		}

		
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			dbutil.closeConnection(conn);
		}
		return accountInserted;
		
	}
		
	public static void updateAccount(Account account, HttpServletRequest request) {
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		
		try {
			conn = dbutil.getConnection(request);
			PreparedStatement update = conn.prepareStatement("update accounts set Username = ?, AccountPassword = ?, Email = ?, UserBio = ?, Points = ?, AccountType = ? where userid = ?");
			update.setString(1, account.getUsername());
			update.setString(2, account.getPassword());
			update.setString(3, account.getEmail());
			update.setString(4, account.getBio());
			update.setInt(5, account.getPoints());
			update.setInt(6, account.getAccountType().ordinal() + 1);
			update.setInt(7, account.getUserID());
			update.executeUpdate();
			
		}
		
		catch(SQLException e){
			e.printStackTrace();
			
		}
		
		finally {
			dbutil.closeConnection(conn);
		}
		
		
	}
	
	
	
	public static Account getAccountByID(int id, HttpServletRequest request){
		Connection conn = null;
		Account account = new Account();
		DBUtil dbutil = new DBUtil();
		try {
			conn = dbutil.getConnection(request);
			PreparedStatement select = conn.prepareStatement("select * from accounts where userid = ?");
			
			select.setInt(1, id);
			ResultSet set = select.executeQuery();
			while(set.next()) {
				account = getAccountFromSet(set);		
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			dbutil.closeConnection(conn);
		}
		return account;
		
	}
	
	private static Account getAccountFromSet(ResultSet set) throws SQLException {
		Account account = new Account();
		
		account.setUserID(set.getInt(1));
		account.setUsername(set.getString(2));
		account.setPassword(set.getString(3));
		account.setEmail(set.getString(4));
		account.setBio(set.getString(5));
		account.setDateJoined(set.getDate(6));
		account.setPoints(set.getInt(7));
		account.setAccountType(Account.AccountType.getAccountType(set.getInt(8)));
		return account;
		
	}
	
	public static Account getAccountByUsername(String username, HttpServletRequest request){
		Connection conn = null;
		Account account = new Account();
		DBUtil dbutil = new DBUtil();
		try {
			conn = dbutil.getConnection(request);
			PreparedStatement select = conn.prepareStatement("select * from accounts where Username = ?");
			
			select.setString(1, username);
			ResultSet set = select.executeQuery();
			while(set.next()) {
				account = getAccountFromSet(set);		
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			dbutil.closeConnection(conn);
		}
		return account;
		
	}
	
}
