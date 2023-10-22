<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>		
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sell Book</title>

<%@include file="allComponent/allCSS.jsp"%>
</head>


<style>
body {
	background-color: #9fb3b5;
}
.col-md-5{
padding: 20px;
}

.card-body{
margin:20px;
padding:20px;

background-color: #abb3ad;
}
.form-group{
font-weight: bold;
font-size: 15px;
}
.sell{
font-weight: bold;
}
.head{
color: #112e30;
text-align: center;
font-weight: bold;
font-size: 30px;
margin: 5px;
padding-bottom: 15px;
}
</style>

<body>
<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>
	<%@include file="allComponent/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body">
					
					<h4 class="head">Sell Old Book</h4>
					
					<c:if test="${not empty succMsg}">
					<p class="text-center text-success">${succMsg}</p>
					<c:remove var="succMsg" scope="session"/>
					</c:if>
					
					<c:if test="${not empty faildMsg}">
					<p class="text-center text-danger">${faildMsg}</p>
					<c:remove var="faildMsg" scope="session"/>
					</c:if>
					
					<form action="AddOldBook" method="post" enctype="multipart/form-data">
					
					<input type="hidden" value="${userobj.email}" name="user">
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
								<label for="exampleFormControlFile1">Upload Photo*</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div >
							<button type="submit" class="btn btn-primary"><strong>Sell</strong></button>
						</form>
					
					</div>
				</div>

			</div>
		</div>
	</div>

</body>
</html>