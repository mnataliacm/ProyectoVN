<%--@ page import="edu.fpdual.proyectovn.client.CategoriaClient" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Categoria" %>
<%@ page import="java.util.Set" %>
<%@ page import="edu.fpdual.proyectovn.client.CiudadClient" %>
<%@ page import="edu.fpdual.proyectovn.client.ActividadClient" %>
<%@ page import="java.util.HashSet" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Actividad" %>
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
  <div id="container" class="container-flex text-center m-auto p-3 d-flex h-auto">
    <div class="row row-cols-1 row-cols-md-2 row-cols-xl-auto m-auto">
  <%-- // TODO: 11/06/2022 CREO QUE ESTE LO PODEMOS QUITAR
    CategoriaClient categoriaClient = new CategoriaClient();
    ActividadClient actividadClient = new ActividadClient();
    Integer idciu = Integer.parseInt(request.getParameter("IDciu"));

    int numActCiu = actividadClient.actPorCiu(idciu).size();

    if ((idciu != 0) && (numActCiu > 0)) {
      Set<String> categoriaSet =  categoriaClient.catConAct(idciu);
      for (String c : categoriaSet) {
  %>
      <div class="col m-auto p-2">
        <div class="card">
          <div class="container w-50 h-25">
          <img src="<%=c.getImagen()%>" class="card-img-top m-auto" alt="icono museo\">
        </div>
          <div class="card-body">
            <h5 class="card-title"><%=c.getNom() %>
            </h5>
            <p class="card-text"></p>
          </div>
          <ul class="list-group list-group-flush">
            <li class="list-group-item">Ciudad elegida: <%=c. %>
            </li>
            <li class="list-group-item"> Num actividades: <%=categoriaSet.size()%>
            </li>
          </ul>
          <div class="card-body">
            <a class="card-link" href="actividades.jsp" >Lista de Actividades</a>
          </div>
        </div>
      </div>
      <%
        }
    } else if (numActCiu == 0){
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