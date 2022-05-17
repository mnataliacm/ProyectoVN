<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.connector.Connector" %>

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
  <link rel="stylesheet" href="style/style.css">
  <!-- javascript para reutilizar navbar -->
  <script src="https://code.jquery.com/jquery.min.js"></script>
</head>
<body class="bg-fondo">
<div id="wrapper" class="container-flex">
  <!--Barra navegacion-->
  <div id="nav-placeholder"></div>
  <%-- enlace con la base de datos --%>
    <% // TODO: 01/05/2022 añadir control login que solo admin pueda ver e intentar conectar con JDBC
    Connector connector = new Connector();
    Connection con = connector.getConnection();
    Statement s = con.createStatement();
    String user = (String) session.getAttribute("usuario");
    int idciu = (int) session.getAttribute("idciu");
    int idcat = (int) session.getAttribute("idcat");

    if (session.getAttribute("usuario") == null) {
  %>
  <!-- listado de actividades     table-responsive-stack table  table-success table-striped -->
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE ACTIVIDADES</h2>
    </div>
      <table class="table table-striped table-verde ">
        <tr class="table-dark">
          <th>ID</th>
          <th>Actividad</th>
          <th>Empresa</th>
          <th>Subcategoria</th>
          <th>Ciudad</th>
          <th>Horario</th>
        </tr>
        <%
          ResultSet listado = s.executeQuery("SELECT * FROM actividad WHERE IDciu = " + idciu);
          while (listado.next()) {
        %>
        <tr>
          <td><%=listado.getInt("IDact")%>
          </td>
          <td><%=listado.getString("NomAct")%>
          </td>
          <td><%=listado.getInt("IDemp")%>
          </td>
          <td><%=listado.getInt("IDsub")%>
          </td>
          <td><%=listado.getInt("IDciu")%>
          </td>
          <td><%=listado.getString("Horario")%>
          </td>
        <%
            }
        %>
      </table>
    </div> <!-- cierre container lista -->

  <%
  } else if ((session.getAttribute("usuario") != null) && (!(user.equals("Administrador")))) {
  %>
  <!-- listado de actividades     table-responsive-stack table  table-success table-striped -->
  <div class="container mt-3 text-center">
    <div class=" panel panel-light">
      <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE ACTIVIDADES</h2>
    </div>
    <table class="table table-striped table-verde ">
      <tr class="table-dark">
        <th>ID</th>
        <th>Actividad</th>
        <th>Empresa</th>
        <th>Subcategoria</th>
        <th>Ciudad</th>
        <th>Horario</th>
      </tr>
      <%
        ResultSet listado = s.executeQuery("SELECT * FROM actividad a INNER JOIN subcategoria s ON a.IDsub = s.IDsub "
            + " WHERE s.IDcat = " + idcat);
        while (listado.next()) {
      %>
      <tr>
        <td><%=listado.getInt("IDact")%>
        </td>
        <td><%=listado.getString("NomAct")%>
        </td>
        <td><%=listado.getInt("IDemp")%>
        </td>
        <td><%=listado.getInt("IDsub")%>
        </td>
        <td><%=listado.getInt("IDciu")%>
        </td>
        <td><%=listado.getString("Horario")%>
        </td>
        <td>
          <!-- añadir calendario o a reservas ?? -->
          <form method="post" action="reserva.jsp">
            <input type="hidden" name="IDact" value="<%=listado.getString("IDact") %>">
            <button type="submit"  class="btn btn-info"><span class="bi bi-plus-circle"> </span> </button>
          </form>
        </td></tr>
      <%
        }
      %>
    </table>
  </div> <!-- cierre container lista -->

    <%
    } else if ((session.getAttribute("usuario") != null) && (user.equals("Administrador"))) {
    %>

    <div class="container mt-3 text-center">
      <div class=" panel panel-light">
        <h2 class="panel-heading text-center bg-verde">BASE DE DATOS DE ACTIVIDADES</h2>
        <table class="table table-striped table-verde">
          <form method="post" action="nuevaActividad.jsp">
            <tr class="table-warning">
              <td><input type="text" size="30" name="NomAct" placeholder="Nombre actividad" required></td>
              <td><input type="text" name="IDemp" size="10" placeholder="Empresa" required></td>
              <td><input type="text" name="IDsub" size="10" placeholder="Subcategoria" required></td>
              <td><input type="text" name="IDciu" size="10" placeholder="Ciudad" required></td>
              <td><input type="text" name="Horario" size="35" placeholder="Horario" required></td>

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
            <th>Actividad</th>
            <th>Empresa</th>
            <th>Subcategoria</th>
            <th>Ciudad</th>
            <th>Horario</th>
          </tr>
          <%
            ResultSet listado = s.executeQuery("SELECT * FROM actividad");
            while (listado.next()) {
          %>
          <tr>
            <td><%=listado.getInt("IDact")%>
            </td>
            <td><%=listado.getString("NomAct")%>
            </td>
            <td><%=listado.getInt("IDemp")%>
            </td>
            <td><%=listado.getInt("IDsub")%>
            </td>
            <td><%=listado.getInt("IDciu")%>
            </td>
            <td><%=listado.getString("Horario")%>
            </td>
            <!-- modificar -->
            <td>
              <div class="row">
                <div class="col-6 ">
                  <form method="post" action="modificarUsuario.jsp">
                    <input type="hidden" name="IDact" value="<%=listado.getString("IDact") %>">
                    <input type="hidden" name="NomAct" value="<%=listado.getString("NomAct") %>">
                    <input type="hidden" name="IDemp" value="<%=listado.getString("IDemp") %>">
                    <input type="hidden" name="IDsub" value="<%=listado.getString("IDsub") %>">
                    <input type="hidden" name="IDciu" value="<%=listado.getString("IDciu") %>">
                    <input type="hidden" name="Horario" value="<%=listado.getString("Horario") %>">
                    <button type="submit" class="btn btn-info"><span class="bi bi-pencil-fill"> </span> Editar</button>
                  </form>
                </div>
                <%--borrar--%>
                <div class="col-6">
                  <form method="post" action="index.jsp">
                    <input type="hidden" name="IDact" value="<%=listado.getString("IDact") %>"/>
                    <button type="submit" class="btn btn-danger"><span class="bi bi-trash-fill"></span> Borrar</button>
                  </form>
                </div>
              </div>
            </td>
          </tr>
          <%
              }
            }
            con.close();
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


