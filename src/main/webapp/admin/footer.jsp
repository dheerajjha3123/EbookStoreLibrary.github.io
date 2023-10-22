<style>

body {
        font-family: 'Signika', sans-serif;
     }
     .bg-grey {
        background: #607d8b;
     }
     .logo-footer {
        margin-bottom: 40px;
     }
     footer {
            color: #ffffff;
            font-weight: bold;
     }
     footer p, a {
    font-size: 12px;
    font-family: 'Roboto', sans-serif;
}
footer h6 {
    font-family: 'Playfair Display', serif;
    margin-bottom: 40px;
    position: relative;
}
footer h6:after {
    position: absolute;
    content: "";
    background: #0a0a0a;
    width: 12%;
    height: 1px;
    left: 0;
    bottom: -20px;
}
     .btn-footer {
                 color: #cfd470;
              
                text-decoration: none;
                border: 1px solid;
                border-radius: 43px;
                font-size: 13px;
                padding: 7px 30px;
                line-height: 47px;
     }
     .btn-footer:hover {
                
                text-decoration: none;
               
     }
    .form-footer input[type="text"] {
        border: none;
    border-radius: 16px 0 0 16px;
    outline: none;
    padding-left: 10px;
    
}
::placeholder {
    font-size: 10px;
    padding-left: 10px;
    font-style: italic;
}
 .form-footer input[type="button"] {
    border: none;
    background:#232323;
        margin-left: -5px;
    color: #fff;
    outline: none;
    border-radius: 0 16px 16px 0;
    padding: 2px 12px;
}
     .social .fa {
    color: #0a0a0a;
    font-weight:bold;
    font-size: 22px;
    padding: 10px 15px;
    background: #3c3c3c;
}
     footer ul li {
    list-style: none;
    display: block;
}
  footer ul  {
   padding-left: 0;
}
footer ul  li a{
  text-decoration: none;
  color: #0a0a0a;
  font-weight:bold;
  text-decoration:none;
}
a:hover {
    text-decoration: none;
    color: #f5f5f5 !important;
    
}
.logo-part {
    border-right: 1px solid white;
    height: 100%;
    }

</style>

<body>


</body>
<footer class="container-fluid bg-grey py-5">
<div class="container">
   <div class="row">
      <div class="col-md-6">
         <div class="row">
            <div class="col-md-6 ">
               <div class="logo-part">
                  <img src="img/ebk2.jpg" class="w-50 logo-footer" >
                  <p>B-68 Sector-15, Noida Gautam Buddha Nagar(U.P)</p>
                  <p>Welcome to the Library Store, your one-stop shop for all your book-related needs. We offer a wide selection of books, e-books, and more. Explore the world of literature with us.</p>
               </div>
            </div>
            <div class="col-md-6 px-4">
               <h6> About Store</h6>
               <p>The Library Store has been serving book enthusiasts for over a decade, providing quality books and exceptional customer service. We are passionate about helping you discover your next favorite book.</p>
               <a href="#" class="btn-footer"> More Info </a><br>
               <a href="helpline.jsp" class="btn-footer"> Contact Us</a>
            </div>
         </div>
      </div>
      <div class="col-md-6">
         <div class="row">
            <div class="col-md-6 px-4">
               <h6> Help us</h6>
               <div class="row ">
                  <div class="col-md-6">
                     <ul>
                        <li> <a href="..index.jsp"> Home</a> </li>
                        <li> <a href="#"> About</a> </li>
                        <li> <a href="#"> Service</a> </li>
                        <li> <a href="#"> Team</a> </li>
                        <li> <a href="#"> Help</a> </li>
                       
                     </ul>
                  </div>
                  <div class="col-md-6 px-4">
                     <ul>
                        <li> <a href="#"> E-Books</a> </li>
                        <li> <a href="#"> New Books</a> </li>
                        <li> <a href="#"> Recent Books</a> </li>
                        <li> <a href="#"> Old Books</a> </li>
                        <li> <a href="#"> Term</a> </li>
                        <li> <a href="#"> Policy</a> </li>
                     </ul>
                  </div>
               </div>
            </div>
            <div class="col-md-6 ">
               <h6> Newsletter</h6>
               <div class="social">
                  <a href="#"><i class="fa-brands fa-facebook fa-2x p-2" ></i></a>
                  <a href="#"><i class="fa-brands fa-instagram fa-2x p-2"></i></a>
                   <a href="#"><i class="fa-brands fa-twitter fa-2x p-2"></i></a>
               </div>
               <form class="form-footer my-3">
                  <input type="text"  placeholder="search here...." name="search">
                  <input type="button" value="Go" >
               </form>
               <p>That's technology limitation of eBooks</p>
            </div>
            <h5 class="custom-h5">&copy; Copyright Designed and Developed by Dheeraj Jha</h5>
         </div>
      </div>
   </div>
</div>

</footer>
</body>