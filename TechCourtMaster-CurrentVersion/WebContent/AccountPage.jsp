<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="DAO.PostsDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ page import = "TechCourt.*" %>
<%@ page import = "java.util.*" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="post.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Page</title>
</head>
<body>
<%
List<Post> posts = (ArrayList<Post>)session.getAttribute("posts");
%>

<ul style="height: 2em; border-bottom-color: mediumpurple; border-style: solid; border-width: 0px 0px 1px 0px;"
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
		<li><a href="Main.jsp">HOME</a></li>
		<li><a href="SearchPage.html">SEARCH</a></li>
		<li><a href="EditAccount.jsp">EDIT ACCOUNT</a></li>
	</ul>

<!-- <div> -->
<!-- <br><hr> -->
<!-- <table> -->
<!-- <tr> -->
<!-- <th><a href="homepage.jsp">HOME</a></th> -->
<!-- <th><a href="SearchPage.html">SEARCH</a></th> -->
<!-- <th><a href="EditAccount.jsp">EDIT ACCOUNT</a></th> -->
<!-- </tr> -->
<!-- </table> -->
<!-- </div> -->

<h1>Welcome ${sessionScope.account.username }</h1>
<br>
<div>
<table style="width:100%">
<tr>
<th>Posts</th>
</tr>
<c:forEach items="${sessionScope.posts }" var = "post">
<tr>
<td>
<a href = "post.jsp?id=${post.ID}"><c:out value = "${post.name }"></c:out></a>
</td>
</tr>
</c:forEach>
</table>
</div>
<br>
<div>
<a href="Logout.jsp">Logout</a>
</div>
</body>
</html>