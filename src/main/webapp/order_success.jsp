<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="allComponent/allCSS.jsp"%>

</head>

<style>
body {
	background-color: #9fb3b5;
}

</style>
<body>

<%@include file="allComponent/navbar.jsp"%>

<div class="container text-center mt-3">
  <i class="fas fa-check-circle fa-5x text-success"></i> <!-- A checkmark icon with a large size and green color -->
  <h1>Thank You</h1> <!-- Heading 1 with the "Thank You" message -->
  <h2>Your Order has been Placed Successfully</h2> <!-- Heading 2 with a success message -->
  <h5>with in 7 Days Your Product will be Delivered In your Adress</h5> <!-- Subheading with delivery information -->
  <a href="index.jsp" class="btn btn-primary mt-3">Home</a> <!-- Home button with a blue primary color -->
  <a href="order.jsp" class="btn btn-danger mt-3">View Order</a> <!-- View Order button with a red danger color -->
</div>


</body>
</html>