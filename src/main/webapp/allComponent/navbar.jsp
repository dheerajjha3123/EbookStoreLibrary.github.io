<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<div class="container-fluid"
	style="height: 10px; background-color: #607d8b"></div>
<div>
	<style>
.logo2 {
    width: 150px; /* Set the desired width */
    height: auto; /* Maintain the aspect ratio */
    border: 2px solid transparent; /* Add initial border */
    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    opacity: 0.8;
    transition: transform 0.3s ease-in-out, filter 0.3s ease-in-out;
}

.logo2:hover {
    border: 2px solid black; /* Change border color on hover */
    transform: scale(1.1); /* Scale image to 110% on hover */
    filter: grayscale(0.5); /* Apply grayscale effect on hover */
}
.cartCust,
.cartCust2,
.cartCust3 {

  width: 50%; /* Set the desired percentage width */
  max-width: 150px; /* Set a maximum width if needed */
  height: auto; /* Maintain the aspect ratio */
     border: 10px solid transparent; 
 
  border-radius: 8px;
  opacity: 1;
  /* transition: transform 0.3s ease-in-out, filter 0.3s ease-in-out; */
}

.cartCust2 {

color:#f2fff5;
  background-color:#039e27; /* Background color for cartCust2 */
}
.cartCust3{
background-color: #147ec4;
color: white;
}
.cartCust{
background: #147ec4;
color: white;


}

</style>
	<div class="container-flued p-4">
		<div class="row">


			<div class="col-md-3 ">
				<img src="images/ebk2.jpg" alt="Ebook Management System Image"
					class="logo2">

			</div>

			<div class="col-md-6">
				<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
					<input class="form-control mr-sm-2" type="search" name="ch"
						placeholder="Search" aria-label="Search">
					<button class="btn  btn-cus my-2 my-sm-0" type="submit" class="logo2">Search</button>
				</form>
			</div>
			
			<c:if test="${not empty userobj}">
			<div class="col-md-3">
			
    <a href="checkout.jsp" class="cartCust"><i class="fa-solid fa-cart-shopping fa-1.2x"></i> Cart</a>
    <a href="edit_profile.jsp" class="cartCust2"><i class="fa-solid fa-user fa-1.2x "></i> ${userobj.name}</a>
    <a href="LogoutServlet" class="cartCust3"><i class="fa-solid fa-right-to-bracket fa-1.2x "></i> Logout</a>

</div>

			
			</c:if>
			
			<c:if test="${empty userobj}">
			<div class="col-md-3">
				<a href="login.jsp" class="btn btn-success"><i
					class="fa-solid fa-right-to-bracket"></i> Login</a> <a
					href="register.jsp" class="btn btn-primary"><i
					class="fa-solid fa-user-plus"></i> Register</a>
			</div>
			</c:if>


			
		</div>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="index.jsp"><i
					class="fa-solid fa-house-user"></i> Home <span class="sr-only">(current)</span>
			</a></li>
			<li class="nav-item active"><a class="nav-link" href="all_recentbooks.jsp"><i
					class="fa-solid fa-book-open"></i> Recent Book</a></li>
			<li class="nav-item active"><a class="nav-link" href="all_newbooks.jsp"><i
					class="fa-solid fa-book-bookmark"></i> New Book</a></li>

			<li class="nav-item active"><a class="nav-link disabled"
				href="all_oldbooks.jsp"><i class="fa-solid fa-book"></i> Old Book</a></li>
		</ul>
		<form class="form-inline my-2 my-lg-0">

			<a href="setting.jsp" class="btn btn-dark my-2 my-sm-0 m-2" type="submit">
				<i class="fa-solid fa-gear"></i> Setting
			</a>
			<button class="btn btn-darkmy-2 my-sm-0 " type="submit">
				<i class="fa-solid fa-phone"></i> Contact Us
			</button>

		</form>
	</div>

</nav>


