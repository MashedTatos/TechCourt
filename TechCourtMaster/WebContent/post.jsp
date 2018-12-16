<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="TechCourt.Post"%>
<%@ page import="TechCourt.DAO.PostsDAO"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<%
		int id = Integer.parseInt(request.getParameter("id"));

		Post post = PostsDAO.getPostAndComments(id, request);
		request.setAttribute("CurrentPost", post);
	%>
<link rel="stylesheet" href="post.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title><c:out value="${CurrentPost.name }"></c:out></title>
</head>
<body>





	<div id="title">
		<c:out value="${CurrentPost.name }"></c:out>
	</div>
	<div id ="post-header">
		<c:out value="${CurrentPost.author.username }"></c:out>
	</div>
	<br>
	<div class="content">
		<c:out value="${CurrentPost.content }"></c:out>

	</div>
	<br>

	<button onclick="showAddComment()" style="height: 20px; width: 120px; font-size: 60%; margin-left: 100px">Add a comment</button>
	<form action="MakeComment" style="visibility: hidden; margin-left: 100px;" id="addAComment" method="post">
		<textarea id="commentArea" name="comment" cols="40" rows="10" style="height: 1px"> </textarea>
		<input type="hidden" id="postId" name="postId" value="${param.id }" />
		<br> <input type="submit" value="submit" />
	</form>


	<br>
	<br>

	<br>
	<c:forEach items="${CurrentPost.getComments() }" var="comment">
		<c:if test="${comment.parentID.get() == 0 }">


			<div class="comment" id="${comment.ID }" >
				<c:out value="${comment.points }"></c:out>
				<c:out value="${ comment.content}"  escapeXml="false"></c:out>

				<br>
				<div class="comment-footer">
					<c:out value="${comment.author.username }"></c:out>
					
					<form action="CommentAction" method="POST">
						<input type="hidden" id="commentId" name="commentId" value="${comment.ID }"> 
						<input type="hidden" id="postId" name="postId" value="${param.id }" /> 
						<input type="submit" value="Vote" name="buttonAction"> 
						<input type="submit" value="Delete" name="buttonAction">
						<button onclick="addAReply(${comment.ID})" type="button">Add a reply</button>
						<div id="reply${comment.ID }" style="visibility: hidden;">
							<textarea class="reply" id="replyTextArea${comment.ID }" name="reply" cols="40" rows="10""></textarea>
							<input type="submit" value="Reply" name="buttonAction" style="">
						</div>
					</form>
				</div>
			</div>


			<c:if test="${comment.getComments().size() > 0}">
				<c:forEach items="${comment.getComments() }" var="subcomment">
					<div class="subcomment">

						<c:out value="${subcomment.points }"></c:out>
						<c:out value="${subcomment.content }" escapeXml="false"></c:out>
						<br>
						<div class="comment-footer">
							<c:out value="${subcomment.author.username }"></c:out>
							<form action="CommentAction" method="POST">
							<input type="hidden" id="commentId" name="commentId" value="${subcomment.ID }"> 
							<input type="hidden" id="postId" name="postId" value="${param.id }" /> 
							<input type="submit" value="Vote" name="buttonAction"> 
							<input type="submit" value="Delete" name="buttonAction">
							</form>
						</div>

					</div>

				</c:forEach>

			</c:if>

			<br>
		</c:if>
	</c:forEach>
	
	<div id="tools" align="right"> Find hardware store near you!<br><button onclick="getLocation()">Click me</button></div>
	
	<script>
		var currentLocation;
		
		function showAddComment() {
			if(document.getElementById("addAComment").style.visibility == "hidden"){
				document.getElementById("addAComment").style.visibility = "visible";
				document.getElementById("commentArea").style.height = "125px";
			}
			
			else{
				document.getElementById("addAComment").style.visibility = "hidden";
				document.getElementById("commentArea").style.height = "1px";
			}
		}

		function addAReply(id) {
			if(document.getElementById("reply"+id).style.visibility == "hidden"){
				document.getElementById("reply"+id).style.visibility = "visible";
				document.getElementById("replyTextArea"+id).style.height = "50px";
			}
			
			else{
				document.getElementById("reply"+id).style.visibility = "hidden";
				document.getElementById("replyTextArea"+id).style.height = "1px";
			}
		}
		
		function getLocation(){
			console.log("Getting location");
			if(navigator.geolocation){
				navigator.geolocation.getCurrentPosition(showLocation);
				
			}
			else{
				console.log("Could not get location");
			}
		}
		
		function showLocation(location){
			window.open("https://www.google.com/maps/search/computer+store/@" +location.coords.latitude + "," +location.coords.longitutde + ",13z/data=!4m4!2m3!5m1!10e2!6e6")
		}
		
		
	</script>
	
	<br>


</body>
</html>