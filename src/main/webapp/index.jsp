<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Inicio</title>
    <link rel="shortcut icon" href="./imagenes/iconoflor.png" type="image/x-icon">
    <!-- CSS bootstrap -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
    <!-- ICONOS bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
    <!-- CSS mio -->
    <link rel="stylesheet" href="./estilo/style.css">
    <!-- javascript para reutilizar navbar -->
    <script src="https://code.jquery.com/jquery-1.10.2.js"></script>
  </head>
  <body class="bg-warning">
    <!-- fondo que lleva a iniciar sesion -->
    <div class="container-flex position-relative">
      <img src="./imagenes/marco.png" class="img-flex vh-100 w-100" role="button" alt="marco con hierba y treboles">
      <a  href="formularioLogin.jsp">
    </div>

    <div id="wrapper" class="container-fluid position-absolute top-50 start-50 translate-middle">
		

      <!-- Card de bienvenida -->          
      <div id="entrada" class="container align-items-center mt-5 w-50">
        <div class="card text-center bg-verde">
          <div class="card-header fs-1 fw-bold">
            Bienvenid@!
          </div>
          <div class="card-body">   
            <i class="fa fa-pagelines fs-5" aria"tr/i>
            <h5 class="card-title">Busca que hacer en tu tiempo libre</h5>
            <p class="card-text">Reserva en Teatro, Exposiciones, Playa, Montaña, EscapeRoom, Paintball<br>
            y reservabusca información sobre Zoos, Museos, Parques de atracciones y acuáticos, etc</p>

          </div> 
        </div>
      </div>

      <!-- imagen de entrada -->
      <div class="container">
        <div class="container-flex">
          <div class="row">
            <div class="col-lg-6 m-auto">
              <img src="./imagenes/rose.png" 
                   class="img-fluid  mt-5" alt="flores moradas">
            </div>
          </div>
        </div>
      </div>
    </div><!-- fin wrapper -->

    <!-- JS bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>  
    <!-- JS mio -->
    <script src="./js/javascript.js"></script> 
  </body>
</html>