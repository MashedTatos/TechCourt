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


	<form action="EditAccount" method="post">
		<table>
			<tr>
				<td>Username</td>
				<td><input style="background-color:white" type="text" name="username"
					value="${sessionScope.account.username}" readonly="readonly"></td>
				<br>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="email" name="email"
					placeholder="Leave blank if you dont wanna change"></td>
				<br>
			</tr>
			<tr>
				<td>Bio</td>
				<td><textarea name="bio" rows="2" cols="50"
						placeholder="Leave blank if you dont wanna change"></textarea></td>
				<br>
			</tr>
			<tr>
				<td>Password</td>
				<td><input type="password" name="password"
					placeholder="Leave blank if you dont wanna change"></td>
				<br>
			</tr>
			<tr>
				<td><input type="submit" value="Update Account"></td>
			</tr>
		</table>
	</form>
</body>
</html>