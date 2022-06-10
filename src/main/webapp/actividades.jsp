<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="edu.fpdual.proyectovn.client.ActividadClient" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Actividad" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Ciudad" %>
<%@ page import="edu.fpdual.proyectovn.client.CiudadClient" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Categoria" %>
<%@ page import="edu.fpdual.proyectovn.client.CategoriaClient" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Empresa" %>
<%@ page import="edu.fpdual.proyectovn.client.EmpresaClient" %>
<%--
    Author     : Natalia Castillo
    Author     : Verónica González
--%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Gestión Actividades</title>
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
  <link rel="stylesheet" href="style/style.css">
  <!-- javascript para reutilizar navbar -->
  <script src="https://code.jquery.com/jquery.min.js"></script>
  <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
</head>
<body class="bg-fondo">
<div id="wrapper" class="container-flex">
  <!--Barra navegacion-->
  <div id="nav-placeholder"></div>
  <%
    ActividadClient actividadClient = new ActividadClient();
    CiudadClient ciudadClient = new CiudadClient();
    CategoriaClient categoriaClient = new CategoriaClient();
    EmpresaClient empresaClient = new EmpresaClient();
    int total = new ActividadClient().todos().size();
    Ciudad ciudad;
    Categoria categoria;
    if (session.getAttribute("usuario") == null) {
  %>
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde"> LISTADO DE ACTIVIDADES (<%=total %>) </h2>
      <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
          <label for="search"></label>
          <input type="search" id="search" value="" class="form-control" placeholder="buscador ...">
        </div>
        <div class="row">
      <table class="table table-striped table-verde">
        <thead>
        <tr class="table-dark">
          <th>ID</th>
          <th>Categoría</th>
          <th>Ciudad</th>
          <th>Actividad</th>
          <th>Horario</th>
          <th>Información</th>
        </tr>
        </thead>
          <%
            Set<Actividad> listado = actividadClient.todos()
                .stream().sorted(Comparator.comparing(Actividad::getId))
                .collect(Collectors.toCollection(LinkedHashSet::new));
            for (Actividad a : listado) {
              ciudad = ciudadClient.buscaPorID(a.getIdciu());
              categoria = categoriaClient.buscaPorID(a.getIdcat());
        %>
        <tbody>
        <tr>
          <td><%=a.getId()%>
          </td>
          <td><%=categoria.getNom()%>
          </td>
          <td><%=ciudad.getNom()%>
          </td>
          <td><%=a.getNom()%>
          </td>
          <td><%=a.getHorario()%>
          </td>
          <td><%=a.getInfo()%>
          </td>
        </tr>
        </tbody>
        </div>
    </div>
    </div>
  </div>
  <%
    }
  } else if ((session.getAttribute("usuario") != null) && (session.getAttribute("usuario").equals("Admin"))) {
  %>
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde"> LISTADO DE ACTIVIDADES (<%=total %>)</h2>
      <table class="table table-striped table-verde">
        <form method="post" action="registrosNuevos.jsp">
          <tr class="table-warning">
            <td><label for="IDact"></label>
              <input type="hidden" id="IDact" name="IDact" size="1" placeholder="<%=total + 1%>" readonly>
            </td>
            <td><label for="IDciu" class="form-label"></label>
              <select class="form-select" name="IDciu" aria-label="Default select example" id="IDciu">
                <option value="1" selected>Ciudad</option>
                <%
                  Set<Ciudad> ciudadSet =  ciudadClient.todos()
                      .stream().sorted(Comparator.comparing(Ciudad::getNom))
                      .collect(Collectors.toCollection(LinkedHashSet::new));;
                  for (Ciudad ci : ciudadSet) {
                %>
                <option value="<%=ci.getId() %>"> <%=ci.getNom() %> </option>
                <%
                  }
                %>
              </select>
            </td>
            <td><label for="IDcat" class="form-label"></label>
              <select class="form-select" name="IDcat" aria-label="Default select example" id="IDcat">
                <option value="1" selected>Categ.</option>
                <%
                  Set<Categoria> categoriaSet =  categoriaClient.todos()
                      .stream().sorted(Comparator.comparing(Categoria::getNom))
                      .collect(Collectors.toCollection(LinkedHashSet::new));
                  for (Categoria ca : categoriaSet) {
                %>
                <option value="<%=ca.getId() %>"> <%=ca.getNom() %> </option>
                <%
                  }
                %>
              </select>
          </td>
            <td><label for="NomAct"> </label>
              <input type="text" id="NomAct" name="NomAct" size="25" placeholder="Nombre de la Actividad" required>
           </td>
            <td><label for="IDemp" class="form-label"></label>
              <select class="form-select" name="IDemp" aria-label="Default select example" id="IDemp">
                <option value="1" selected>Empresa</option>
                <%-- // TODO: 11/06/2022 DESCOMENTAR cuando vaya empresa
                  Set<Empresa> empresaSet =  empresaClient.todos()
                  .stream().sorted(Comparator.comparing(Empresa::getNom))
              .collect(Collectors.toCollection(LinkedHashSet::new));
                  for (Empresa e : empresaSet) {
                %>
                <option value="<%=e.getId() %>"> <%=e.getNom() %> </option>
                <%
                  }
                --%>
              </select>
            </td>
            <td><label for="horario"> </label>
              <input type="text" id="horario" name="Horario" placeholder="Horario" size="25">
           </td>
            <td><label for="info"></label>
              <input type="text" id="info" name="Info" placeholder="Información" size="25">
            </td>
            <td>
              <button type="submit" value="Añadir" class="btn btn-primary"><span
                  class="bi bi-plus-circle"></span>
              </button>
            </td>
          </tr>
        </form>
      </table>
      <table class="table table-striped table-verde ">
        <tr class="table-dark">
          <th>ID</th>
          <th>Categoría</th>
          <th>Ciudad</th>
          <th>Actividad</th>
          <th>Empresa</th>
          <th>Horario</th>
          <th>Información</th>
        </tr>
          <%
          Set<Actividad> listado = actividadClient.todos()
              .stream().sorted(Comparator.comparing(Actividad::getId))
              .collect(Collectors.toCollection(LinkedHashSet::new));
          for (Actividad a : listado) {
            ciudad = ciudadClient.buscaPorID(a.getIdciu());
            categoria = categoriaClient.buscaPorID(a.getIdcat());
        %>
        <tr>
          <td><%=a.getId()%>
          </td>
          <td><%=categoria.getNom()%>
          </td>
          <td><%=ciudad.getNom()%>
          </td>
          <td><%=a.getNom()%>
          </td>
          <td><%=a.getIdemp()%>
          </td>
          <td><%=a.getHorario()%>
          </td>
          <td><%=a.getInfo()%>
          </td>
          <!-- modificar -->
          <td>
            <div class="row">
              <div class="col-6 ">
                <form method="post" action="formularioActividad.jsp">
                  <input type="hidden" name="IDact" value="<%=a.getId() %>">
                  <input type="hidden" name="IDcat" value="<%=a.getIdcat() %>">
                  <input type="hidden" name="IDciu" value="<%=a.getIdciu() %>">
                  <input type="hidden" name="NomAct" value="<%=a.getNom() %>">
                  <input type="hidden" name="IDemp" value="<%=a.getIdemp() %>">
                  <input type="hidden" name="Horario" value="<%=a.getHorario() %>">
                  <input type="hidden" name="Info" value="<%=a.getInfo() %>">
                  <button type="submit" class="btn btn-info"><span class="bi bi-pencil-fill"> </span> Editar
                  </button>
                </form>
              </div>
              <%--borrar--%>
              <div class="col-6">
                <form method="post" action="registrosBorrar.jsp">
                  <input type="hidden" name="IDact" value="<%=a.getId() %>"/>
                  <button type="submit" class="btn btn-danger"><span class="bi bi-trash-fill"></span> Borrar
                  </button>
                </form>
              </div>
            </div>
          </td>
        </tr>
    </div>
  </div>
  <%
    }
  } else if (session.getAttribute("usuario") != null) {
  %>
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde">LISTADO DE ACTIVIDADES</h2>
      <table class="table table-striped table-verde ">
        <tr class="table-dark">
          <th>ID</th>
          <th>Categoría</th>
          <th>Ciudad</th>
          <th>Actividad</th>
          <th>Horario</th>
          <th>Información</th>
        </tr>
        <%
          Set<Actividad> listado = actividadClient.todos()
              .stream().sorted(Comparator.comparing(Actividad::getId))
              .collect(Collectors.toCollection(LinkedHashSet::new));
          for (Actividad a : listado) {
            ciudad = ciudadClient.buscaPorID(a.getIdciu());
            categoria = categoriaClient.buscaPorID(a.getIdcat());
        %>
        <tr>
          <td><%=a.getId()%>
          </td>
          <td><%=categoria.getNom()%>
          </td>
          <td><%=ciudad.getNom()%>
          </td>
          <td><%=a.getNom()%>
          </td>
          <td><%=a.getHorario()%>
          </td>
          <td><%=a.getInfo()%>
          </td>
          <!-- añadir calendario o a reservas ?? -->
          <td>
            <form method="post" action="">
              <input type="hidden" name="IDact" value="<%=a.getId() %>">
              <input type="hidden" name="IDciu" value="<%=a.getIdciu() %>">
              <input type="hidden" name="NomAct" value="<%=a.getNom() %>">
              <button type="submit" class="btn btn-info"><span class="bi bi-plus-circle"> Reservar</span>
              </button>
            </form>
              <%
        }
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
<!-- buscador -->
<script src="//rawgithub.com/stidges/jquery-searchable/master/dist/jquery.searchable-1.0.0.min.js"></script>
</body>
</html>


