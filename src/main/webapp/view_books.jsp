<%@page import="com.entity.BookDetails"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Books</title>
<%@include file="allComponent/allCSS.jsp"%>
</head>
<style>
body {
	background-color: #a5c2bd;
}

.row p {
	font-size:15px;
	font-weight: bold;
}
.rowcP{
padding:30px;
text-align: center;

}
.row h4{
font-weight: bold;
}
.emailcus{
color: #f7590a;
font-weight: bold;

}
.cont{
font-weight: bold;
color: #f00202;
}
.head{
font-weight: bold;
}

</style>
<body>
	<%@include file="allComponent/navbar.jsp"%>
	
	<%
	int bid=Integer.parseInt(request.getParameter("bid"));
	BookDAOImp dao=new BookDAOImp(DBConnect.getConn());
	BookDetails b=dao.getBookById(bid);
	
	%>

	<div class="container">
		<div class="row p-4">
			<div class="col-md-6 text-center p-5 border " style="background-color: #abd9b4;">
				<img src="book/<%=b.getPhotoName() %>" style="height: 200px; width: 150px;">
				<h4 class="mt-4">Book Name: <span style="color: #006aff;"><%=b.getBookName() %></span></h4>
				<h4 >Author: <span style="color: #f22c00;"><%=b.getAuthor() %></span></h4>
				<h4 >Category: <span style="color: #2205fa;"><%=b.getBookCategory()%></span></h4>
			</div>


			<div class="col-md-6 text-center p-5 border " style="background-color: #ccccd9;">
				<h2 class="head"><%=b.getBookName()%></h2>
				
				<%
				if("Old".equals(b.getBookCategory())){%>
				<h5 class="cont">Contact to Seller</h5>
				<h5 class="emailcus"><i class="fa-solid fa-envelope"></i> Email: <%=b.getEmail() %></h5>
				<%}
				%>
				
				<div class="row">
					<div class="col-md-4 text-success text-center p-3">
						<i class="fa-solid fa-money-bill-transfer fa-2x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger text-center p-3">
						<i class="fa-solid fa-rotate-left fa-2x"></i>
						<p>Return Available</p>
					</div>
					<div class="col-md-4 text-primary text-center p-3">
						<i class="fa-solid fa-truck fa-2x"></i>
						<p>Free Delivery</p>
					</div>
	
				</div>
				
				<%
				if("Old".equals(b.getBookCategory())){%>
				
					<div class="rowcP">
				<a href="index.jsp" class="btn btn-primary"><strong><i class="fa-solid fa-cart-shopping"></i> Continue Shopping</strong></a>
				<a href="" class="btn btn-info"><strong><i class="fa-solid fa-indian-rupee-sign"></i> 300</strong></a>
				
				</div>
				<%}
				else{%>
					<div class="rowcP">
				<a href="" class="btn btn-primary"><strong><i class="fa-solid fa-cart-shopping"></i> Add Cart</strong></a>
				<a href="" class="btn btn-info"><strong><i class="fa-solid fa-indian-rupee-sign"></i> 300</strong></a>
				
				</div>
				<%}
				%>
				
				
				
			</div>

		</div>
	</div>

</body>
</html>