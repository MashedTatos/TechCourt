<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="post.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	
	<div class="column2" id="tools"
			style="background-color: silver; margin-top: 1em; margin-right: 1em; padding: 0px; text-align: center">

			<c:choose>
				<c:when test="${account != null}">
					<c:out value="${account.username }"></c:out>
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
	
	<form action="MakePost" method="post" style="">

		Title<br>
		<input type="text" name="title" required style="background-color:white"/><br> Content<br>
		<textarea name="content" rows="30" cols="10"
			style="height: 400px; width: 400px;"></textarea>
		<br> <input type="submit" value="Submit" />
		<input type="hidden" value="${param.topic }" id="topic" name="topic" >
	</form>
	</div>
	</div>
</body>
</html>