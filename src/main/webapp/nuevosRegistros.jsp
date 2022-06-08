<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.client.dto.Actividad" %>
<%@ page import="edu.fpdual.proyectovn.client.ActividadClient" %>
<%--
    Author     : Natalia Castillo
    Author     : Verónica González
--%>
<%
  // TODO: 08/06/2022 Falla crear cuando vaya eliminar registrarEmpresa y registrarUsuario
  if ((session.getAttribute("usuario") == null) || !(session.getAttribute("usuario").equals("Admin"))) {
    response.sendRedirect("index.jsp");
  } else {
      boolean nuevo;
      if (request.getParameter("IDact") != null) {
        ActividadClient actividadClient = new ActividadClient();
        Integer idact = 0;
        Integer idcat = Integer.valueOf(request.getParameter("IDcat"));
        Integer idciu = Integer.valueOf(request.getParameter("IDciu"));
        String nom = request.getParameter("NomAct");
        Integer idemp = Integer.valueOf(request.getParameter("IDemp"));
        String horario = request.getParameter("Horario");
        String info = request.getParameter("Info");

        Actividad actividad = new Actividad(idcat, idciu, nom, idemp, horario, info);
        nuevo = actividadClient.crear(actividad);
        if (nuevo) {
          session.setAttribute("icono", "<i class=\"bi bi-check2-circle text-primary fs-1\"></i>");
          session.setAttribute("mensaje", "<p>Actividad nueva añadida con éxito.</p>");
          session.setAttribute("enlace", "actividades.jsp");
          session.setAttribute("col", "btn-lg btn-primary");
          response.sendRedirect("ok.jsp");
        } else {
          session.setAttribute("icono", "<i class=\"bi bi-x-circle text-danger fs-1\"></i>");
          session.setAttribute("mensaje", "<p>ERROR, revise los datos introducidos</p>");
          session.setAttribute("enlace", "actividades.jsp");
          session.setAttribute("col", "btn-lg btn-danger");
          response.sendRedirect("error.jsp");
        }
      } else if (request.getParameter("IDemp") != null) {

      }
  }

%>