<%@page import="DAO.AccountDAO"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="DAO.PostsDAO"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%> 
<%@ page import = "TechCourt.*" %>
<%@ page import = "java.util.*" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Account Page</title>
</head>
<body>
<%
String username = request.getParameter("username");
List<Post> posts = (ArrayList<Post>)PostsDAO.getPostByUsername(username, request);
Account account = (Account)AccountDAO.getAccountByUsername(username, request);
%>

<div>
<br><hr>
<table>
<tr>
<th><a href="main.jsp">HOME</a></th>
<th><a href="SearchPage.html">SEARCH</a></th>
</tr>
</table>
</div>

<h1>Username: <%=account.getUsername() %></h1>
<h2>Points: <%=account.getPoints() %></h2>
<h2>Date Joined: <%=account.getDateJoined() %></h2>
<h2>Account type: <%=account.getAccountType() %></h2>

<br>
<div>
<table style="width:100%">
<tr>
<th>Posts</th>
</tr>
<c:forEach items="${posts }" var = "post">
<tr>
<td>
<a href = "post.jsp?id=${post.ID}"><c:out value = "${post.name }"></c:out></a>
</td>
</tr>
</c:forEach>
</table>
</div>
</body>
</html>