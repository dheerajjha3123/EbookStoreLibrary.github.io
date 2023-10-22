<%@page import="com.entity.User"%>
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
<title>All Recent Books</title>
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

 <%
	User u=(User) session.getAttribute("userobj");
	%>

	<%@include file="allComponent/navbar.jsp"%>

	<div class="container-fluid p-3">
		<div class="row">
			
			
			<%
			String ch=request.getParameter("ch");
			BookDAOImp dao2 = new BookDAOImp(DBConnect.getConn());
			List<BookDetails> list2 = dao2.getBookBySearch(ch);
			for (BookDetails b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 190px; height: 230px" class="img-thumblin">
						<p class="mb-2" style="color:"><strong><%=b.getBookName()%></strong></p>
						<p class="mb-2" style="color: #4469e3"><strong>Author: <%=b.getAuthor()%></strong></p>
						<p class="mb-4" style="color: #19A7CE"><strong>
						
						<%
						if(b.getBookCategory().equals("Old")){%>
						Categorie: <%=b.getBookCategory()%></strong></p>
						<div class="row text-center">
						
							<!-- Added text-center class here -->
							  <a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-secondary btn-sm ml-4"><i
								class="fa-solid fa-circle-info"></i> View Details</a> <a href=""
								class="btn btn-info btn-sm  ml-2"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
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
								<a href="view_books.jsp?bid=<%=b.getBookId()%>" class="btn btn-secondary btn-sm ml-1"><i
								class="fa-solid fa-circle-info"></i> View Details</a> <a href=""
								class="btn btn-info btn-sm  ml-2"><i
								class="fa-solid fa-indian-rupee-sign"></i> <%=b.getPrice()%></a>
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
		</div>
	

</body>
</html>