<%@ page import="edu.fpdual.proyectovn.jdbc.connector.Connector" %>
<%@ page import="java.sql.*" %>

<%--
    Author     : Natalia Castillo
    Author     : Verónica González
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Gestión Usuarios</title> CAMBIAR
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
  <%
    Connector connector = new Connector();
    Connection con = connector.getConnection();
    // TODO: 03/05/2022 cambiar cuando hayamos creado dao y cya
    PreparedStatement s = (PreparedStatement) con.createStatement();
    request.setCharacterEncoding("UTF-8");
    ResultSet sub = s.executeQuery("SELECT s.NomSub"
        + " FROM subcategoria s "
        + " INNER JOIN categoria c ON s.IDcat = s.IDcat"
        + " INNER JOIN actividad a ON s.IDsub = a.IDsub"
        + " INNER JOIN ciudad ci ON a.IDciu = ci.IDciu"
        + " WHERE ci.IDciu = " + ".get("Nom");

    int conteo = 0;
  %>



  %>
  <!-- listado de plantas del jardin del usuario-->
  <div class="container-flex m-3">
    <div class=" panel">
      <h2 class="panel-heading text-center bg-turquesa">Jardín de</h2>
    </div>
    <div class="container-flex text-center">
      <table>
        <div class="row row-cols-1 row-cols-md-4 g-4">
          <%
            String subcategoria = request.getParameter("s.IDsub");
            while (sub.next()) {
              conteo++;
          %>
          <div class="col">
            <div class="card">
              <div class="card-header">
                <div class="modal-header">
                  <h4><%=sub.getString("p.nombre") %></h4>
                  <form method="post" action="borraDeJardin.jsp">
                    <input type="hidden" name="codpla" value="<%=sub.getString("codpla") %>">
                    <button type="submit" class="btn btn-close"></button>
                  </form>
                </div>
              </div>
              <div class="card-body">
                <h6 class="card-title"><%=sub.getString("p.cientifico") %></h6>
                <img src="" class="card-img-top">
                <p class="card-text">
                  <%=sub.getString("info")%>);
                </p>
              </div>
              <div class="card-footer">
                <h5><%=sub.getString("f.familia") %></h5>
              </div>
            </div>
          </div>
          <%
            }
            session.setAttribute("conteo", conteo);
          %>
        </div>      <!-- fin row -->
      </table>
    </div> <!-- cierre container lista -->
  </div>





</div> <!-- fin wrapper -->
<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS mio -->
<script src="javascript/javascript.js"></script>
</body>
</html>