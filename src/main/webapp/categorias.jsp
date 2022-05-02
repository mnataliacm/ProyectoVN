<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>

<%--
    Author     : Natalia Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Gestión Usuarios</title>
  <link rel="shortcut icon" href="images/icons/logo.ico" type="image/x-icon">
  <!-- CSS bootstrap -->
  <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous">
  <!-- ICONOS bootstrap -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css">
  <!-- CSS mio -->
  <link rel="stylesheet" href="./style/style.css">
  <!-- javascript para reutilizar navbar -->
  <script src="https://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<div id="wrapper" class="container-flex">
  <!--Barra navegacion-->
  <div id="nav-placeholder"></div>
  <%-- enlace con la base de datos --%>
  <% // TODO: 01/05/2022 Intentar conectar con JDBC
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/proyectovn", "root", "root");
    request.setCharacterEncoding("UTF-8");
    Statement s = con.createStatement();

    ResultSet listado = s.executeQuery("SELECT * FROM categoria");
  %>

  <div id="container" class="container-flex text-center m-auto p-5 d-flex h-auto">
    <div class="row row-cols-1 row-cols-md-2 row-cols-xl-auto m-auto">

      <div class="col m-auto p-2">
      <div class="card" style="width: 18rem;">
        <img src="images/icons/icon-museum-25.png" class="card-img-top" alt="logo VN">
        <div class="card-body">
          <h5 class="card-title">Exposición</h5>
          <p class="card-text"></p>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">An item</li>
          <li class="list-group-item">A second item</li>
          <li class="list-group-item">A third item</li>
        </ul>
        <div class="card-body">
          <a href="#" class="card-link">Card link</a>
          <a href="#" class="card-link">Another link</a>
        </div>
      </div>
    </div> <!-- fin de col 1-->
    <div class="col m-auto p-2">
      <div class="card" style="width: 18rem;">
        <img src="images/icons/ciudad.png" class="card-img-top" alt="logo VN">
        <div class="card-body">
          <h5 class="card-title">Turismo</h5>
          <p class="card-text"></p>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">An item</li>
          <li class="list-group-item">A second item</li>
          <li class="list-group-item">A third item</li>
        </ul>
        <div class="card-body">
          <a href="#" class="card-link">Card link</a>
          <a href="#" class="card-link">Another link</a>
        </div>
      </div>
    </div> <!-- fin de col 2-->
    <div class="col m-auto p-2">
      <div class="card" style="width: 18rem;">
        <img src="images/icons/zapatilla.png" class="card-img-top" alt="logo VN">
        <div class="card-body">
          <h5 class="card-title">Deporte</h5>
          <p class="card-text"></p>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">An item</li>
          <li class="list-group-item">A second item</li>
          <li class="list-group-item">A third item</li>
        </ul>
        <div class="card-body">
          <a href="#" class="card-link">Card link</a>
          <a href="#" class="card-link">Another link</a>
        </div>
      </div>
    </div> <!-- fin de col 3-->
    <div class="col m-auto p-2">
      <div class="card" style="width: 18rem;">
        <img src="images/icons/location-icon.png" class="card-img-top" alt="logo VN">
        <div class="card-body">
          <h5 class="card-title">Visitar</h5>
          <p class="card-text"></p>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">An item</li>
          <li class="list-group-item">A second item</li>
          <li class="list-group-item">A third item</li>
        </ul>
        <div class="card-body">
          <a href="#" class="card-link">Card link</a>
          <a href="#" class="card-link">Another link</a>
        </div>
      </div>
    </div> <!-- fin de col 4-->
    <div class="col m-auto p-2">
      <div class="card" style="width: 18rem;">
        <img src="images/icons/mono-gnome-question.png" class="card-img-top" alt="logo VN">
        <div class="card-body">
          <h5 class="card-title">Entretenimiento</h5>
          <p class="card-text"></p>
        </div>
        <ul class="list-group list-group-flush">
          <li class="list-group-item">An item</li>
          <li class="list-group-item">A second item</li>
          <li class="list-group-item">A third item</li>
        </ul>
        <div class="card-body">
          <a href="#" class="card-link">Card link</a>
          <a href="#" class="card-link">Another link</a>
        </div>
      </div>
    </div> <!-- fin de col 5-->

  </div> <!-- fin del row -->
</div> <!-- fin container -->
</div> <!-- fin wrapper -->
<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS mio -->
<script src="javascript/javascript.js"></script>
</body>
</html>