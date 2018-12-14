package TechCourt.DAO;

import TechCourt.Comment;
import TechCourt.DBUtil;
import TechCourt.TextEntity;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

public class CommentDAO {

	public static List<Comment> getAllComments(HttpServletRequest request) {
		List<Comment> comments = new ArrayList<Comment>();
		Connection conn = null;
		DBUtil dbutil = new DBUtil();

		try {
			conn = dbutil.getConnection(request);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from comments");
			while (rs.next()) {

				Comment comment = new Comment();
				comment = getCommentFromSet(rs, request);
				comments.add(comment);
			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			dbutil.closeConnection(conn);

		}
		return comments;

	}

	public static Comment getCommentByID(int id, HttpServletRequest request) {
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		Comment comment = new Comment();

		try {
			conn = dbutil.getConnection(request);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from comments where commentid = " + id);
			if (rs.next()) {
				comment = getCommentFromSet(rs, request);
			}

		}

		catch (SQLException e) {
			e.printStackTrace();

		}

		finally {
			dbutil.closeConnection(conn);
		}

		return comment;
	}

	public static List<Comment> getAllCommentsByPostID(int id, HttpServletRequest request) {
		List<Comment> comments = new ArrayList<Comment>();
		Connection conn = null;
		DBUtil dbutil = new DBUtil();

		try {
			conn = dbutil.getConnection(request);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from comments where post = " + id);
			while (rs.next()) {

				Comment comment = new Comment();
				comment = getCommentFromSet(rs, request);
				comments.add(comment);
			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			dbutil.closeConnection(conn);

		}
		return comments;
	}

	public static List<Comment> getAllCommentsByParentID(Optional<Integer> id, HttpServletRequest request) {
		List<Comment> comments = new ArrayList<Comment>();
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		if (id.isPresent()) {
			try {
				conn = dbutil.getConnection(request);
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("select * from comments where parent = " + id.get());
				while (rs.next()) {

					Comment comment = new Comment();
					comment = getCommentFromSet(rs, request);
					comments.add(comment);
				}
			}

			catch (SQLException e) {
				e.printStackTrace();
			}

			finally {
				dbutil.closeConnection(conn);

			}
		}
		return comments;
	}

	public static Comment getCommentFromSet(ResultSet rs, HttpServletRequest request) throws SQLException {
		Comment comment = new Comment();
		comment.setID(rs.getInt(1));
		comment.setAuthor(AccountDAO.getAccountByID(rs.getInt(2), request));
		comment.setPost(PostsDAO.getPostByID(rs.getInt(3), request));
		comment.setContent(rs.getString(4));
		comment.setDatePosted(rs.getDate(5));
		comment.setPoints(rs.getInt(6));
		comment.setParentID(Optional.ofNullable(rs.getInt(7)));
		return comment;
	}

}
