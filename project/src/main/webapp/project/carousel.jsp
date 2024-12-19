<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="./carousel.css" />
    <script
      src="https://kit.fontawesome.com/7ab22df35b.js"
      async
      crossorigin="anonymous"
    ></script>
  </head>
  <body>
    <div id="all">
      <div id="slide_show">
        <a href="#"
          ><img src="./media/slide-1.jpg" alt="" class="slide" id="p1"
        /></a>
        <a href="#"
          ><img src="./media/slide-2.jpg" alt="" class="slide" id="p2"
        /></a>
        <a href="#"
          ><img src="./media/slide-3.jpg" alt="" class="slide" id="p3"
        /></a>
        <a href="#"
          ><img src="./media/slide-4.jpg" alt="" class="slide" id="p4" />
        </a>
      </div>
      <i class="fa-solid fa-circle-chevron-left" id="navgateleft"></i>
      <i class="fa-solid fa-circle-chevron-right" id="navgateright"></i>
      <div id="indicator">
        <a href="#" class="active">
          <i class="fa-solid fa-circle-dot"></i>
        </a>
        <a href="#"> <i class="fa-solid fa-circle-dot"></i></a
        ><a href="#"> <i class="fa-solid fa-circle-dot"></i></a
        ><a href="#"> <i class="fa-solid fa-circle-dot"></i></a>
      </div>
      <!-- indicater and -->
    </div>
    <script src="carousel.js"></script>
  <!-- </body>
</html> -->
