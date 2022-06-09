<%@ page import="edu.fpdual.proyectovn.client.ActividadClient" %>
<%@ page import="edu.fpdual.proyectovn.client.UsuarioClient" %>
<%@ page import="edu.fpdual.proyectovn.client.EmpresaClient" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%--
    Author     : Natalia Castillo
    Author     : Verónica González
--%>
<%
  boolean confirma = false;
  if ((session.getAttribute("usuario") == null) || !(session.getAttribute("usuario").equals("Admin"))) {
    response.sendRedirect("index.jsp");
  } else {
    if (request.getParameter("IDact") != null) {
      int idact = Integer.parseInt(request.getParameter("IDact"));
      confirma = new ActividadClient().borrar(idact);
      session.setAttribute("enlace", "actividades.jsp");

    } else if (request.getParameter("IDusu") != null) {
      int idusu = Integer.parseInt(request.getParameter("IDusu"));
      confirma = new UsuarioClient().borrar(idusu);
      session.setAttribute("enlace", "usuarios.jsp");

    } else if (request.getParameter("IDemp") != null) {
      int idusu = Integer.parseInt(request.getParameter("IDusu"));
      confirma = new EmpresaClient().borrar(idusu);
      session.setAttribute("enlace", "empresas.jsp");
    }

    if (confirma) {
      session.setAttribute("icono", "<i class=\"bi bi-check2-circle text-primary fs-1\"></i>");
      session.setAttribute("mensaje", "<p>Registro borrado con éxito.</p>");
      session.setAttribute("col", "btn-lg btn-primary");
      response.sendRedirect("ok.jsp");
    } else {
      session.setAttribute("icono", "<i class=\"bi bi-x-circle text-danger fs-1\"></i>");
      session.setAttribute("mensaje", "<p>No se ha podido eliminar el registro</p>");
      session.setAttribute("col", "btn-lg btn-danger");
      response.sendRedirect("error.jsp");
    }
  }
%>