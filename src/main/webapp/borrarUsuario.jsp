<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.service.UsuarioService" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.UsuarioManagerImpl" %>
<%@ page import="java.sql.SQLException" %>
<%-- 
    Author     : Natalia Castillo Muñoz
--%>
<%
  UsuarioService usuarioService = new UsuarioService(new UsuarioManagerImpl());
  boolean confirma;
  int idusu = Integer.parseInt(request.getParameter("IDusu"));
  try {
    confirma = usuarioService.borrarUsuario(idusu);
  } catch (SQLException | ClassNotFoundException e) {
    throw new RuntimeException(e);
  }
  if (confirma) {
    session.setAttribute("icono", "<i class=\"bi bi-check2-circle text-primary fs-1\"></i>");
    session.setAttribute("mensaje", "<p>Usuario borrado con éxito.</p>");
    session.setAttribute("enlace", "usuarios.jsp");
    session.setAttribute("col", "btn-lg btn-primary");
    response.sendRedirect("ok.jsp");
  } else {
    session.setAttribute("icono", "<i class=\"bi bi-x-circle text-danger fs-1\"></i>");
    session.setAttribute("mensaje", "<p>Error, no se ha borrar el usuario</p>");
    session.setAttribute("enlace", "usuarios.jsp");
    session.setAttribute("col", "btn-lg btn-danger");
    response.sendRedirect("error.jsp");
  }
%>
