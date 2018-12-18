<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="EditAccount" method="post">
<table>
<tr><td>Username</td><td><input type="text" name="username" value="${sessionScope.account.username}" readonly="readonly"></td><br></tr>
<tr><td>Email</td><td><input type="email" name="email" placeholder="Leave blank if you dont wanna change" ></td><br></tr>
<tr><td>Bio</td><td><textarea name="bio" rows="2" cols="50" placeholder="Leave blank if you dont wanna change" ></textarea></td><br></tr>
<tr><td>Password</td><td><input type="password" name="password" placeholder="Leave blank if you dont wanna change"></td><br></tr>
<tr><td><input type="submit" value="Update Account"></td></tr>
</table>
</form>
</body>
</html>