<%@ page import="edu.fpdual.proyectovn.model.connector.Connector" %>
<%@ page import="edu.fpdual.proyectovn.controller.UsuarioController" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.UsuarioManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.service.UsuarioService" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Usuario" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.Manager" %>
<%@ page import="edu.fpdual.proyectovn.service.ActividadService" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.ActividadManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Actividad" %>
<%@ page import="javax.accessibility.AccessibleValue" %>
<%-- 
    Author     : Natalia Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Confirmación</title>
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
</head>
<body>

<%
  boolean nuevo;
  String icono;
  String mensaje;
  String enlace;
  String col;

  if (request.getParameter("IDusu") != null) {
    try {
      UsuarioService usuarioService = new UsuarioService(new UsuarioManagerImpl());
      int id = (usuarioService.todosUsuarios().size()) + 1;
      String nom = request.getParameter("nombre");
      String ape = request.getParameter("apellido");
      String pass = request.getParameter("password");
      String email = request.getParameter("email");
      String movil = request.getParameter("movil");
      String comprobar = "";

      Usuario usuario = new Usuario();
      usuario.setNom(nom);
      usuario.setApe(ape);
      usuario.setPass(pass);
      usuario.setEmail(email);
      usuario.setMovil(movil);
      usuario = Usuario.builder().build();
      try {
        nuevo = usuarioService.crearUsuario(usuario);
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }

      if (nuevo) {
        icono = "<i class=\"bi bi-check2-circle text-primary fs-1\"></i>";
        mensaje = "<p>Usuario nuevo registrado con éxito.</p>";
        enlace = "buscador.jsp";
        col = "btn-lg btn-primary";
        response.sendRedirect("ok.jsp");
      } else {
        icono = "<i class=\"bi bi-x-circle text-danger fs-1\"></i>";
        mensaje = "<p>Lo siento, no se ha podido dar de alta, ya existe el usuario: </p>" + "<h5>"
            + request.getParameter("usuario") + "</h5>";
        enlace = "formularioRegistro.jsp";
        col = "btn-lg btn-danger";
        response.sendRedirect("error.jsp");
      }
    } catch (ClassNotFoundException e) {
      throw new RuntimeException(e);
    }
  } else if (request.getParameter("IDact") != null) {
    try {
      ActividadService actividadService = new ActividadService(new ActividadManagerImpl());
      int idact = (actividadService.todasActividades().size()) + 1;
      int idcat = Integer.parseInt(request.getParameter("IDcat"));
      int idciu = Integer.parseInt(request.getParameter("IDciu"));
      String nom = request.getParameter("NomAct");
      int idemp = Integer.parseInt(request.getParameter("IDemp"));
      String horario = request.getParameter("Horario");
      String info = request.getParameter("Info");

      Actividad actividad = new Actividad();
      actividad.setIdact(idact);
      actividad.setIdcat(idcat);
      actividad.setIdciu(idciu);
      actividad.setNom(nom);
      actividad.setIdemp(idemp);
      actividad.setHorario(horario);
      actividad.setInfo(info);
      actividad = Actividad.builder().build();
      try {
        nuevo = actividadService.crearActividad(actividad);
      } catch (SQLException e) {
        throw new RuntimeException(e);
      }

      if (nuevo) {
        icono = "<i class=\"bi bi-check2-circle text-primary fs-1\"></i>";
        mensaje = "<p>Usuario nuevo registrado con éxito.</p>";
        enlace = "buscador.jsp";
        col = "btn-lg btn-primary";
        response.sendRedirect("ok.jsp");
      } else {
        icono = "<i class=\"bi bi-x-circle text-danger fs-1\"></i>";
        mensaje = "<p>Lo siento, no se ha podido dar de alta, ya existe el usuario: </p>" + "<h5>"
            + request.getParameter("usuario") + "</h5>";
        enlace = "formularioRegistro.jsp";
        col = "btn-lg btn-danger";
        response.sendRedirect("error.jsp");
      }
    } catch (ClassNotFoundException e) {
      throw new RuntimeException(e);
    }

%>

<div id="wraper" class="container-flex vh-100 pt-5">
  <div class="container w-25 text-center">
    <div class="row">
      <div class="col">
        <div class="card bg-verde">
          <div class="card-header">Nuevo Usuario</div>
          <div class="card-body">
            <%=icono %>
            <%=mensaje %>
          </div>
          <div class="card-footer">
            <a href=" <%=enlace %>" class="<%=col %>" role="button">Aceptar</a>
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- imagen -->
  <div class="container">
    <div class="container-flex">
      <div class="row">
        <div class="col-lg-6 m-auto">
          <img src="images/rosa.png"
               class="img-fluid  mt-5" alt="flores moradas">
        </div>
      </div>
    </div>
  </div>
</div> <!-- fin del wrapper -->
<%
  }
%>
<!-- JS bootstrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<!-- JS mio -->
<script src="javascript/javascript.js"></script>

</body>
</html>

