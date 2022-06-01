<%@ page import="edu.fpdual.proyectovn.model.manager.implement.EmpresaManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.controller.EmpresaController" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Empresa" %>
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
    if ((session.getAttribute("usuario") != null) && (session.getAttribute("usuario").equals("Admin"))) {
      EmpresaController empresaController = new EmpresaController(new EmpresaManagerImpl());
      int total = empresaController.todasEmpresas().size();
  %>
  <!-- listado de plantas     table-responsive-stack table  table-success table-striped -->
  <div class="container mt-3 text-center">
    <div class="panel panel-light">
      <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE EMPRESAS (<%=total %>)</h2>
      <table class="table table-striped table-verde">
        <tr class="table-dark">
          <th>ID</th>
          <th>Nombre</th>
          <th>Ciudad</th>
        </tr>

        <form method="post" action="empresas.jsp">
          <tr class="table-warning">
            <td><input type="text" name="IDemp" size="5" placeholder="<%=total + 1%>" disabled></td>
            <td><input type="text" name="NomEmp" size="60" placeholder="Nombre empresa" required></td>
            <td><input type="text" name="Ciudad" size="10" placeholder="Ciudad" required></td>
            <td>
              <button type="submit" value="Añadir" class="btn btn-primary"><span class="bi bi-plus-circle"></span>
              </button>
            </td>
          </tr>
        </form>
      </table>

      <table class="table table-striped table-verde ">
        <tr class="table-dark">
          <th>ID</th>
          <th>Empresa</th>
          <th>Ciudad</th>
        </tr>

        <%
          for (Empresa e : empresaController.todasEmpresas()) {
        %>
        <tr>
          <td><%=e.getId()%>
          </td>
          <td><%=e.getNom()%>
          </td>
          <!-- modificar -->
          <td>
            <div class="row">
              <div class="col-4 ">
                <form method="post" action="empresas.jsp">
                  <input type="hidden" name="IDemp" value="<%=e.getId()%>">
                  <input type="hidden" name="NomEmp" value="<%=e.getNom()%>">
                  <button type="submit" class="btn btn-info"><span class="bi bi-pencil-fill"> </span> Editar</button>
                </form>
              </div>
              <%--borrar--%>
              <div class="col-4">
                <form method="post" action="empresas.jsp">
                  <input type="hidden" name="IDemp" value="<%=e.getId()%>"/>
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
