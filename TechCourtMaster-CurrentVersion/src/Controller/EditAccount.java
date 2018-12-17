package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountDAO;
import TechCourt.Account;
import TechCourt.Account.AccountType;

/**
 * Servlet implementation class EditAccount
 */
@WebServlet("/EditAccount")
public class EditAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Account oldAccount = (Account) request.getSession(false).getAttribute("account");
		Account currentAccount = AccountDAO.getAccountByUsername(oldAccount.getUsername(), request);
		
		String email = request.getParameter("email");
		if(email.isEmpty()) {email = currentAccount.getEmail();}
		
		String password = request.getParameter("password");
		if(password.isEmpty()) {password = currentAccount.getPassword();}

		String bio = request.getParameter("bio");
		if(bio.isEmpty()) {bio = currentAccount.getBio();}

		String username = request.getParameter("username");
		int userID = currentAccount.getUserID();
		Date dateJoined = currentAccount.getDateJoined();
		int points = currentAccount.getPoints();
		AccountType accountType = currentAccount.getAccountType();
		
		Account newAccount = new Account(userID, username, password, email, bio, dateJoined, points, accountType);
		
		AccountDAO.updateAccount(newAccount, request);
		
		PrintWriter out = response.getWriter();
		out.println("<html><head><title>Login</title></head><body><h1>Account Updated</h1></body></html>");
		request.getRequestDispatcher("Login.html").include(request, response);
		
	}

}
