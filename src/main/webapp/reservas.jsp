<%@ page import="edu.fpdual.proyectovn.controller.ReservaController" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.ReservasManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Reservas" %>
<%@ page import="java.sql.SQLException" %>

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
  <link rel="stylesheet" href="./style/style.css">
  <!-- javascript para reutilizar navbar -->
  <script src="https://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<div id="wrapper" class="container-flex">
  <!--Barra navegacion-->
  <div id="nav-placeholder"></div>
  <%
    int total;
    if ((session.getAttribute("usuario") != null) && (session.getAttribute("usuario").equals("Admin"))) {
      ReservaController reservaController = new ReservaController(new ReservasManagerImpl());
      try {
        total = reservaController.todasReservas().size();
      } catch (SQLException | ClassNotFoundException e) {
        throw new RuntimeException(e);
      }
  %>
  <div class="container mt-3 text-center">
    <div class="panel panel-light">
      <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE RESERVAS (<%=total %>)</h2>
      <table class="table table-striped table-verde ">
        <tr class="table-dark">
          <th>ID</th>
          <th>Usuario</th>
          <th>Actividad</th>
          <th>Hora</th>
          <th>Fecha</th>
        </tr>
        <%
          try {
            for (Reservas e : reservaController.todasReservas()) {
        %>
        <tr>
          <td><%=e.getIdres()%>
          </td>
          <td><%=e.getIdUsu()%>
          </td>
          <td><%=e.getIdAct()%>
          </td>
          <td><%=e.getHora()%>
          </td>
          <td><%=e.getFecha()%>
          </td>
        </tr>
        <%
              }
            } catch (SQLException | ClassNotFoundException e) {
              throw new RuntimeException(e);
            }
          } else {
            response.sendRedirect("index.jsp");
          }
        %>
      </table>
    </div>
  </div> <!-- cierre container lista -->
</div> <!-- fin wrapper -->
<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS mio -->
<script src="javascript/javascript.js"></script>
</body>
</html>
