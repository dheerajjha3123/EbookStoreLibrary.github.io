<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: All Orders</title>
<%@include file="allCSS.jsp" %>
</head>
<style>
body{
background-color: #c7d49b;
}
.hed{
padding-top: 20px;
font-weight: bold;
font-smooth: always;
text-align: center;
block-size:60px;
}
.bgCus{
background-color:#66b37a;
font-weight: bold;
font-size: 17px;
color:#0a0a09;
text-align:center;
font-smooth: always;

}
.table{
background-color: #819186;
text-align: center;
}
.rwc {
font-weight:bold;
font-size:14px;

    color: #fcba03;

}

.rwc td:nth-child(2) {
    color: #010505;
}

.rwc td:nth-child(3) {
    color: #ad0707;
}

.rwc td:nth-child(4) {
    color: #080705;
}

.rwc td:nth-child(5) {
    color: #000203;
}

.rwc td:nth-child(6) {
    color: #000203;
}
.rwc td:nth-child(7){
color: #000203;
}
.rwc td:nth-child(8){
color: #05fa05;
}

.rwc td:nth-child(9) {
    color: #054efa;
}


</style>
<body>

 <c:if test="${empty userobj}">
	<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

<%@include file="navbar.jsp" %>
<h3 class="hed">Hello Admin!</h3>
<table class="table table-striped">
  <thead class="bgCus">
    <tr class="bgk">
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Email</th>
      <th scope="col">Address</th>
      <th scope="col">Mob No</th>
      <th scope="col">Book Name</th>  
      <th scope="col">Author</th>  
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
      
      
    </tr>
  </thead>
  <tbody>
  
  <%
  BookOrderDAOImp dao=new BookOrderDAOImp(DBConnect.getConn());
  List<Book_Order> blist=dao.getAllOrders();
  
  for(Book_Order b:blist){%>
	  <tr class="rwc">
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUserName()%></td>
      <td><%=b.getEmail()%></td>
      <td><%=b.getFullAdd()%></td>
      <td><%=b.getPhno()%></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
      
    </tr>
  <%}
  %>
  
    
    
  </tbody>
</table>

<%@include file="footer.jsp" %>

</body>
</html>