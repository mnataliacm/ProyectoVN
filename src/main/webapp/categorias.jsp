<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="edu.fpdual.proyectovn.model.connector.Connector" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.CiudadManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.controller.CiudadController" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Categorías VayaPlan</title>
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
  <%-- enlace con la base de datos --%>
  <%
    Connector connector = new Connector();
    Connection con = connector.getConnection();
    CiudadController ciudadController = new CiudadController(new CiudadManagerImpl());
    Integer idciu = Integer.parseInt(request.getParameter("IDciu"));
    session.setAttribute("ciudad", idciu);
    //String ciudad = ciudadController.nombreCiudad(idciu);
    // TODO: 03/05/2022 cambiar cuando hayamos creado dao y cya
    Statement s = con.createStatement();
    Statement st = con.createStatement();

    ResultSet sub = s.executeQuery("SELECT DISTINCT(c.NomCat), c.Imagen, ci.NomCiu, a.IDcat, a.IDciu FROM categoria c "
        + " INNER JOIN actividad a ON c.IDcat = a.IDcat"
        + " INNER JOIN ciudad ci ON a.IDciu = ci.IDciu"
        + " WHERE a.IDciu = " + idciu
        + " AND a.IDcat = c.IDcat"
        + " GROUP BY IDcat, IDciu");
    ResultSet numActividades = st.executeQuery("SELECT COUNT(a.IDact) AS total, a.IDcat FROM actividad a"
        + " INNER JOIN categoria c ON a.IDcat = c.IDcat"
        + " WHERE a.IDciu = " + idciu
        + " AND a.IDcat = c.IDcat"
        + " GROUP BY a.IDcat");
    numActividades.next();
    //int idcat = numActividades.getInt("IDcat");
    //session.setAttribute("categoria", idcat);
  %>

  <div id="container" class="container-flex text-center m-auto p-3 d-flex h-auto">
    <div class="row row-cols-1 row-cols-md-2 row-cols-xl-auto m-auto">

      <%
        while (sub.next()) {
      %>
      <div class="col m-auto p-2">
        <div class="card">
          <div class="container w-50 h-25">
          <img src="<%=sub.getString("Imagen")%>" class="card-img-top m-auto" alt="icono museo\">
        </div>
          <div class="card-body">
            <h5 class="card-title"><%=sub.getString("NomCat") %>
            </h5>
            <p class="card-text"></p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">Ciudad elegida: <% %><%=sub.getString("NomCiu") %>
            </li>
            <li class="list-group-item"> Num actividades: <%=numActividades.getInt("total")%>
            </li>
          </ul>
          <div class="card-body">
            <a class="card-link" href="actividades.jsp" >Lista de Actividades</a>

          </div>
        </div>
      </div>
      <%
        }
        // TODO: 10/05/2022 A ver si averiguamos por que falla el if...
        if (numActividades.getRow() == 0) {
      %>
      <div class="col m-auto p-5">
        <div class="card pt-3 pb-2">
          <i class="bi bi-emoji-frown display-1"></i>
          <div class="card-body">
            <h5 class="card-title">Lo sentimos, en esta ciudad no hay actividades disponibles en este momento
            </h5>
            <p class="card-text"></p>
          </div>
          <div class="card-body">
            <a href="ciudades.jsp" class="card-link">Volver para elegir otra ciudad </a>
          </div>
        </div>
      </div>
      <%
        }
      %>
    </div> <!-- fin del row -->
  </div> <!-- fin container -->
</div> <!-- fin wrapper -->
<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS mio -->
<script src="javascript/javascript.js"></script>
</body>
</html>