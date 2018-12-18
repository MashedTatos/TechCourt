<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/techcourt" user="root" password="1234" />
<link rel="stylesheet" href="topic.css">
<sql:query dataSource="${snapshot }" var="result">

	select * from topics where topicid = <c:out value="${param.id }" />
</sql:query>

<sql:query dataSource="${snapshot }" var="resultposts">
	select * from posts where topic = <c:out value="${param.id }" />
</sql:query>
<c:forEach var="topic" items = "${result.rows }">
<c:set var="topicname" scope="page" value="${topic.TopicName }"/>
</c:forEach>
</head>
<body>
<ul style="height: 2em;border-bottom-color: mediumpurple;border-style: solid;border-width: 0px 0px 1px 0px;" class="top-container">
		
			<form action="SearchResult" method="post"><a
		style="background-color: aliceblue; margin: 0px; padding: 2px; opacity: .2"><input
			type="text" name="search"><font color="black"><button><i style ="color:black;"class="fas fa-search"></i></button></font></a></form></li>
			<p align="center"><c:out value="${topicname }"/></p>
		</ul>

		<ul class="header" id="myHeader">

			<li><a href="Main.jsp">Home</a></li>

			<li><a>Posts</a></li>

			<li><a>User</a></li>

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
			<a href = "Logout.jsp">Logout</a><br>

			<c:if test="${account.accountType == 'Admin' }">
				<a href ="BanUser.html">Ban user</a>

			</c:if>
			<br>
			<p style="background-color: lightgray; padding: 1em; margin: 0px;">Find
				computer hardware store near you!</p>
			<button onclick="getLocation()">Click me</button>


		</div>
		</div>

	<c:forEach var="row" items="${result.rows }">

Welcome to <c:out value="${row.TopicName }" />

	</c:forEach>

	<br>
	<c:choose>
		<c:when test="${account!=null }">
			<a href="MakePost.jsp?topic=${param.id }">Make a post!</a>
		</c:when>
		<c:otherwise>
			<div style="margin-left: 100px;">
				Please login or register to contribute! <br> <a
					href="Login.html">Login</a> <a href="UserRegistration.html">
					Register</a>
			</div>
		</c:otherwise>
	</c:choose>
	<c:forEach var="post" items="${resultposts.rows }">
		<sql:query dataSource="${snapshot }" var="resultuser">
	select * from accounts where userid = <c:out value="${post.author }" />
		</sql:query>

		<c:forEach var="user" items="${resultuser.rows }">
			<div class=post>
				<br> <a href="post.jsp?id=${post.postid}"><c:out
						value="${post.name }"></c:out></a><br>
				<div class="postFooter">
					<c:out value="${post.points }"> Points </c:out>
					&nbsp;&nbsp;&nbsp;&nbsp; Submitted by
					<a href="UserPage.jsp?username=${user.username }"><c:out value="${user.username }" /></a>
					on
					<c:out value="${post.DatePosted }" />
				</div>
			</div>
		</c:forEach>
	</c:forEach>


</body>
</html>