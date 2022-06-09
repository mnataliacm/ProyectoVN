<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Actividad" %>
<%@ page import="edu.fpdual.proyectovn.client.ActividadClient" %>
<%--
    Author     : Natalia Castillo
    Author     : Verónica González
--%>
<%
  // TODO: 08/06/2022 Falla crear cuando vaya eliminar registrarEmpresa y registrarUsuario
  boolean confirma = false;
  if ((session.getAttribute("usuario") == null) || !(session.getAttribute("usuario").equals("Admin"))) {
    response.sendRedirect("index.jsp");
  } else {
      if (request.getParameter("IDact") != null) {
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
  }

%>