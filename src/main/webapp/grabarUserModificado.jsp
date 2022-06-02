<%@ page import="java.sql.Connection" %>
<%@ page import="edu.fpdual.proyectovn.model.connector.Connector" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.SQLException" %>

<%-- 
    Author     : Natalia Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  Connection con;
  try {
    con = new Connector().getConnection();
  } catch (ClassNotFoundException | SQLException e) {
    throw new RuntimeException(e);
  }
  Statement s;
  try {
    s = con.createStatement();
  } catch (SQLException e) {
    throw new RuntimeException(e);
  }

  String editar = "UPDATE usuario SET "
      + " NomUsu = '" + request.getParameter("NomUsu")
      + "', ApeUsu = '" + request.getParameter("ApeUsu")
      + "', PassUsu = '" + request.getParameter("PassUsu")
      + "', Email = '" + request.getParameter("Email")
      + "', Movil = '" + request.getParameter("Movil")
      + "' WHERE IDusu = " + Integer.parseInt(request.getParameter("IDusu"));

  boolean confirma;
  try {
    confirma = s.execute(editar);
  } catch (SQLException e) {
    throw new RuntimeException(e);
  }
  if (confirma) {
    response.sendRedirect("error.jsp");
  } else {
    response.sendRedirect("ok.jsp");
  }
%>

<%--
  try {
    Connection con = new Connector().getConnection();
    PreparedStatement ps = null;
    String editar = "UPDATE usuario SET  NomUsu = ?, ApeUsu = ?, PassUsu = ?, Email = ?, Movil = ? WHERE IDusu = ?";
    assert ps != null;
    ps.setString(1, request.getParameter("NomUsu"));
    ps.setString(2, request.getParameter("ApeUsu"));
    ps.setString(3, request.getParameter("PassUsu"));
    ps.setString(4, request.getParameter("Email"));
    ps.setString(5, request.getParameter("Movil"));
    ps.setInt(6, Integer.parseInt(request.getParameter("IDusu")));
    ps.executeUpdate(editar);
    response.sendRedirect("ok.jsp");
  } catch (ClassNotFoundException | SQLException e) {
    response.sendRedirect("error.jsp");
    throw new RuntimeException(e);
  }

--%>

<%--
  UsuarioService usuarioService = new UsuarioService(new UsuarioManagerImpl());
  Integer idusu = Integer.parseInt(request.getParameter("IDusu"));
  Usuario usuario = null;
  try {
    usuario = new UsuarioService(new UsuarioManagerImpl()).buscaIdUsuario(idusu);
    if (usuarioService.modificarUsuario(usuario)) {
      response.sendRedirect("ok.jsp");
    } else {
      response.sendRedirect("error.jsp");
    }
  } catch (SQLException | ClassNotFoundException e) {
    response.sendRedirect("error.jsp");
  }


--%>

