package DAO;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import TechCourt.*;

public class PostsDAO {

	public static List<Post> getAllPosts(HttpServletRequest request) {
		List<Post> posts = new ArrayList<Post>();
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		try {
			conn = dbutil.getConnection(request);
			Statement stmt = conn.createStatement();
			ResultSet set = stmt.executeQuery("select * from posts");

			while (set.next()) {
				Post post = new Post();

				post = getPostFromSet(set, request);
				posts.add(post);
			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			dbutil.closeConnection(conn);
		}
		return posts;
	}

	public static void insertPost(Post post, HttpServletRequest request) {
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		try {
			conn = dbutil.getConnection(request);
			PreparedStatement pstmt = conn
					.prepareStatement("insert into posts (name,content,author,topic) values (?,?,?,?)");
			pstmt.setString(1, post.getName());
			pstmt.setString(2, post.getContent());
			pstmt.setInt(3, post.getAuthor().getUserID());
			pstmt.setString(4, post.getTopic());
			pstmt.executeUpdate();
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			dbutil.closeConnection(conn);
		}
	}

	public static Post getPostByID(int id, HttpServletRequest request) {
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		Post post = new Post();
		try {
			conn = dbutil.getConnection(request);
			PreparedStatement pstmt = conn.prepareStatement("select * from posts where postid = ?");
			pstmt.setInt(1, id);
			ResultSet set = pstmt.executeQuery();

			set.next();
			post = getPostFromSet(set, request);
		}

		catch (SQLException e) {
			e.printStackTrace();
		}
		
		finally {
			dbutil.closeConnection(conn);
		}

		return post;

	}

	public static String getTopicName(int id, HttpServletRequest request) throws SQLException {
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		String topic = null;
		try {
			conn = dbutil.getConnection(request);
			PreparedStatement stmt = conn.prepareStatement("select topicname from topics where topicid = ? ");
			stmt.setInt(1, id);

			ResultSet set = stmt.executeQuery();
			while (set.next()) {
				topic = set.getString(1);

			}
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

		finally {
			dbutil.closeConnection(conn);
		}
		return topic;
	}

	private static Post getPostFromSet(ResultSet set, HttpServletRequest request) throws SQLException {
		Post post = new Post();

		post.setID(set.getInt(1));
		post.setName(set.getString(2));
		post.setContent(set.getString(3));
		post.setAuthor(AccountDAO.getAccountByID(set.getInt(4), request));
		post.setPoints(set.getInt(5));
		post.setViews(set.getInt(6));
		post.setTopic(getTopicName(set.getInt(7), request));
		post.setDatePosted(set.getDate(8));
		return post;

	}

	public static Post getPostAndComments(int id, HttpServletRequest request) {
		Post post = getPostByID(id, request);
		post.setComments((ArrayList<Comment>) post.getAllComments(request));
		for (Comment c : post.getComments()) {
			c.setComments((ArrayList<Comment>) c.getAllComments(request));

		}
		return post;
	}

	public static List<Post> getPostByUsername(String username, HttpServletRequest request) {
		List<Post> posts = new ArrayList<Post>();
		Connection conn = null;
		DBUtil dbutil = new DBUtil();
		Post post = new Post();
		try {
			conn = dbutil.getConnection(request);
			PreparedStatement pstmt = conn.prepareStatement("select * from posts where author in (select userid from accounts where username = ?)");
			pstmt.setString(1, username);
			ResultSet set = pstmt.executeQuery();

			while(set.next()) {
				post=getPostFromSet(set,request);
				posts.add(post);
			}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}

		finally {
			dbutil.closeConnection(conn);
		}
		return posts;
	}
}
