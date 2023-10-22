<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>
<div class= "container-fluid"
style="height:10px; background-color:#607d8b"
> </div>
<div>
<style>

.logo2 {
    width: 150px; /* Set the desired width */
    height: auto; /* Maintain the aspect ratio */
    border: 2px solid transparent; /* Add initial border */
    box-shadow: 4px 4px 8px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    opacity: 0.8;
    transition: transform 0.3s ease-in-out, filter 0.3s ease-in-out;
}

.logo2:hover {
    border: 2px solid black; /* Change border color on hover */
    transform: scale(1.1); /* Scale image to 110% on hover */
    filter: grayscale(0.5); /* Apply grayscale effect on hover */
}
</style>
	<div class="container-flued p-4">
		<div class="row">
		
			<div class="col-md-3 text text-custom">
				<img src="img/ebk2.jpg" alt="Ebook Management System Image"
					class="logo2">
			</div>
			
			
			<div class="col-md-3">
			
			<c:if test="${not empty userobj}">
			<a class="btn btn-success text-white "><i class="fa-solid fa-user"></i> ${userobj.name}</a>
			<a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-primary text-white"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
			
			</c:if>
						
			<c:if test="${empty userobj}">
		   <a href="../login.jsp" class="btn btn-success"><i class="fa-solid fa-right-to-bracket"></i> Login</a>
			<a href="../register.jsp" class="btn btn-primary"><i class="fa-solid fa-user-plus"></i> Register</a>
			
			</c:if>
				 
			</div>
		</div>
	</div>
</div>



<!-- Logout Button trigger modal  Start-->
<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <div class="text-center">
        <h4>Do you want Logout?</h4>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <a href="../LogoutServlet" type="button" class="btn btn-primary">Logout</a>
       </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>

<!-- Logout Button trigger modal End-->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
		<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link" href="home.jsp"><i class="fa-solid fa-house-user"></i> Home
					<span class="sr-only">(current)</span>
			</a></li>
			
			
		
	</div>
	
</nav>


