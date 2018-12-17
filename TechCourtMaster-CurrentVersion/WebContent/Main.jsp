<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<ul style="height: 2em;border-bottom-color: mediumpurple;border-style: solid;border-width: 0px 0px 1px 0px;" class="top-container">
			<li style="float: right;"><a style="background-color: aliceblue;margin: 0px;padding: 2px;opacity: .2"><input type="text" name="search"><font color="purple"><i class="fas fa-gavel"></i></font></a></li>
		</ul>
		<ul class="header" id="myHeader">
			<li><a>Home</a></li>
			<li><a>Posts</a></li>
			<li><a>User</a></li>
		</ul>
	
	<div class="content">
		<div>
			<h2>Topics</h2>
			<div class="topic">
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;Hardware<button onclick="toggleFunctionH()" style="float: right"><i class="fas fa-gavel"></i></button></h3>
				<div class="posts" id="toggleDIVH">
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post1</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post2</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post3</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post4</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post5</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post6</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post7</div>
				</div>
			</div>
		</div>
		<div>

			<div class="topic">
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;Software<button onclick="toggleFunctionS()" style="float: right"><i class="fas fa-gavel"></i></button></h3>
				<div class="posts" id="toggleDIVS">
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post1</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post2</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post3</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post4</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post5</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post6</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post7</div>
				</div>
			</div>
		</div>
		<div>
			<div class="topic">
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;Code<button onclick="toggleFunctionC()" style="float: right"><i class="fas fa-gavel"></i></button></h3>
				<div class="posts" id="toggleDIVC">
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post1</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post2</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post3</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post4</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post5</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post6</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post7</div>
				</div>
			</div>
		</div>
		<div>
			<div class="topic">
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;Periferals<button onclick="toggleFunctionP()" style="float: right"><i class="fas fa-gavel"></i></button></h3>
				<div class="posts" id="toggleDIVP">
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post1</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post2</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post3</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post4</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post5</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post6</div>
				<div class="toggleDIV"><i class="fas fa-gavel"></i>&nbsp;&nbsp;&nbsp;&nbsp;Post7</div>
				</div>
			</div>
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
		function toggleFunctionH() {
  		var x = document.getElementById("toggleDIVH");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
		function toggleFunctionS() {
  		var x = document.getElementById("toggleDIVS");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
		function toggleFunctionC() {
  		var x = document.getElementById("toggleDIVC");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
		function toggleFunctionP() {
  		var x = document.getElementById("toggleDIVP");
			if (x.style.display === "none") {
				x.style.display = "block";
			} else {
				x.style.display = "none";
			}
		}
	</script>

</body>
</html>
