package TechCourt;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Optional;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.AccountDAO;
import DAO.CommentDAO;
import DAO.PostsDAO;

/**
 * Servlet implementation class MakeComment
 */
@WebServlet("/MakeComment")
public class MakeComment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MakeComment() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Comment comment = new Comment();
		comment.setAuthor((Account) request.getSession().getAttribute("account"));
		comment.setPost(PostsDAO.getPostByID(Integer.parseInt(request.getParameter("postId")), request));
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

		request.getRequestDispatcher("post.jsp?id=" + request.getParameter("postId") ).forward(request, response);
	}

}
