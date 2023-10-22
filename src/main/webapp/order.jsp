<%@page import="com.entity.Book_Order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderDAOImp"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Book</title>

<%@include file="allComponent/allCSS.jsp"%>

</head>
<style>
body{
background-color: #9fb3b5;
}
.container{
padding: 20px;

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
    color: #f5f7f7;
}

.rwc td:nth-child(4) {
    color: #d1133c;
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
#footerDiv {
    position: fixed;
    bottom: 0;
    left: 0;
    width: 100%;
}

.head{
padding:8px;
margin:15px;
text-align: center;
font-size: 35px;
font-weight: bold;
color: red;
}

.head:hover {
	color: white;
}
</style>

<body>

<c:if test="${empty userobj}">
<c:redirect url="login.jsp"></c:redirect>
</c:if>

<%@include file="allComponent/navbar.jsp"%>

<div class="container">
<h4 class="head">Your Orders</h4>

<table class="table table-striped">
  <thead class="bgCus">
    <tr class="bgk">
      <th scope="col">Order Id</th>
      <th scope="col">Name</th>
      <th scope="col">Book Name</th>  
      <th scope="col">Author</th>  
      <th scope="col">Price</th>
      <th scope="col">Payment Type</th>
      
      
    </tr>
  </thead>
  <tbody>
  <%
  User u=(User)session.getAttribute("userobj");
  BookOrderDAOImp dao=new BookOrderDAOImp(DBConnect.getConn());
  List<Book_Order> blist=dao.getBook(u.getEmail());
  
  for(Book_Order b:blist){%>
	  <tr class="rwc">
      <th scope="row"><%=b.getOrderId()%></th>
      <td><%=b.getUserName()%></td>
      <td><%=b.getBookName()%></td>
      <td><%=b.getAuthor()%></td>
      <td><%=b.getPrice()%></td>
      <td><%=b.getPaymentType()%></td>
     
    
    </tr>
  <%}
  
  %>
  
    
   
</table>

</div>

</body>
</html>