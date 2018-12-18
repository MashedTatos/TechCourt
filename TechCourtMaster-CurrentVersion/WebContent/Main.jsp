<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<link rel="stylesheet" href="c1.css" type="text/css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css"
	integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU"
	crossorigin="anonymous">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/techcourt" user="root" password="1234" />

<sql:query dataSource="${snapshot }" var="result">

select * from topics
</sql:query>
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
	<li><a>Posts</a></li>
	<li><a href="AccountPage.jsp">User</a></li>
</ul>



<div class="content">
	<div>
		<h2>Topics</h2>




		<c:forEach var="row" items="${result.rows }">

			<div class="topic">
				<h3>
					<a href="topic.jsp?id=${row.TopicID }"> <c:out
							value="	${row.TopicName }" /></a>
				</h3>
				<button onclick="toggleFunction(${row.TopicID})"
					style="float: right">
					<i class="fas fa-gavel"></i>
				</button>

				<div class="posts" id="toggle${row.TopicID }">
					<sql:query dataSource="${snapshot }" var="resultposts">
						select * from posts where topic = <c:out value="${row.TopicID }"/>
					</sql:query>
					
					<c:forEach var="post" items="${resultposts.rows }">
							<sql:query dataSource="${snapshot }" var="resultuser"> select * from accounts where userid = <c:out value="${post.author }" /> </sql:query>
							<c:forEach var="user" items="${resultuser.rows }">
						<div class=post>
							<br> <a href="post.jsp?id=${post.postid}"><c:out value="${post.name }"></c:out></a><br>
							<div class="postFooter">
								<c:out value="${post.points }"> Points </c:out> &nbsp;&nbsp;&nbsp;&nbsp; Submitted by
								<a href="UserPage.jsp?username=${user.username }"><c:out value="${user.username }" /></a> on
								<fmt:parseDate value="${post.DatePosted }" var="date" pattern="yyyy-MM-dd HH:mm:ss" dateStyle="short" timeStyle="short"/>
								<c:out value="${date }"/>
							</div>
						</div>
						
						</c:forEach>
					</c:forEach>
					
				</div>
			</div>

		</c:forEach>
	</div>
</div>

<footer>
<ul class="botton-container">
	<li>&nbsp;&nbsp;&nbsp;&nbsp;<a>PRIVACY POLICY</a></li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;<a>TERMS OF USE</a></li>
	<li>&nbsp;&nbsp;&nbsp;&nbsp;<a>CONTACT US</a></li>
</ul>
</footer>
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
		
		
		function toggleFunction(id){
			var x = document.getElementById("toggle"+id);
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
		
	</script>

</body>
</html>
