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
    <title>Iniciar sesión</title>
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
  <body>
    <div id="wraper" class="container-fluid pt-5">

      <%
        String user = (String) session.getAttribute("usuario");
        if (session.getAttribute("usuario") != null) {
          if (user.equals("Admin")) {
            response.sendRedirect("usuarios.jsp");
          } else if (user.equals("Colaborador")) {
              response.sendRedirect("buscadorColab.jsp");
          } else {
              response.sendRedirect("tuJardin.jsp");
          }
        }
      %>
      <div class="container mt-5">
        <!-- ventana de logging -->	
        <div class="row  d-flex align-items-center  justify-content-center ">
          <div class="col-xs-12 col-md-8 col-lg-4 bg-verde border border-primary">
            <img src="./imagenes/tulips.png" class="img w-100 h-25" alt="tulipanes rojos">
            <h2 class="bg-tostado text-center py-3">Iniciar sesión</h2>

            <form method="post" action="login.jsp" class="p-3">
              <div class="mb-3">
                <label for="usuario" class="form-label">Usuario</label>
                <input type="text" name="usuario" class="form-control rounded-pill" id="usuario" aria-describedby="identificadorHelp" required>
              </div>
              <div class="mb-3">
                <label for="password" class="form-label">Contraseña</label>
                <input type="password" name="password" class="form-control rounded-pill" id="password" required>
              </div>
              <div class="row m-3">
                <div class="col-12 text-center">
                  <button type="submit" value="Enviar" class="btn btn-primary">Enviar</button>
                </div>   
              </div>
              <div class="card-footer">
                <p>Si no tienes cuenta: </p>
                <div class="row m-3">
                <div class="col-6 text-center">
                  <a role="button" class="btn btn-primary" href="formularioRegistro.jsp" >Regístrate</a>
                </div>
                <div class="col-6 text-center">
                  <a role="button" class="btn btn-primary" href="buscador.jsp" >Ver Plantas</a>
                </div>
                </div>
              </div>

            </form>

            <p class="text-danger">
              <%=
                session.getAttribute("error") == null ?
                        "" : session.getAttribute("error")
              %>
              <% session.removeAttribute("error"); %>
            </p>
          </div>
        </div>
      </div>    
    </div> <!-- fin container ventana -->
  </div> <!-- fin del wrapper -->

  <!-- JS bootstrap -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
          integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
          crossorigin="anonymous"></script>  
  <!-- JS mio -->
  <script src="./js/javascript.js"></script> 
</body>
</html>
