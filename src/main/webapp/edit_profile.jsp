<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Profile</title>

<%@include file="allComponent/allCSS.jsp"%>

</head>

<style>
body {
	background-color: #9fb3b5;
}

.col-md-5 {
	padding: 20px;
}

.card-body {
	margin: 20px;
	padding: 20px;
	background-color: #abb3ad;
}

.form-group {
	font-weight: bold;
	font-size: 15px;
}

.head4 {
	color: #105994;
	margin: 10px;
	padding: 8px;
	text-align: center;
	font-weight: bold;
	font-size: 25px;
	padding-bottom: 10px;
}
</style>

<body>

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body">

						<h4 class="head4">Edit Your Profile</h4>

						<c:if test="${not empty faildMsg}">
							<h5 class="text-center text-danger">${faildMsg}</h5>
							<c:remove var="faildMsg" scope="session" />
						</c:if>
						<c:if test="${not empty succMsg}">
							<h5 class="text-center text-success">${succMsg}</h5>
							<c:remove var="succMsg" scope="session" />
						</c:if>

						<form class="form-container" method="post"
							action="UpdatePorfileServlet">
							<input type="hidden" value="${userobj.id }" name="id">
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname"
									value="${userobj.name}">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email"
									value="${userobj.email}">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Mobile No</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phono"
									value="${userobj.phno}">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									required="required" name="password">
							</div>

							<button type="submit" class="btn btn-primary m-2">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>