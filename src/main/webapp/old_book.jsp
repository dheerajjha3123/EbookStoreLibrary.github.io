<%@page import="com.entity.BookDetails"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User: Old Book</title>

<%@include file="allComponent/allCSS.jsp"%>

</head>
<style>
body {
	background-color: #9fb3b5;
}

.container {
	padding: 20px;
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
	text-align: center;
}

.rwc {
	font-weight: bold;
	font-size: 14px;
	color: #9ae366;
}

.rwc td:nth-child(2) {
	color: #010505;
}

.rwc td:nth-child(3) {
	color: white;
}

.rwc td:nth-child(4) {
	color: #1b62c4;
}

.rwc td:nth-child(5) {
	color: #000203;
}
</style>
<body>

	<%@include file="allComponent/navbar.jsp"%>

	<c:if test="${not empty succMsg }">
		<p class="text-center text-success">${succMsg}</p>
		<c:remove var="succMsg" scope="session" />
	</c:if>
	<c:if test="${not empty faildMsg }">${faildMsg }
						<p class="text-center text-danger">${faildMsg}</p>
		<c:remove var="faildMsg" scope="session" />
	</c:if>

	<div class="container">
		<table class="table table-striped">
			<thead class="bgCus">
				<tr class="bgk">
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Category</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody>

				<%
				User u = (User) session.getAttribute("userobj");
				String email = u.getEmail();

				BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
				List<BookDetails> list = dao.getBookByOld(email, "Old");

				for (BookDetails b : list) {
				%>
				<tr class="rwc">
					<td><%=b.getBookName()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getBookCategory() %></td>
					<td><a href="DeleteOldBook?em=<%=email%>&&id=<%=b.getBookId() %>"
						class="btn btn-sm btn-danger">Delete</a></td>
				</tr>
				<%
				}
				%>


			</tbody>
		</table>
	</div>

</body>
</html>