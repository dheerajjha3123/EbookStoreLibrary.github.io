<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Helpline</title>

<%@include file="allComponent/allCSS.jsp"%>

</head>

<style>
body {
	background-color: #9fb3b5;
}

.logo {
	padding: 25px;
	text-align: center;
	color: #1c8bb8;
	font-size: 25px;
	font-weight: bold;
}

h3 {
	text-align: center;
	font-weight: bold;
	font-size: 38px;
}

h4 {
	text-align: center;
	font-weight: bold;
	font-size: 25px;
}

h5 {
	text-align: center;
	font-weight: bold;
	font-weight: bold;
	font-size: 20px;
}

.addi {
	font-weight: bold;
	color: white;
	border: hidden;
	font-size: 22px;
	background-color: #4181b5;
	cursor: pointer;
	border-radius: 10px;
	outline: none;
	box-shadow: 0 0.1rem rgb(121, 121, 121, 0.70);
	margin-left: 148px;
	align-content: center;
	justify-content: center;
}

.addi:hover {
	background-color: yellow;
	color: #e81531;
}

.a {
	align-items: center;
}
</style>

<body>

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="logo">
					<i class="fa-solid fa-square-phone fa-4x"></i>
				</div>
				<h3>24*7 Service</h3>
				<h4>Helpline Number</h4>
				<h5>+91 845117444</h5>
				<a href="index.jsp">
					<button class="addi">Home</button>
				</a>
			</div>
		</div>


	</div>

</body>
</html>