<%@ page import="edu.fpdual.proyectovn.client.dto.Ciudad" %>
<%@ page import="java.util.Set" %>
<%@ page import="edu.fpdual.proyectovn.client.CiudadClient" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.stream.Collectors" %>
<%@ page import="java.util.LinkedHashSet" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
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
<div id="wrapper" class="container-flex vh-100">
  <!--Barra navegacion-->
  <div id="nav-placeholder"></div>
  <div class="container-flex m-auto mt-5 p-5 w-75 h-75 andalucia">
    <div class="container-fluid w-50 h-50 m-auto text-center ">
      <div class="panel w-75 m-auto pt-5 mt-5">
        <h2 class="panel-heading text-center bg-turquesa">Selecciona una ciudad</h2>
      </div>
      <form method="post" action="categorias.jsp">
        <div class="row justify-content-around align-items-center gy-5 row-cols-lg-4 mt-5">
          <%
            CiudadClient ciudadClient = new CiudadClient();
            Set<Ciudad> ciudads = ciudadClient.todos()
                .stream().sorted(Comparator.comparing(Ciudad::getId))
                .collect(Collectors.toCollection(LinkedHashSet::new));
            session.setAttribute("ciudad", request.getParameter("IDciu"));
            for (Ciudad c : ciudads) {
          %>
          <div class="col">
            <button class="btn btn-primary btn-lg" type="submit" name="IDciu" value="<%=c.getId()%>"><%=c.getNom()%>>
            </button>
          </div>
          <%
            }
          %>
        </div> <!-- fin row -->
      </form>
      <form method="post" action="actividades.jsp">
        <div class="container-fluid w-50 h-50 m-auto text-center ">
          <div class="panel w-75 m-auto pt-5 mt-5">
            <h2 class="panel-heading text-center bg-turquesa">Ver todas</h2>
            <button class="btn btn-primary btn-lg" type="submit" name="IDciu" value="0">Todas</button>
          </div>
        </div>
      </form>
    </div> <!-- fin container 2 -->
  </div> <!--  fin container 1 -->
</div> <!-- fin wrapper img-->
<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS mio -->
<script src="javascript/javascript.js"></script>
</body>
</html>

