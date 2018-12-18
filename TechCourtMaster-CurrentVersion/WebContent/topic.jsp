<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/techcourt" user="root" password="3nhVH26Wm2705r2509" />
<link rel="stylesheet" href="topic.css">
<link href="topic.css" rel="stylesheet" type="text/css">
<sql:query dataSource="${snapshot }" var="result">

	select * from topics where topicid = <c:out value="${param.id }" />
</sql:query>

<sql:query dataSource="${snapshot }" var="resultposts">
	select * from posts where topic = <c:out value="${param.id }" />
</sql:query>

</head>
<body>
<ul style="height: 2em;border-bottom-color: mediumpurple;border-style: solid;border-width: 0px 0px 1px 0px;" class="top-container">

			<li style="float: right;"><form action="SearchResult" method="post"><a
		style="background-color: aliceblue; margin: 0px; padding: 2px; opacity: .2"><input
			type="text" name="search"><font color="black"><button><i style ="color:black;"class="fas fa-search"></i></button></font></a></form></li>

</ul>

		<ul class="header" id="myHeader">

			<li><a href="Main.jsp">Home</a></li>

			<li><a>Posts</a></li>

			<li><a>User</a></li>

		</ul>





<div class="row" style="margin: 0px;padding: 0;">

	<!--User Box START/!-->

	<div class="column2" id="tools" style="background-color: silver; margin-top: 1em; margin-right: 1em;padding: 0px;text-align: center"> 

	

	<c:choose>

	<c:when test = "${account != null}">

			<c:out value = "${account.username }"></c:out><br>

	</c:when>

	

	<c:otherwise>

		<ul style="margin: 0px;background-color: lightgray;">

		<li style="display: block;float: left;margin-left: 3em;"><a href = "Login.html">Login</a></li>

		<li style="display: block;float: right;margin-right: 3em;"><a href ="UserRegistration.html"> Register</a></li>

		</ul>

	</c:otherwise>

	</c:choose>



	

	<c:if test = "${account.accountType == 'Admin' }">

	

		<button onclick = "modMode()">Moderator mode</button>

	

	</c:if>

		<br>

		<p style="background-color: lightgray;padding: 1em;margin: 0px;">Find computer hardware store near you!</p>

		<button onclick="getLocation()">Click me</button>

	

	

	</div>
<!--  
	<div id="tools" align="right">

		<c:choose>
			<c:when test="${account != null}">
				<c:out value="${account.username }"></c:out>
				<br>
			</c:when>

			<c:otherwise>
				<a href="Login.html">Login</a>
				<a href="UserRegistration.html"> Register</a>
			</c:otherwise>
		</c:choose>


		<c:if test="${account.accountType == 'Admin' }">

			<button onclick="modMode()">Moderator mode</button>

		</c:if>
		<br> Find computer hardware store near you!<br>
		<button onclick="getLocation()">Click me</button>


	</div>-->
	<div class="column1" id="tools" style="background-color: silver; margin-top: 1em; margin-left: 1em;padding: 0px;text-align: center">
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
					<c:out value="${user.username }" />
					on
					<c:out value="${post.DatePosted }" />
				</div>
			</div>
		</c:forEach>
	</c:forEach>
	</div>
</div>

</body>
</html>