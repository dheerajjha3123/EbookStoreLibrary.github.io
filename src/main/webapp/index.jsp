
<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ebook System</title>

<%@include file="allComponent/allCSS.jsp"%>

<style>
.back-img {
	background: url("images/bgMim.jpeg");
	height: 60vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center middle; /* Center the image */
}

}
.crd-ho:hover {
	background-color: #c2d1c8;
}

.card-body p {
	font-size: 17px; /* Adjust the font size to your preference */
	line-height: 1.3; /* Adjust the line height for better readability */
	transition: color 0.3s;
}

.card-body  p:hover {
	color: #1486e3;
} /* Change the text color on hover to your desired color */
.container h3 {
	background: #044857;
	border: 1px solid #000;
	color: white;
	transition: color 0.3s;
	padding: 10px;
}

.container h3:hover {
	color: #06768f;
}

.headhed {
	text-align: center;
	font-weight: 900;
	padding: 160px;
	color: #000b0f;
}

.card {
	margin-bottom: 20px;
	/* Add margin to control the spacing between cards */
}

.row {
	margin-bottom: 20px;
	/* Add margin to control the spacing between rows of cards */
}
</style>

</head>
<body style="background-color: #c2d1c8">

    <%
	User u=(User) session.getAttribute("userobj");
	%>
	
	<%@include file="allComponent/navbar.jsp"%>
	
	
	<div class="container-fluid back-img">

		<h2 class="headhed">
			<span style="color: #070714;"> Welcome to</span><br> E-Book Libr<span style="color: red;">ary
			System</span>
		</h2>

	</div>


	<!-- Start New Book Section -->
	<div class="container">
		<h3 class="text-center m-2">New Books</h3>
		<div class="row">

			<%
			BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
			List<BookDetails> list = dao.getNewBooks();
			for (BookDetails b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 170px; height: 220px" class="img-thumblin">
						<p class="mb-2" style="color:">
							<strong><%=b.getBookName()%></strong>
						</p>
						<p class="mb-2" style="color: #4469e3">
							<strong>Author: <%=b.getAuthor()%></strong>
						</p>
						<p class="mb-4" style="color: #19A7CE">
							<strong>Categorie: <%=b.getBookCategory()%></strong>
						</p>
						
												
						<div class="row text-center">
							<!-- Added text-center class here -->
						<%
						if(u==null){%>
							<a href="login.jsp" class="btn btn-primary btn-sm ml-4"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
						<%}
						else{%>
							<a href="Cart_Servlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-primary btn-sm ml-4"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
						<%}
						%>
								<a href="view_books.jsp?bid=<%=b.getBookId()%>"	class="btn btn-secondary btn-sm ml-1"><i
								class="fa-solid fa-circle-info"></i> View Details</a> <a href=""
								class="btn btn-info btn-sm my-2 ml-4 "><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>



		</div>
		<div class="text-center">
			<a href="all_newbooks.jsp" class="btn btn-success btn-sm  text-white"><strong>View
					All</strong></a>
		</div>
	</div>

	<!-- End New Book Section -->



	<!-- Start Slider  Section -->

	<div class="text-center p-4">
		<div id="featureImageSlider" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#featureImageSlider" data-slide-to="0"
					class="active"></li>
				<li data-target="#featureImageSlider" data-slide-to="1"></li>
				<li data-target="#featureImageSlider" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner">
				<div class="carousel-item active">
					<img class="d-block w-90 mx-auto" src="slider/slid1.jpeg"
						alt="First slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-90 mx-auto" src="slider/slid2.jpeg"
						alt="Second slide">
				</div>
				<div class="carousel-item">
					<img class="d-block w-90 mx-auto" src="slider/slid3.jpg"
						alt="Third slide">
				</div>
			</div>
			<a class="carousel-control-prev" href="#featureImageSlider"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#featureImageSlider"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

	</div>

	<!-- End Slider Section Section -->



	<!-- Start Recent Book Section -->
	<div class="container">
		<h3 class="text-center m-2">Recent Books</h3>
		<div class="row">
			<%
			BookDAOImp dao2 = new BookDAOImp(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getRecentBooks();
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 170px; height: 220px" class="img-thumblin">
						<p class="mb-2" style="color:"><strong><%=b.getBookName()%></strong></p>
						<p class="mb-2" style="color: #4469e3"><strong>Author: <%=b.getAuthor()%></strong></p>
						<p class="mb-4" style="color: #19A7CE"><strong>
						
						<%
						if(b.getBookCategory().equals("Old")){%>
						Categorie: <%=b.getBookCategory()%></strong></p>
						<div class="row text-center">
						
							<!-- Added text-center class here -->
							  <a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-secondary btn-sm ml-4"><i class="fa-solid fa-circle-info"></i> View Details</a> 
							  <a href="" class="btn btn-info btn-sm  ml-2"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						<%}else{%>
							Categorie: <%=b.getBookCategory()%></strong></p>
						<div class="row text-center">
						
						<%
						if(u==null){%>
							<a href="login.jsp" class="btn btn-primary btn-sm ml-4"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
						<%}
						else{%>
							<a href="Cart_Servlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-primary btn-sm ml-4"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
						<%}
						%>
							<!-- Added text-center class here -->
							 <a href=""	class="btn btn-secondary btn-sm ml-1"><i class="fa-solid fa-circle-info"></i> View Details</a> 
							 <a href="" class="btn btn-info btn-sm my-2 ml-4"><i class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
							
						<%}
						%>
						
						
					</div>
				</div>
			</div>
			<%
			}
			%>

		</div>
		<div class="text-center">
			<a href="all_recentbooks.jsp" class="btn btn-success btn-sm m-2 text-white"><strong>View
					All</strong></a>
		</div>
	</div>

	<!-- End Recent Book Section -->



	<!-- Start Old Book Section -->
	<div class="container">
		<h3 class="text-center m-2">Old Books</h3>
		<div class="row">
		
		
			<%
			BookDAOImp dao3 = new BookDAOImp(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getOldBooks();
			for (BookDetails b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 170px; height: 220px" class="img-thumblin">
						<p class="mb-2" style="color:"><strong><%=b.getBookName()%></strong></p>
						<p class="mb-2" style="color: #4469e3"><strong>Author: <%=b.getAuthor()%></strong></p>
						<p class="mb-4" style="color: #19A7CE"><strong>Categorie: <%=b.getBookCategory()%>	</strong> </p>
						<div class="row text-center">
							<!-- Added text-center class here -->
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-secondary btn-sm ml-4"><i
								class="fa-solid fa-circle-info"></i> View Details</a> <a href=""
								class="btn btn-info btn-sm  ml-2"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
						
						
					</div>
				</div>
			</div>
			<%
			}
			%>
			
			
		</div>
		<div class="text-center">
			<a href="all_oldbooks.jsp" class="btn btn-success btn-sm m-2 text-white"><strong>View
					All</strong></a>
		</div>
	</div>

	<!-- End Old Book Section -->

	<!-- Add footer file -->



</body>
	<%@include file="allComponent/footer.jsp"%>

</html>