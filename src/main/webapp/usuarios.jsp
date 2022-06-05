<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.UsuarioManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Usuario" %>
<%@ page import="edu.fpdual.proyectovn.controller.UsuarioController" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Comparator" %>
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
    int total = 0;
    if ((session.getAttribute("usuario") != null) && (session.getAttribute("usuario").equals("Admin"))) {
      UsuarioController usuarioController = new UsuarioController(new UsuarioManagerImpl());
      try {
        total = usuarioController.todosUsuarios().size();
      } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
      }
  %>
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE USUARIOS (<%=total%>)</h2>
      <table class="table table-striped table-verde ">
        <tr class="table-dark">
          <th>ID</th>
          <th>Nombre</th>
          <th>Apellido</th>
          <th>Contraseña</th>
          <th>Email</th>
          <th>Móvil</th>
          <th>Ciudad</th>
        </tr>
        <%
          Set<Usuario> listado = usuarioController.todosUsuarios()
              .stream().sorted(Comparator.comparing(Usuario::getId))
              .collect(Collectors.toCollection(LinkedHashSet::new));
          for (Usuario u : listado) {
        %>
        <tr>
          <td><%=u.getId()%>
          </td>
          <td><%=u.getNom()%>
          </td>
          <td><%=u.getApe()%>
          </td>
          <td><%=u.getPass()%>
          </td>
          <td><%=u.getEmail()%>
          </td>
          <td><%=u.getMovil()%>
          </td>
          <td><%=u.getCiu()%>
          </td>
          <!-- modificar -->
          <td>
            <div class="row">
              <div class="col-6 ">
                <form method="post" action="modificarUsuario.jsp">
                  <input type="hidden" name="IDusu" value="<%=u.getId() %>">
                  <input type="hidden" name="NomUsu" value="<%=u.getNom() %>">
                  <input type="hidden" name="ApeUsu" value="<%=u.getApe() %>">
                  <input type="hidden" name="PassUsu" value="<%=u.getPass() %>">
                  <input type="hidden" name="Email" value="<%=u.getEmail() %>">
                  <input type="hidden" name="Movil" value="<%=u.getMovil() %>">
                  <input type="hidden" name="ciudad" value="<%=u.getCiu() %>">
                  <button type="submit" class="btn btn-info"><span class="bi bi-pencil-fill"> </span> Editar</button>
                </form>
              </div>
              <%--borrar--%>
              <div class="col-6">
                <form method="post" action="borrarUsuario.jsp">
                  <input type="hidden" name="IDusu" value="<%=u.getId() %>"/>
                  <button type="submit" class="btn btn-danger"><span class="bi bi-trash-fill"></span> Borrar</button>
                </form>
              </div>
            </div>
          </td>
        </tr>
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
