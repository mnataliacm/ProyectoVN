<%@ page import="java.sql.Connection" %>
<%@ page import="edu.fpdual.proyectovn.model.connector.Connector" %>
<%@ page import="edu.fpdual.proyectovn.controller.ActividadController" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.ActividadManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Actividad" %>
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
    int total;
    ActividadController actividadController = new ActividadController(new ActividadManagerImpl());
    try {
      total = actividadController.todasActividades().size();
    } catch (SQLException | ClassNotFoundException e) {
      throw new RuntimeException(e);
    }
    if (session.getAttribute("usuario") == null) {
  %>
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde"> LISTADO DE ACTIVIDADES (<%=total %>)</h2>
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
          try {
            for (Actividad a : actividadController.todasActividades()) {
        %>
        <tr>
          <td><%=a.getIdact()%>
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
        <%
            }
          } catch (SQLException | ClassNotFoundException e) {
            throw new RuntimeException(e);
          }
        } else if ((session.getAttribute("usuario") != null) && (session.getAttribute("usuario").equals("Admin"))) {
        %>
        <div class="container mt-3 text-center">
          <div class=" panel panel-light">
            <h2 class="panel-heading text-center bg-verde"> LISTADO DE ACTIVIDADES (<%=total %>)</h2>
            <table class="table table-striped table-verde">
              <form method="post" action="nuevaActividad.jsp">
                <tr class="table-warning">
                  <td><input type="text" name="IDact" size="3" placeholder="<%=total + 1%>" readonly></td>
                  <td><input type="text" name="IDcat" size="3" placeholder="IDcat" required></td>
                  <td><input type="text" name="IDciu" size="3" placeholder="IDciu" required></td>
                  <td><input type="text" name="NomAct" size="30" placeholder="Actividad" required></td>
                  <td><input type="text" name="IDemp" size="5" placeholder="Empresa" required></td>
                  <td><textarea type="text" name="Horario" rows="1" placeholder="Horario" required></textarea></td>
                  <td><textarea type="url" name="Info" rows="1" placeholder="Información" ></textarea></td>
                  <td>
                    <button type="submit" value="Añadir" class="btn btn-primary"><span class="bi bi-plus-circle"></span>
                    </button>
                  </td>
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
              </tr>
              <%
                try {
                  for (Actividad a : actividadController.todasActividades()) {
              %>
              <tr>
                <td><%=a.getIdact()%>
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
              <!-- modificar -->
              <td>
                <div class="row">
                  <div class="col-6 ">
                    <form method="post" action="registrarUsuario.jsp">
                      <input type="hidden" name="IDact" value="<%=a.getIdact() %>">
                      <input type="hidden" name="IDcat" value="<%=a.getIdcat() %>">
                      <input type="hidden" name="IDciu" value="<%=a.getIdciu() %>">
                      <input type="hidden" name="NomAct" value="<%=a.getNom() %>">
                      <input type="hidden" name="IDemp" value="<%=a.getIdemp() %>">
                      <input type="hidden" name="Horario" value="<%=a.getHorario() %>">
                      <input type="hidden" name="Info" value="<%=a.getInfo() %>">
                      <button type="submit" class="btn btn-info"><span class="bi bi-pencil-fill"> </span> Editar</button>
                    </form>
                  </div>
                  <%--borrar--%>
                  <div class="col-6">
                    <form method="post" action="actividades.jsp">
                      <input type="hidden" name="IDact" value="<%=a.getIdact() %>"/>
                      <button type="submit" class="btn btn-danger"><span class="bi bi-trash-fill"></span> Borrar</button>
                    </form>
                  </div>
                </div>
              </td>
            </tr>
            </table>
            <%
                }
              } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
              }
            } else if (session.getAttribute("usuario") != null) {
              try {
                Connection con = new Connector().getConnection();
              } catch (ClassNotFoundException | SQLException e) {
                throw new RuntimeException(e);
              }
              int idciu = (int) session.getAttribute("ciudad");
              int idcat = (int) session.getAttribute("categoria");
              //Set<Actividad> actividadSet = new ActividadManagerImpl().actividadesPorCiudad(con, idciu, idcat);
              //actividadSet.add((Actividad) actividadSet);
              try {
                total = actividadController.todasActividades().size();
              } catch (SQLException | ClassNotFoundException e) {
                throw new RuntimeException(e);
              }
            %>
            <div class="container mt-3 text-center">
              <div class=" panel panel-light">
                <h2 class="panel-heading text-center bg-verde">LISTADO DE ACTIVIDADES (<%=total %>)</h2>
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
                  try {
                    for (Actividad a : actividadController.todasActividades()) {
                %>
                <tr>
                  <td><%=a.getIdact()%>
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
                <form method="post" action="reserva.jsp">
                  <input type="hidden" name="IDact" value="<%=a.getIdact() %>">
                  <button type="submit" class="btn btn-info"><span class="bi bi-plus-circle">Reservar</span></button>
                </form>
              </div>
            </div>
            </td>
            </tr>
            <%
                    }
                  } catch (SQLException | ClassNotFoundException e) {
                    throw new RuntimeException(e);
                  }
            }
              %>
      </table>
    </div> <!-- cierre container lista -->
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


