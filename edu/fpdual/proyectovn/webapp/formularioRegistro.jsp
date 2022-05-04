<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%-- 
    Author     : Natalia Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Registrar Usuario</title>
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
  <body class="bg-success">
    <div id="wraper" class="container-block h-100">

      <!--Barra navegacion-->
      <div id="nav-placeholder"></div>

      <!-- formulario registro -->
      <div class="container mt-5">
        <div
          class="row  d-flex align-items-center  justify-content-center">
          <div class="col-xs-12 col-md-8 col-lg-6 bg-verde border border-primary">
            <img src="./imagenes/tulips.png" class="img w-100 h-25" alt="tulipanes rojos">
            <h2 class="bg-tostado text-center py-3">Nuevo usuario</h2>
            
            <form method="post" action="registrarUsuario.jsp" class="row g-4 p-3 bg-verde">		
              <div class="col-md-5">
                <label for="usuario" class="form-label">Usuario</label> 
                <input type="text" name="usuario" class="form-control" id="usuario" required>
              </div>
              <div class="col-md-2"></div>
              <div class="col-md-5">
                <label for="password" class="form-label">Contraseña</label> 
                <input type="password" name="password" class="form-control" id="password" required>
                <div id="identificadorlHelp" class="form-text">Entre 4 y 10 caracteres [(a-z)(0-9)]</div>
              </div>
              <div class="col-md-12">
                <label for="email" class="form-label">Email</label> <input
                  type="email" name="email" class="form-control" id="email" placeholder="nombre@correo.com" required>
                <div id="identificadorlHelp" class="form-text">Nunca compartiremos tu email, ni ningún otro dato con nadie.</div>
              </div>
              <div class="col-12 text-center">
                <button type="submit" value="Aceptar" class="btn btn-primary">Registrar</button>
              </div>
            </form>
            
          </div>						<!-- cierre col ppal-->
        </div>				<!-- cierre row -->
      </div>
    </div>		<!-- cierre wraper -->

    <!-- JS bootstrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>  
  <!-- JS mio -->
  <script src="./js/javascript.js"></script>  
  </body>
</html>