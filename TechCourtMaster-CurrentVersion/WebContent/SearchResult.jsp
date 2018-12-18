<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="main.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Result</title>
</head>
<body>

	<ul
		style="height: 2em; border-bottom-color: mediumpurple; border-style: solid; border-width: 0px 0px 1px 0px;"
		class="top-container">
		<li style="float: right;">
			<form action="SearchResult" method="post">
				<a
					style="background-color: aliceblue; margin: 0px; padding: 2px; opacity: .2"><input
					type="text" name="search"><font color="black"><button>
							<i style="color: black;" class="fas fa-search"></i>
						</button></font></a>
			</form>
		</li>
	</ul>
	<ul class="header" id="myHeader">
		<li><a href="Main.jsp">Home</a></li>
		<li><a href="post.jsp?id=1">Posts</a></li>
		<li><a href="UserPage.jsp">User</a></li>
	</ul>


	<h1 style="color: dimgray;">Search Result</h1>
	<br>
	<div>
		<br>
		<hr>
		<table>
			<tr>
				<th><a href="main.jsp">HOME</a></th>
				<th><a href="SearchPage.html">SEARCH</a></th>
				<th><a href="AccountPage.jsp">ACCOUNT PAGE</a></th>
			</tr>
		</table>
	</div>
	<br>
	<div>
		<table style="width: 100%">
			<tr>
				<th>Posts</th>
			</tr>
			<c:forEach items="${sessionScope.result }" var="post">
				<tr>
					<td><a href="post.jsp?id=${post.ID}"><c:out
								value="${post.name }"></c:out></a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>