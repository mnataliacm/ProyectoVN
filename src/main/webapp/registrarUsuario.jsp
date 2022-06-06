<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.UsuarioManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.service.UsuarioService" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Usuario" %>
<%@ page import="java.sql.*" %>
<%-- 
    Author     : Natalia Castillo
--%>
<%
  UsuarioService usuarioService = new UsuarioService(new UsuarioManagerImpl());

  String nom = request.getParameter("nombre");
  String ape = request.getParameter("apellido");
  String pass = request.getParameter("password");
  String email = request.getParameter("email");
  String movil = request.getParameter("movil");
  Integer ciu = Integer.valueOf(request.getParameter("ciudad"));
  boolean nuevo;
  try {
    Usuario usuario = new Usuario(nom, ape, pass, email, movil, ciu);
    nuevo = usuarioService.crearUsuario(usuario);
  } catch (SQLException | ClassNotFoundException e) {
    throw new RuntimeException(e);
  }
  if (nuevo) {
    session.setAttribute("icono", "<i class=\"bi bi-check2-circle text-primary fs-1\"></i>");
    session.setAttribute("mensaje", "<p>Usuario nuevo registrado con éxito.</p>");
    session.setAttribute("enlace", "index.jsp");
    session.setAttribute("col", "btn-lg btn-primary");
    response.sendRedirect("ok.jsp");
  } else {
    session.setAttribute("icono", "<i class=\"bi bi-x-circle text-danger fs-1\"></i>");
    session.setAttribute("mensaje", "<p>Error, no se ha podido crear el nuevo usuario</p>");
    session.setAttribute("enlace", "formularioRegistro.jsp");
    session.setAttribute("col", "btn-lg btn-danger");
    response.sendRedirect("error.jsp");
  }
%>
