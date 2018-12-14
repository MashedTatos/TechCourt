<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<c:forEach items="${sessionScope.posts}" var="post">
		
		Title: <c:out value="${post.name }"></c:out>
		<br>
		<c:out value="${post.content }"></c:out>
		<br>
		<br>
			
			Comments:<br>
		<c:forEach items="${post.getComments() }" var="comment">
			<c:if test="${comment.parentID.get() != 0 }">

				<p style="">

					<c:out value="${comment.author.username } Wrote:"></c:out>

			</p>
			<p style="padding-left: 7em">
				<c:out value="${ comment.content}"></c:out>

				<c:if test="${comment.getComments().size() > 0}">
					<c:forEach items="${comment.getComments() }" var="subcomment">

						<p style="padding-left: 11em">
							<c:out value="${subcomment.content }"></c:out>
						</p>

					</c:forEach>

				</c:if>
			</p>

			<br>
			<br>
			</c:if>
		</c:forEach>
	</c:forEach>
</body>
</html>