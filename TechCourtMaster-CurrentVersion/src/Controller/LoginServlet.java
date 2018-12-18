package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.AccountDAO;
import DAO.CommentDAO;
import DAO.PostsDAO;
import TechCourt.Account;
import TechCourt.Account.AccountType;
import TechCourt.Comment;
import TechCourt.Post;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String password = request.getParameter("password");

		Account account = AccountDAO.getAccountByUsername(username, request);
		String dbPassword = account.getPassword();

		HttpSession session = request.getSession();

		PrintWriter out = response.getWriter();
		if (account.getAccountType() == AccountType.Banned) {
			out.println("<html><head><title>Login failed</title></head><body><h1>You are banned!</h1></body></html>");
			request.getRequestDispatcher("Login.html").include(request, response);
		}

		else {
			if (password.equals(dbPassword)) {
				out.println(
						"<html><head><title>Login Successful</title></head><body><h1>Login successful</h1></body></html>");
				request.getSession().setAttribute("account", account);

				List<Post> posts = new ArrayList<Post>();
				posts = PostsDAO.getPostByUsername(username, request);
				request.getSession().setAttribute("posts", posts);

				List<Comment> comments = new ArrayList<Comment>();

				request.getSession().setAttribute("comments", comments);
				request.getRequestDispatcher("AccountPage.jsp").forward(request, response);

			} else {
				out.println(
						"<html><head><title>Login failed</title></head><body><h1>Login unsuccessful, please try again</h1></body></html>");
				request.getRequestDispatcher("Login.html").include(request, response);
			}
		}

	}

}
