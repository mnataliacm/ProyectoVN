<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.client.ReservasClient" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Reservas" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.util.LinkedHashSet" %>
<%--
    Author     : Natalia Castillo
    Author     : Verónica González
--%>
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
    if ((session.getAttribute("usuario") != null) && (session.getAttribute("usuario").equals("Admin"))) {
      ReservasClient reservasClient = new ReservasClient();
      int total = new ReservasClient().todos().size();
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
          Set<Reservas> reservas = reservasClient.todos()
                  .stream().sorted(Comparator.comparing(Reservas::getIdRes))
                  .collect(Collectors.toCollection(LinkedHashSet::new));
          for (Reservas r : reservas) {
        %>
        <tr>
          <td><%=r.getIdRes()%>
          </td>
          <td><%=r.getIdUsu()%>
          </td>
          <td><%=r.getIdAct()%>
          </td>
          <td><%=r.getHora()%>
          </td>
          <td><%=r.getFecha()%>
          </td>
        </tr>
        <!-- modificar -->
        <td>
          <div class="row">
            <%--borrar--%>
            <div class="col-6">
              <form method="post" action="registrosBorrar.jsp">
                <input type="hidden" name="IDres" value="<%=r.getIdRes() %>"/>
                <button type="submit" class="btn btn-danger"><span class="bi bi-trash-fill"></span>
                  Borrar
                </button>
              </form>
            </div>
          </div>
        </td>
        <%
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
