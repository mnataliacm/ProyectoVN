<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Actividad" %>
<%@ page import="edu.fpdual.proyectovn.client.ActividadClient" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Usuario" %>
<%@ page import="edu.fpdual.proyectovn.client.UsuarioClient" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Empresa" %>
<%@ page import="edu.fpdual.proyectovn.client.EmpresaClient" %>
<%@ page import="java.sql.Time" %>
<%@ page import="java.sql.Date" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Reservas" %>
<%@ page import="edu.fpdual.proyectovn.client.ReservasClient" %>
<%--
    Author     : Natalia Castillo
    Author     : Verónica González
--%>
<%
  boolean confirma = false;

  if (session.getAttribute("usuario") == null) {
    String nom = request.getParameter("nombre");
    String ape = request.getParameter("apellido");
    String pass = request.getParameter("password");
    String email =request.getParameter("email");
    String movil = request.getParameter("movil");
    Integer idciu = Integer.parseInt(request.getParameter("ciudad"));
    Usuario usuario = new Usuario(nom, ape, pass, email, movil, idciu);
    Usuario nuevoUsu = new UsuarioClient().crear(usuario);
    if (request.getParameter("email") != null) {
      UsuarioClient usuarioClient = new UsuarioClient();
      Usuario emailInfo = usuarioClient.buscaPorNombre(nom);
      usuarioClient.enviarEmail(emailInfo.getId());
    }
    confirma = nuevoUsu != null;
    session.setAttribute("enlace", "formularioLogin.jsp");

  } else if ((session.getAttribute("usuario") == null) || !(session.getAttribute("usuario").equals("Admin"))) {
    response.sendRedirect("index.jsp");

  } else if (request.getParameter("IDact") != null) {
      Integer idcat = Integer.valueOf(request.getParameter("IDcat"));
      Integer idciu = Integer.valueOf(request.getParameter("IDciu"));
      String nom = request.getParameter("NomAct");
      Integer idemp = Integer.valueOf(request.getParameter("IDemp"));
      String horario = request.getParameter("Horario");
      String info = request.getParameter("Info");
      Actividad actividad = new Actividad(idcat, idciu, nom, idemp, horario, info);
      Actividad nuevaAct = new ActividadClient().crear(actividad);
      confirma = nuevaAct != null;
      session.setAttribute("enlace", "actividades.jsp");

    } else if (request.getParameter("IDemp") != null) {
      String nomEmp = request.getParameter("NomEmp");
      Empresa empresa = new Empresa(nomEmp);
      Empresa nuevaEmp = new EmpresaClient().crear(empresa);
      confirma = nuevaEmp != null;
      session.setAttribute("enlace", "empresas.jsp");

    } else if (request.getParameter("IDres") != null) {
      Integer idusu = Integer.valueOf(request.getParameter("IDusu"));
      Integer idact = Integer.valueOf(request.getParameter("IDact"));
      Time hora = Time.valueOf(request.getParameter("Hora"));
      Date fecha = Date.valueOf(request.getParameter("Fecha"));

      Reservas reservas = new Reservas(idusu, idact, fecha, hora);
      Reservas nuevaRes = new ReservasClient().crear(reservas);
      confirma = nuevaRes != null;
      session.setAttribute("enlace", "reservas.jsp");

    }


    if (confirma) {
      session.setAttribute("icono", "<i class=\"bi bi-check2-circle text-primary fs-1\"></i>");
      session.setAttribute("mensaje", "<p>Actividad nueva añadida con éxito.</p>");
      session.setAttribute("col", "btn-lg btn-primary");
      response.sendRedirect("ok.jsp");
    } else {
      session.setAttribute("icono", "<i class=\"bi bi-x-circle text-danger fs-1\"></i>");
      session.setAttribute("mensaje", "<p>ERROR, revise los datos introducidos</p>");
      session.setAttribute("col", "btn-lg btn-danger");
      response.sendRedirect("error.jsp");
    }

%>