package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountDAO;
import TechCourt.Account;
import TechCourt.Account.AccountType;

@WebServlet("/UserRegistrationServlet")
public class UserRegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UserRegistrationServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String bio = request.getParameter("bio");
		AccountType accountType = AccountType.User;
		Account account = new Account(username, password, email, bio, accountType);

		Boolean insert = AccountDAO.insertAccount(account, request);
		
		PrintWriter out = response.getWriter();

		if(insert) {
		response.sendRedirect("Login.html");
		}
		else {
			out.println("<html><head><title>Login failed</title></head><body><h1>Login unsuccessful, please try again</h1></body></html>");
			request.getRequestDispatcher("UserRegistration.html").include(request, response);
		}
	}

}
