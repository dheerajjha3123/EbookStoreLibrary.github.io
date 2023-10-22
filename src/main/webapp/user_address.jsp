<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Address</title>

<%@include file="allComponent/allCSS.jsp"%>

</head>

<style>
body {
	background-color: #9fb3b5;
}
.col-md-6{

padding: 10px;

}

.card-body{

margin:20px;
padding:25px;

background-color: #abb3ad;
}

.form-group{

font-weight: bold;
font-size: 15px;
}

.head{
color: #21313d;
text-align: center;
font-weight: bold;
margin:10px;
padding:8px;
font-size: 25px;
padding-bottom: 10px;

}
.addi{
text-align:center;
border: hidden;

}
.addi2{
font-weight: bold;
color:white;
border: hidden;
font-size: 17px;
background-color: #4181b5;
cursor: pointer;
border-radius: 10px;
outline: none;
box-shadow: 0 0.1rem rgb(121,121,121, 0.70);

align-content: center;
justify-content: center;
}
.addi2:hover {
	background-color: yellow;
	color: #e81531;
}
</style>

<body>

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-4 ">
				<div class="card">
					<div class="card-body">
					<h4 class="head">Add Address</h4>
					
					<form action="">

							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputPassword4">Address</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-6">
									<label for="inputEmail4">Landmark</label> <input type="text"
										class="form-control" id="inputEmail4">
								</div>
							</div>



							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputPassword4">City</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-5">
									<label for="inputPassword4">State</label> <input type="text"
										class="form-control" id="inputPassword4">
								</div>
								<div class="form-group col-md-3">
									<label for="inputPassword4">Pin Code</label> <input
										type="number" class="form-control" id="inputPassword4">
								</div>
							</div>
							
							<div class="addi">
							<button class="addi2">Add Address</button>
							</div>

						</form>

					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>