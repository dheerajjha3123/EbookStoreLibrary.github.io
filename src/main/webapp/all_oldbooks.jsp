<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.BookDetails"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All Old Books</title>
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

</style>
<body style="background-color: #8691a3;">
	<%@include file="allComponent/navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			
			
			<%
			BookDAOImp dao3 = new BookDAOImp(DBConnect.getConn());
			List<BookDetails> list3 = dao3.getAllOldBooks();
			for (BookDetails b : list3) {
			%>
			<div class="col-md-2">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 190px; height: 230px" class="img-thumblin">
						<p class="mb-2" style="color:"><strong><%=b.getBookName()%></strong></p>
						<p class="mb-2" style="color: #4469e3"><strong>Author: <%=b.getAuthor()%></strong></p>
						<p class="mb-4" style="color: #19A7CE"><strong>Categorie: <%=b.getBookCategory()%>	</strong> </p>
						<div class="row text-center">
							<!-- Added text-center class here -->
							 <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-secondary btn-sm ml-5"><i
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
		</div>
	

</body>
</html>