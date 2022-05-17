<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.connector.Connector" %>
<%@ page import="edu.fpdual.proyectovn.jdbc.manager.implement.CiudadManagerImpl" %>

<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Categorías VayaPlan</title>
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
    request.setCharacterEncoding("UTF-8");
    Connector connector = new Connector();
    Connection con = connector.getConnection();
    int idciu = Integer.parseInt(request.getParameter("IDciu"));
    session.setAttribute("idciu", idciu);
    //ResultSet ciudad = new CiudadManagerImpl().CiudadPorID(con, idciu);
    //ciudad.next();
    // TODO: 03/05/2022 cambiar cuando hayamos creado dao y cya
    Statement s = con.createStatement();
    Statement st = con.createStatement();

    ResultSet sub = s.executeQuery("SELECT DISTINCT NomCat, Imagen FROM categoria c "
        + " INNER JOIN subcategoria s ON c.IDcat = s.IDcat"
        + " INNER JOIN actividad a ON s.IDsub = a.IDsub"
        + " INNER JOIN ciudad ci ON a.IDciu = ci.IDciu"
        + " WHERE a.IDciu = " + idciu);
    ResultSet numActividades = st.executeQuery("SELECT COUNT(a.IDact) AS total, c.IDcat FROM actividad a"
        + " INNER JOIN subcategoria s ON a.IDsub = s.IDsub"
        + " INNER JOIN categoria c ON s.IDcat = c.IDcat"
        + " WHERE IDciu = " + idciu
        + " GROUP BY IDcat");
    numActividades.next();
  %>

  <div id="container" class="container-flex text-center m-auto p-3 d-flex">
    <div class="row row-cols-1 row-cols-md-2 row-cols-xl-auto m-auto">

      <%
        while (sub.next()) {
      %>
      <div class="col m-auto p-2">
        <div class="card">
          <img src="<%=sub.getString("Imagen")%>" class="card-img-top m-auto w-25 h-25" alt="icono categoría\">
          <div class="card-body">
            <h5 class="card-title"><%=sub.getString("NomCat") %>
            </h5>
            <p class="card-text"></p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">Ciudad elegida: <%=idciu %>
            </li>
            <li class="list-group-item"> Num actividades: <%=numActividades.getInt("total")%>
            </li>
          </ul>
          <div class="card-body">
            <a href="actividades.jsp" class="card-link">Lista de Actividades </a>
          </div>
        </div>
      </div>
      <%
        }
        // TODO: 10/05/2022 A ver si averiguamos por que falla el if...
        if (numActividades.getRow() == 0) {
      %>
      <div class="col m-auto p-2">
        <div class="card">
          <img src="static/images/icons/bored.png" class="card-img-top img-responsive" alt="falla icono aburrido">
          <i class="bi bi-emoji-frown display-1"></i>
          <div class="card-body">
            <h5 class="card-title">Lo sentimos, no hay actividades
            </h5>
            <p class="card-text"></p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">Ciudad elegida: <%=idciu %>
            </li>
            <li class="list-group-item">Nombre ciudad: <%--=ciudad.getString("NomCiu")--%>
            </li>
            <li class="list-group-item"> Num actividades: <%=numActividades.getRow()%>
            </li>
          </ul>
          <div class="card-body">
            <a href="ciudades.jsp" class="card-link">Volver para elegir otra ciudad </a>
          </div>
        </div>
      </div>
      <%
        }
        String idcat = request.getParameter("IDcat");
        session.setAttribute("idcat", idcat);
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