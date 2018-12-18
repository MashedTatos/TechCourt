package Controller;

import java.io.IOException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountDAO;
import DAO.CommentDAO;
import DAO.PostsDAO;
import TechCourt.Account;
import TechCourt.Comment;
import TechCourt.TextParser;

/**
 * Servlet implementation class PostAction
 */
@WebServlet("/PostAction")
public class PostAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostAction() {
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
		// TODO Auto-generated method stub
		String action = request.getParameter("Action");
		int postId = Integer.parseInt(request.getParameter("postId"));
		if(action.equals("Comment")) {
			Comment comment = new Comment();
			comment.setAuthor((Account)request.getSession().getAttribute("account"));
			comment.setPost(PostsDAO.getPostByID(postId,request));
			String content = TextParser.parseText(request.getParameter("comment"));
			comment.setContent(content);
			System.out.println(content);
			if(request.getParameter("parentid") != null) {
				comment.setParentID(Optional.ofNullable(Integer.parseInt(request.getParameter("parentid"))));
			}
			
			else {
				comment.setParentID(Optional.empty());
			}
			CommentDAO.insertComment(comment, request);
		}
		
		else if(action.equals("Like")) {
			PostsDAO.changePoints(postId, 1, request);
		}
		
		else if(action.equals("Dislike")) {
			PostsDAO.changePoints(postId, -1, request);
		}
		
		else if(action.equals("Delete")) {
			PostsDAO.deletePost(request, postId);
		}
		
		request.getRequestDispatcher("post.jsp?id=" + request.getParameter("postId") ).forward(request, response);
	}

}
