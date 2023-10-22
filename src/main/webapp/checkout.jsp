<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImp"%>
<%@page import="com.entity.Cart"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="allComponent/allCSS.jsp"%>
</head>
<style>
body {
	background-color: #9fb3b5;
}

.hed2 {
	text-align: center;
	font-weight: bold;
	color: #1d823d;
}

.card {
	background-color: #b4b8b5;
}
/* Default button style */
.btn11 {
	background-color: #e5f71b;
	width: 25%; /* Button width takes 100% of the parent container */
	height: auto; /* Automatically adjust the height */
	padding: 5px 6px; /* Adjust padding as needed */
	border: none; /* Remove border if not needed */
	color: #000000; /* Text color */
	border-radius: 6px; /* Rounded corners */
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease-in-out;
}

/* Optional: Hover effect */
.btn11:hover {
	background-color: #4fad6e;
}

.btn22 {
	background-color: #0b591e; /* Your color here */;
	width: 30%;
	height: auto;
	padding: /* Your padding here */;
	border: 6px solid transparent;
	color: /* Your text color here */;
	border-radius: 6px;
	cursor: pointer;
	transition: background-color 0.3s ease-in-out;
	font-weight: bold;
	color: white;
}

/* Optional: Hover effect for btn22 */
.btn22:hover {
	background-color: #4693c7; /* Your hover color here */;
}

.pmod {
	text-align: center;
}

.form-row {
	font-weight: bold;
}

.form-group {
	font-weight: bold;
}

.form-control {
	font-weight: bold;
}

.priceClass {
	font-weight: bold;
	font-size: 22px;
	color: #000000;
}

.priceClass2 {
	font-weight: bold;
	color: #000000;
	padding: 8px;
}

.alert {
    text-align: center;
	font-weight: bold;
	background-color: #9fb3b5;
	border: hidden;
	font-size: 20px;
}
</style>
<body>
	<%@include file="allComponent/navbar.jsp"%>

	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>
	</c:if>
	<c:if test="${not empty succMsg}">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty faildMsg}">
		<div class="alert alert-danger" role="alert">${faildMsg}</div>
		<c:remove var="faildMsg" scope="session" />
	</c:if>

</body>

<div class="container">
	<div class="row p-3">
		<div class="col-md-6">

			<div class="card">
				<div class="card-body">
					<h2 class="hed2">Your Selected Items</h2>
					<table class="table table-striped ">
						<thead>
							<tr>
								<th scope="col">Book Name</th>
								<th scope="col">Author</th>
								<th scope="col">Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>

							<%
							User u = (User) session.getAttribute("userobj");

							CartDAOImp dao = new CartDAOImp(DBConnect.getConn());
							List<Cart> cart = dao.getByUser(u.getId());
							Double totalPrice = 0.00;
							for (Cart c : cart) {
								totalPrice = c.getTotalPrice();
							%>

							<tr>
								<th scope="row"><%=c.getBookName()%></th>
								<td><%=c.getAuthor()%></td>
								<td><%=c.getPrice()%></td>
								<td><a
									href="RemoveBookCart?bid=<%=c.getBid()%>&&uid=<%=c.getUserId()%>&&cid=<%=c.getCid()%>"
									class="btn btn-sm btn-danger"><strong>Remove</strong></a></td>
							</tr>
							<%
							}
							%>
							<tr>
								<td class="priceClass">Total Price :</td>
								<td></td>
								<td></td>
								<td class="priceClass2"><%=totalPrice%></td>
							</tr>


						</tbody>
					</table>
				</div>
			</div>

		</div>

		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h2 class="hed2">Fill Your Details</h2>

					<form action="OderServlet" method="post">
					<input type="hidden" value="${userobj.id}" name="id">
											<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Name</label> <input type="text" name="username"
									class="form-control" id="inputEmail4" value="${userobj.name}" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Email</label> <input type="email" name="email"
									class="form-control" id="inputPassword4" value="${userobj.email}" required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Mobile No.</label> <input type="number" name="phono"
									class="form-control" id="inputEmail4" value="${userobj.phno}" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Address</label> <input type="text" name="address"
									class="form-control" id="inputPassword4" required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">Landmark</label> <input type="text" name="landmark"
									class="form-control" id="inputEmail4" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">City</label> <input type="text" name="city"
									class="form-control" id="inputPassword4" required>
							</div>
						</div>

						<div class="form-row">
							<div class="form-group col-md-6">
								<label for="inputEmail4">State</label> <input type="text" name="state"
									class="form-control" id="inputEmail4" required>
							</div>
							<div class="form-group col-md-6">
								<label for="inputPassword4">Pin Code</label> <input name="pincode"
									type="number" class="form-control" id="inputPassword4" required>
							</div>
						</div>

						<div class="form-group">
							<label>Payment Mode</label> <select class="form-control" name="payment">
								<option value="noselect">--Select--</option>
								<option value="COD">Cash On Delivery</option>

							</select>

						</div>
						<div class="pmod">
							<button class="btn11 ">Order Now</button>
							<a href="index.jsp" class="btn22">Continue Shopping</a>
						</div>


					</form>



				</div>
			</div>
		</div>

	</div>
</div>

</html>