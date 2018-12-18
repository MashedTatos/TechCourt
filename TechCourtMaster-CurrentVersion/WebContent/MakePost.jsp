<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="MakePost" method="post">

		Title<br>
		<input type="text" name="title" required /><br> Content<br>
		<textarea name="content" rows="30" cols="10"
			style="height: 400px; width: 400px;"></textarea>
		<br> <input type="submit" value="Submit" />
		<input type="hidden" value="${param.topic }" id="topic" name="topic" >
	</form>
</body>
</html>