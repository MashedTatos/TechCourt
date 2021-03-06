package TechCourt;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import DAO.CommentDAO;

public class Comment extends TextEntity {

	private Optional<Integer> parentID;
	private Post post;
	
	
	public Optional<Integer> getParentID() {
		return parentID;
	}
	@Override
	public String toString() {
		return "Comment [parentID=" + parentID + ", post=" + post + ", getDatePosted()=" + getDatePosted()
				+ ", getID()=" + getID() + ", getContent()=" + getContent() + ", getAuthor()=" + getAuthor()
				+ ", getPoints()=" + getPoints() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode();
	}
	public void setParentID(Optional<Integer> parentID) {
		this.parentID = parentID;
	}
	public Post getPost() {
		return post;
	}
	public void setPost(Post post) {
		this.post = post;
	}
	
	//Gets all replys to this comments
	@Override
	public List<Comment> getAllComments(HttpServletRequest request){
		List<Comment> comments = new ArrayList<Comment>();
		comments = CommentDAO.getAllCommentsByParentID(this.getID(), request);
		
		
		
		
		return comments;
		
	}
	
	
	
}
