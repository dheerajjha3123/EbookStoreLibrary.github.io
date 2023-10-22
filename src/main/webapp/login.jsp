<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Login</title>
<%@include file="allComponent/allCSS.jsp"%>
</head>
<style>
body {
	background-image: url('images/loGG.jpeg');
	/* Replace 'background.jpg' with your image file's path */
	background-size: cover; /* Cover the entire viewport */
	background-repeat: no-repeat; /* Prevent image repetition */
	background-attachment: fixed; /* Fixed background position */
	background-color: #a6a49d; /* Fallback background color */
}

.professional-h4 {

	font-size: 24px; /* Adjust the font size as needed */
	font-weight: bold; /* Make the text bold */
	color: #333; /* Set the text color */
	margin-bottom: 20px; /* Add some bottom margin for spacing */
	text-align: center;
}
/* Style the form container */
.form-container {
	background-color: #c0c1c2; /* Set the background color */
	border: 1px solid #ccc; /* Add a border around the form */
	border-radius: 5px; /* Add rounded corners to the form */
	padding: 20px; /* Add padding inside the form */
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1); /* Add a subtle box shadow */
	max-width: 400px; /* Limit the maximum width of the form */
	margin: 0 auto; /* Center the form horizontally */
}

/* Style the form groups */
.form-group {
	margin-bottom: 20px; /* Add spacing between form groups */
}

/* Style the labels for form controls */
label {
	font-weight: bold; /* Make labels bold */
	color: #141414; /* Set label text color */
}

/* Style the form controls themselves */
.form-control {
	border: 1px solid #ccc; /* Add a border to form controls */
	border-radius: 4px; /* Rounded corners for form controls */
	padding: 8px; /* Add padding to form controls */
	width: 100%; /* Make form controls full width */
}

/* Style the submit button */
.btn-cust {
	background-color: #2f5e13; /* Set the button background color */
	font-weight:bold;
	border: none; /* Remove button border */
	color: #fff; /* Set button text color */
	padding: 10px 20px; /* Add padding to the button */
	border-radius: 4px; /* Rounded corners for the button */
	cursor: pointer; /* Add a pointer cursor on hover */
}
#footerDiv {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
}

</style>
<body>
	<%@include file="allComponent/navbar.jsp"%>

	<div class="container p-5">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="professional-h4">Login</h4>
						
						<c:if test="${not empty faildMsg}">
						<h5 class="text-center text-danger">${faildMsg}</h5>
						<c:remove var="faildMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty succMsg}">
						<h5 class="text-center text-success">${succMsg}</h5>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<form class="form-container" action="Login" method="post">
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" 
									required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1"
									 required="required" name="password">
							</div>
							
							<div class="text-center">
								<button type="submit" class="btn btn-cust m-2">Login</button>
								<br> <a href="register.jsp "><strong>Create Account</strong></a>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>

<%@include file= "allComponent/footer.jsp" %>

</html>