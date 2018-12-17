package TechCourt;

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

/**
 * Servlet implementation class CommentAction
 */
@WebServlet("/CommentAction")
public class CommentAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommentAction() {
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
		String buttonAction = request.getParameter("buttonAction");
		int id = Integer.parseInt(request.getParameter("commentId"));
		int postid = Integer.parseInt(request.getParameter("postId"));
		Account account = (Account) request.getSession().getAttribute("account");
		if (request.getSession().getAttribute("account") == null) {
			request.setAttribute("notLoggedIn", true);
		} else {
			if (buttonAction.equals("Vote")) {
				CommentDAO.incrementPoints(request, id);
			}

			else if (buttonAction.equals("Delete")) {
				CommentDAO.deleteComment(request, id);
			}

			else if (buttonAction.equals("Reply")) {
				Comment comment = new Comment();
				comment.setAuthor(account);
				comment.setPost(PostsDAO.getPostByID(postid, request));
				comment.setContent(request.getParameter("reply"));
				comment.setParentID(Optional.ofNullable(id));
				CommentDAO.insertComment(comment, request);

			}
		}
		response.sendRedirect("post.jsp?id=" + request.getParameter("postId"));
		// request.getRequestDispatcher("post.jsp?id=" + request.getParameter("postId")
		// ).forward(request, response);
	}

}
