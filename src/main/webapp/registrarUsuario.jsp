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
    <title>Confirmación</title>
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
  </head>
  <body>

    <%-- enlace con la base de datos --%>
    <%
      Class.forName("com.mysql.jdbc.Driver");
      Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mijardin","root", "");
      Statement s = conexion.createStatement();

      request.setCharacterEncoding("UTF-8");
      
      // Comprueba la existencia del número de socio introducido
      String nUsuarios = "SELECT * FROM usuarios WHERE usuario= '"
                       + request.getParameter("usuario") + "'";      
      
      ResultSet user = s.executeQuery (nUsuarios);
      user.last();
        
      String icono;
      String mensaje;
      String enlace;
      String col;
    
      //si ya existe el usuario
      if (user.getRow() != 0) {
        icono = "<i class=\"bi bi-x-circle text-danger fs-1\"></i>";
        mensaje = "<p>Lo siento, no se ha podido dar de alta, ya existe el usuario: </p>" + "<h5>"
                + request.getParameter("usuario") + "</h5>";
        enlace = "formularioRegistro.jsp";
        col = "btn-lg btn-danger";
      //si todo OK introduzco datos
      } else {     
          String insertar = "INSERT INTO usuarios (usuario, password, email) VALUES ('"
          + request.getParameter("usuario")
          + "', '" + request.getParameter("password")
          + "', '" + request.getParameter("email") + "')";

          s.execute(insertar);
            
          icono = "<i class=\"bi bi-check2-circle text-primary fs-1\"></i>";
          mensaje = "<p>Usuario nuevo registrado con exito.</p>";
          enlace = "buscador.jsp";
          col = "btn-lg btn-primary";
      }
       
    %>

    <div id="wraper" class="container-flex vh-100 pt-5"> 
      <div class="container w-25 text-center">
        <div class="row">        
          <div class="col">
            <div class="card bg-verde">
              <div class="card-header">Nuevo Usuario</div>
              <div class="card-body">          
                <%=icono %>
                <%=mensaje %>
              </div>  
              <div class="card-footer">
                <a href=" <%=enlace %>" class="<%=col %>" role="button">Aceptar</a>
              </div>
            </div>
          </div>
        </div>
      </div>
      <!-- imagen -->
      <div class="container">
        <div class="container-flex">
          <div class="row">
            <div class="col-lg-6 m-auto">
              <img src="./imagenes/rosa.png" 
                   class="img-fluid  mt-5" alt="flores moradas">
            </div>
          </div>
        </div>
      </div>        
    </div> <!-- fin del wrapper -->

    <!-- JS bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
            crossorigin="anonymous"></script>  
    <!-- JS mio -->
    <script src="./js/javascript.js"></script> 

  </body>
</html>

