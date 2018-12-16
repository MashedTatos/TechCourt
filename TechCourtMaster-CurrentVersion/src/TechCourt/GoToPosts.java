package TechCourt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import TechCourt.DBUtil;
import TechCourt.Account;
import TechCourt.Account.AccountType;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.*;

/**
 * Servlet implementation class GoToPosts
 */
@WebServlet("/GoToPosts")
public class GoToPosts extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoToPosts() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Post> posts = new ArrayList<Post>();
		posts = PostsDAO.getAllPosts(request);
		
		for(Post p : posts) {
			p.setComments((ArrayList<Comment>)p.getAllComments(request));
			
			for(Comment c : p.getComments()) {
				c.setComments((ArrayList<Comment>)c.getAllComments(request));
				
				
			}
		}
		
		request.getSession().setAttribute("posts", posts);
		request.getRequestDispatcher("posts.jsp").forward(request, response);
	}

}
