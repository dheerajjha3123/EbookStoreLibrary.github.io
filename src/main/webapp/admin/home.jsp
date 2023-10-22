<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Page</title>
<%@include file="allCSS.jsp"%>
</head>

<style>
body {
	background-color: #9fa8bf;
}

#footerDiv {
	position: fixed;
	bottom: 0;
	left: 0;
	width: 100%;
}

.container {
	padding-top: 100px;
}

.hed {
	text-align: center;
	margin-top: 30px;
	font-weight: bold;
	color: white;
	transition: color 0.5s ease;
}

.hed:hover {
	color: black;
}

.card {
text-align:center;
	margin: 15px;
	padding: 20px;
	color: white;
	background-color: #4d7572;
}
.card:hover {
	color: black;
}
.card2 {
text-align:center;
	margin: 15px;
	padding: 20px;
	color:  #121de6;
	background-color: #a3a68d;
}
.card2:hover {
	color: #d4f70c;
}
.card3 {
text-align:center;
	margin: 15px;
	padding: 20px;
	color: #08d4fc;
	background-color: #d9610b;
}
.card3:hover {
	color: #156e18;
}
.card4 {
text-align:center;
	margin: 15px;
	padding: 20px;
	color: #fa0511;
	background-color: #a9b068;
}
.card4:hover {
	color: #30545e;
}
</style>

<body>
	<%@include file="navbar.jsp"%>
	<c:if test="${empty userobj}">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>


	<h3 class="hed">Welcome Admin!</h3>

	<div class="container ">
		<div class="row ">
			<div class="col-md-3">
				<a href="add_books.jsp">
					<div class="card">
						<div class="card-body ">
							<i class="fa-solid fa-folder-plus fa-3x "></i> <br>
							<h4>Add Books</h4>

						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="all_books.jsp">
					<div class="card2">
						<div class="card-body ">
							<i class="fa-solid fa-book-open-reader fa-3x "></i> <br>
							<h4>All Books</h4>

						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="orders.jsp">
					<div class="card3">
						<div class="card-body ">
							<i class="fa-solid fa-box-open fa-3x "></i> <br>
							<h4>Orders</h4>

						</div>
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a data-toggle="modal" data-target="#exampleModalCenter">
					<div class="card4">
						<div class="card-body ">
							<i class="fa-solid fa-arrow-right-from-bracket fa-3x "></i>
							<br>
							<h4>Logout</h4>

						</div>
					</div>
				</a>
			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle"></h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="text-center">
						<h4>Do you want Logout?</h4>
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal">Cancel</button>
						<a href="../LogoutServlet" type="button" class="btn btn-primary">Logout</a>
					</div>
				</div>
				<div class="modal-footer"></div>
			</div>
		</div>
	</div>

	<!-- Logout Button trigger modal End-->
	
		<%@include file="footer.jsp"%>
	
</body>
</html>