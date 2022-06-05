<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.UsuarioManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.service.UsuarioService" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Usuario" %>
<%@ page import="java.sql.*" %>
<%@ page import="edu.fpdual.proyectovn.model.connector.Connector" %>
<%-- 
    Author     : Natalia Castillo
--%>
<%
  UsuarioService usuarioService = new UsuarioService(new UsuarioManagerImpl());
  int id;
  try {
    id = (usuarioService.todosUsuarios().size()) + 1;
  } catch (SQLException | ClassNotFoundException e) {
    throw new RuntimeException(e);
  }
  String nom = request.getParameter("nombre");
  String ape = request.getParameter("apellido");
  String pass = request.getParameter("password");
  String email = request.getParameter("email");
  String movil = request.getParameter("movil");
  int idciu = 0;
  boolean nuevo;
  try {
    Connection con = new Connector().getConnection();
    Usuario usuario = new Usuario(id, nom, ape, pass, email, movil, idciu);
    nuevo = new UsuarioManagerImpl().crear(con, usuario);
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
