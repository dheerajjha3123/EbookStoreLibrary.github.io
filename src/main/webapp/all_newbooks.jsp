<%@page import="com.entity.User"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All New Books</title>
<%@include file="allComponent/allCSS.jsp"%>
</head>
<style>
.card {
	margin-bottom: 20px;
	/* Add margin to control the spacing between cards */
}

.row {
	margin-bottom: 20px;
	/* Add margin to control the spacing between rows of cards */
}
.crd-ho:hover {
	color:green;
	background-color:#aae3e6;
}
#snackbar {
  visibility: hidden; /* Hidden by default. Visible on click */
  min-width: 250px; /* Set a default minimum width */
  margin-left: -125px; /* Divide value of min-width by 2 */
  background-color: #28571f; /* Black background color */
  color: #fff; /* White text color */
  font-weight:bold;
  text-align: center; /* Centered text */
  border-radius: 2px; /* Rounded borders */
  padding: 16px; /* Padding */
  position: fixed; /* Sit on top of the screen */
  z-index: 1; /* Add a z-index if needed */
  left: 50%; /* Center the snackbar */
  bottom: 30px; /* 30px from the bottom */
}

/* Show the snackbar when clicking on a button (class added with JavaScript) */
#snackbar.show {
  visibility: visible; /* Show the snackbar */
  /* Add animation: Take 0.5 seconds to fade in and out the snackbar.
  However, delay the fade out process for 2.5 seconds */
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

/* Animations to fade the snackbar in and out */
@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}


</style>
<body style="background-color: #8691a3;">


   <%
	User u=(User) session.getAttribute("userobj");
	%>

<c:if test="${not empty addCart}">
    <div id="snackbar">${addCart}</div>

    <script>
        function showSnackbar() {
            var snackbar = document.getElementById("snackbar");
            snackbar.className = "show";
            setTimeout(function () {
                snackbar.className = snackbar.className.replace("show", "");
            }, 3000);
        }

        // Call the function to show the snackbar when needed
        showSnackbar();
    </script>
    <c:remove var="addCart" scope="session"/>
</c:if>


	<%@include file="allComponent/navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			
			
			<%
			BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
			List<BookDetails> list = dao.getAllNewBooks();
			for (BookDetails b : list) {
			%>
			<div class="col-md-2">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 190px; height: 230px" class="img-thumblin">
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
							<a href="login.jsp" class="btn btn-primary btn-sm ml-1"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
						<%}
						else{%>
							<a href="Cart_Servlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId() %>" class="btn btn-primary btn-sm ml-2"><i class="fa-solid fa-cart-shopping"></i> Add Cart</a> 
						<%}
						%>
						<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-secondary btn-sm ml-1">
						<i class="fa-solid fa-circle-info"></i> View Details</a> <a href=""
								class="btn btn-info btn-sm  ml-1 "><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>
			
			</div>
		</div>
	

</body>
</html>