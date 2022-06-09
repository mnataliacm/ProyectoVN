<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page import="edu.fpdual.proyectovn.client.ActividadClient" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Actividad" %>
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
</head>
<body class="bg-fondo">
<div id="wrapper" class="container-flex">
  <!--Barra navegacion-->
  <div id="nav-placeholder"></div>
  <%

    ActividadClient actividadClient = new ActividadClient();
    int total = new ActividadClient().todos().size();
    if (session.getAttribute("usuario") == null) {
  %>
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde"> LISTADO DE ACTIVIDADES (<%=total %>)</h2>
      <table class="table table-striped table-verde ">
        <tr class="table-dark">
          <th>ID</th>
          <th>Categ.</th>
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
        %>
        <tr>
          <td><%=a.getId()%>
          </td>
          <td><%=a.getIdcat()%>
          </td>
          <td><%=a.getIdciu()%>
          </td>
          <td><%=a.getNom()%>
          </td>
          <td><%=a.getIdemp()%>
          </td>
          <td><%=a.getHorario()%>
          </td>
          <td><%=a.getInfo()%>
          </td>
        </tr>
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
        <form method="post" action="nuevosRegistros.jsp">
          <tr class="table-warning">
            <td><label for="IDact"></label>
              <input type="text" id="IDact" name="IDact" size="3" placeholder="<%=total + 1%>" readonly>
            </td>
            <td><label for="IDcat"> </label>
              <input type="text" id="IDcat" name="IDcat" size="3" placeholder="Categ." required>
           </td>
            <td><label for="IDciu"> </label>
              <input type="text" id="IDciu" name="IDciu" size="3" placeholder="Ciudad" required>
           </td>
            <td><label for="NomAct"> </label>
              <input type="text" id="NomAct" name="NomAct" size="30" placeholder="Actividad" required>
           </td>
            <td><label for="IDemp"></label>
              <input type="text" id="IDemp" name="IDemp" size="5" placeholder="Empresa" >
            </td>
            <td><label for="horario"> </label>
              <textarea id="horario" name="Horario" rows="1" placeholder="Horario" ></textarea>
           </td>
            <td><label for="info"></label>
              <textarea id="info" name="Info" rows="1" placeholder="Información"></textarea>
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
          <th>Categ.</th>
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
        %>
        <tr>
          <td><%=a.getId()%>
          </td>
          <td><%=a.getIdcat()%>
          </td>
          <td><%=a.getIdciu()%>
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
                <form method="post" action="modificarActividad.jsp">
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
                <form method="post" action="borrarRegistros.jsp">
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
          <th>Categ.</th>
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
        %>
        <tr>
          <td><%=a.getId()%>
          </td>
          <td><%=a.getIdcat()%>
          </td>
          <td><%=a.getIdciu()%>
          </td>
          <td><%=a.getNom()%>
          </td>
          <td><%=a.getIdemp()%>
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
</body>
</html>


