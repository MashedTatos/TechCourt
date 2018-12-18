<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Search Result for <c:out value = "${searchQuery }"></c:out></h1>
<br>
<div>
<br><hr>
<table>
<tr>
<th><a href="Main.jsp">HOME</a></th>
<th><a href="SearchPage.html">SEARCH</a></th>
<th><a href="AccountPage.jsp">ACCOUNT PAGE</a></th>
</tr>
</table>
</div>
<br>
<div>
<table style="width:100%">
<tr>
<th>Posts</th>
</tr>
<c:forEach items="${sessionScope.result }" var = "post">
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