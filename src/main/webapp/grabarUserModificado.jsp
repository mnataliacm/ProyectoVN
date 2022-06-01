<%@ page import="edu.fpdual.proyectovn.service.UsuarioService" %>
<%@ page import="edu.fpdual.proyectovn.model.manager.implement.UsuarioManagerImpl" %>
<%@ page import="edu.fpdual.proyectovn.model.dao.Usuario" %>
<%@ page import="java.sql.SQLException" %>

<%-- 
    Author     : Natalia Castillo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
  UsuarioService usuarioService = new UsuarioService(new UsuarioManagerImpl());
  Integer idusu = Integer.parseInt(request.getParameter("IDusu"));
  Usuario usuario;
  try {
    usuario = usuarioService.buscaId(idusu);
  } catch (SQLException | ClassNotFoundException e) {
    throw new RuntimeException(e);
  }
  try {
    usuarioService.modificarUsuario(usuario);
  } catch (SQLException | ClassNotFoundException e) {
    throw new RuntimeException(e);
  }
%>

<%--
 Connection con = new Connector().getConnection();
Statement s = con.createStatement();

 String editar = "UPDATE usuario SET "
     + " NomUsu = '" + request.getParameter("NomUsu")
     + "', ApeUsu = '" + request.getParameter("ApeUsu")
     + "', PassUsu = '" + request.getParameter("PassUsu")
     + "', Email = '" + request.getParameter("Email")
     + "', Movil = '" + request.getParameter("Movil")
     + "' WHERE IDusu = " + Integer.parseInt(request.getParameter("IDusu"));



Boolean confirma = s.execute(editar);
 if (confirma.booleanValue()) {
   response.sendRedirect("error.jsp");
 } else {
   response.sendRedirect("ok.jsp");
 }
 s.close();
--%>
<%--
/*
String editar = "UPDATE usuario SET "
+ " NomUsu = ?"
+ ", ApeUsu = ?"
+ ", PassUsu = ?"
+ ", Email = ?"
+ ", Movil = ?"
+ " WHERE IDusu = ?";
PreparedStatement ps = con.prepareStatement(editar);
  ps.setString(1, nom);
  ps.setString(2, ape);
  ps.setString(3, pass);
  ps.setString(4, email);
  ps.setString(5, movil);
  ps.setInt(6, id);
   response.sendRedirect("usuarios.jsp");
*/

--%>