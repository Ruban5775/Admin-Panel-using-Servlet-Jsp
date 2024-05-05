<html>
<head>

	<title>Home</title>
	<link rel="stylesheet" href="style.css">
</head>
<body>
	<div class="pagetop">
		<h3 ><span>Mail: </span> example@gmail.com</h3>
		<marquee behavior="slow" direction="right">Anything</marquee>
		<h4><span>Phone: </span> 000000000000</h4>
	</div> <br>
 
    <div class="Home">
      <div>
        <header>
           
            <nav class="home-navi">
                <img src="images/logo.png" alt="Logo">
                <h3>Administration</h3>
                <ul>
                    <li>
                        <a href="#">Home</a>
                        <a href="Orderform.jsp">Orderform</a>
                        <a href="Loginform.jsp">Admin</a>
                    </li>
                </ul>
            </nav>
         </header> 
     </div> 
<div class="home-details">
        <h2>Administration Page</h2>
     </div><br>

     <div class="home-carousel">
        <div class="mySlides fade">
            <img src="images/adminbg3.jpg"  alt="starting" style="width: 100%;">
        </div>

        <div class="mySlides fade">
            <img src="images/adminbg2.jpg" alt="working" style="width: 100%;">
        </div>
        <div class="mySlides fade">
            <img src="images/adminbg4.jpg" alt="admin" style="width: 100%;">
        </div>
        <div class="mySlides fade">
            <img src="images/adminbg5.png" alt="admin page" style="width: 100%;">
        </div>


     </div><br>
     <div style="text-align:center; position: absolute;">
        <span class="dot"></span> 
        <span class="dot"></span> 
        <span class="dot"></span> 
      </div><br>
      <div class="subscription">
        <form action="suscribe" class="subs-form" autocomplete="off">
            <label for="Subscribe">Subscribe: </label>
            <input type="email" name="submail" required>
            <button type="submit">Send</button>
        </form>
      </div>

 </div> <br>
<div style="background-color: gray; margin-top: -20px; width: 1350px; margin-left: -10px;">
 <section class="get-into">
        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3908.601449403354!2d78.0451803744077!3d11.580402943851352!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3babe4437b451d87%3A0x4987a575cbd31529!2sAnnapoorana%20Engineering%20College!5e0!3m2!1sen!2sin!4v1712880597360!5m2!1sen!2sin" width="600px" height="400px" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade" ></iframe>
        </div>

        <aside class="contact">
            <h3>Get Into Touch</h3> 
            <h4>Administration</h4>
            <ul class="admin-info">
                
                <li>Admin : <span>#####</span></li>
                <li>Email  : <span class="mail">example@gmil.com</span></li>
                <li>Phone : <span>9999999999</span></li>
                <li>Address : <span>Current <Address></Address></span></li>
            </ul>
            <div class="contact-form">
                <h2>Contact</h2>
                <form action="Message" class="contact-details">
                    <label for="Name">Name: </label>
                    <input type="text" name="contact-name"required >
                    <label for="Email">Email: </label>
                    <input type="email" name="contact-email" required> <br>
                    <label class="msg-label" for="Message">Message: </label>
                    <input type="text" name="contact-msg" class="msg-input" required > <br> <br>
                    <button type="submit">Send</button>
                </form>

            </div>
        </aside>
 </section> <br><br> <br><br><br> 
</div>
 <div style="margin-top: 10px;">
    <%@ include file="footer.jsp" %>
 </div>


</body>
<script>
    let slideIndex = 0;
    showSlides();

    function showSlides() {
        let i;
        let slides = document.getElementsByClassName("mySlides");
        let dots = document.getElementsByClassName("dot");

        for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";
        }
        slideIndex++;

        if(slideIndex > slides.length) {
            slideIndex = 1
        }
        
        slides[slideIndex-1].style.display = "block";  
        setTimeout(showSlides, 3000);
    }
</script>
</html>