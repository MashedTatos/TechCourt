package TechCourt;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import TechCourt.DAO.CommentDAO;
import TechCourt.DAO.PostsDAO;

public class Post extends TextEntity  {
	private String name;
	private String topic;
	private int views;

	
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	public String getTopic() {
		return topic;
	}
	public void setTopic(String topic) {
		this.topic = topic;
	}
	
	@Override
	public List<Comment> getAllComments(HttpServletRequest request){
		List<Comment> comments = new ArrayList<Comment>();
		comments = CommentDAO.getAllCommentsByPostID(this.getID(), request);
		
		
		return comments;
		
	}
	
	@Override
	public String toString() {
		return "Post [postID=" + getID() + ", name=" + name + ", content=" + getContent() + ", author=" + getAuthor() + ", point="
				+ getPoints() + ", views=" + views + ", topic=" + topic + "]";
	}
	
	public static void updatePostsAttribute(HttpServletRequest request) {
		List<Post> posts = new ArrayList<Post>();
		posts = PostsDAO.getAllPosts(request);
		
		for(Post p : posts) {
			p.setComments((ArrayList<Comment>)p.getAllComments(request));
			
			for(Comment c : p.getComments()) {
				c.setComments((ArrayList<Comment>)c.getAllComments(request));
				System.out.println(c.getAuthor().getUsername());
				for(Comment c2: c.getComments()) {
					System.out.println(c2.getAuthor().getUsername());
				}
				
			}
		}
		
		request.getSession().setAttribute("posts", posts);
	}
	
	
	
}
