<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="TechCourt.Post"%>
<%@ page import="DAO.PostsDAO"%>
<%@ page import="TechCourt.Account"%>
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
<c:if test="${notLoggedIn == true }">
You are not logged in
</c:if>
</head>
<body>

	<ul
		style="height: 2em; border-bottom-color: mediumpurple; border-style: solid; border-width: 0px 0px 1px 0px;"
		class="top-container">
		<li style="float: right;">
	<form action="SearchResult" method="post"><a
		style="background-color: aliceblue; margin: 0px; padding: 2px; opacity: .2"><input
			type="text" name="search"><font color="black"><button><i style ="color:black;"class="fas fa-search"></i></button></font></a></form></li>
	</ul>
	<ul class="header" id="myHeader">
		<li><a href="Main.jsp">Home</a></li>
		<li><a href="post.jsp?id=1">Posts</a></li>
		<li><a href="UserPage.jsp">User</a></li>
	</ul>


	<div class="row" style="margin: 0px; padding: 0;">
		<!--User Box START/!-->
		<div class="column2" id="tools"
			style="background-color: silver; margin-top: 1em; margin-right: 1em; padding: 0px; text-align: center">

			<c:choose>
				<c:when test="${account != null}">
					<a href="UserPage.jsp?username=${account.username }"><c:out value="${account.username }"></c:out></a>
					<br>
				</c:when>

				<c:otherwise>
					<ul style="margin: 0px; background-color: lightgray;">
						<li style="display: block; float: left; margin-left: 3em;"><a
							href="Login.html">Login</a></li>
						<li style="display: block; float: right; margin-right: 3em;"><a
							href="UserRegistration.html"> Register</a></li>
					</ul>
				</c:otherwise>
			</c:choose>


			<c:if test="${account.accountType == 'Admin' }">

				<button onclick="modMode()">Moderator mode</button>

			</c:if>
			<br>
			<p style="background-color: lightgray; padding: 1em; margin: 0px;">Find
				computer hardware store near you!</p>
			<button onclick="getLocation()">Click me</button>


		</div>
		<!--User Box END/!-->


		<div class="column1" style="background-color: silver; margin-top: 1em;margin-left: 1em;">
		<div id="title">
			<c:out value="${CurrentPost.name }"></c:out>
		</div>
		<div id="post-header">
			<c:out value="${CurrentPost.author.username }"></c:out>
			<c:out value = "${CurrentPost.points }"/>
		</div>
		<div class="content">
			<c:out value="${CurrentPost.content }" escapeXml="false"></c:out>

		</div>
		<c:choose>
			<c:when test="${account!=null }">
				<button onclick="showAddComment()">Add a comment</button>
				
				<form action="PostAction" method = "post">
				<input type= "submit" name="Action" value = "Like"/>
				<input type= "submit" name="Action" value = "Dislike"/>
				<input type = "submit" name= "Action" value ="Delete" class = "deleteButton" style="visibility:hidden;">
					<div style="visibility: collapse; margin-left: 2em;" id="addAComment">
					<textarea id="commentArea" name="comment" cols="40" rows="10"
						style="height: 1px"> </textarea>
					<input type="hidden" id="postId" name="postId" value="${param.id }" />
					 <input type="submit" value="Comment" name ="Action" />
					 </div>
					 
				</form>
			</c:when>
			<c:otherwise>
				<div style="margin-left: 100px;">
					Please login or register to contribute! <br>
					<a href="Login.html">Login</a> <a href="UserRegistration.html">
						Register</a>
				</div>
			</c:otherwise>
		</c:choose>

		<c:forEach items="${CurrentPost.getComments() }" var="comment">
			<c:if test="${comment.parentID.get() == 0 }">


				<div class="comment" id="${comment.ID }">
					<c:out value="${comment.points }"></c:out>
					<c:out value="${ comment.content}" escapeXml="false"></c:out>

					<div class="comment-footer">
						<a href="UserPage.jsp?username=${comment.author.username }"><c:out value="${comment.author.username }"></c:out></a>

						<form action="CommentAction" method="POST">
							<input type="hidden" id="commentId" name="commentId"
								value="${comment.ID }"> <input type="hidden" id="postId"
								name="postId" value="${param.id }" /> <input type="submit"
								value="Vote" name="buttonAction">
							<button onclick="addAReply(${comment.ID})" type="button">Add
								a reply</button>
							<input type="submit" value="Delete" name="buttonAction"
								style="visibility: hidden;" class="deleteButton">
							<div id="reply${comment.ID }" style="visibility: hidden;">
								<textarea class="reply" id="replyTextArea${comment.ID }"
									name="reply" cols="40" rows="10"></textarea>
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
								<a href="UserPage.jsp?username=${subcomment.author.username }"><c:out value="${subcomment.author.username }"></c:out></a>
								<form action="CommentAction" method="POST">
									<input type="hidden" id="commentId" name="commentId"
										value="${subcomment.ID }"> <input type="hidden"
										id="postId" name="postId" value="${param.id }" /> <input
										type="submit" value="Vote" name="buttonAction"> <input
										type="submit" value="Delete" name="buttonAction"
										style="visibility: hidden;" class="deleteButton">
								</form>
								<br>
							</div>

						</div>

					</c:forEach>

				</c:if>

			</c:if>
		</c:forEach>
		</div>
	</div>


	<!-- 	<div id="tools" align="right">  -->

	<%-- 	<c:choose> --%>
	<%-- 	<c:when test = "${account != null}"> --%>
	<%-- 			<c:out value = "${account.username }"></c:out><br> --%>
	<%-- 	</c:when> --%>

	<%-- 	<c:otherwise> --%>
	<!-- 		<a href = "Login.html">Login</a> <a href ="UserRegistration.html"> Register</a> -->
	<%-- 	</c:otherwise> --%>
	<%-- 	</c:choose> --%>


	<%-- 	<c:if test = "${account.accountType == 'Admin' }"> --%>

	<!-- 		<button onclick = "modMode()">Moderator mode</button> -->

	<%-- 	</c:if> --%>
	<!-- 	<br> -->
	<!-- 	Find computer hardware store near you!<br><button onclick="getLocation()">Click me</button> -->


	<!-- 	</div> -->

	<script>
		window.onscroll = function() {myFunction()};
		var header = document.getElementById("myHeader");
		var sticky = header.offsetTop;
		function myFunction() {
				if (window.pageYOffset > sticky) {
				header.classList.add("sticky");
			} else {
			header.classList.remove("sticky");
		}
		}
		
		var currentLocation;
		var moderatorMode = false;
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
		
		function modMode(){
			
			var elements = document.getElementsByClassName("deleteButton");
			var i;
			
			if(!moderatorMode){
				for(i = 0; i < elements.length; i++ ){
					elements[i].style.visibility = "visible";
					moderatorMode = true
				}
			}
			
			else{
				for(i = 0; i < elements.length; i++ ){
					elements[i].style.visibility = "hidden";
					moderatorMode = false
				}
			}
		}
		
		
	</script>

	<br>


</body>
</html>