<%@ page import="edu.fpdual.proyectovn.jdbc.connector.Connector" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.manager.enumeration.CiudadEnum" %>

<%--
    Author     : Natalia Castillo
    Author     : Verónica González
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
  // TODO: 01/05/2022 Intentar conectar con JDBC

  <%-- enlace con la base de datos --%>
  <%
    Connector connector = new Connector();
    Connection con = connector.getConnection();
    // TODO: 03/05/2022 cambiar cuando hayamos creado dao y cya
    Statement s = con.createStatement();
    request.setCharacterEncoding("UTF-8");
    ResultSet sub = null;
    try {
      sub = s.executeQuery("SELECT c.NomCat FROM categoria c "
          + " INNER JOIN subcategoria s ON s.IDcat = s.IDcat"
          + " INNER JOIN actividad a ON s.IDsub = a.IDsub"
          + " INNER JOIN ciudad ci ON a.IDciu = ci.IDciu"
          + " WHERE ci.NomCiu LIKE " + session.getAttribute(ciudad));
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  %>

  <div id="container" class="container-flex text-center m-auto p-5 d-flex h-auto">
    <div class="row row-cols-1 row-cols-md-2 row-cols-xl-auto m-auto">

      <%
        while (sub.next()) {

        out.println();
        out.println("<div class=\"col m-auto p-2\">");
        out.println("<div class=\"card\" >");
        out.println("<img src=\"images/icons/icon-museum-25.png\" class=\"card-img-top\" alt=\"logo VN\">");
        out.println("<div class=\"card-body\">");
        out.println("<h5 class=\"card-title\">" + sub.getString("NomCat") + "</h5>");
        out.println("<p class=\"card-text\"></p>");
        out.println("</div>");
        out.println("<ul class=\"list-group list-group-flush\">");
        out.println("<li class=\"list-group-item\">Ciudad elegida</li>");
        out.println("<li class=\"list-group-item\">"+ session.getAttribute("ciudad") + "</li>");
        out.println("<li class=\"list-group-item\"></li>");
        out.println("</ul>");
        out.println("<div class=\"card-body\">");
        out.println("<a href=\"subcategoria.jsp\" class=\"card-link\">Actividades</a>");
        out.println("</div>");
        out.println("</div>");
        out.println("</div>");
    }
    %>

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