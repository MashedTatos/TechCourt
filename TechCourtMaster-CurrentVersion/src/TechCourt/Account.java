package TechCourt;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import DAO.*;
public class Account implements Serializable {

	private int userID;
	private String username;
	private String password;
	private String email;
	private String bio;
	private Date dateJoined;
	private int points;
	private AccountType accountType;
	
	
	

	public Account(int userID, String username, String password, String email, String bio, Date dateJoined, int points,
			AccountType accountType) {
		this.userID = userID;
		this.username = username;
		this.password = password;
		this.email = email;
		this.bio = bio;
		this.dateJoined = dateJoined;
		this.points = points;
		this.accountType = accountType;
	}

	public Account( String username, String password, String email, String bio,AccountType accountType) {

		this.username = username;
		this.password = password;
		this.email = email;
		this.bio = bio;
		this.accountType = accountType;
	}
	
	public Account() {
		
	}
	
	public int getUserID() {
		return userID;
	}




	public void setUserID(int userID) {
		this.userID = userID;
	}




	public String getUsername() {
		return username;
	}




	public void setUsername(String username) {
		this.username = username;
	}




	public String getPassword() {
		return password;
	}




	public void setPassword(String password) {
		this.password = password;
	}




	public String getEmail() {
		return email;
	}




	public void setEmail(String email) {
		this.email = email;
	}




	public String getBio() {
		return bio;
	}




	public void setBio(String bio) {
		this.bio = bio;
	}




	public Date getDateJoined() {
		return dateJoined;
	}




	public void setDateJoined(Date dateJoined) {
		this.dateJoined = dateJoined;
	}




	public int getPoints() {
		return points;
	}




	public void setPoints(int points) {
		this.points = points;
	}




	public AccountType getAccountType() {
		return accountType;
	}




	public void setAccountType(AccountType i) {
		this.accountType = i;
	}




	@Override
	public String toString() {
		return "Account [userID=" + userID + ", username=" + username + ", password=" + password + ", email=" + email
				+ ", bio=" + bio + ", dateJoined=" + dateJoined + ", points=" + points + ", accountType=" + accountType
				+ "]";
	}


	public void deactivate(HttpServletRequest request) {
		this.setAccountType(AccountType.Inactive);
		AccountDAO.updateAccount(this,request);

	}
	

	public enum AccountType{
		User (1),
		Moderator (2),
		Admin (3),
		Banned(4),
		Inactive(5);
		
		private final int accountNum;
		private AccountType(int accountNum) {
			this.accountNum = accountNum;
		}
		
		public static AccountType getAccountType(int i) {
			return AccountType.values()[i - 1];
		}
	}
}
