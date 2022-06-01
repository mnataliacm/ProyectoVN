<%@page contentType="text/html; charser=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>VayaplaN</title>
  <link rel="shortcut icon" href="images/icons/favicon2.ico" type="image/x-icon">
  <!-- CSS bootstrap -->
  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
  <!-- ICONOS bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  <!-- CSS mio -->
  <link rel="stylesheet" href="style/style.css">
  <!-- javascript para reutilizar navbar -->
  <script src="https://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<!-- fondo que lleva a iniciar sesion -->
<div class="container-flex position-relative">
  <img src="images/marco1.png" class="img-flex vh-100 w-100" role="button" alt="marco">
  <a href="formularioLogin.jsp">

<div id="wrapper" class="container-fluid position-absolute top-50 start-50 translate-middle">
  <!-- Card de bienvenida -->
  <div id="entrada" class="container align-items-center mt-5 w-50">
    <div class="card text-center bg-turquesa">
      <img src="images/LogoMorado.png"
           class="img-fluid m-auto w-25" alt="logo vaya plan">
      <div class="card-header fs-1 fw-bold bg-turquesa">
        <h3 class="text-morado">Disfruta de tu tiempo libre</h3>
      </div>
      <div class="card-body bg-white">
        <i class="fa fa-pagelines fs-5" aria-hidden="true"></i>
        <h5 class="card-title">Alejate de las pantallas y haz algo diferente</h5>
        <p class="card-text">Entra y podrás ver todo lo que te proponemos</p>
        <p class="card-text">Registrate y podrás reservar, obtener descuentos, ...</p>
      </div>
    </div>
  </div>
  <!-- imagen de entrada -->
  <div class="container">
    <div class="container-flex">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <img src="images/cenefa.png"
               class="img-fluid  mt-5" alt="cenefa">
        </div>
      </div>
    </div>
  </div>
</div><!-- fin wrapper -->
  </a>
</div>

<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS mio -->
<script src="javascript/javascript.js"></script>
</body>
</html>
