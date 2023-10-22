<%@page import="com.entity.BookDetails"%>
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
<title>Admin: Add Books Here</title>
<%@include file="allCSS.jsp"%>
</head>

<body style="background-color: #d1d0cd">

<style>

body{
background-image: url('img/add2.jpeg');
background-size: cover;
background-repeat: no-repeat; /* Prevent image repetition */
    background-attachment: fixed; /* Fixed background position */
    background-color: #a6a49d;

.card-bg{
background-color:#abb3ad;
}
.proText{
text-align: center;
font-weight:bold;
block-size:40px;
font-smooth: always;

}
.form-group{
font-weight:bold;
font-smooth:always;
}
.btn{
font-weight:bold;
font-smooth:always;
}

</style>
	<%@include file="navbar.jsp"%>

	<div class="container p-3 ">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card card-bg">
					<div class="card-body">
					<h4 class="proText" >Edit Books</h4>
					
					
					
					<%
					int id=Integer.parseInt(request.getParameter("id"));
					BookDAOImp dao = new BookDAOImp(DBConnect.getConn());
					BookDetails b=dao.getBookById(id);
					%>
					
						<form action="../editBooks" method="post">
						<input type="hidden" name="id" value="<%=b.getBookId()%>">
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name*</label> <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getBookName()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Author Name*</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp" value="<%=b.getAuthor()%>">
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Price*</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputPassword1" value="<%=b.getPrice()%>">
							</div>
							
							<div class="form-group">
								<label for="inputState">Book Status*</label> <select
									id="inputState" name="status" class="form-control">
									
									<%
									if("Active".equals(b.getStatus())){
									%>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%										
									}
									else{ %>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									<%
										
									}%>					
		                   </select>
							</div>
							<div class="form-group">
								<label for="exampleFormControlFile1">Upload Photo*</label> <input
									name="bimg" type="file" class="form-control-file"
									id="exampleFormControlFile1">
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
		
<%@include file="footer.jsp" %>
</body>
</html>