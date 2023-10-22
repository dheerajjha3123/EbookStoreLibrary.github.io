<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Books</title>
<%@include file="allCSS.jsp"%>
</head>
<body>
	<style>
body {
	background-color: #c7d49b;
}

.hed {
	padding-top: 20px;
	font-weight: bold;
	font-smooth: always;
	text-align: center;
	block-size: 60px;
}

.bgCus {
	background-color: #66b37a;
	font-weight: bold;
	font-size: 17px;
	color: #0a0a09;
	text-align: center;
	font-smooth: always;
}

.table {
	background-color: #819186;
}

.rwc {
	font-weight: bold;
	font-size: 14px;
	text-align: center;
	color: #f0ebec;
}

.btn2 {
	font-weight: bold;
	font-smooth: always;
	background-color: #fa0728;
	color: #000203;
}


</style>
	<%@include file="navbar.jsp"%>
	
	<c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>
	
	<h3 class="hed">Hello Admin!</h3>

	<c:if test="${not empty succMsg}">
		<h4 class="text-center text-success">${succMsg}</h4>
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<c:if test="${not empty faildMsg}">
		<h4 class="text-center text-danger">${faildMsg}</h4>
		<c:remove var="faildMsg" scope="session" />
	</c:if>

	<table class="table table-striped">
		<thead class="bgCus">
			<tr class="bgk">
				<th scope="col">ID</th>
				<th scope="col">Image</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author Name</th>
				<th scope="col">Price</th>
				<th scope="col">Categories</th>
				<th scope="col">Status</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>

			<%
			BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
			List<BookDetails> list = dao.getAllBooks();
			for (BookDetails b : list) {
			%>
			<tr class="rwc">
				<td><%=b.getBookId()%></td>
				<td><img src="../book/<%=b.getPhotoName()%>"
					style="width: 50px; height: 50px"></td>
				<td><%=b.getBookName()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>
				<td><%=b.getStatus()%></td>


				<td><a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn1 btn-sm btn-info"><i class="fa-solid fa-pen-to-square"></i> Edit</a> 
				<a href="../BooksDeleteServlet?id=<%=b.getBookId()%>" class="btn2 btn-sm btn-danger"><i class="fa-solid fa-trash"></i> Delete</a></td>

			</tr>

			<%
			}
			%>
		</tbody>
	</table>

		<%@include file="footer.jsp"%>
</body>
</html>