<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBook: Registration</title>
<%@include file="allComponent/allCSS.jsp"%>
</head>
<body style="background-color:#a6a49d;">

<style>
  body {
    background-image: url('images/bgMim.jpeg'); /* Replace 'background.jpg' with your image file's path */
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
    background-color:#c0c1c2; /* Set the background color */
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
  .btn-primary {
    background-color: #1460e3; /* Set the button background color */
    border: none; /* Remove button border */
    color: #fff; /* Set button text color */
    padding: 10px 20px; /* Add padding to the button */
    border-radius: 4px; /* Rounded corners for the button */
    cursor: pointer; /* Add a pointer cursor on hover */
  }
</style>
	<%@include file="allComponent/navbar.jsp"%>
	<div class="container p-5">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body ">
					<h4  class="professional-h4" >Registration Page</h4>
						
						
						<c:if test="${not empty succMsg }">
						<p class="text-center text-success">${succMsg}</p>
						<c:remove var="succMsg" scope="session"/>
						</c:if>
						<c:if test="${not empty faildMsg }">${faildMsg }
						<p class="text-center text-danger">${faildMsg}</p>
						<c:remove var="faildMsg" scope="session"/>
						</c:if>
						<form class="form-container" method="post" action="RegisterServlet" >
							<div class="form-group">
								<label for="exampleInputEmail1">Enter Full Name</label> <input
									type="text" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="fname">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> <input
									type="email" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="email">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Mobile No</label> <input
									type="number" class="form-control" id="exampleInputEmail1"
									aria-describedby="emailHelp" required="required" name="phono">

							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> <input
									type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
							</div>
							<div class="form-check">
								<input type="checkbox" class="form-check-input" name="check"
									id="exampleCheck1"> <label class="form-check-label"
									for="exampleCheck1">Agree Terms and Condition</label>
							</div>
							<button type="submit" class="btn btn-primary m-2">Register</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<%@include file="allComponent/footer.jsp" %>

</body>
</html>