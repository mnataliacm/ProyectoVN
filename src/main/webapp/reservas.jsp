<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Reservas" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="edu.fpdual.proyectovn.client.*" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Actividad" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Usuario" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Categoria" %>
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
      ActividadClient actividadClient = new ActividadClient();
      UsuarioClient usuarioClient = new UsuarioClient();
      Actividad actividad;
      Usuario usuario;
      ReservasClient reservasClient = new ReservasClient();
  %>
  <div class="container mt-3 text-center">
    <div class="panel panel-light">
      <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE RESERVAS </h2>
      <table class="table table-striped table-verde ">
        <form method="post" action="registrosNuevos.jsp">
          <tr class="table-warning">
            <td><label for="IDres"></label>
              <input type="hidden" id="IDres" name="IDres" size="1" readonly>
            </td>
            <td><label for="IDusu" class="form-label"></label>
              <select class="form-select" name="IDusu" aria-label="Default select example" id="IDusu">
                <option value="1" selected>Usuario</option>
                <%
                  Set<Usuario> usuarioSet =  usuarioClient.todos()
                          .stream().sorted(Comparator.comparing(Usuario::getNom))
                          .collect(Collectors.toCollection(LinkedHashSet::new));
                  for (Usuario u : usuarioSet) {
                %>
                <option value="<%=u.getId() %>"> <%=u.getNom() %> </option>
                <%
                  }
                %>
              </select>
            </td>
            <td><label for="IDact" class="form-label"></label>
              <select class="form-select" name="IDact" aria-label="Default select example" id="IDact">
                <option value="1" selected>Actividad</option>
                <%
                  Set<Actividad> actividadSet =  actividadClient.todos()
                          .stream().sorted(Comparator.comparing(Actividad::getNom))
                          .collect(Collectors.toCollection(LinkedHashSet::new));;
                  for (Actividad a : actividadSet) {
                %>
                <option value="<%=a.getId() %>"> <%=a.getNom() %> </option>
                <%
                  }
                %>
              </select>
            </td>


            <td><label for="Hora"> </label>
              <input type="time" id="Hora" name="Hora" size="25" placeholder="hora" required>
            </td>
            <td><label for="Fecha"> </label>
              <input type="date" id="Fecha" name="Hora" size="25" placeholder="fecha" required>
            </td>
            <td>
              <button type="submit" value="Añadir" class="btn btn-primary"><span
                      class="bi bi-plus-circle"></span>
              </button>
            </td>
          </tr>
        </form>
        <tr class="table-dark">
          <th>ID</th>
          <th>Usuario</th>
          <th>Actividad</th>
          <th>Hora</th>
          <th>Fecha</th>
        </tr>
        <%
          Set<Reservas> listado = reservasClient.todos()
                  .stream().sorted(Comparator.comparing(Reservas::getIdRes))
                  .collect(Collectors.toCollection(LinkedHashSet::new));
          for (Reservas r : listado) {
            usuario = usuarioClient.buscaPorID(r.getIdUsu());
            actividad = actividadClient.buscaPorID(r.getIdAct());
        %>
        <tr>
          <td><%=r.getIdRes()%>
          </td>
          <td><%=usuario.getNom()%>
          </td>
          <td><%=actividad.getNom()%>
          </td>
          <td><%=r.getHora()%>
          </td>
          <td><%=r.getFecha()%>
          </td>
        </tr>
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
