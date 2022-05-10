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
    <title>Perfil</title>
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
    <div id="wraper" class="container-fluid">

      <!--Barra navegacion-->
      <div id="nav-placeholder"></div>

      <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/mijardin","root", "");
        Statement s = conexion.createStatement();
        Statement p = conexion.createStatement();

        String nombre = (String) session.getAttribute("usuario");
        String user = nombre.toUpperCase().charAt(0) + nombre.substring(1, nombre.length()).toLowerCase();

        ResultSet info = s.executeQuery("SELECT * FROM usuarios WHERE usuario LIKE ('" + nombre + "')");
        info.next();

        int conteo = 0;
        ResultSet numPlantas = p.executeQuery("SELECT codpla"
                + " FROM jardin j "
                + " INNER JOIN usuarios u ON j.codusu = u.codusu "
                + " WHERE u.usuario LIKE ('" + nombre + "')" 
                + " GROUP BY codpla");
        
        while (numPlantas.next()) {
          conteo++;
        }
        
             
        if (session.getAttribute("usuario") == null) {
          session.setAttribute("error", "Debe iniciar sesión para acceder a la página de perfil.");
          response.sendRedirect("formularioLogin.jsp");
        } 
          
      %> 

      <div class="container border-danger">
        <div class=" panel mt-5">
          <h1 class="panel-heading text-center bg-indigo text-white">Perfil de <%=user %></h1>       
        </div> 
        <div class="container">
          <table>
            <tr>            
              <td>
                <!-- ajuste de imagen -->             
                <div class="container">
                  <div class="row">
                    <div class="col-lg-6 m-auto">
                      <img src="./imagenes/avatar.png" 
                           class="img-fluid  mt-5" alt="avatar persona">
                    </div>
                  </div>
                </div> 
              </td>
              <td>
                <div class="container mt-5">
                  <div class="row">
                    <div class="col m-auto"></div> 
                    <div class="card m-5 bg-turquesa">
                      <h5 class="card-header text-center"><%=user %></h5>
                      <div class="card-body bg-tostado ">
                        <ul class="list-group list-group-flush">
                          <li class="list-group-item">Email: <%=info.getString("email") %> </li>
                          <li class="list-group-item"> </li>
                          <li class="list-group-item">Tienes: <%=conteo %> plantas en tu jardin.</li>
                        </ul>
                      </div>
                      <div class="card-footer text-center">
                        <a href="tuJardin.jsp" class="btn btn-primary">Tu Jardín</a>
                      </div>
                    </div>
                  </div>  
                </div>
              </td>
            </tr>  
          </table>
        </div>
      </div>
    </div> <!-- fin wraper -->

    <!-- JS bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
    crossorigin="anonymous"></script>  
    <!-- JS mio -->
    <script src="./js/javascript.js"></script> 
  </body>
</html>