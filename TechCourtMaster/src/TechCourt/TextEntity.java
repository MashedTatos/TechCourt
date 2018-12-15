package TechCourt;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import TechCourt.DAO.CommentDAO;

public abstract class TextEntity implements Serializable {

	private int ID;
	private String content;
	private Account author;
	private int points;
	private Date datePosted;
	private ArrayList<Comment> comments;
	
	public Date getDatePosted() {
		return datePosted;
	}
	public void setDatePosted(Date datePosted) {
		this.datePosted = datePosted;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Account getAuthor() {
		return author;
	}
	public void setAuthor(Account author) {
		this.author = author;
	}
	public int getPoints() {
		return points;
	}
	public void setPoints(int points) {
		this.points = points;
	}
	
	public ArrayList<Comment> getComments() {
		return comments;
	}
	public void setComments(ArrayList<Comment> comments) {
		this.comments = comments;
	}
	
	public abstract List<Comment> getAllComments(HttpServletRequest request);
	
	
	
}
