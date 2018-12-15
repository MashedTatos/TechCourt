<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="post.css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


	<c:forEach items="${sessionScope.posts}" var="post">
		<c:if test="${param.id == post.ID }">
			<div id="title">
				<c:out value="${post.name }"></c:out>
			</div>
			<br>
			<div class="content">
				<c:out value="${post.content }"></c:out>
			</div>
			<br>
			<br>
			
			Comments:<br>
			<c:forEach items="${post.getComments() }" var="comment">
				<c:if test="${comment.parentID.get() != 0 }">

					<p style="">

						<c:out value="${comment.author.username } Wrote:"></c:out>

					</p>
					<div class="comment">
						<c:out value="${ comment.content}"></c:out>
					</div>

					<c:if test="${comment.getComments().size() > 0}">
						<c:forEach items="${comment.getComments() }" var="subcomment">
							<div class="subcomment">
								<p style="padding-left: 11em">
									<c:out value="${subcomment.content }"></c:out>
								</p>
							</div>

						</c:forEach>

					</c:if>


					<br>
					<br>
				</c:if>
			</c:forEach>
		</c:if>
	</c:forEach>
</body>
</html>