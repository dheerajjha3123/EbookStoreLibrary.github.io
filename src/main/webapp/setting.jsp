<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Settings</title>

<%@include file="allComponent/allCSS.jsp"%>
</head>

<style>
body {
	background-color: #9fb3b5;
}
.heading{
padding:15px;
margin:10px;
text-align:center;
font-size:35px;
font-weight:bold;


 --c: #8A9B0F; /* the border color */
  --b: 10px;    /* the border thickness*/
  --g: 5px;     /* the gap on hover */
  
  padding: calc(var(--g) + var(--b));
  --_g: #0000 25%,var(--c) 0;
  background: 
    conic-gradient(from 180deg at top    var(--b) right var(--b),var(--_g))
     var(--_i,200%) 0  /200% var(--_i,var(--b))  no-repeat,
    conic-gradient(            at bottom var(--b) left  var(--b),var(--_g))
     0   var(--_i,200%)/var(--_i,var(--b)) 200%  no-repeat;
  transition: .3s, background-position .3s .3s;
  cursor: pointer;

}
.heading:hover{
color:#f3f70a;
 --_i: 100%;
  transition: .3s, background-size .3s .3s;
}

.card, .card2 ,.card3 ,.card4 ,.card5{
text-align: center;
background-color: #9fb3b5;
border: none;
font-weight: bold;
text-decoration:none;
font-size: 55px;
}
.card h3,.card2 h3,.card3 h3,.card4 h3,.card5 h3{
font-weight: bold;
font-size: 30px;
}
.card{
margin:10px;
padding:10px;
background-color: #364538;
}
.card:hover{
color: white;
}
.card2{
margin:10px;
padding:10px;
color: #0d0d0d;
background-color: #5f948f;
}

.card2:hover{
color: white;
}
/* .card3{
margin:15px;
padding:15px;
color: #fbff05;
background-color: #7c7d33;
}
.card3:hover {
	color: #38381f;
} */
.card4{
margin: 15px;
padding: 15px;
color: #a81318;
background-color: #cacecf;
}
.card4:hover {
	color: #37277d;
}
.card5{
margin: 15px;
padding: 15px;
color: #1f872f;
background-color: #c9e695;
}
.card5:hover {
	color: #2f6bcc;
}
.para{
font-weight:bold;
font-size: 18px;
}
</style>
<body>

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container">
	<c:if test="${not empty userobj}">
	<h3 class="heading">Hello, ${userobj.name}</h3>
	
	</c:if>
		
		<div class="row p-4">
			<div class="col-md-4">
			<a href="sell_book.jsp">
				<div class="card">
					<div class="card-body">
					<i class="fa-solid fa-book-open-reader"></i>
					<h3>Sell Old Book</h3>
					
					</div>
				</div>
			</a>
			</div>
			
			<div class="col-md-4">
			<a href="old_book.jsp">
				<div class="card">
					<div class="card-body">
					<i class="fa-solid fa-book-open-reader"></i>
					<h3>Old Book</h3>
					
					</div>
				</div>
			</a>
			</div>
			
			<div class="col-md-4">
			<a href="edit_profile.jsp">
				<div class="card2">
					<div class="card-body">
					<i class="fa-solid fa-id-card"></i>
					<h3>Edit Profile</h3>
					
					</div>
				</div>
			</a>
			</div>
			<!--  
				
				<div class="col-md-4 mt-5">*/
				<a href="user_address.jsp">
					<div class="card3">
						<div class="card-body">
						<i class="fa-solid fa-map-location"></i>
						<h3>Your Address</h3>
						<p class="para">Edit Address</p>
						
						</div>
					</div>
				</a>
				</div> -->
				
			<div class="col-md-6 mt-5">
			<a href="order.jsp">
				<div class="card4">
					<div class="card-body">
					<i class="fa-solid fa-box-open"></i>
					<h3>Your Orders</h3>
					<p class="para">Track Your Orders</p>
					
					</div>
				</div>
			</a>
			</div>
			<div class="col-md-6 mt-5">
			<a href="helpline.jsp">
				<div class="card5">
					<div class="card-body">
					<i class="fa-solid fa-headset"></i>
					<h3>Help Center</h3>
					<p class="para">24*7 Service</p>
					
					</div>
				</div>
			</a>
			</div>
			
		</div>
	</div>

</body>
<%@include file="allComponent/footer.jsp"%>
</html>