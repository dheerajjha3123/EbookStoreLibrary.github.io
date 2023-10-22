<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books Here</title>
<%@include file="allCSS.jsp"%>
</head>

<body style="background-color: #d1d0cd">

<style>

body{
background-image: url('img/add2.jpeg');
background-size: cover;
background-repeat: no-repeat; /* Prevent image repetition */
    background-attachment: fixed; /* Fixed background position */
    background-color: #a6a49d;

.card-bg{
background-color:#abb3ad;
}
.proText{
text-align: center;
font-weight:bold;
block-size:40px;
font-smooth: always;

}
.form-group{
font-weight:bold;
font-smooth:always;
}
.btn{
font-weight:bold;
font-smooth:always;
}

</style>
	<%@include file="navbar.jsp"%>

    <c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	

	<div class="container p-3 ">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card card-bg">
					<div class="card-body">
					<h4 class="proText" >Add Books</h4>
					
					<c:if test="${not empty succMsg}">
					<p class="text-center text-success">${succMsg}</p>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty faildMsg}">
					<p class="text-center text-danger">${faildMsg}</p>
					<c:remove var="faildMsg" scope="session"/>
					</c:if>
					
						<form action="../add_books" method="post"
							enctype="multipart/form-data">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1">
							</div>
							<div class="form-group">
								<label for="inputState">Book Categories*</label> <select
									id="inputState" name="categories" class="form-control">
									<option selected>--select--</option>
									<option value="New">New Book</option>
								</select>
							</div>
							<div class="form-group">
								<label for="inputState">Book Status*</label> <select
									id="inputState" name="status" class="form-control">
									<option selected>--select--</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
								</select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo*</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Add</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
		
<%@include file="footer.jsp" %>
</body>
</html>