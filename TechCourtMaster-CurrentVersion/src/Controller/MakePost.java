package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.PostsDAO;
import TechCourt.Account;
import TechCourt.Post;

/**
 * Servlet implementation class MakePost
 */
@WebServlet("/MakePost")
public class MakePost extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakePost() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Post post = new Post();
		post.setAuthor((Account) request.getSession().getAttribute("account"));
		post.setContent(request.getParameter("content"));
		post.setName(request.getParameter("title"));
		PostsDAO.insertPost(post, request, Integer.parseInt(request.getParameter("topic")));
		response.sendRedirect("topic.jsp?id="+request.getParameter("topic"));
	}

}
